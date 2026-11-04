.686
.MODEL FLAT, C
EXTRN sub_1004C99A:PROC
EXTRN sub_1004CA17:PROC
EXTRN sub_1004CB0D:PROC
EXTRN sub_10050923:PROC
EXTRN sub_10050BCE:PROC
EXTRN sub_10050BF1:PROC
EXTRN sub_10050BFF:PROC
EXTRN sub_10050C0A:PROC
EXTRN sub_10050C1B:PROC
EXTRN sub_10050C54:PROC
EXTRN sub_10050C80:PROC
EXTRN sub_10050CAD:PROC
EXTRN sub_10050CBD:PROC
EXTRN sub_10050CCA:PROC
EXTRN sub_10050D02:PROC
EXTRN sub_10050D2A:PROC
.CODE
FUN_10050980 PROC
    sub sub esp, 60
    push push ebx
    push push esi
    mov mov esi, dword ptr [esp + 72]
    mov mov eax, dword ptr [esi + 0180h]
    mov mov ebx, dword ptr [esi + 01A0h]
    mov mov dword ptr [esp + 20], eax
    mov mov eax, dword ptr [esi + 0104h]
    test test eax, eax
    mov mov dword ptr [esp + 12], ebx
    je L0
    mov mov eax, dword ptr [ebx + 40]
    test test eax, eax
    jne L1
    call sub_10050923
    test test al, al
    jne L2
    pop pop esi
    pop pop ebx
    add add esp, 60
    ret ret
    mov mov al, byte ptr [ebx + 8]
    test test al, al
    push push ebp
    push push edi
    jne sub_10050BF1
    mov mov eax, dword ptr [esi + 32]
    mov mov ecx, dword ptr [eax]
    mov mov edx, dword ptr [eax + 4]
    mov mov eax, dword ptr [ebx + 16]
    mov mov dword ptr [esp + 36], ecx
    lea lea ecx, [ebx + 20]
    mov mov edi, dword ptr [ecx]
    mov mov dword ptr [esp + 56], edi
    mov mov edi, dword ptr [ecx + 4]
    mov mov dword ptr [esp + 60], edi
    mov mov edi, dword ptr [ecx + 8]
    mov mov dword ptr [esp + 64], edi
    mov mov edi, dword ptr [ecx + 12]
    mov mov ecx, dword ptr [ecx + 16]
    mov mov dword ptr [esp + 72], ecx
    mov mov ecx, dword ptr [esi + 0148h]
    test test ecx, ecx
    mov mov dword ptr [esp + 40], edx
    mov mov edx, dword ptr [ebx + 12]
    mov mov dword ptr [esp + 52], esi
    mov mov dword ptr [esp + 68], edi
    mov mov dword ptr [esp + 80], 0
    jle sub_10050C0A
    lea lea ecx, [esi + 014Ch]
    mov mov dword ptr [esp + 16], ecx
    lea lea esp, [esp]
    cmp cmp eax, 8
    mov mov ecx, dword ptr [esp + 84]
    mov mov edi, dword ptr [esp + 80]
    mov mov ecx, dword ptr [ecx + edi*4]
    mov mov dword ptr [esp + 32], ecx
    mov mov ecx, dword ptr [esp + 16]
    mov mov ecx, dword ptr [ecx]
    mov mov dword ptr [esp + 24], ecx
    mov mov ecx, dword ptr [esi + ecx*4 + 0130h]
    mov mov ecx, dword ptr [ecx + 20]
    mov mov ebp, dword ptr [ebx + ecx*4 + 44]
    jge L3
    push push 0
    push push eax
    push push edx
    lea lea edx, [esp + 48]
    push push edx
    call sub_1004C99A
    add add esp, 16
    test test al, al
    je sub_10050CAD
    mov mov eax, dword ptr [esp + 48]
    cmp cmp eax, 8
    mov mov edx, dword ptr [esp + 44]
    jge L4
    mov mov ecx, 1
    jmp L5
    lea lea ecx, [eax - 8]
    mov mov edi, edx
    sar sar edi, cl
    and and edi, 0FFh
    mov mov ecx, dword ptr [ebp + edi*4 + 090h]
    test test ecx, ecx
    je sub_10050BCE
    movzx movzx edi, byte ptr [edi + ebp + 0490h]
    sub sub eax, ecx
    jmp sub_10050BFF
    mov mov ecx, 9
    push push ebp
    lea lea edi, [esp + 40]
    push push edi
    call sub_1004CB0D
    mov mov edi, eax
    add add esp, 8
    test test edi, edi
    jl sub_10050D02
    mov mov edx, dword ptr [esp + 44]
    mov mov eax, dword ptr [esp + 48]
    test test edi, edi
    je sub_10050C80
    cmp cmp eax, edi
    jge sub_10050C54
    push push edi
    push push eax
    push push edx
    lea lea eax, [esp + 48]
    push push eax
    call sub_1004CA17
    add add esp, 16
    test test al, al
    je sub_10050D2A
    mov mov edx, dword ptr [esp + 44]
    mov mov eax, dword ptr [esp + 48]
    sub sub eax, edi
    mov mov ecx, edi
    mov mov ebx, 1
    shl shl ebx, cl
    mov mov ecx, eax
    mov mov ebp, edx
    sar sar ebp, cl
    mov mov ecx, dword ptr [edi*4 + 010190E68h]
    dec dec ebx
    and and ebx, ebp
    cmp cmp ebx, ecx
    jge sub_10050CBD
    mov mov edi, dword ptr [edi*4 + 010190EA8h]
    add add edi, ebx
    jmp sub_10050CCA
    mov mov edi, ebx
    mov mov ebx, dword ptr [esp + 20]
    mov mov ecx, dword ptr [esp + 24]
    mov mov ebp, dword ptr [esp + ecx*4 + 60]
    lea lea ecx, [esp + ecx*4 + 60]
    add add ebp, edi
    mov mov dword ptr [ecx], ebp
    mov mov ecx, dword ptr [esp + 28]
    mov mov edi, ebp
    mov mov ebp, dword ptr [esp + 16]
    shl shl edi, cl
    mov mov ecx, dword ptr [esp + 32]
    add add ebp, 4
    mov mov dword ptr [esp + 16], ebp
    mov mov word ptr [ecx], di
    mov mov ecx, dword ptr [esp + 80]
    mov mov edi, dword ptr [esi + 0148h]
    inc inc ecx
    cmp cmp ecx, edi
    mov mov dword ptr [esp + 80], ecx
L3:
    jl sub_10050C1B
    mov mov ecx, dword ptr [esi + 32]
    mov mov edi, dword ptr [esp + 36]
    mov mov dword ptr [ecx], edi
    mov mov ecx, dword ptr [esi + 32]
    mov mov esi, dword ptr [esp + 40]
    mov mov dword ptr [ecx + 4], esi
    mov mov ecx, dword ptr [esp + 64]
    mov mov dword ptr [ebx + 12], edx
    mov mov edx, dword ptr [esp + 56]
    mov mov dword ptr [ebx + 20], edx
    mov mov edx, dword ptr [esp + 68]
    mov mov dword ptr [ebx + 16], eax
    mov mov eax, dword ptr [esp + 60]
    mov mov dword ptr [ebx + 24], eax
    mov mov eax, dword ptr [esp + 72]
    mov mov dword ptr [ebx + 28], ecx
    mov mov dword ptr [ebx + 32], edx
    mov mov dword ptr [ebx + 36], eax
    mov mov eax, dword ptr [ebx + 40]
    pop pop edi
    pop pop ebp
    dec dec eax
    mov mov dword ptr [ebx + 40], eax
    pop pop esi
    mov mov al, 1
    pop pop ebx
    add add esp, 60
    ret ret
    pop pop edi
    pop pop ebp
    pop pop esi
L5:
    xor xor al, al
    pop pop ebx
    add add esp, 60
    ret ret
FUN_10050980 ENDP
END
