.686
.MODEL FLAT, C
EXTRN sub_1008B0DD:PROC
EXTRN sub_1008B147:PROC
EXTRN sub_100ABA50:PROC
EXTRN sub_100ABA57:PROC
EXTRN sub_100ABA5D:PROC
EXTRN sub_100ABA60:PROC
EXTRN sub_100ABA69:PROC
EXTRN sub_100ABACE:PROC
EXTRN sub_100ABADD:PROC
.CODE
FUN_100ab94e PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push esi
    mov mov esi, ecx
    mov mov ecx, dword ptr [esi + 12]
    push push edi
    xor xor edi, edi
    cmp cmp ecx, 64
    mov mov dword ptr [ebp - 4], edi
    jbe L1
    push push 0101171DCh
    push push 01194h
    push push edi
    push push esi
    call sub_1008B0DD
    xor xor eax, eax
    add add esp, 16
    inc inc eax
    jmp sub_100ABA50
    xor xor eax, eax
    cmp cmp ecx, edi
    jbe L2
    mov mov ecx, dword ptr [esi + 24]
    mov mov ecx, dword ptr [ecx + eax*4]
    inc inc eax
    mov mov dword ptr [ecx + 40], edi
    cmp cmp eax, dword ptr [esi + 12]
    jb L2
    push push ebx
    xor xor ebx, ebx
    cmp cmp dword ptr [esi + 12], edi
    jbe sub_100ABA69
    mov mov eax, dword ptr [esi + 24]
    mov mov eax, dword ptr [eax + ebx*4]
    mov mov dword ptr [esi + 0100h], eax
    cmp cmp dword ptr [eax + 36], edi
    je sub_100ABA57
    cmp cmp dword ptr [eax + 4], 0
    jbe sub_100ABA5D
    mov mov eax, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [eax + 8]
    mov mov ecx, dword ptr [ecx + edi*4]
    mov mov edx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [edx + ecx*4]
    cmp cmp byte ptr [ecx + 108], 1
    jne sub_100ABA69
    push push 010117190h
    push push 01194h
    push push dword ptr [eax + 60]
    push push esi
    call sub_1008B147
    add add esp, 16
    mov mov dword ptr [ebp - 4], 1
    mov mov eax, dword ptr [esi + 0100h]
    inc inc edi
    cmp cmp edi, dword ptr [eax + 4]
    jb sub_100ABA5D
    xor xor edi, edi
    push push edi
    push push dword ptr [esi + 0100h]
    mov mov ecx, esi
    call L0
    test test eax, eax
    je sub_100ABACE
    inc inc ebx
    cmp cmp ebx, dword ptr [esi + 12]
    jb sub_100ABA60
    jmp sub_100ABADD
    mov mov dword ptr [ebp - 4], 1
    mov mov eax, dword ptr [ebp - 4]
    pop pop ebx
    pop pop edi
    pop pop esi
    leave leave
    ret ret
FUN_100ab94e ENDP
END
