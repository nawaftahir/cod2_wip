.686
.MODEL FLAT, C
EXTRN sub_10014C57:PROC
EXTRN sub_10014C69:PROC
EXTRN sub_10014C71:PROC
EXTRN sub_10014D5A:PROC
EXTRN sub_10014D69:PROC
EXTRN sub_10014DD2:PROC
EXTRN sub_10014DE6:PROC
EXTRN sub_10014DE8:PROC
EXTRN sub_10014DF6:PROC
EXTRN sub_10014DFC:PROC
EXTRN sub_10014EF1:PROC
EXTRN sub_10014F06:PROC
EXTRN sub_10049EDD:PROC
EXTRN sub_1004A26C:PROC
EXTRN sub_1004A546:PROC
EXTRN sub_1004A5B0:PROC
EXTRN sub_1004A7FB:PROC
EXTRN EXTRN fp_101D49C8:DWORD:DWORD
EXTRN EXTRN fp_101D49D8:DWORD:DWORD
EXTRN EXTRN fp_101D4AFC:DWORD:DWORD
EXTRN EXTRN fp_101D4B00:DWORD:DWORD
EXTRN EXTRN g_101D4C84:DWORD:DWORD
.CODE
FUN_10014940 PROC
    sub sub esp, 0250h
    push push ebx
    push push ebp
    mov mov ebx, eax
    push push esi
    lea lea eax, [esp + 12]
    push push eax
    push push ebx
    call dword ptr [fp_101D4AFC]
    mov mov esi, eax
    mov mov eax, dword ptr [esp + 20]
    xor xor ebp, ebp
    add add esp, 8
    cmp cmp eax, ebp
    je sub_10014C71
    lea lea ecx, [esp + 24]
    mov mov dword ptr [esp + 0A4h], ecx
    push push edi
    mov mov ecx, 01B8h
    mov mov eax, 62
    lea lea edx, [esp + 0A8h]
    mov mov dword ptr [esp + 28], 010051F90h
    mov mov dword ptr [esp + 32], 010052010h
    mov mov dword ptr [esp + 36], 010051FD0h
    mov mov dword ptr [esp + 40], 010052050h
    mov mov dword ptr [esp + 44], 010052100h
    mov mov dword ptr [esp + 084h], ebp
    mov mov dword ptr [esp + 088h], ebp
    mov mov dword ptr [esp + 48], ebp
    mov mov dword ptr [esp + 08Ch], 010190EE8h
    mov mov dword ptr [esp + 090h], 123
    mov mov dword ptr [esp + 094h], ebp
    mov mov dword ptr [esp + 098h], ebp
    mov mov dword ptr [esp + 09Ch], ebp
    mov mov dword ptr [esp + 0A0h], 010014630h
    mov mov dword ptr [esp + 0A4h], 010014650h
    mov mov dword ptr [esp + 0C0h], 010014610h
    mov mov dword ptr [esp + 0C4h], 010014620h
    call sub_10049EDD
    mov mov eax, dword ptr [esp + 0C8h]
    cmp cmp eax, ebp
    mov mov edi, dword ptr [esp + 16]
    jne L0
    mov mov eax, dword ptr [esp + 0ACh]
    push push 32
    lea lea edx, [esp + 0ACh]
    push push ebp
    push push edx
    call call dword ptr [eax]
    add add esp, 12
    mov mov dword ptr [esp + 0C8h], eax
    mov mov dword ptr [eax + 4], esi
    push push 1
    lea lea esi, [esp + 0ACh]
    mov mov dword ptr [eax + 8], 01004A950h
    mov mov dword ptr [eax + 12], ebp
    mov mov dword ptr [eax + 16], 01004A960h
    mov mov dword ptr [eax + 20], 01004F690h
    mov mov dword ptr [eax + 24], 01004A980h
    mov mov dword ptr [eax], edi
    call sub_1004A26C
    add add esp, 4
    mov mov eax, esi
    call sub_1004A546
    mov mov ecx, dword ptr [esp + 010Ch]
    mov mov edx, dword ptr [g_101D4C84]
    cmp cmp ecx, edx
    ja sub_10014D5A
    mov mov eax, dword ptr [esp + 0110h]
    cmp cmp eax, edx
    ja sub_10014D69
    cmp cmp dword ptr [esp + 0118h], 3
    je sub_10014C57
    push push ebx
    push push 0101941ACh
    push push 2
    call dword ptr [fp_101D49C8]
    mov mov eax, dword ptr [esp + 0B8h]
    add add esp, 12
    cmp cmp eax, ebp
    je sub_10014C69
    mov mov ecx, esi
    push push ecx
    call call dword ptr [eax + 40]
    add add esp, 4
    mov mov edx, dword ptr [esp + 16]
    push push edx
    jmp sub_10014DD2
    mov mov edx, dword ptr [esp + 026Ch]
    mov mov dword ptr [edx], ecx
    mov mov edx, dword ptr [esp + 0270h]
    mov mov dword ptr [edx], eax
    imul imul eax, ecx
    mov mov edx, dword ptr [esp + 0274h]
    shl shl eax, 2
    push push eax
    mov mov dword ptr [edx], 21
    call dword ptr [fp_101D49D8]
    mov mov ecx, dword ptr [esp + 0110h]
    mov mov edi, eax
    mov mov eax, dword ptr [esp + 026Ch]
    mov mov dword ptr [eax], edi
    mov mov eax, dword ptr [esp + 20]
    lea lea edx, [ecx*4]
    mov mov ecx, dword ptr [esp + 0268h]
    mov mov dword ptr [esp + 24], edx
    mov mov edx, dword ptr [esp + 012Ch]
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [esp + 0114h]
    add add esp, 4
    cmp cmp edx, eax
    jae sub_10014DE6
    mov mov bl, 0FFh
    lea lea eax, [esp + 24]
    push push 1
    push push eax
    lea lea esi, [esp + 0B0h]
    mov mov dword ptr [esp + 32], edi
    call sub_1004A7FB
    mov mov eax, dword ptr [esp + 0114h]
    add add esp, 8
    dec dec eax
    cmp cmp eax, ebp
    jl sub_10014DF6
    lea lea ecx, [edi + eax*4 + 2]
    mov mov edi, edi
    mov mov byte ptr [ecx + 1], bl
    mov mov edx, eax
    imul imul edx, dword ptr [esp + 0118h]
    mov mov dl, byte ptr [edx + edi + 2]
    mov mov byte ptr [ecx], dl
    mov mov edx, eax
    imul imul edx, dword ptr [esp + 0118h]
    mov mov dl, byte ptr [edx + edi + 1]
    mov mov byte ptr [ecx - 1], dl
    mov mov edx, eax
    imul imul edx, dword ptr [esp + 0118h]
    mov mov dl, byte ptr [edx + edi]
    mov mov byte ptr [ecx - 2], dl
    dec dec eax
    sub sub ecx, 4
    cmp cmp eax, ebp
    jge sub_10014DFC
    mov mov edx, dword ptr [esp + 20]
    mov mov eax, dword ptr [esp + 0128h]
    mov mov ecx, dword ptr [esp + 0110h]
    add add edi, edx
    cmp cmp eax, ecx
    jb sub_10014DE8
    lea lea esi, [esp + 0A8h]
    call sub_1004A5B0
    mov mov eax, dword ptr [esp + 0ACh]
    cmp cmp eax, ebp
    je sub_10014EF1
    mov mov ecx, esi
    push push ecx
    call call dword ptr [eax + 40]
    add add esp, 4
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 0250h
    ret ret
    push push edx
    push push ebx
    push push 0101941D4h
    push push 2
    call dword ptr [fp_101D49C8]
    mov mov eax, dword ptr [esp + 0BCh]
    add add esp, 16
    cmp cmp eax, ebp
    je sub_10014F06
    lea lea edx, [esp + 0A8h]
    push push edx
    call call dword ptr [eax + 40]
    add add esp, 4
    mov mov eax, dword ptr [esp + 16]
    push push eax
    mov mov dword ptr [esp + 0C0h], ebp
    mov mov dword ptr [esp + 0B0h], ebp
    call dword ptr [fp_101D4B00]
    add add esp, 4
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 0250h
    ret ret
FUN_10014940 ENDP
END
