typedef unsigned char byte;

#define HASH_TABLE_SIZE 0x4000
#define HASH_STAT_MASK 0xc000
#define HASH_NEXT_MASK 0x3fff

struct HashEntry
{
    unsigned short status_next;
    unsigned short prev;
};

struct RefString
{
    unsigned char byteLen;
    unsigned char user;
    unsigned short refCount;
    char str[4];
};

struct scrStringGlob_t
{
    HashEntry hashTable[HASH_TABLE_SIZE];
    bool inited;
    HashEntry *nextFreeEntry;
};

scrStringGlob_t scrStringGlob;

extern void SL_Clear();
extern void SL_Init();

unsigned int __fastcall GetHashCode( const char *str, unsigned int len )
{
    unsigned int hash;

    if ( len < 0x100 )
    {
        hash = 0;

        while ( len )
        {
            hash = *str + 31 * hash;

            str++;
            len--;
        }

        return hash % ( HASH_TABLE_SIZE - 1 ) + 1;
    }

    return ( len >> 2 ) % ( HASH_TABLE_SIZE - 1 ) + 1;
}

void SL_Restart()
{
    if ( scrStringGlob.inited )
        return SL_Clear();

    return SL_Init();
}
