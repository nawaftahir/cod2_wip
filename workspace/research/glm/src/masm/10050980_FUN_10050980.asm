.686
.MODEL FLAT, C
EXTRN sub_1004C99A:PROC
EXTRN sub_1004CA17:PROC
EXTRN sub_1004CB0D:PROC
EXTRN sub_10050923:PROC
.CODE
FUN_10050980 PROC
    sub esp, 60
    push ebx
    push esi
    mov esi, dword ptr [esp + 72]
    mov eax, dword ptr [esi + 000000180h]
    mov ebx, dword ptr [esi + 0000001A0h]
    mov dword ptr [esp + 20], eax
    mov eax, dword ptr [esi + 000000104h]
    test eax, eax
    mov dword ptr [esp + 12], ebx
    je L0
    mov eax, dword ptr [ebx + 40]
    test eax, eax
    jne L0
    call sub_10050923
    test al, al
    jne L0
    pop esi
    pop ebx
    add esp, 60
    ret
L0:
    mov al, byte ptr [ebx + 8]
    test al, al
    push ebp
    push edi
    jne L11
    mov eax, dword ptr [esi + 32]
    mov ecx, dword ptr [eax]
    mov edx, dword ptr [eax + 4]
    mov eax, dword ptr [ebx + 16]
    mov dword ptr [esp + 36], ecx
    lea ecx, [ebx + 20]
    mov edi, dword ptr [ecx]
    mov dword ptr [esp + 56], edi
    mov edi, dword ptr [ecx + 4]
    mov dword ptr [esp + 60], edi
    mov edi, dword ptr [ecx + 8]
    mov dword ptr [esp + 64], edi
    mov edi, dword ptr [ecx + 12]
    mov ecx, dword ptr [ecx + 16]
    mov dword ptr [esp + 72], ecx
    mov ecx, dword ptr [esi + 000000148h]
    test ecx, ecx
    mov dword ptr [esp + 40], edx
    mov edx, dword ptr [ebx + 12]
    mov dword ptr [esp + 52], esi
    mov dword ptr [esp + 68], edi
    mov dword ptr [esp + 80], 0
    jle L10
    lea ecx, [esi + 00000014Ch]
    mov dword ptr [esp + 16], ecx
    lea esp, [esp]
L1:
    cmp eax, 8
    mov ecx, dword ptr [esp + 84]
    mov edi, dword ptr [esp + 80]
    mov ecx, dword ptr [ecx + edi*4]
    mov dword ptr [esp + 32], ecx
    mov ecx, dword ptr [esp + 16]
    mov ecx, dword ptr [ecx]
    mov dword ptr [esp + 24], ecx
    mov ecx, dword ptr [esi + ecx*4 + 000000130h]
    mov ecx, dword ptr [ecx + 20]
    mov ebp, dword ptr [ebx + ecx*4 + 44]
    jge L2
    push 0
    push eax
    push edx
    lea edx, [esp + 48]
    push edx
    call sub_1004C99A
    add esp, 16
    test al, al
    je L12
    mov eax, dword ptr [esp + 48]
    cmp eax, 8
    mov edx, dword ptr [esp + 44]
    jge L2
    mov ecx, 1
    jmp L4
L2:
    lea ecx, [eax - 8]
    mov edi, edx
    sar edi, cl
    and edi, 0000000FFh
    mov ecx, dword ptr [ebp + edi*4 + 000000090h]
    test ecx, ecx
    je L3
    movzx edi, byte ptr [edi + ebp + 000000490h]
    sub eax, ecx
    jmp L5
L3:
    mov ecx, 9
L4:
    push ebp
    lea edi, [esp + 40]
    push edi
    call sub_1004CB0D
    mov edi, eax
    add esp, 8
    test edi, edi
    jl L12
    mov edx, dword ptr [esp + 44]
    mov eax, dword ptr [esp + 48]
L5:
    test edi, edi
    je L9
    cmp eax, edi
    jge L6
    push edi
    push eax
    push edx
    lea eax, [esp + 48]
    push eax
    call sub_1004CA17
    add esp, 16
    test al, al
    je L12
    mov edx, dword ptr [esp + 44]
    mov eax, dword ptr [esp + 48]
L6:
    sub eax, edi
    mov ecx, edi
    mov ebx, 1
    shl ebx, cl
    mov ecx, eax
    mov ebp, edx
    sar ebp, cl
    mov ecx, dword ptr [edi*4 + 010190E68h]
    dec ebx
    and ebx, ebp
    cmp ebx, ecx
    jge L7
    mov edi, dword ptr [edi*4 + 010190EA8h]
    add edi, ebx
    jmp L8
L7:
    mov edi, ebx
L8:
    mov ebx, dword ptr [esp + 20]
L9:
    mov ecx, dword ptr [esp + 24]
    mov ebp, dword ptr [esp + ecx*4 + 60]
    lea ecx, [esp + ecx*4 + 60]
    add ebp, edi
    mov dword ptr [ecx], ebp
    mov ecx, dword ptr [esp + 28]
    mov edi, ebp
    mov ebp, dword ptr [esp + 16]
    shl edi, cl
    mov ecx, dword ptr [esp + 32]
    add ebp, 4
    mov dword ptr [esp + 16], ebp
    mov word ptr [ecx], di
    mov ecx, dword ptr [esp + 80]
    mov edi, dword ptr [esi + 000000148h]
    inc ecx
    cmp ecx, edi
    mov dword ptr [esp + 80], ecx
    jl L1
L10:
    mov ecx, dword ptr [esi + 32]
    mov edi, dword ptr [esp + 36]
    mov dword ptr [ecx], edi
    mov ecx, dword ptr [esi + 32]
    mov esi, dword ptr [esp + 40]
    mov dword ptr [ecx + 4], esi
    mov ecx, dword ptr [esp + 64]
    mov dword ptr [ebx + 12], edx
    mov edx, dword ptr [esp + 56]
    mov dword ptr [ebx + 20], edx
    mov edx, dword ptr [esp + 68]
    mov dword ptr [ebx + 16], eax
    mov eax, dword ptr [esp + 60]
    mov dword ptr [ebx + 24], eax
    mov eax, dword ptr [esp + 72]
    mov dword ptr [ebx + 28], ecx
    mov dword ptr [ebx + 32], edx
    mov dword ptr [ebx + 36], eax
L11:
    mov eax, dword ptr [ebx + 40]
    pop edi
    pop ebp
    dec eax
    mov dword ptr [ebx + 40], eax
    pop esi
    mov al, 1
    pop ebx
    add esp, 60
    ret
L12:
    pop edi
    pop ebp
    pop esi
    xor al, al
    pop ebx
    add esp, 60
    ret
FUN_10050980 ENDP
END
