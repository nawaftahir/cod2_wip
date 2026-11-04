.686
.MODEL FLAT, C
EXTRN EXTRN g_1019BC78:DWORD:DWORD
.CODE
FUN_1003f620 PROC
    sub sub esp, 8
    push push esi
    mov mov esi, dword ptr [edi + 84]
    movzx movzx eax, byte ptr [esi + 14]
    movzx movzx edx, byte ptr [esi + 15]
    imul imul edx, eax
    cmp cmp edx, 1
    mov mov dword ptr [esp + 8], eax
    jne L0
    mov mov eax, 03F800000h
    mov mov dword ptr [ecx], 0
    mov mov dword ptr [ecx + 4], 0
    mov mov dword ptr [ecx + 8], eax
    mov mov dword ptr [ecx + 12], eax
    pop pop esi
    add add esp, 8
    ret ret
    mov mov eax, dword ptr [edi + 96]
    push push ebx
    movzx movzx ebx, byte ptr [esi + 15]
    cdq cdq
    idiv idiv ebx
    mov mov dword ptr [esp + 8], ebx
    pop pop ebx
    fild fild dword ptr [esp + 4]
    fdivr fdivr dword ptr [g_1019BC78]
    fild fild dword ptr [esp + 8]
    mov mov dword ptr [esp + 8], edx
    fdivr fdivr dword ptr [g_1019BC78]
    fild fild dword ptr [esp + 8]
    fmul fmul st(2)
    fstp fstp dword ptr [ecx]
    movzx movzx esi, byte ptr [esi + 15]
    mov mov eax, dword ptr [edi + 96]
    cdq cdq
    idiv idiv esi
    pop pop esi
    mov mov dword ptr [esp + 4], eax
    fild fild dword ptr [esp + 4]
    fmul fmul st(1)
    fstp fstp dword ptr [ecx + 4]
    fxch fxch st(1)
    fadd fadd dword ptr [ecx]
    fstp fstp dword ptr [ecx + 8]
    fadd fadd dword ptr [ecx + 4]
    fstp fstp dword ptr [ecx + 12]
    add add esp, 8
    ret ret
FUN_1003f620 ENDP
END
