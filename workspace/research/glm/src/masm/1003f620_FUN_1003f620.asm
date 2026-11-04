.686
.MODEL FLAT, C
EXTRN g_1019BC78:DWORD
.CODE
FUN_1003f620 PROC
    sub esp, 8
    push esi
    mov esi, dword ptr [edi + 84]
    movzx eax, byte ptr [esi + 14]
    movzx edx, byte ptr [esi + 15]
    imul edx, eax
    cmp edx, 1
    mov dword ptr [esp + 8], eax
    jne L0
    mov eax, 03F800000h
    mov dword ptr [ecx], 0
    mov dword ptr [ecx + 4], 0
    mov dword ptr [ecx + 8], eax
    mov dword ptr [ecx + 12], eax
    pop esi
    add esp, 8
    ret
L0:
    mov eax, dword ptr [edi + 96]
    push ebx
    movzx ebx, byte ptr [esi + 15]
    cdq
    idiv ebx
    mov dword ptr [esp + 8], ebx
    pop ebx
    fild dword ptr [esp + 4]
    fdivr dword ptr [g_1019BC78]
    fild dword ptr [esp + 8]
    mov dword ptr [esp + 8], edx
    fdivr dword ptr [g_1019BC78]
    fild dword ptr [esp + 8]
    fmul st(2)
    fstp dword ptr [ecx]
    movzx esi, byte ptr [esi + 15]
    mov eax, dword ptr [edi + 96]
    cdq
    idiv esi
    pop esi
    mov dword ptr [esp + 4], eax
    fild dword ptr [esp + 4]
    fmul st(1)
    fstp dword ptr [ecx + 4]
    fxch st(1)
    fadd dword ptr [ecx]
    fstp dword ptr [ecx + 8]
    fadd dword ptr [ecx + 4]
    fstp dword ptr [ecx + 12]
    add esp, 8
    ret
FUN_1003f620 ENDP
END
