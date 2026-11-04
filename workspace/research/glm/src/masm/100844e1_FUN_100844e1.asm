.686
.MODEL FLAT, C
EXTRN sub_10084186:PROC
EXTRN sub_100F789E:PROC
EXTRN sub_100F791B:PROC
.CODE
FUN_100844e1 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    mov eax, dword ptr [ebp + 20]
    push edi
    xor edi, edi
    cmp dword ptr [eax + 4], 13
    mov dword ptr [ebp - 4], edi
    jne L9
    push esi
    mov esi, dword ptr [eax + 32]
    cmp dword ptr [esi + 4], 1
    jne L8
    push ebx
    mov ebx, dword ptr [ebp + 12]
    shl ebx, 4
    push ebx
    call sub_100F789E
    mov edi, eax
    test edi, edi
    pop ecx
    mov dword ptr [ebp - 4], edi
    jne L0
    mov edi, 08007000Eh
    jmp L7
L0:
    mov ecx, ebx
    mov edx, ecx
    shr ecx, 2
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    mov eax, dword ptr [ebp + 12]
    test eax, eax
    jbe L6
    mov ecx, dword ptr [ebp - 4]
    mov dword ptr [ebp + 12], ecx
    mov dword ptr [ebp + 20], eax
L1:
    mov edi, dword ptr [ebp + 16]
    test edi, edi
    jbe L5
    mov ecx, dword ptr [ebp + 12]
L2:
    mov eax, dword ptr [esi + 8]
    mov edx, dword ptr [eax + 16]
    cmp edx, 3
    jne L3
    fld qword ptr [eax + 24]
    fstp dword ptr [ecx]
    jmp L4
L3:
    mov eax, dword ptr [eax + 24]
    mov dword ptr [ecx], eax
L4:
    mov esi, dword ptr [esi + 12]
    add ecx, 4
    dec edi
    jne L2
L5:
    add dword ptr [ebp + 12], 16
    dec dword ptr [ebp + 20]
    jne L1
L6:
    push dword ptr [ebp + 24]
    mov ecx, dword ptr [ebp + 8]
    push 6
    push ebx
    push dword ptr [ebp - 4]
    call sub_10084186
    mov edi, eax
L7:
    pop ebx
L8:
    push dword ptr [ebp - 4]
    call sub_100F791B
    pop ecx
    mov eax, edi
    pop esi
    jmp L10
L9:
    xor eax, eax
L10:
    pop edi
    leave
    ret 20
FUN_100844e1 ENDP
END
