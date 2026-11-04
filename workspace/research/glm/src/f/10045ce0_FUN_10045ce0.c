/* FUN_10045ce0 @ 0x10045ce0 — D3D command emitter entry.
 * TU-reconstructed together with static helper R_EmitCmd (sibling target
 * 0x10044e40, same file): MSVC passes EmitCtx* in ESI between them (IPRA),
 * reproducible only when both live in one translation unit. */
typedef struct CmdBuf {
    unsigned char *volatile cur;   /* +0x00 cursor            */
    int            free_;          /* +0x04 bytes remaining   */
    char           pad08[4];       /* +0x08                   */
    int (*flush)(void *ctx);       /* +0x0c space-refill hook */
} CmdBuf;

typedef struct EmitCtx {
    void **vtab;                   /* +0x00 [+0x14] = overflow flag, [0] = reset */
    char   pad04[8];
    char  *pad0c;
    char   pad10[4];
    char   pad14[4];
    int    val1c;
    char   pad1c[4];
    CmdBuf *buf;                   /* +0x20 */
} EmitCtx;

static void R_EmitWord(EmitCtx *ctx, int v);

static void R_EmitCmd(EmitCtx *ctx, unsigned char b)
{
    CmdBuf *cb;
    unsigned char *p;
    unsigned char *q;
    int free_;
    void (*reset)(void *);

    cb = ctx->buf;
    p = cb->cur;
    *p = 0xff;
    q = cb->cur;
    cb->cur = q + 1;
    free_ = cb->free_ - 1;
    cb->free_ = free_;
    if (free_ == 0)
    {
        if (!cb->flush(ctx))
        {
            *(int *)((char *)ctx->vtab + 0x14) = 0x18;
        }
        reset = (void (*)(void *))ctx->vtab[0];
        reset(ctx);
    }
    cb = ctx->buf;
    p = cb->cur;
    *p = b;
    q = cb->cur;
    cb->cur = q + 1;
    free_ = cb->free_ - 1;
    cb->free_ = free_;
    if (free_ == 0)
    {
        if (!cb->flush(ctx))
        {
            *(int *)((char *)ctx->vtab + 0x14) = 0x18;
        }
    }
    {
        void (*dispatch)(EmitCtx *);

        dispatch = (void (*)(EmitCtx *))ctx->vtab[0];
        dispatch(ctx);
    }
}

void FUN_10045ce0(EmitCtx *ctx)
{
    R_EmitCmd(ctx, 0xd9);
}


int g_dummy_tu_anchor;   /* keep TU non-empty for standalone obj */

void FUN_10045320(EmitCtx *ctx)
{
    R_EmitCmd(ctx, 0xdd);
    R_EmitWord(ctx, 4);
    R_EmitWord(ctx, ctx->val1c);
}

static void R_EmitWord(EmitCtx *ctx, int v)
{
    CmdBuf *cb;
    unsigned char *p;
    unsigned char *q;
    int free_;
    void (*reset)(void *);

    cb = ctx->buf;
    p = cb->cur;
    *p = (unsigned char)(v >> 8);
    q = cb->cur;
    cb->cur = q + 1;
    free_ = cb->free_ - 1;
    cb->free_ = free_;
    if (free_ == 0)
    {
        if (!cb->flush(ctx))
        {
            *(int *)((char *)ctx->vtab + 0x14) = 0x18;
        }
        reset = (void (*)(void *))ctx->vtab[0];
        reset(ctx);
    }
    cb = ctx->buf;
    p = cb->cur;
    *p = (unsigned char)v;
    q = cb->cur;
    cb->cur = q + 1;
    free_ = cb->free_ - 1;
    cb->free_ = free_;
    if (free_ == 0)
    {
        if (!cb->flush(ctx))
        {
            *(int *)((char *)ctx->vtab + 0x14) = 0x18;
        }
    }
    reset = (void (*)(void *))ctx->vtab[0];
    reset(ctx);
}