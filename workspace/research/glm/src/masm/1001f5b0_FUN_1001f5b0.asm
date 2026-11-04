.686
.MODEL FLAT, C
EXTRN sub_1001D760:PROC
.CODE
FUN_1001f5b0 PROC
    mov eax, dword ptr [esp + 4]
    push ebx
    movzx ebx, byte ptr [eax + 29]
    push esi
    xor esi, esi
    test ebx, ebx
    push edi
    mov edi, dword ptr [eax + 8]
    jle L2
    push ebp
    mov ebp, dword ptr [esp + 24]
    lea esp, [esp]
L0:
    mov ecx, esi
    and ecx, 31
    mov edx, 1
    shl edx, cl
    mov ecx, esi
    sar ecx, 5
    test dword ptr [eax + ecx*4 + 12], edx
    je L1
    mov eax, ebp
    mov ecx, edi
    call sub_1001D760
    mov eax, dword ptr [esp + 20]
L1:
    inc esi
    add ebp, 64
    add edi, 32
    cmp esi, ebx
    jl L0
    pop ebp
L2:
    pop edi
    pop esi
    pop ebx
    ret
FUN_1001f5b0 ENDP
END
