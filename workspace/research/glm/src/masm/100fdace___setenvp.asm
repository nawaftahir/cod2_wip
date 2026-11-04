.686
.MODEL FLAT, C
EXTRN sub_100F8567:PROC
EXTRN sub_100F858C:PROC
EXTRN sub_100FA22B:PROC
EXTRN sub_100FA264:PROC
EXTRN sub_100FC4A7:PROC
EXTRN sub_100FC4D7:PROC
EXTRN sub_100FE911:PROC
EXTRN sub_101071F0:PROC
EXTRN g_101ADD80:DWORD
EXTRN g_101AE02C:DWORD
EXTRN g_1076ADA0:DWORD
EXTRN g_1076ADAC:DWORD
.CODE
__setenvp PROC
    push ebx
    xor ebx, ebx
    cmp dword ptr [g_1076ADAC], ebx
    push esi
    push edi
    jne L0
    call sub_101071F0
L0:
    mov esi, dword ptr [g_101ADD80]
    xor edi, edi
    cmp esi, ebx
    jne L3
    jmp L4
L1:
    cmp al, 61
    je L2
    inc edi
L2:
    push esi
    call sub_100FA22B
    pop ecx
    lea esi, [esi + eax + 1]
L3:
    mov al, byte ptr [esi]
    cmp al, bl
    jne L1
    lea eax, [edi*4 + 4]
    push eax
    call sub_100FC4A7
    mov edi, eax
    cmp edi, ebx
    pop ecx
    mov dword ptr [g_101AE02C], edi
    jne L5
L4:
    or eax, 0FFFFFFFFh
    jmp L10
L5:
    mov esi, dword ptr [g_101ADD80]
    push ebp
    jmp L8
L6:
    push esi
    call sub_100FA264
    mov ebp, eax
    inc ebp
    cmp byte ptr [esi], 61
    pop ecx
    je L7
    push ebp
    call sub_100FC4D7
    cmp eax, ebx
    pop ecx
    mov dword ptr [edi], eax
    je L11
    push esi
    push eax
    call sub_100FE911
    pop ecx
    pop ecx
    add edi, 4
L7:
    add esi, ebp
L8:
    cmp byte ptr [esi], bl
    jne L6
    push dword ptr [g_101ADD80]
    call sub_100F8567
    mov dword ptr [g_101ADD80], ebx
    mov dword ptr [edi], ebx
    mov dword ptr [g_1076ADA0], 1
    xor eax, eax
L9:
    pop ecx
    pop ebp
L10:
    pop edi
    pop esi
    pop ebx
    ret
L11:
    push dword ptr [g_101AE02C]
    call sub_100F858C
    mov dword ptr [g_101AE02C], ebx
    or eax, 0FFFFFFFFh
    jmp L9
__setenvp ENDP
END
