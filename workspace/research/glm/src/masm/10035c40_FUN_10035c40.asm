.686
.MODEL FLAT, C
EXTRN sub_10035C3D:PROC
EXTRN g_10764578:DWORD
EXTRN g_1076457C:DWORD
.CODE
FUN_10035c40 PROC
    push ebp
    push esi
    mov esi, dword ptr [g_1076457C]
    push edi
    dec esi
    xor edi, edi
    test esi, esi
    jl L4
L0:
    mov edx, dword ptr [g_10764578]
    lea eax, [edi + esi]
    sar eax, 1
    lea ecx, [eax + eax*2]
    movzx ebp, word ptr [edx + ecx*2]
    lea edx, [edx + ecx*2]
    mov ecx, ebx
    sub ecx, ebp
    jne L1
    movzx ebp, word ptr [edx + 2]
    mov ecx, dword ptr [esp + 16]
    sub ecx, ebp
    jne L1
    movzx edx, word ptr [edx + 4]
    mov ecx, dword ptr [esp + 20]
    sub ecx, edx
    je L6
L1:
    test ecx, ecx
    jge L2
    lea esi, [eax - 1]
    jmp L3
L2:
    lea edi, [eax + 1]
L3:
    cmp edi, esi
    jle L0
L4:
    mov eax, dword ptr [esp + 24]
    test eax, eax
    je L5
    mov eax, dword ptr [esp + 20]
    mov ecx, dword ptr [esp + 16]
    push eax
    push ecx
    push ebx
    mov edx, edi
    call sub_10035C3D
    add esp, 12
    test al, al
    je L5
    mov eax, edi
    pop edi
    pop esi
    pop ebp
    ret
L5:
    or eax, 0FFFFFFFFh
L6:
    pop edi
    pop esi
    pop ebp
    ret
FUN_10035c40 ENDP
END
