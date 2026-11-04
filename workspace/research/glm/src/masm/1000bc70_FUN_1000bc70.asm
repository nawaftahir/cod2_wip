.686
.MODEL FLAT, C
.CODE
FUN_1000bc70 PROC
    cmp edi, 32
    push ebp
    mov ebp, dword ptr [esp + 8]
    jb L0
    cmp edi, 127
    ja L0
    mov ecx, dword ptr [ebp + 16]
    lea eax, [edi + edi*2 - 96]
    lea eax, [ecx + eax*8]
    pop ebp
    ret
L0:
    mov ecx, dword ptr [ebp + 8]
    push ebx
    push esi
    dec ecx
    mov esi, 96
    cmp ecx, esi
    jl L4
    mov ebx, dword ptr [ebp + 16]
    lea ecx, [ecx]
L1:
    lea eax, [esi + ecx]
    cdq
    sub eax, edx
    sar eax, 1
    lea edx, [eax + eax*2]
    movzx edx, word ptr [ebx + edx*8]
    cmp edx, edi
    je L5
    jae L2
    lea esi, [eax + 1]
    jmp L3
L2:
    lea ecx, [eax - 1]
L3:
    cmp esi, ecx
    jle L1
L4:
    mov eax, dword ptr [ebp + 16]
    pop esi
    pop ebx
    add eax, 000000150h
    pop ebp
    ret
L5:
    lea eax, [eax + eax*2]
    pop esi
    lea eax, [ebx + eax*8]
    pop ebx
    pop ebp
    ret
FUN_1000bc70 ENDP
END
