.686
.MODEL FLAT, C
EXTRN sub_10005789:PROC
EXTRN sub_1003484F:PROC
EXTRN sub_10034860:PROC
EXTRN sub_10034869:PROC
EXTRN sub_10060D54:PROC
EXTRN EXTRN g_1019BCB4:DWORD:DWORD
EXTRN EXTRN g_1019BDF0:DWORD:DWORD
EXTRN EXTRN g_1019BDF4:DWORD:DWORD
EXTRN EXTRN g_1019BDF8:DWORD:DWORD
EXTRN EXTRN g_106D3194:DWORD:DWORD
EXTRN EXTRN g_1072DDB8:DWORD:DWORD
.CODE
FUN_10034700 PROC
    sub sub esp, 20
    mov mov eax, dword ptr [g_106D3194]
    mov mov ecx, dword ptr [eax + 0249D64h]
    push push ebp
    mov mov ebp, dword ptr [esp + 28]
    push push esi
    xor xor esi, esi
    cmp cmp ecx, esi
    mov mov dword ptr [esp + 8], esi
    jle sub_1003484F
    push push ebx
    push push edi
    jmp L0
    lea lea esp, [esp]
    lea lea ecx, [ecx]
    mov mov ecx, dword ptr [eax + 0249D60h]
    mov mov edi, dword ptr [esi + ecx + 32]
    lea lea edx, [esi + ecx]
    mov mov ecx, dword ptr [g_1072DDB8]
    sub sub ecx, edi
    mov mov dword ptr [esp + 20], ecx
    js sub_10034860
    cmp cmp ecx, dword ptr [edx + 36]
    jg sub_10034869
    mov mov edx, dword ptr [eax + 0249D60h]
    mov mov dword ptr [esi + edx + 24], 03F800000h
    mov mov edx, dword ptr [eax + 0249D60h]
    mov mov edi, dword ptr [esi + edx + 36]
    add add ecx, ecx
    cmp cmp ecx, edi
    jle L1
    fild fild dword ptr [esp + 20]
    lea lea ecx, [esi + edx]
    fadd fadd st(0), st(0)
    fidiv fidiv dword ptr [ecx + 36]
    fsubr fsubr dword ptr [g_1019BCB4]
    fstp fstp dword ptr [ecx + 24]
    fild fild dword ptr [esp + 20]
    mov mov eax, dword ptr [eax + 0249D60h]
    fld fld dword ptr [g_1019BDF8]
    add add eax, esi
    mov mov ecx, dword ptr [eax + 28]
    fmul fmul st(1)
    push push ecx
    push push 010196CCCh
    fiadd fiadd dword ptr [esp + 24]
    fsin fsin
    fmul fmul dword ptr [g_1019BDF4]
    fld fld st(0)
    fmul fmul dword ptr [ebp + 24]
    fadd fadd dword ptr [eax]
    fstp fstp dword ptr [esp + 32]
    fld fld st(0)
    fmul fmul dword ptr [ebp + 28]
    fadd fadd dword ptr [eax + 4]
    fstp fstp dword ptr [esp + 36]
    fmul fmul dword ptr [ebp + 32]
    fadd fadd dword ptr [eax + 8]
    fxch fxch st(1)
    fmul fmul dword ptr [g_1019BDF0]
    faddp faddp st(1)
    fstp fstp dword ptr [esp + 40]
    call sub_10060D54
    push push eax
    mov mov eax, dword ptr [g_106D3194]
    mov mov edx, dword ptr [eax + 0249D60h]
    lea lea ecx, [esp + 36]
    push push 03F000000h
    lea lea ebx, [edx + esi + 12]
    push push ecx
    lea lea edi, [eax + 0249D18h]
    call sub_10005789
    mov mov eax, dword ptr [g_106D3194]
    add add esp, 20
    mov mov ecx, dword ptr [esp + 16]
    mov mov edx, dword ptr [eax + 0249D64h]
    inc inc ecx
    add add esi, 40
    cmp cmp ecx, edx
    mov mov dword ptr [esp + 16], ecx
FUN_10034700 ENDP
END
