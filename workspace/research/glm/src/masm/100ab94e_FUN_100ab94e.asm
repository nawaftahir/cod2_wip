.686
.MODEL FLAT, C
EXTRN sub_1008B0DD:PROC
EXTRN sub_1008B147:PROC
EXTRN sub_100AB98F:PROC
.CODE
FUN_100ab94e PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push esi
    mov esi, ecx
    mov ecx, dword ptr [esi + 12]
    push edi
    xor edi, edi
    cmp ecx, 64
    mov dword ptr [ebp - 4], edi
    jbe L0
    push 0101171DCh
    push 000001194h
    push edi
    push esi
    call sub_1008B0DD
    xor eax, eax
    add esp, 16
    inc eax
    jmp L9
L0:
    xor eax, eax
    cmp ecx, edi
    jbe L2
L1:
    mov ecx, dword ptr [esi + 24]
    mov ecx, dword ptr [ecx + eax*4]
    inc eax
    mov dword ptr [ecx + 40], edi
    cmp eax, dword ptr [esi + 12]
    jb L1
L2:
    push ebx
    xor ebx, ebx
    cmp dword ptr [esi + 12], edi
    jbe L8
L3:
    mov eax, dword ptr [esi + 24]
    mov eax, dword ptr [eax + ebx*4]
    mov dword ptr [esi + 000000100h], eax
    cmp dword ptr [eax + 36], edi
    je L6
    cmp dword ptr [eax + 4], 0
    jbe L6
L4:
    mov eax, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [eax + 8]
    mov ecx, dword ptr [ecx + edi*4]
    mov edx, dword ptr [esi + 20]
    mov ecx, dword ptr [edx + ecx*4]
    cmp byte ptr [ecx + 108], 1
    jne L5
    push 010117190h
    push 000001194h
    push dword ptr [eax + 60]
    push esi
    call sub_1008B147
    add esp, 16
    mov dword ptr [ebp - 4], 1
L5:
    mov eax, dword ptr [esi + 000000100h]
    inc edi
    cmp edi, dword ptr [eax + 4]
    jb L4
L6:
    xor edi, edi
    push edi
    push dword ptr [esi + 000000100h]
    mov ecx, esi
    call sub_100AB98F
    test eax, eax
    je L7
    inc ebx
    cmp ebx, dword ptr [esi + 12]
    jb L3
    jmp L8
L7:
    mov dword ptr [ebp - 4], 1
L8:
    mov eax, dword ptr [ebp - 4]
    pop ebx
L9:
    pop edi
    pop esi
    leave
    ret
FUN_100ab94e ENDP
END
