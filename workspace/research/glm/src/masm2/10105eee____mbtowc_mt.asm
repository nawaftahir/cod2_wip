.686
.MODEL FLAT, C
EXTRN sub_100FC2C8:PROC
EXTRN sub_10105FC6:PROC
EXTRN sub_10105FCB:PROC
EXTRN sub_10105FD0:PROC
EXTRN sub_10105FD4:PROC
EXTRN sub_10105FDC:PROC
EXTRN sub_10105FF5:PROC
EXTRN sub_10106020:PROC
EXTRN sub_10106025:PROC
EXTRN EXTRN fp_1010C13C:DWORD:DWORD
.CODE
___mbtowc_mt PROC
    push push ebp
    mov mov ebp, esp
    push push ebx
    push push esi
    push push edi
    mov mov edi, dword ptr [ebp + 16]
    xor xor ebx, ebx
    cmp cmp edi, ebx
    je L0
    cmp cmp dword ptr [ebp + 20], ebx
    je L1
    mov mov al, byte ptr [edi]
    cmp cmp al, bl
    jne L2
    mov mov eax, dword ptr [ebp + 12]
    cmp cmp eax, ebx
    je L2
    mov mov word ptr [eax], bx
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    pop pop ebp
    ret ret
    mov mov esi, dword ptr [ebp + 8]
    cmp cmp dword ptr [esi + 20], ebx
    jne L4
L0:
    mov mov ecx, dword ptr [ebp + 12]
    cmp cmp ecx, ebx
L1:
    je L5
    movzx movzx ax, al
    mov mov word ptr [ecx], ax
    xor xor eax, eax
    inc inc eax
    jmp L3
    mov mov ecx, dword ptr [esi + 72]
    movzx movzx eax, al
    test test byte ptr [ecx + eax*2 + 1], 080h
    je sub_10105FD0
    mov mov eax, dword ptr [esi + 40]
    cmp cmp eax, 1
    jle sub_10105FC6
    cmp cmp dword ptr [ebp + 20], eax
    jl sub_10105FCB
    xor xor ecx, ecx
    cmp cmp dword ptr [ebp + 12], ebx
    setne setne cl
    push push ecx
    push push dword ptr [ebp + 12]
L3:
    push push eax
    push push edi
    push push 9
    push push dword ptr [esi + 4]
    call dword ptr [fp_1010C13C]
L4:
    test test eax, eax
L5:
    jne sub_10105FF5
    mov mov eax, dword ptr [ebp + 20]
    cmp cmp eax, dword ptr [esi + 40]
    jb sub_10106020
    cmp cmp byte ptr [edi + 1], bl
    je sub_10106025
    mov mov eax, dword ptr [esi + 40]
    jmp L6
    xor xor eax, eax
    cmp cmp dword ptr [ebp + 12], ebx
    setne setne al
    push push eax
    push push dword ptr [ebp + 12]
    push push 1
    push push edi
    push push 9
    push push dword ptr [esi + 4]
    call dword ptr [fp_1010C13C]
    test test eax, eax
    jne sub_10105FDC
    call sub_100FC2C8
    mov mov dword ptr [eax], 42
    or or eax, -1
    jmp sub_10105FD4
___mbtowc_mt ENDP
END
