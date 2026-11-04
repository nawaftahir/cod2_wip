.686
.MODEL FLAT, C
EXTRN sub_10005789:PROC
EXTRN sub_1003484F:PROC
EXTRN sub_10060D54:PROC
EXTRN g_1019BCB4:DWORD
EXTRN g_1019BDF0:DWORD
EXTRN g_1019BDF4:DWORD
EXTRN g_1019BDF8:DWORD
EXTRN g_106D3194:DWORD
EXTRN g_1072DDB8:DWORD
.CODE
FUN_10034700 PROC
    sub esp, 20
    mov eax, dword ptr [g_106D3194]
    mov ecx, dword ptr [eax + 000249D64h]
    push ebp
    mov ebp, dword ptr [esp + 28]
    push esi
    xor esi, esi
    cmp ecx, esi
    mov dword ptr [esp + 8], esi
    jle sub_1003484F
    push ebx
    push edi
    jmp L0
    lea esp, [esp]
    lea ecx, [ecx]
L0:
    mov ecx, dword ptr [eax + 000249D60h]
    mov edi, dword ptr [esi + ecx + 32]
    lea edx, [esi + ecx]
    mov ecx, dword ptr [g_1072DDB8]
    sub ecx, edi
    mov dword ptr [esp + 20], ecx
    js L2
    cmp ecx, dword ptr [edx + 36]
    jg L2
    mov edx, dword ptr [eax + 000249D60h]
    mov dword ptr [esi + edx + 24], 03F800000h
    mov edx, dword ptr [eax + 000249D60h]
    mov edi, dword ptr [esi + edx + 36]
    add ecx, ecx
    cmp ecx, edi
    jle L1
    fild dword ptr [esp + 20]
    lea ecx, [esi + edx]
    fadd st(0), st(0)
    fidiv dword ptr [ecx + 36]
    fsubr dword ptr [g_1019BCB4]
    fstp dword ptr [ecx + 24]
L1:
    fild dword ptr [esp + 20]
    mov eax, dword ptr [eax + 000249D60h]
    fld dword ptr [g_1019BDF8]
    add eax, esi
    mov ecx, dword ptr [eax + 28]
    fmul st(1)
    push ecx
    push 010196CCCh
    fiadd dword ptr [esp + 24]
    fsin
    fmul dword ptr [g_1019BDF4]
    fld st(0)
    fmul dword ptr [ebp + 24]
    fadd dword ptr [eax]
    fstp dword ptr [esp + 32]
    fld st(0)
    fmul dword ptr [ebp + 28]
    fadd dword ptr [eax + 4]
    fstp dword ptr [esp + 36]
    fmul dword ptr [ebp + 32]
    fadd dword ptr [eax + 8]
    fxch st(1)
    fmul dword ptr [g_1019BDF0]
    faddp st(1)
    fstp dword ptr [esp + 40]
    call sub_10060D54
    push eax
    mov eax, dword ptr [g_106D3194]
    mov edx, dword ptr [eax + 000249D60h]
    lea ecx, [esp + 36]
    push 03F000000h
    lea ebx, [edx + esi + 12]
    push ecx
    lea edi, [eax + 000249D18h]
    call sub_10005789
    mov eax, dword ptr [g_106D3194]
    add esp, 20
L2:
    mov ecx, dword ptr [esp + 16]
    mov edx, dword ptr [eax + 000249D64h]
    inc ecx
    add esi, 40
    cmp ecx, edx
    mov dword ptr [esp + 16], ecx
FUN_10034700 ENDP
END
