.686
.MODEL FLAT, C
EXTRN sub_10085E20:PROC
EXTRN sub_100862DB:PROC
EXTRN sub_100B9A15:PROC
EXTRN sub_100B9A40:PROC
EXTRN sub_100B9A6B:PROC
EXTRN sub_100B9A96:PROC
EXTRN sub_100C0711:PROC
EXTRN sub_100C071F:PROC
EXTRN sub_100C0796:PROC
EXTRN sub_100C07A1:PROC
EXTRN sub_100C07BC:PROC
EXTRN sub_100C07EB:PROC
EXTRN sub_100C0801:PROC
EXTRN sub_100C080B:PROC
EXTRN sub_100C0835:PROC
EXTRN sub_100C0872:PROC
EXTRN sub_100C088F:PROC
EXTRN sub_100C089B:PROC
EXTRN sub_100C08C0:PROC
EXTRN sub_100C08D0:PROC
EXTRN sub_100C08E5:PROC
EXTRN EXTRN g_1019BE20:DWORD:DWORD
EXTRN EXTRN g_1019BEB8:DWORD:DWORD
.CODE
FUN_100c04d4 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0FCh
    push push ebx
    push push esi
    mov mov esi, ecx
    mov mov ecx, dword ptr [esi + 0100h]
    mov mov eax, dword ptr [ecx]
    push push edi
    xor xor edi, edi
    xor xor ebx, ebx
    inc inc edi
    and and eax, 0FFFFFh
    cmp cmp eax, edi
    mov mov dword ptr [ebp - 4], ebx
    mov mov dword ptr [ebp - 28], ebx
    mov mov dword ptr [ebp - 24], edi
    mov mov dword ptr [ebp - 20], 2
    mov mov dword ptr [ebp - 16], 3
    je L0
    mov mov eax, edi
    jmp sub_100C0711
    push push edi
    push push edi
    lea lea eax, [ebp - 28]
    push push eax
    lea lea eax, [ebp - 0FCh]
    push push eax
    lea lea eax, [ebp - 4]
    push push eax
    lea lea eax, [ebp - 92]
    push push eax
    push push 010118FB8h
    push push ecx
    mov mov ecx, esi
    call sub_100B9A15
    cmp cmp eax, edi
    jne L1
    push push edi
    push push edi
    lea lea eax, [ebp - 28]
    push push eax
    lea lea eax, [ebp - 0FCh]
    push push eax
    lea lea eax, [ebp - 4]
    push push eax
    lea lea eax, [ebp - 92]
    push push eax
    push push 010119018h
    push push dword ptr [esi + 0100h]
    mov mov ecx, esi
    call sub_100B9A40
    cmp cmp eax, edi
    jne L2
    push push edi
    push push edi
    lea lea eax, [ebp - 28]
    push push eax
    lea lea eax, [ebp - 0FCh]
    push push eax
    lea lea eax, [ebp - 4]
    push push eax
    lea lea eax, [ebp - 92]
    push push eax
    push push 010119078h
    push push dword ptr [esi + 0100h]
    mov mov ecx, esi
    call sub_100B9A6B
    cmp cmp eax, edi
    jne L3
    push push edi
    push push edi
    lea lea eax, [ebp - 28]
    push push eax
    lea lea eax, [ebp - 0FCh]
    push push eax
    lea lea eax, [ebp - 4]
    push push eax
    lea lea eax, [ebp - 92]
    push push eax
    push push 0101190D8h
    push push dword ptr [esi + 0100h]
    mov mov ecx, esi
    call sub_100B9A96
    cmp cmp eax, ebx
    jne sub_100C07BC
    mov mov eax, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [eax + 8]
    mov mov edx, dword ptr [esi + 20]
    mov mov dword ptr [ebp - 4], ebx
    mov mov ebx, dword ptr [esi + 16]
    add add ecx, 4
    mov mov eax, dword ptr [ecx]
    mov mov edi, dword ptr [edx + eax*4]
    mov mov eax, dword ptr [edi + 4]
    mov mov eax, dword ptr [ebx + eax*4]
    test test byte ptr [eax + 5], 1
    je sub_100C07EB
    fld fld qword ptr [g_1019BE20]
    fld fld qword ptr [edi + 32]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp sub_100C0801
    cmp cmp dword ptr [edi + 8], -1
    jne sub_100C080B
    inc inc dword ptr [ebp - 4]
    xor xor eax, eax
    inc inc eax
    add add ecx, 4
    cmp cmp dword ptr [ebp - 4], eax
    jb sub_100C071F
    mov mov ecx, dword ptr [ebp - 0DCh]
    mov mov edx, dword ptr [edx + ecx*4]
    and and dword ptr [ebp - 4], 0
    cmp cmp dword ptr [edx + 8], -1
    jne sub_100C0796
    mov mov ecx, dword ptr [edx + 4]
    mov mov ecx, dword ptr [ebx + ecx*4]
    test test byte ptr [ecx + 5], al
    je sub_100C07A1
    mov mov dword ptr [ebp - 4], eax
    xor xor ebx, ebx
    mov mov eax, dword ptr [esi + 0100h]
    mov mov eax, dword ptr [eax + 8]
    mov mov ecx, dword ptr [ebp + ebx - 0ECh]
    mov mov dword ptr [ebx + eax], ecx
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [ebp + ebx - 0DCh]
    mov mov edi, dword ptr [ecx + eax*4]
    fld fld qword ptr [edi + 32]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push dword ptr [edi + 16]
    mov mov ecx, esi
    push push dword ptr [edi + 12]
    push push dword ptr [edi + 4]
    call sub_100862DB
    cmp cmp eax, -1
    mov mov dword ptr [ebp - 12], eax
    je sub_100C088F
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    push push edi
    mov mov ecx, eax
    mov mov dword ptr [ebp - 8], eax
    call sub_10085E20
    cmp cmp dword ptr [ebp - 4], 0
    mov mov eax, dword ptr [ebp - 8]
    jne sub_100C089B
    cmp cmp dword ptr [eax + 56], -1
    jne sub_100C0872
    mov mov ecx, dword ptr [ebp + ebx - 0DCh]
    mov mov dword ptr [eax + 56], ecx
    xor xor dword ptr [eax + 60], 080000h
    mov mov eax, dword ptr [esi + 0100h]
    mov mov eax, dword ptr [eax + 8]
    mov mov ecx, dword ptr [ebp - 12]
    mov mov dword ptr [eax + ebx + 4], ecx
    add add ebx, 4
    cmp cmp ebx, 4
    jb sub_100C0835
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
    xor xor eax, eax
    inc inc eax
    jmp sub_100C08D0
    fld fld qword ptr [eax + 32]
    fmul fmul qword ptr [g_1019BEB8]
    fstp fstp qword ptr [eax + 32]
    jmp sub_100C08C0
    mov mov eax, 08007000Eh
    jmp sub_100C08E5
FUN_100c04d4 ENDP
END
