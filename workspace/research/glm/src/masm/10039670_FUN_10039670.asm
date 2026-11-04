.686
.MODEL FLAT, C
EXTRN sub_1001390A:PROC
EXTRN sub_10039639:PROC
EXTRN g_1072D9BC:DWORD
.CODE
FUN_10039670 PROC
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 16]
    mov ebx, eax
    mov eax, dword ptr [ebx]
    push esi
    push edi
    mov edi, dword ptr [esp + 20]
    mov dword ptr [ebp], eax
    mov ecx, dword ptr [ebx + 4]
    xor esi, esi
    mov dword ptr [ebp + 4], ecx
    add edi, 4
    mov edi, edi
L0:
    mov eax, dword ptr [edi]
    mov ecx, ebp
    call sub_10039639
    test al, al
    jne L1
    mov edx, dword ptr [g_1072D9BC]
    mov eax, dword ptr [edx]
    mov ecx, dword ptr [esp + 20]
    mov edx, dword ptr [ecx]
    push eax
    push esi
    push edx
    push 010198BA8h
    push 0
    call sub_1001390A
    add esp, 20
L1:
    inc esi
    add edi, 4
    cmp esi, 11
    jb L0
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
FUN_10039670 ENDP
END
