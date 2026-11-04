extern int g_10001230;
extern int g_10001280;
extern int g_10001390;
extern int g_10001430;
extern int g_10001460;
extern int g_10001690;
extern int g_10003430;
extern int g_10005970;
extern int g_10005980;
extern int g_100059E0;
extern int g_10005A40;
extern int g_1000AA60;
extern int g_1000AAC0;
extern int g_1000BAD0;
extern int g_1000BB10;
extern int g_1000BB30;
extern int g_1000BBC0;
extern int g_1000BC40;
extern int g_1000BCE0;
extern int g_1000BDC0;
extern int g_1000BF40;
extern int g_1000BF60;
extern int g_1000C000;
extern int g_1000C010;
extern int g_1000C390;
extern int g_1000C4B0;
extern int g_1000C8D0;
extern int g_1000CE60;
extern int g_1000CE70;
extern int g_10013080;
extern int g_10013190;
extern int g_100131B0;
extern int g_10013200;
extern int g_10013250;
extern int g_10013260;
extern int g_10015BA0;
extern int g_10016F30;
extern int g_10017020;
extern int g_10017290;
extern int g_100172B0;
extern int g_10017300;
extern int g_10017310;
extern int g_10017320;
extern int g_1001D830;
extern int g_1001D8A0;
extern int g_1001D8C0;
extern int g_1001D8F0;
extern int g_1001D900;
extern int g_1001D910;
extern int g_100201B0;
extern int g_10020270;
extern int g_10020400;
extern int g_10020CB0;
extern int g_10020CC0;
extern int g_10020CD0;
extern int g_10020CE0;
extern int g_10020CF0;
extern int g_10020DC0;
extern int g_10020F10;
extern int g_10020F70;
extern int g_10020FE0;
extern int g_10021100;
extern int g_100211A0;
extern int g_10021270;
extern int g_10021300;
extern int g_100213F0;
extern int g_100214E0;
extern int g_100215D0;
extern int g_100216F0;
extern int g_10021BF0;
extern int g_10021F40;
extern int g_10021F90;
extern int g_10021FF0;
extern int g_10022040;
extern int g_10022220;
extern int g_100222A0;
extern int g_100222F0;
extern int g_10023DB0;
extern int g_10023E90;
extern int g_10023ED0;
extern int g_10023FD0;
extern int g_10025510;
extern int g_100256C0;
extern int g_100257A0;
extern int g_10026A50;
extern int g_10026A70;
extern int g_10026A90;
extern int g_100270E0;
extern int g_1002C100;
extern int g_1002CE20;
extern int g_1002CE30;
extern int g_1002CE40;
extern int g_1002CEE0;
extern int g_1002D4A0;
extern int g_10032540;
extern int g_10032D70;
extern int g_10032D80;
extern int g_10032F40;
extern int g_10193AA8;
extern int g_101D49C8;
extern int g_1076A880;

__declspec(naked) void GetRefAPI(void)
{
    __asm {
        _emit 056h _emit 08Bh _emit 074h _emit 024h _emit 00Ch _emit 057h _emit 0B9h _emit 0A9h _emit 000h _emit 000h _emit 000h _emit 0BFh
        /* g_101D49C8 */ dword ptr [g_101D49C8]
        _emit 0F3h _emit 0A5h _emit 033h _emit 0C0h _emit 0B9h _emit 06Ch _emit 000h _emit 000h _emit 000h _emit 0BFh
        /* g_1076A880 */ dword ptr [g_1076A880]
        _emit 0F3h _emit 0ABh _emit 08Bh _emit 044h _emit 024h _emit 00Ch _emit 083h _emit 0F8h _emit 03Bh _emit 05Fh _emit 05Eh _emit 074h _emit 016h _emit 050h _emit 06Ah _emit 03Bh _emit 068h
        /* g_10193AA8 */ dword ptr [g_10193AA8]
        _emit 06Ah _emit 000h _emit 0FFh _emit 015h
        /* g_101D49C8 */ dword ptr [g_101D49C8]
        _emit 083h _emit 0C4h _emit 010h _emit 033h _emit 0C0h _emit 0C3h _emit 0C7h _emit 005h _emit 080h _emit 0A8h _emit 076h _emit 010h
        /* g_10013080 */ dword ptr [g_10013080]
        _emit 0C7h _emit 005h _emit 084h _emit 0A8h _emit 076h _emit 010h
        /* g_10013190 */ dword ptr [g_10013190]
        _emit 0C7h _emit 005h _emit 088h _emit 0A8h _emit 076h _emit 010h
        /* g_1001D830 */ dword ptr [g_1001D830]
        _emit 0C7h _emit 005h _emit 08Ch _emit 0A8h _emit 076h _emit 010h
        /* g_1001D8A0 */ dword ptr [g_1001D8A0]
        _emit 0C7h _emit 005h _emit 0B0h _emit 0A8h _emit 076h _emit 010h
        /* g_1000C8D0 */ dword ptr [g_1000C8D0]
        _emit 0C7h _emit 005h _emit 090h _emit 0A8h _emit 076h _emit 010h
        /* g_10017290 */ dword ptr [g_10017290]
        _emit 0C7h _emit 005h _emit 094h _emit 0A8h _emit 076h _emit 010h
        /* g_100172B0 */ dword ptr [g_100172B0]
        _emit 0C7h _emit 005h _emit 098h _emit 0A8h _emit 076h _emit 010h
        /* g_10017020 */ dword ptr [g_10017020]
        _emit 0C7h _emit 005h _emit 09Ch _emit 0A8h _emit 076h _emit 010h
        /* g_10001690 */ dword ptr [g_10001690]
        _emit 0C7h _emit 005h _emit 0A0h _emit 0A8h _emit 076h _emit 010h
        /* g_10001230 */ dword ptr [g_10001230]
        _emit 0C7h _emit 005h _emit 0A4h _emit 0A8h _emit 076h _emit 010h
        /* g_1001D8C0 */ dword ptr [g_1001D8C0]
        _emit 0C7h _emit 005h _emit 0A8h _emit 0A8h _emit 076h _emit 010h
        /* g_1001D8F0 */ dword ptr [g_1001D8F0]
        _emit 0C7h _emit 005h _emit 0ACh _emit 0A8h _emit 076h _emit 010h
        /* g_1001D900 */ dword ptr [g_1001D900]
        _emit 0C7h _emit 005h _emit 0C4h _emit 0A8h _emit 076h _emit 010h
        /* g_100131B0 */ dword ptr [g_100131B0]
        _emit 0C7h _emit 005h _emit 0B4h _emit 0A8h _emit 076h _emit 010h
        /* g_10017300 */ dword ptr [g_10017300]
        _emit 0C7h _emit 005h _emit 0B8h _emit 0A8h _emit 076h _emit 010h
        /* g_10017310 */ dword ptr [g_10017310]
        _emit 0C7h _emit 005h _emit 0BCh _emit 0A8h _emit 076h _emit 010h
        /* g_10017320 */ dword ptr [g_10017320]
        _emit 0C7h _emit 005h _emit 0C0h _emit 0A8h _emit 076h _emit 010h
        /* g_1000AA60 */ dword ptr [g_1000AA60]
        _emit 0C7h _emit 005h _emit 03Ch _emit 0A9h _emit 076h _emit 010h
        /* g_10021F40 */ dword ptr [g_10021F40]
        _emit 0C7h _emit 005h _emit 040h _emit 0A9h _emit 076h _emit 010h
        /* g_10021F90 */ dword ptr [g_10021F90]
        _emit 0C7h _emit 005h _emit 044h _emit 0A9h _emit 076h _emit 010h
        /* g_10021FF0 */ dword ptr [g_10021FF0]
        _emit 0C7h _emit 005h _emit 048h _emit 0A9h _emit 076h _emit 010h
        /* g_10022040 */ dword ptr [g_10022040]
        _emit 0C7h _emit 005h _emit 04Ch _emit 0A9h _emit 076h _emit 010h
        /* g_10013200 */ dword ptr [g_10013200]
        _emit 0C7h _emit 005h _emit 050h _emit 0A9h _emit 076h _emit 010h
        /* g_10013250 */ dword ptr [g_10013250]
        _emit 0C7h _emit 005h _emit 054h _emit 0A9h _emit 076h _emit 010h
        /* g_100222A0 */ dword ptr [g_100222A0]
        _emit 0C7h _emit 005h _emit 058h _emit 0A9h _emit 076h _emit 010h
        /* g_100222F0 */ dword ptr [g_100222F0]
        _emit 0C7h _emit 005h _emit 05Ch _emit 0A9h _emit 076h _emit 010h
        /* g_10022220 */ dword ptr [g_10022220]
        _emit 0C7h _emit 005h _emit 060h _emit 0A9h _emit 076h _emit 010h
        /* g_10021BF0 */ dword ptr [g_10021BF0]
        _emit 0C7h _emit 005h _emit 064h _emit 0A9h _emit 076h _emit 010h
        /* g_10015BA0 */ dword ptr [g_10015BA0]
        _emit 0C7h _emit 005h _emit 068h _emit 0A9h _emit 076h _emit 010h
        /* g_1001D910 */ dword ptr [g_1001D910]
        _emit 0C7h _emit 005h _emit 0C8h _emit 0A8h _emit 076h _emit 010h
        /* g_10025510 */ dword ptr [g_10025510]
        _emit 0C7h _emit 005h _emit 0CCh _emit 0A8h _emit 076h _emit 010h
        /* g_10020CE0 */ dword ptr [g_10020CE0]
        _emit 0C7h _emit 005h _emit 0D0h _emit 0A8h _emit 076h _emit 010h
        /* g_10023DB0 */ dword ptr [g_10023DB0]
        _emit 0C7h _emit 005h _emit 0D4h _emit 0A8h _emit 076h _emit 010h
        /* g_10020CD0 */ dword ptr [g_10020CD0]
        _emit 0C7h _emit 005h _emit 0D8h _emit 0A8h _emit 076h _emit 010h
        /* g_10020CB0 */ dword ptr [g_10020CB0]
        _emit 0C7h _emit 005h _emit 0DCh _emit 0A8h _emit 076h _emit 010h
        /* g_10020CC0 */ dword ptr [g_10020CC0]
        _emit 0C7h _emit 005h _emit 0E0h _emit 0A8h _emit 076h _emit 010h
        /* g_10023E90 */ dword ptr [g_10023E90]
        _emit 0C7h _emit 005h _emit 0E4h _emit 0A8h _emit 076h _emit 010h
        /* g_10023ED0 */ dword ptr [g_10023ED0]
        _emit 0C7h _emit 005h _emit 0E8h _emit 0A8h _emit 076h _emit 010h
        /* g_10023FD0 */ dword ptr [g_10023FD0]
        _emit 0C7h _emit 005h _emit 0ECh _emit 0A8h _emit 076h _emit 010h
        /* g_10001390 */ dword ptr [g_10001390]
        _emit 0C7h _emit 005h _emit 0F0h _emit 0A8h _emit 076h _emit 010h
        /* g_10001280 */ dword ptr [g_10001280]
        _emit 0C7h _emit 005h _emit 0F4h _emit 0A8h _emit 076h _emit 010h
        /* g_1000AAC0 */ dword ptr [g_1000AAC0]
        _emit 0C7h _emit 005h _emit 0F8h _emit 0A8h _emit 076h _emit 010h
        /* g_1000BB30 */ dword ptr [g_1000BB30]
        _emit 0C7h _emit 005h _emit 0FCh _emit 0A8h _emit 076h _emit 010h
        /* g_1000BBC0 */ dword ptr [g_1000BBC0]
        _emit 0C7h _emit 005h _emit 000h _emit 0A9h _emit 076h _emit 010h
        /* g_1000BC40 */ dword ptr [g_1000BC40]
        _emit 0C7h _emit 005h _emit 004h _emit 0A9h _emit 076h _emit 010h
        /* g_1000BB10 */ dword ptr [g_1000BB10]
        _emit 0C7h _emit 005h _emit 008h _emit 0A9h _emit 076h _emit 010h
        /* g_10001430 */ dword ptr [g_10001430]
        _emit 0C7h _emit 005h _emit 00Ch _emit 0A9h _emit 076h _emit 010h
        /* g_10001460 */ dword ptr [g_10001460]
        _emit 0C7h _emit 005h _emit 010h _emit 0A9h _emit 076h _emit 010h
        /* g_100257A0 */ dword ptr [g_100257A0]
        _emit 0C7h _emit 005h _emit 014h _emit 0A9h _emit 076h _emit 010h
        /* g_10020F10 */ dword ptr [g_10020F10]
        _emit 0C7h _emit 005h _emit 018h _emit 0A9h _emit 076h _emit 010h
        /* g_10020F70 */ dword ptr [g_10020F70]
        _emit 0C7h _emit 005h _emit 01Ch _emit 0A9h _emit 076h _emit 010h
        /* g_10020FE0 */ dword ptr [g_10020FE0]
        _emit 0C7h _emit 005h _emit 020h _emit 0A9h _emit 076h _emit 010h
        /* g_1000BAD0 */ dword ptr [g_1000BAD0]
        _emit 0C7h _emit 005h _emit 028h _emit 0A9h _emit 076h _emit 010h
        /* g_10021100 */ dword ptr [g_10021100]
        _emit 0C7h _emit 005h _emit 02Ch _emit 0A9h _emit 076h _emit 010h
        /* g_100211A0 */ dword ptr [g_100211A0]
        _emit 0C7h _emit 005h _emit 030h _emit 0A9h _emit 076h _emit 010h
        /* g_10021270 */ dword ptr [g_10021270]
        _emit 0C7h _emit 005h _emit 034h _emit 0A9h _emit 076h _emit 010h
        /* g_100214E0 */ dword ptr [g_100214E0]
        _emit 0C7h _emit 005h _emit 038h _emit 0A9h _emit 076h _emit 010h
        /* g_100215D0 */ dword ptr [g_100215D0]
        _emit 0C7h _emit 005h _emit 024h _emit 0A9h _emit 076h _emit 010h
        /* g_100216F0 */ dword ptr [g_100216F0]
        _emit 0C7h _emit 005h _emit 074h _emit 0A9h _emit 076h _emit 010h
        /* g_1000BCE0 */ dword ptr [g_1000BCE0]
        _emit 0C7h _emit 005h _emit 078h _emit 0A9h _emit 076h _emit 010h
        /* g_1000CE60 */ dword ptr [g_1000CE60]
        _emit 0C7h _emit 005h _emit 07Ch _emit 0A9h _emit 076h _emit 010h
        /* g_1000CE70 */ dword ptr [g_1000CE70]
        _emit 0C7h _emit 005h _emit 080h _emit 0A9h _emit 076h _emit 010h
        /* g_10026A50 */ dword ptr [g_10026A50]
        _emit 0C7h _emit 005h _emit 084h _emit 0A9h _emit 076h _emit 010h
        /* g_10026A70 */ dword ptr [g_10026A70]
        _emit 0C7h _emit 005h _emit 088h _emit 0A9h _emit 076h _emit 010h
        /* g_10026A90 */ dword ptr [g_10026A90]
        _emit 0C7h _emit 005h _emit 08Ch _emit 0A9h _emit 076h _emit 010h
        /* g_100270E0 */ dword ptr [g_100270E0]
        _emit 0C7h _emit 005h _emit 090h _emit 0A9h _emit 076h _emit 010h
        /* g_10005980 */ dword ptr [g_10005980]
        _emit 0C7h _emit 005h _emit 094h _emit 0A9h _emit 076h _emit 010h
        /* g_100059E0 */ dword ptr [g_100059E0]
        _emit 0C7h _emit 005h _emit 098h _emit 0A9h _emit 076h _emit 010h
        /* g_10005A40 */ dword ptr [g_10005A40]
        _emit 0C7h _emit 005h _emit 09Ch _emit 0A9h _emit 076h _emit 010h
        /* g_10005970 */ dword ptr [g_10005970]
        _emit 0C7h _emit 005h _emit 06Ch _emit 0A9h _emit 076h _emit 010h
        /* g_10013260 */ dword ptr [g_10013260]
        _emit 0C7h _emit 005h _emit 070h _emit 0A9h _emit 076h _emit 010h
        /* g_1002C100 */ dword ptr [g_1002C100]
        _emit 0C7h _emit 005h _emit 0A0h _emit 0A9h _emit 076h _emit 010h
        /* g_10032540 */ dword ptr [g_10032540]
        _emit 0C7h _emit 005h _emit 0A4h _emit 0A9h _emit 076h _emit 010h
        /* g_1000BF40 */ dword ptr [g_1000BF40]
        _emit 0C7h _emit 005h _emit 0A8h _emit 0A9h _emit 076h _emit 010h
        /* g_1000BF60 */ dword ptr [g_1000BF60]
        _emit 0C7h _emit 005h _emit 0ACh _emit 0A9h _emit 076h _emit 010h
        /* g_1000C000 */ dword ptr [g_1000C000]
        _emit 0C7h _emit 005h _emit 0B0h _emit 0A9h _emit 076h _emit 010h
        /* g_1000C010 */ dword ptr [g_1000C010]
        _emit 0C7h _emit 005h _emit 0B4h _emit 0A9h _emit 076h _emit 010h
        /* g_100213F0 */ dword ptr [g_100213F0]
        _emit 0C7h _emit 005h _emit 0B8h _emit 0A9h _emit 076h _emit 010h
        /* g_1000C390 */ dword ptr [g_1000C390]
        _emit 0C7h _emit 005h _emit 0BCh _emit 0A9h _emit 076h _emit 010h
        /* g_1000C4B0 */ dword ptr [g_1000C4B0]
        _emit 0C7h _emit 005h _emit 0C0h _emit 0A9h _emit 076h _emit 010h
        /* g_10021300 */ dword ptr [g_10021300]
        _emit 0C7h _emit 005h _emit 0C4h _emit 0A9h _emit 076h _emit 010h
        /* g_100201B0 */ dword ptr [g_100201B0]
        _emit 0C7h _emit 005h _emit 0C8h _emit 0A9h _emit 076h _emit 010h
        /* g_10020270 */ dword ptr [g_10020270]
        _emit 0C7h _emit 005h _emit 0CCh _emit 0A9h _emit 076h _emit 010h
        /* g_10003430 */ dword ptr [g_10003430]
        _emit 0C7h _emit 005h _emit 0D0h _emit 0A9h _emit 076h _emit 010h
        /* g_10016F30 */ dword ptr [g_10016F30]
        _emit 0C7h _emit 005h _emit 0D4h _emit 0A9h _emit 076h _emit 010h
        /* g_1000BDC0 */ dword ptr [g_1000BDC0]
        _emit 0C7h _emit 005h _emit 000h _emit 0AAh _emit 076h _emit 010h
        /* g_1002D4A0 */ dword ptr [g_1002D4A0]
        _emit 0C7h _emit 005h _emit 004h _emit 0AAh _emit 076h _emit 010h
        /* g_10020400 */ dword ptr [g_10020400]
        _emit 0C7h _emit 005h _emit 008h _emit 0AAh _emit 076h _emit 010h
        /* g_1002CEE0 */ dword ptr [g_1002CEE0]
        _emit 0C7h _emit 005h _emit 00Ch _emit 0AAh _emit 076h _emit 010h
        /* g_1002CE40 */ dword ptr [g_1002CE40]
        _emit 0C7h _emit 005h _emit 010h _emit 0AAh _emit 076h _emit 010h
        /* g_1002CE30 */ dword ptr [g_1002CE30]
        _emit 0C7h _emit 005h _emit 014h _emit 0AAh _emit 076h _emit 010h
        /* g_1002CE20 */ dword ptr [g_1002CE20]
        _emit 0C7h _emit 005h _emit 018h _emit 0AAh _emit 076h _emit 010h
        /* g_10020CF0 */ dword ptr [g_10020CF0]
        _emit 0C7h _emit 005h _emit 01Ch _emit 0AAh _emit 076h _emit 010h
        /* g_10020DC0 */ dword ptr [g_10020DC0]
        _emit 0C7h _emit 005h _emit 020h _emit 0AAh _emit 076h _emit 010h
        /* g_10032F40 */ dword ptr [g_10032F40]
        _emit 0C7h _emit 005h _emit 024h _emit 0AAh _emit 076h _emit 010h
        /* g_10032D80 */ dword ptr [g_10032D80]
        _emit 0C7h _emit 005h _emit 028h _emit 0AAh _emit 076h _emit 010h
        /* g_10032D70 */ dword ptr [g_10032D70]
        _emit 0C7h _emit 005h _emit 02Ch _emit 0AAh _emit 076h _emit 010h
        /* g_100256C0 */ dword ptr [g_100256C0]
        _emit 0B8h
        /* g_1076A880 */ dword ptr [g_1076A880]
        _emit 0C3h
    }
}
