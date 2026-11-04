/* Import-thunk shims (PE ff 25 pattern): indirect tail-jump through a
 * const function-pointer slot, mirroring jumps into the import address
 * table. Verified relocation-normalized byte-identical via match_gfx. */

extern void RtlUnwind_slot(void);
extern void Direct3DCreate9_slot(void);
extern void DirectDrawEnumerateExA_slot(void);
extern void DirectDrawCreateEx_slot(void);

static void (*const p_RtlUnwind)(void) = RtlUnwind_slot;
static void (*const p_D3D9)(void) = Direct3DCreate9_slot;
static void (*const p_DDEnumExA)(void) = DirectDrawEnumerateExA_slot;
static void (*const p_DDCreateEx)(void) = DirectDrawCreateEx_slot;

void RtlUnwind(void)
{
    p_RtlUnwind();
}

void Direct3DCreate9(void)
{
    p_D3D9();
}

void DirectDrawEnumerateExA(void)
{
    p_DDEnumExA();
}

void DirectDrawCreateEx(void)
{
    p_DDCreateEx();
}
