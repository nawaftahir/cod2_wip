.686
.MODEL FLAT, C
EXTRN sub_1005EC56:PROC
EXTRN sub_1005ECC1:PROC
EXTRN sub_1005ED1F:PROC
EXTRN sub_1005ED27:PROC
.CODE
FUN_1005eaf0 PROC
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi
    mov ebx, dword ptr [ebp + 12]
    mov ecx, dword ptr [ebp + 16]
    cmp ecx, 000001000h
    jle L0
    mov ecx, 000001000h
L0:
    add ecx, 31
    shr ecx, 5
    je L2
    jmp L1
    jmp L1
    lea esp, [esp]
    lea esp, [esp]
L1:
    test byte ptr [ebx], al
    add ebx, 32
    dec ecx
    jne L1
L2:
    push edi
    push esi
    mov ecx, dword ptr [ebp + 16]
    cmp ecx, 0
    je sub_1005EC56
    mov edx, dword ptr [ebp + 8]
    mov ebx, dword ptr [ebp + 12]
    cmp ecx, 32
    jl L4
    mov edi, ecx
    and edi, 0FFFFFFE0h
    sub edi, 32
    lea esp, [esp]
L3:
    mov eax, dword ptr [ebx + edi]
    mov esi, dword ptr [ebx + edi + 4]
    mov dword ptr [edx + edi], eax
    mov dword ptr [edx + edi + 4], esi
    mov eax, dword ptr [ebx + edi + 8]
    mov esi, dword ptr [ebx + edi + 12]
    mov dword ptr [edx + edi + 8], eax
    mov dword ptr [edx + edi + 12], esi
    mov eax, dword ptr [ebx + edi + 16]
    mov esi, dword ptr [ebx + edi + 20]
    mov dword ptr [edx + edi + 16], eax
    mov dword ptr [edx + edi + 20], esi
    mov eax, dword ptr [ebx + edi + 24]
    mov esi, dword ptr [ebx + edi + 28]
    mov dword ptr [edx + edi + 24], eax
    mov dword ptr [edx + edi + 28], esi
    sub edi, 32
    jge L3
    mov edi, ecx
    and edi, 0FFFFFFE0h
    add ebx, edi
    add edx, edi
    and ecx, 31
    je sub_1005ECC1
L4:
    cmp ecx, 16
    jl L5
    mov eax, dword ptr [ebx]
    mov dword ptr [edx], eax
    mov eax, dword ptr [ebx + 4]
    mov dword ptr [edx + 4], eax
    mov eax, dword ptr [ebx + 8]
    mov dword ptr [edx + 8], eax
    mov eax, dword ptr [ebx + 12]
    mov dword ptr [edx + 12], eax
    sub ecx, 16
    add ebx, 16
    add edx, 16
L5:
    cmp ecx, 8
    jl L6
    mov eax, dword ptr [ebx]
    mov dword ptr [edx], eax
    mov eax, dword ptr [ebx + 4]
    sub ecx, 8
    mov dword ptr [edx + 4], eax
    add ebx, 8
    add edx, 8
L6:
    cmp ecx, 4
    jl L7
    mov eax, dword ptr [ebx]
    add ebx, 4
    sub ecx, 4
    mov dword ptr [edx], eax
    add edx, 4
L7:
    cmp ecx, 2
    jl L8
    mov ax, word ptr [ebx]
    cmp ecx, 3
    mov word ptr [edx], ax
    jl sub_1005ED1F
    mov al, byte ptr [ebx + 2]
    mov byte ptr [edx + 2], al
    jmp sub_1005ED27
L8:
    cmp ecx, 1
FUN_1005eaf0 ENDP
END
