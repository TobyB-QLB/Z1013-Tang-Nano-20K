#include <ctype.h>
#include <errno.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#ifdef _WIN32
#include <direct.h>
#include <windows.h>
#define PATH_SEP '\\'
#elif defined(__APPLE__)
#include <mach-o/dyld.h>
#include <limits.h>
#include <unistd.h>
#define PATH_SEP '/'
#else
#include <limits.h>
#include <unistd.h>
#define PATH_SEP '/'
#endif

#define LINE_SIZE 1024

static void trim_line(char *s) {
    size_t n = strlen(s);
    while (n > 0 && (s[n - 1] == '\n' || s[n - 1] == '\r' || isspace((unsigned char)s[n - 1]))) {
        s[--n] = '\0';
    }
    while (*s && isspace((unsigned char)*s)) {
        memmove(s, s + 1, strlen(s));
    }
    n = strlen(s);
    if (n >= 2 && ((s[0] == '"' && s[n - 1] == '"') || (s[0] == '\'' && s[n - 1] == '\''))) {
        memmove(s, s + 1, n - 2);
        s[n - 2] = '\0';
    }
}

static int read_line(const char *prompt, char *dst, size_t size) {
    fputs(prompt, stdout);
    fflush(stdout);
    if (!fgets(dst, (int)size, stdin)) return 0;
    trim_line(dst);
    return dst[0] != '\0';
}

static int parse_hex16(const char *text, uint16_t *value) {
    char *end = NULL;
    unsigned long v;
    errno = 0;
    v = strtoul(text, &end, 16);
    if (errno || end == text || *end != '\0' || v > 0xFFFFUL) return 0;
    *value = (uint16_t)v;
    return 1;
}

static const char *base_name(const char *path) {
    const char *a = strrchr(path, '/');
    const char *b = strrchr(path, '\\');
    const char *p;
    if (!a) p = b;
    else if (!b) p = a;
    else p = a > b ? a : b;
    return p ? p + 1 : path;
}

static int valid_83_char(unsigned char c) {
    if (isalnum(c)) return 1;
    return strchr("!#$%&'()-@^_`{}~", c) != NULL;
}

static int make_83_name(const char *source, char out[13]) {
    const char *name = base_name(source);
    const char *dot = strrchr(name, '.');
    size_t stem_len, ext_len, i, pos = 0;

    if (!*name || dot == name || (dot && strchr(dot + 1, '.'))) return 0;
    stem_len = dot ? (size_t)(dot - name) : strlen(name);
    ext_len = dot ? strlen(dot + 1) : 0;
    if (stem_len < 1 || stem_len > 8 || ext_len > 3) return 0;

    for (i = 0; i < stem_len; ++i) {
        unsigned char c = (unsigned char)name[i];
        if (!valid_83_char(c)) return 0;
        out[pos++] = (char)toupper(c);
    }
    if (ext_len) {
        out[pos++] = '.';
        for (i = 0; i < ext_len; ++i) {
            unsigned char c = (unsigned char)dot[1 + i];
            if (!valid_83_char(c)) return 0;
            out[pos++] = (char)toupper(c);
        }
    }
    out[pos] = '\0';
    return 1;
}

static int join_path(char *out, size_t size, const char *dir, const char *name) {
    size_t n = strlen(dir);
    int needs_sep = n > 0 && dir[n - 1] != '/' && dir[n - 1] != '\\';
    int written;
    if (needs_sep) written = snprintf(out, size, "%s%c%s", dir, PATH_SEP, name);
    else written = snprintf(out, size, "%s%s", dir, name);
    return written > 0 && (size_t)written < size;
}

static int executable_directory(const char *argv0, char *out, size_t size) {
    char path[LINE_SIZE];
    const char *slash;
    (void)argv0;
#ifdef _WIN32
    DWORD n = GetModuleFileNameA(NULL, path, (DWORD)sizeof(path));
    if (n == 0 || n >= sizeof(path)) return 0;
#elif defined(__APPLE__)
    uint32_t n = (uint32_t)sizeof(path);
    if (_NSGetExecutablePath(path, &n) != 0) return 0;
#else
    ssize_t n = readlink("/proc/self/exe", path, sizeof(path) - 1);
    if (n <= 0 || (size_t)n >= sizeof(path)) {
        if (strlen(argv0) >= sizeof(path)) return 0;
        strcpy(path, argv0);
    } else {
        path[n] = '\0';
    }
#endif
    slash = strrchr(path, PATH_SEP);
    if (!slash) {
        if (size < 2) return 0;
        strcpy(out, ".");
        return 1;
    }
    if ((size_t)(slash - path) + 1 > size) return 0;
    memcpy(out, path, (size_t)(slash - path));
    out[slash - path] = '\0';
    return 1;
}

static long file_size(FILE *f) {
    long n;
    if (fseek(f, 0, SEEK_END) != 0) return -1;
    n = ftell(f);
    if (n < 0 || fseek(f, 0, SEEK_SET) != 0) return -1;
    return n;
}

static int same_file_path(const char *a, const char *b) {
#ifdef _WIN32
    char full_a[LINE_SIZE], full_b[LINE_SIZE];
    if (!_fullpath(full_a, a, sizeof(full_a)) || !_fullpath(full_b, b, sizeof(full_b))) return 0;
    return _stricmp(full_a, full_b) == 0;
#else
    char full_a[PATH_MAX], full_b[PATH_MAX];
    if (!realpath(a, full_a) || !realpath(b, full_b)) return 0;
    return strcmp(full_a, full_b) == 0;
#endif
}

static int ask_overwrite(const char *path) {
    char answer[16];
    FILE *f = fopen(path, "rb");
    if (!f) return 1;
    fclose(f);
    printf("Die Datei %s existiert bereits. Ueberschreiben (J/N) > ", path);
    fflush(stdout);
    if (!fgets(answer, sizeof(answer), stdin)) return 0;
    return answer[0] == 'J' || answer[0] == 'j' || answer[0] == 'Y' || answer[0] == 'y';
}

int main(int argc, char **argv) {
    uint16_t begin, end, start;
    uint32_t payload_size;
    unsigned char header[9];
    char source_name[LINE_SIZE], source[LINE_SIZE], program_dir[LINE_SIZE];
    char target_dir[LINE_SIZE], fat_name[13];
    char target[LINE_SIZE], temporary[LINE_SIZE];
    unsigned char buffer[32768];
    FILE *in = NULL, *out = NULL;
    long actual_size;
    size_t n;
    int result = 1;

    puts("Z1013 FAT-@DS V1.0");
    puts("-------------------");

    if (argc < 4 || argc > 5 ||
        !parse_hex16(argv[1], &begin) ||
        !parse_hex16(argv[2], &end) ||
        !parse_hex16(argv[3], &start) || end < begin) {
        fprintf(stderr, "Aufruf: %s ANFANG ENDE START [ZIELORDNER]\n", base_name(argv[0]));
        fprintf(stderr, "Beispiel: %s 100 2000 103 E:\\\n", base_name(argv[0]));
        return 2;
    }

    if (!read_line("Datei Name > ", source_name, sizeof(source_name))) {
        fputs("FEHLER: Kein Dateiname angegeben.\n", stderr);
        return 2;
    }
    if (strchr(source_name, '/') || strchr(source_name, '\\')) {
        fputs("FEHLER: Bitte nur den Dateinamen ohne Verzeichnis angeben.\n", stderr);
        return 2;
    }
    if (argc == 5) {
        if (strlen(argv[4]) >= sizeof(target_dir)) {
            fputs("FEHLER: Zielpfad ist zu lang.\n", stderr);
            return 2;
        }
        strcpy(target_dir, argv[4]);
        trim_line(target_dir);
    } else if (!read_line("Ziel Ordner > ", target_dir, sizeof(target_dir))) {
        fputs("FEHLER: Kein Zielordner angegeben.\n", stderr);
        return 2;
    }

    if (!make_83_name(source_name, fat_name)) {
        fputs("FEHLER: Der Dateiname muss dem FAT-Format 8.3 entsprechen.\n", stderr);
        fputs("        Beispiel: TEST.COM\n", stderr);
        return 2;
    }
    if (!executable_directory(argv[0], program_dir, sizeof(program_dir)) ||
        !join_path(source, sizeof(source), program_dir, source_name)) {
        fputs("FEHLER: Der Ordner des @DS-Programms konnte nicht ermittelt werden.\n", stderr);
        return 2;
    }
    if (!join_path(target, sizeof(target), target_dir, fat_name) ||
        snprintf(temporary, sizeof(temporary), "%s.$$$", target) >= (int)sizeof(temporary)) {
        fputs("FEHLER: Zielpfad ist zu lang.\n", stderr);
        return 2;
    }

    in = fopen(source, "rb");
    if (!in) {
        fprintf(stderr, "FEHLER: Quelldatei liegt nicht neben dem @DS-Programm: %s\n", source);
        return 3;
    }
    if (same_file_path(source, target)) {
        fputs("FEHLER: Quell- und Zieldatei sind identisch.\n", stderr);
        fputs("        Bitte die SD-Karte oder einen anderen Zielordner angeben.\n", stderr);
        fclose(in);
        return 3;
    }
    actual_size = file_size(in);
    payload_size = (uint32_t)end - (uint32_t)begin + 1U;
    if (actual_size < 0 || (uint32_t)actual_size != payload_size) {
        fprintf(stderr, "FEHLER: Der Adressbereich umfasst %lu Byte, die Datei aber %ld Byte.\n",
                (unsigned long)payload_size, actual_size);
        if (actual_size > 0 && (uint32_t)actual_size <= 0x10000U - begin) {
            fprintf(stderr, "        Fuer diese Datei waere die Endadresse %04lX richtig.\n",
                    (unsigned long)(begin + (uint32_t)actual_size - 1U));
        }
        fclose(in);
        return 4;
    }
    if (!ask_overwrite(target)) {
        puts("Abgebrochen.");
        fclose(in);
        return 0;
    }

    header[0] = 0x40; /* @ */
    header[1] = 0x44; /* D */
    header[2] = 0x44; /* D */
    header[3] = (unsigned char)(begin & 0xFF);
    header[4] = (unsigned char)(begin >> 8);
    header[5] = (unsigned char)(end & 0xFF);
    header[6] = (unsigned char)(end >> 8);
    header[7] = (unsigned char)(start & 0xFF);
    header[8] = (unsigned char)(start >> 8);

    remove(temporary);
    out = fopen(temporary, "wb");
    if (!out) {
        fprintf(stderr, "FEHLER: Im Zielordner kann nicht geschrieben werden: %s\n", target_dir);
        goto cleanup;
    }
    if (fwrite(header, 1, sizeof(header), out) != sizeof(header)) goto write_error;
    while ((n = fread(buffer, 1, sizeof(buffer), in)) > 0) {
        if (fwrite(buffer, 1, n, out) != n) goto write_error;
    }
    {
        int io_error = ferror(in);
        if (fflush(out) != 0) io_error = 1;
        if (fclose(out) != 0) io_error = 1;
        out = NULL;
        if (io_error) goto write_error_closed;
    }
    out = NULL;
    fclose(in);
    in = NULL;

    if (remove(target) != 0 && errno != ENOENT) {
        fprintf(stderr, "FEHLER: Vorhandene Zieldatei kann nicht ersetzt werden: %s\n", target);
        goto cleanup;
    }
    if (rename(temporary, target) != 0) {
        fprintf(stderr, "FEHLER: Temporaere Datei kann nicht umbenannt werden: %s\n", strerror(errno));
        goto cleanup;
    }

    printf("\nGespeichert: %s\n", target);
    printf("Name       : %s\n", fat_name);
    printf("Anfang     : %04X\n", begin);
    printf("Ende       : %04X\n", end);
    printf("Start      : %04X\n", start);
    printf("Nutzdaten  : %lu Byte\n", (unsigned long)payload_size);
    printf("Dateigroesse: %lu Byte (9 Byte Kopf + Nutzdaten)\n",
           (unsigned long)payload_size + 9UL);
    result = 0;
    goto cleanup;

write_error:
    fclose(out);
    out = NULL;
write_error_closed:
    fputs("FEHLER: Die Datei konnte nicht vollstaendig geschrieben werden.\n", stderr);

cleanup:
    if (out) fclose(out);
    if (in) fclose(in);
    if (result) remove(temporary);
    return result;
}
