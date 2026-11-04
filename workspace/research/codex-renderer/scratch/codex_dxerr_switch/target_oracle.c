/* Analysis-only native x86 oracle. Loads anchor sections without changing them.
 * Not reconstructed source, not a rebuilt DLL, and never release input. */
#define _GNU_SOURCE
#include <assert.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>

static uint32_t u32(const unsigned char *p)
{
    uint32_t n;
    memcpy(&n, p, 4);
    return n;
}

static unsigned int u16(const unsigned char *p)
{
    unsigned short n;
    memcpy(&n, p, 2);
    return n;
}

static unsigned char *load_anchor(const char *path, unsigned int *mapped_size)
{
    FILE *file;
    long length;
    unsigned char *raw, *image;
    unsigned int pe, optional, sections, size, i;
    assert(sizeof(void *) == 4);
    file = fopen(path, "rb");
    assert(file && fseek(file, 0, SEEK_END) == 0);
    length = ftell(file);
    assert(length > 256 && fseek(file, 0, SEEK_SET) == 0);
    raw = malloc((size_t)length);
    assert(raw && fread(raw, 1, (size_t)length, file) == (size_t)length);
    fclose(file);
    assert(raw[0] == 'M' && raw[1] == 'Z');
    pe = u32(raw + 0x3c);
    assert(pe < (unsigned long)length - 256 && u32(raw + pe) == 0x4550);
    optional = pe + 24;
    assert(u16(raw + optional) == 0x10b);
    assert(u32(raw + optional + 28) == 0x10000000);
    size = u32(raw + optional + 56);
    assert(size > 0x1a0000 && size < 0x1000000);
    image = mmap((void *)0x10000000, size, PROT_READ | PROT_WRITE,
                 MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED_NOREPLACE, -1, 0);
    assert(image == (void *)0x10000000);
    sections = optional + u16(raw + pe + 20);
    assert(sections + u16(raw + pe + 6) * 40 < (unsigned long)length);
    for (i = 0; i < u16(raw + pe + 6); i += 1)
    {
        const unsigned char *section = raw + sections + i * 40;
        unsigned int rva = u32(section + 12), bytes = u32(section + 16);
        unsigned int offset = u32(section + 20);
        assert(rva <= size && bytes <= size - rva);
        assert(offset <= (unsigned long)length && bytes <= (unsigned long)length - offset);
        memcpy(image + rva, raw + offset, bytes);
    }
    free(raw);
    assert(mprotect(image, size, PROT_READ | PROT_EXEC) == 0);
    *mapped_size = size;
    return image;
}

#ifndef TARGET_ORACLE_NO_MAIN
int main(int argc, char **argv)
{
    unsigned char *image;
    unsigned int size, i;
    int code;
    const unsigned char *text;
    typedef const char *(__attribute__((stdcall)) *ErrorFunction)(int);
    ErrorFunction function;

    assert(argc == 2);
    image = load_anchor(argv[1], &size);
    function = (ErrorFunction)(uintptr_t)0x100efe3c;
    while (scanf("%d", &code) == 1)
    {
        text = (const unsigned char *)function(code);
        assert((uintptr_t)text >= (uintptr_t)image &&
               (uintptr_t)text < (uintptr_t)image + size);
        printf("%d\t", code);
        for (i = 0; text[i]; i += 1)
        {
            assert((uintptr_t)(text + i) < (uintptr_t)image + size && i < 16384);
            printf("%02x", text[i]);
        }
        puts("");
    }
    assert(munmap(image, size) == 0);
    return 0;
}
#endif
