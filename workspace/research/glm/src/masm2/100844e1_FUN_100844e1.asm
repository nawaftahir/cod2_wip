.686
.MODEL FLAT, C
EXTRN sub_10084186:PROC
EXTRN sub_100845B6:PROC
EXTRN sub_100845D3:PROC
EXTRN sub_100845D9:PROC
EXTRN sub_100845E0:PROC
EXTRN sub_100845E2:PROC
EXTRN sub_100845E3:PROC
EXTRN sub_100845EC:PROC
EXTRN sub_1008465B:PROC
EXTRN sub_100F789E:PROC
EXTRN sub_100F791B:PROC
.CODE
FUN_100844e1 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    mov mov eax, dword ptr [ebp + 20]
    push push edi
    xor xor edi, edi
    cmp cmp dword ptr [eax + 4], 13
    mov mov dword ptr [ebp - 4], edi
    jne sub_100845B6
    push push esi
    mov mov esi, dword ptr [eax + 32]
    cmp cmp dword ptr [esi + 4], 1
    jne sub_100845B6
    push push ebx
    mov mov ebx, dword ptr [ebp + 12]
    shl shl ebx, 4
    push push ebx
    call sub_100F789E
    mov mov edi, eax
    test test edi, edi
    pop pop ecx
    mov mov dword ptr [ebp - 4], edi
    jne L0
    mov mov edi, 08007000Eh
    jmp sub_100845D3
    mov mov ecx, ebx
    mov mov edx, ecx
    shr shr ecx, 2
    xor xor eax, eax
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    mov mov eax, dword ptr [ebp + 12]
    test test eax, eax
    jbe sub_100845D9
    mov mov ecx, dword ptr [ebp - 4]
    mov mov dword ptr [ebp + 12], ecx
    mov mov dword ptr [ebp + 20], eax
    mov mov edi, dword ptr [ebp + 16]
    test test edi, edi
    jbe sub_100845E0
    mov mov ecx, dword ptr [ebp + 12]
    mov mov eax, dword ptr [esi + 8]
    mov mov edx, dword ptr [eax + 16]
    cmp cmp edx, 3
    jne sub_100845E0
    fld fld qword ptr [eax + 24]
    fstp fstp dword ptr [ecx]
    jmp sub_100845EC
L0:
    mov mov eax, dword ptr [eax + 24]
    mov mov dword ptr [ecx], eax
    mov mov esi, dword ptr [esi + 12]
    add add ecx, 4
    dec dec edi
    jne sub_100845E3
    add add dword ptr [ebp + 12], 16
    dec dec dword ptr [ebp + 20]
    jne sub_100845E2
    push push dword ptr [ebp + 24]
    mov mov ecx, dword ptr [ebp + 8]
    push push 6
    push push ebx
    push push dword ptr [ebp - 4]
    call sub_10084186
    mov mov edi, eax
    pop pop ebx
    push push dword ptr [ebp - 4]
    call sub_100F791B
    pop pop ecx
    mov mov eax, edi
    pop pop esi
    jmp sub_1008465B
    xor xor eax, eax
    pop pop edi
    leave leave
    ret ret 20
FUN_100844e1 ENDP
END
