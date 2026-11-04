.686
.MODEL FLAT, C
EXTRN sub_1001384C:PROC
EXTRN sub_10032F24:PROC
EXTRN sub_10032F69:PROC
EXTRN sub_100337DB:PROC
EXTRN sub_10033B07:PROC
EXTRN sub_10033BDF:PROC
EXTRN sub_10033CC2:PROC
EXTRN sub_10033F9A:PROC
EXTRN sub_10033FA8:PROC
EXTRN sub_10033FB5:PROC
EXTRN sub_10033FDC:PROC
EXTRN sub_10033FDD:PROC
EXTRN sub_10033FE7:PROC
EXTRN sub_10034003:PROC
EXTRN sub_1003402A:PROC
EXTRN sub_10034032:PROC
EXTRN sub_1003404D:PROC
EXTRN sub_100340A8:PROC
EXTRN sub_100340B3:PROC
EXTRN sub_100340B6:PROC
EXTRN sub_10034143:PROC
EXTRN sub_1003418A:PROC
EXTRN sub_100341BE:PROC
EXTRN sub_100341C8:PROC
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
EXTRN EXTRN fp_101D4A6C:DWORD:DWORD
EXTRN EXTRN g_101CE74C:DWORD:DWORD
EXTRN EXTRN g_101CE750:DWORD:DWORD
EXTRN EXTRN g_101CE75C:DWORD:DWORD
EXTRN EXTRN g_101CE7D8:DWORD:DWORD
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D0A8C:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_101D4810:DWORD:DWORD
EXTRN EXTRN g_101D492C:DWORD:DWORD
EXTRN EXTRN g_101D492D:DWORD:DWORD
EXTRN EXTRN g_106D3194:DWORD:DWORD
EXTRN EXTRN g_1072D9D0:DWORD:DWORD
EXTRN EXTRN g_1072D9E0:DWORD:DWORD
EXTRN EXTRN g_1072DDC8:DWORD:DWORD
EXTRN EXTRN g_1072DEBC:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_1076674C:DWORD:DWORD
EXTRN EXTRN g_10766750:DWORD:DWORD
EXTRN EXTRN g_10766754:DWORD:DWORD
EXTRN EXTRN g_10766758:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_10033d20 PROC
    push push ebp
    mov mov ebp, esp
    and and esp, -8
    sub sub esp, 20
    mov mov eax, dword ptr [g_101D0A8C]
    push push ebx
    push push esi
    push push edi
    xor xor edi, edi
    cmp cmp eax, edi
    mov mov dword ptr [g_106D3194], edi
    jne sub_10033F9A
    mov mov al, byte ptr [g_101D492C]
    test test al, al
    jne L0
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 12]
    cmp cmp eax, 088760868h
    je L1
    cmp cmp eax, 088760869h
    jne L2
    mov mov al, 1
    mov mov byte ptr [g_101D492C], al
    jmp L3
    mov mov al, byte ptr [g_101D492C]
    test test al, al
    mov mov bl, al
    je L4
    call sub_1001384C
    test test al, al
    je sub_10033FDD
    mov mov edx, dword ptr [ebp + 8]
    mov mov dword ptr [g_106D3194], edx
    call sub_10033CC2
    call sub_10033B07
    test test bl, bl
    je L5
L0:
    call sub_10035910
    mov mov eax, dword ptr [g_101CE750]
    mov mov cl, byte ptr [eax + 8]
    test test cl, cl
    jne L6
    mov mov eax, dword ptr [g_106D3194]
    add add eax, 0219D0Ch
    mov mov dword ptr [esp + 16], eax
    mov mov dword ptr [esp + 20], edi
    mov mov ax, word ptr [eax]
    cmp cmp ax, di
    je L9
    lea lea ebx, [ebx]
    lea lea edx, [esp + 16]
    movzx movzx ecx, ax
    push push edx
    call call dword ptr [ecx*4 + 010190518h]
    mov mov eax, dword ptr [esp + 20]
    movzx movzx eax, word ptr [eax]
    add add esp, 4
    cmp cmp ax, di
    jne L7
    jmp L11
    mov mov al, byte ptr [g_1072DEBC]
    test test al, al
    je L8
    call sub_1003EA8E
    mov mov edi, edi
    mov mov ecx, dword ptr [g_101CE7EC]
    cmp cmp dword ptr [ecx + 8], edi
    je L10
    mov mov eax, dword ptr [g_10764584]
    cmp cmp eax, edi
    setne setne cl
    test test cl, cl
    je L12
    push push 010197964h
    push push 010193358h
    push push eax
    call sub_100F6E0E
    mov mov edx, dword ptr [g_10764584]
    add add esp, 12
    push push edx
    call sub_100F6D55
    add add esp, 4
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push edi
    push push edi
    push push edi
    push push 1
    push push edi
    push push edi
    push push eax
    call call dword ptr [ecx + 0ACh]
    cmp cmp dword ptr [g_1076A830], edi
    jne L13
    cmp cmp dword ptr [g_1072D9D0], edi
    jne sub_10033FA8
    cmp cmp dword ptr [g_1072D9E0], edi
    je sub_10033FB5
    call sub_1003AA1D
    mov mov eax, dword ptr [g_1072DDC8]
    cmp cmp eax, edi
    je sub_10033FDC
    mov mov edx, dword ptr [g_101CE7D8]
L6:
    cmp cmp dword ptr [edx + 8], edi
    je sub_10033FE7
    call sub_100349A6
    cmp cmp dword ptr [g_1076674C], edi
    je sub_10034003
    xor xor esi, esi
    call sub_1003EE25
    cmp cmp dword ptr [g_10766750], edi
    jne sub_1003402A
    cmp cmp dword ptr [g_10766754], edi
    jne sub_10034032
    cmp cmp dword ptr [g_10766758], edi
    je sub_1003404D
    push push edi
    xor xor edi, edi
    xor xor ebx, ebx
    xor xor esi, esi
    call sub_1003EEB9
    add add esp, 4
    lea lea esp, [esp]
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je sub_100340A8
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_100340B6
    push push 010197EC0h
    push push 010193358h
    push push eax
    call sub_100F6ECF
    mov mov ecx, dword ptr [g_10764584]
    add add esp, 12
    push push ecx
    call sub_100F6E16
    add add esp, 4
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [eax]
    push push eax
    call call dword ptr [edx + 0A8h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_100340B3
    mov mov eax, dword ptr [g_101CE75C]
    mov mov byte ptr [g_101D492D], 0
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    jle sub_10034143
L10:
    call sub_100337DB
    mov mov ecx, dword ptr [g_101CE75C]
    push push 0
    push push ecx
L12:
    call dword ptr [fp_101D4A6C]
    add add esp, 8
    mov mov edx, dword ptr [g_101CE74C]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    jle sub_1003418A
    call sub_10033BDF
    mov mov eax, dword ptr [g_101CE74C]
    push push 0
    push push eax
    call dword ptr [fp_101D4A6C]
    add add esp, 8
    mov mov eax, dword ptr [g_101D4810]
    cmp cmp eax, 3
    je sub_100341BE
    cmp cmp eax, 2
    jne sub_100341C8
    call sub_10032F24
    call sub_10032F69
    pop pop edi
    pop pop esi
    pop pop ebx
    mov mov esp, ebp
    pop pop ebp
    ret ret
FUN_10033d20 ENDP
END
