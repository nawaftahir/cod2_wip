.686
.MODEL FLAT, C
EXTRN sub_1001384C:PROC
EXTRN sub_10032F24:PROC
EXTRN sub_10032F69:PROC
EXTRN sub_100337DB:PROC
EXTRN sub_10033B07:PROC
EXTRN sub_10033BDF:PROC
EXTRN sub_10033CC2:PROC
EXTRN sub_100349A6:PROC
EXTRN sub_10035910:PROC
EXTRN sub_1003AA1D:PROC
EXTRN sub_1003EA8E:PROC
EXTRN sub_1003EE25:PROC
EXTRN sub_1003EEB9:PROC
EXTRN sub_100F6D55:PROC
EXTRN sub_100F6E0E:PROC
EXTRN sub_100F6E16:PROC
EXTRN sub_100F6ECF:PROC
EXTRN fp_101D4A6C:DWORD
EXTRN g_101CE74C:DWORD
EXTRN g_101CE750:DWORD
EXTRN g_101CE75C:DWORD
EXTRN g_101CE7D8:DWORD
EXTRN g_101CE7EC:DWORD
EXTRN g_101D0A8C:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_101D4810:DWORD
EXTRN g_101D492C:DWORD
EXTRN g_101D492D:DWORD
EXTRN g_106D3194:DWORD
EXTRN g_1072D9D0:DWORD
EXTRN g_1072D9E0:DWORD
EXTRN g_1072DDC8:DWORD
EXTRN g_1072DEBC:DWORD
EXTRN g_10764584:DWORD
EXTRN g_1076674C:DWORD
EXTRN g_10766750:DWORD
EXTRN g_10766754:DWORD
EXTRN g_10766758:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_10033d20 PROC
    push ebp
    mov ebp, esp
    and esp, 0FFFFFFF8h
    sub esp, 20
    mov eax, dword ptr [g_101D0A8C]
    push ebx
    push esi
    push edi
    xor edi, edi
    cmp eax, edi
    mov dword ptr [g_106D3194], edi
    jne L20
    mov al, byte ptr [g_101D492C]
    test al, al
    jne L2
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 0xc]
    cmp eax, 088760868h
    je L0
    cmp eax, 088760869h
    jne L1
L0:
    mov al, 1
    mov byte ptr [g_101D492C], al
    jmp L2
L1:
    mov al, byte ptr [g_101D492C]
L2:
    test al, al
    mov bl, al
    je L3
    call sub_1001384C
    test al, al
    je L20
L3:
    mov edx, dword ptr [ebp + 8]
    mov dword ptr [g_106D3194], edx
    call sub_10033CC2
    call sub_10033B07
    test bl, bl
    je L4
    call sub_10035910
L4:
    mov eax, dword ptr [g_101CE750]
    mov cl, byte ptr [eax + 8]
    test cl, cl
    jne L6
    mov eax, dword ptr [g_106D3194]
    add eax, 000219D0Ch
    mov dword ptr [esp + 16], eax
    mov dword ptr [esp + 20], edi
    mov ax, word ptr [eax]
    cmp ax, di
    je L9
    lea ebx, [ebx]
L5:
    lea edx, [esp + 16]
    movzx ecx, ax
    push edx
    call dword ptr [ecx*4 + 0x10190518]
    mov eax, dword ptr [esp + 20]
    movzx eax, word ptr [eax]
    add esp, 4
    cmp ax, di
    jne L5
    jmp L9
L6:
    mov al, byte ptr [g_1072DEBC]
    test al, al
    je L7
    call sub_1003EA8E
    mov edi, edi
L7:
    mov ecx, dword ptr [g_101CE7EC]
    cmp dword ptr [ecx + 8], edi
    je L8
    mov eax, dword ptr [g_10764584]
    cmp eax, edi
    setne cl
    test cl, cl
    je L8
    push 010197964h
    push 010193358h
    push eax
    call sub_100F6E0E
    mov edx, dword ptr [g_10764584]
    add esp, 12
    push edx
    call sub_100F6D55
    add esp, 4
L8:
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push edi
    push edi
    push edi
    push 1
    push edi
    push edi
    push eax
    call dword ptr [ecx + 0xac]
    cmp dword ptr [g_1076A830], edi
    jne L7
L9:
    cmp dword ptr [g_1072D9D0], edi
    jne L10
    cmp dword ptr [g_1072D9E0], edi
    je L11
L10:
    call sub_1003AA1D
L11:
    mov eax, dword ptr [g_1072DDC8]
    cmp eax, edi
    je L12
    mov edx, dword ptr [g_101CE7D8]
    cmp dword ptr [edx + 8], edi
    je L12
    call sub_100349A6
L12:
    cmp dword ptr [g_1076674C], edi
    je L13
    xor esi, esi
    call sub_1003EE25
L13:
    cmp dword ptr [g_10766750], edi
    jne L14
    cmp dword ptr [g_10766754], edi
    jne L14
    cmp dword ptr [g_10766758], edi
    je L15
L14:
    push edi
    xor edi, edi
    xor ebx, ebx
    xor esi, esi
    call sub_1003EEB9
    add esp, 4
    lea esp, [esp]
L15:
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L16
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L16
    push 010197EC0h
    push 010193358h
    push eax
    call sub_100F6ECF
    mov ecx, dword ptr [g_10764584]
    add esp, 12
    push ecx
    call sub_100F6E16
    add esp, 4
L16:
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx + 0xa8]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L15
    mov eax, dword ptr [g_101CE75C]
    mov byte ptr [g_101D492D], 0
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    jle L17
    call sub_100337DB
    mov ecx, dword ptr [g_101CE75C]
    push 0
    push ecx
    call dword ptr [fp_101D4A6C]
    add esp, 8
L17:
    mov edx, dword ptr [g_101CE74C]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    jle L18
    call sub_10033BDF
    mov eax, dword ptr [g_101CE74C]
    push 0
    push eax
    call dword ptr [fp_101D4A6C]
    add esp, 8
L18:
    mov eax, dword ptr [g_101D4810]
    cmp eax, 3
    je L19
    cmp eax, 2
    jne L20
    call sub_10032F24
L19:
    call sub_10032F69
L20:
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
FUN_10033d20 ENDP
END
