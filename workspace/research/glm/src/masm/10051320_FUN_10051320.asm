.686
.MODEL FLAT, C
EXTRN sub_100513D1:PROC
.CODE
FUN_10051320 PROC
    mov eax, dword ptr [esi + 4]
    push ebx
    push 64
    push 1
    push esi
    call dword ptr [eax]
    mov dword ptr [esi + 0000001A0h], eax
    mov dword ptr [eax], 010050680h
    xor ebx, ebx
    mov dword ptr [eax + 44], ebx
    mov dword ptr [eax + 48], ebx
    mov dword ptr [eax + 52], ebx
    mov dword ptr [eax + 56], ebx
    mov edx, dword ptr [esi + 44]
    mov ecx, dword ptr [esi + 4]
    shl edx, 8
    push edx
    push 1
    push esi
    call dword ptr [ecx]
    mov dword ptr [esi + 000000094h], eax
    mov edx, eax
    mov eax, dword ptr [esi + 44]
    add esp, 24
    cmp eax, ebx
    jle sub_100513D1
    push edi
    jmp L0
    lea esp, [esp]
L0:
    or eax, 0FFFFFFFFh
    mov edi, edx
    mov ecx, 64
    add edx, 000000100h
    rep stosd dword ptr es:[edi], eax
    mov eax, dword ptr [esi + 44]
    inc ebx
FUN_10051320 ENDP
END
