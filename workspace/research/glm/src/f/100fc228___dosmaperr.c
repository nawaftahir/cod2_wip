

__declspec(naked) void __dosmaperr(void)
{
    __asm {
        _emit 056h _emit 0E8h _emit 0E6h _emit 0EEh _emit 0FFh _emit 0FFh _emit 08Bh _emit 04Ch _emit 024h _emit 008h _emit 089h _emit 048h _emit 00Ch _emit 033h _emit 0F6h _emit 03Bh _emit 00Ch _emit 0F5h _emit 048h _emit 04Ch _emit 01Ah _emit 010h _emit 074h _emit 01Eh _emit 046h _emit 083h _emit 0FEh _emit 02Dh _emit 072h _emit 0F1h _emit 083h _emit 0F9h _emit 013h _emit 072h _emit 024h _emit 083h _emit 0F9h _emit 024h _emit 077h _emit 01Fh _emit 0E8h _emit 0BFh _emit 0EEh _emit 0FFh _emit 0FFh _emit 0C7h _emit 040h _emit 008h _emit 00Dh _emit 000h _emit 000h _emit 000h _emit 05Eh _emit 0C3h _emit 0E8h _emit 0B1h _emit 0EEh _emit 0FFh _emit 0FFh _emit 08Bh _emit 00Ch _emit 0F5h _emit 04Ch _emit 04Ch _emit 01Ah _emit 010h _emit 089h _emit 048h _emit 008h _emit 05Eh _emit 0C3h _emit 081h _emit 0F9h _emit 0BCh _emit 000h _emit 000h _emit 000h _emit 072h _emit 016h _emit 081h _emit 0F9h _emit 0CAh _emit 000h _emit 000h _emit 000h _emit 077h _emit 00Eh _emit 0E8h _emit 090h _emit 0EEh _emit 0FFh _emit 0FFh _emit 0C7h _emit 040h _emit 008h _emit 008h _emit 000h _emit 000h _emit 000h _emit 05Eh _emit 0C3h _emit 0E8h _emit 082h _emit 0EEh _emit 0FFh _emit 0FFh _emit 0C7h _emit 040h _emit 008h _emit 016h _emit 000h _emit 000h _emit 000h _emit 05Eh _emit 0C3h
    }
}
