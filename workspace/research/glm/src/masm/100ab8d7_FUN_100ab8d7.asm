.686
.MODEL FLAT, C
EXTRN sub_1008B0F3:PROC
EXTRN sub_100A6E33:PROC
.CODE
FUN_100ab8d7 PROC
L0:
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    mov eax, dword ptr [esi]
    push edi
    and eax, 0FFF00000h
    push eax
    mov ebx, ecx
    call sub_100A6E33
    xor edi, edi
    test eax, eax
    je L3
    cmp dword ptr [esi + 20], edi
    je L5
    cmp dword ptr [ebp + 12], 1
    jb L2
    push 010117154h
    push 000001194h
    push dword ptr [esi + 60]
    push ebx
    call sub_1008B0F3
    add esp, 16
L1:
    xor eax, eax
    jmp L6
L2:
    inc dword ptr [ebp + 12]
L3:
    cmp dword ptr [esi + 20], edi
    jbe L5
L4:
    mov eax, dword ptr [esi + 24]
    push dword ptr [ebp + 12]
    mov ecx, dword ptr [ebx + 24]
    mov eax, dword ptr [eax + edi*4]
    push dword ptr [ecx + eax*4]
    mov ecx, ebx
    call L0
    test eax, eax
    je L1
    inc edi
    cmp edi, dword ptr [esi + 20]
    jb L4
L5:
    xor eax, eax
    inc eax
L6:
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 8
FUN_100ab8d7 ENDP
END
