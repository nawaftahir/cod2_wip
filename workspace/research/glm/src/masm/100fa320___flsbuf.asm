.686
.MODEL FLAT, C
EXTRN sub_100FBE48:PROC
EXTRN sub_100FBE9B:PROC
EXTRN sub_10106AE9:PROC
EXTRN sub_10106B33:PROC
EXTRN sub_10106B6C:PROC
.CODE
__flsbuf PROC
    push ebp
    mov ebp, esp
    push ebx
    push esi
    mov esi, dword ptr [ebp + 12]
    mov eax, dword ptr [esi + 12]
    test al, 000000082h
    mov ebx, dword ptr [esi + 16]
    je L12
    test al, 64
    jne L12
    test al, 1
    je L0
    and dword ptr [esi + 4], 0
    test al, 16
    je L12
    mov ecx, dword ptr [esi + 8]
    and eax, 0FFFFFFFEh
    mov dword ptr [esi], ecx
    mov dword ptr [esi + 12], eax
L0:
    mov eax, dword ptr [esi + 12]
    and dword ptr [esi + 4], 0
    and dword ptr [ebp + 12], 0
    and eax, 0FFFFFFEFh
    or eax, 2
    test ax, 00000010Ch
    mov dword ptr [esi + 12], eax
    jne L3
    cmp esi, 0101A48C0h
    je L1
    cmp esi, 0101A48E0h
    jne L2
L1:
    push ebx
    call sub_10106B6C
    test eax, eax
    pop ecx
    jne L3
L2:
    push esi
    call sub_10106B33
    pop ecx
L3:
    test word ptr [esi + 12], 000000108h
    push edi
    je L9
    mov eax, dword ptr [esi + 8]
    mov edi, dword ptr [esi]
    lea ecx, [eax + 1]
    mov dword ptr [esi], ecx
    mov ecx, dword ptr [esi + 24]
    sub edi, eax
    dec ecx
    test edi, edi
    mov dword ptr [esi + 4], ecx
    jle L4
    push edi
    push eax
    push ebx
    call sub_100FBE48
    mov dword ptr [ebp + 12], eax
    jmp L7
L4:
    cmp ebx, -1
    je L5
    mov ecx, ebx
    sar ecx, 5
    mov ecx, dword ptr [ecx*4 + 01076ACA0h]
    mov eax, ebx
    and eax, 31
    lea eax, [eax + eax*8]
    lea eax, [ecx + eax*4]
    jmp L6
L5:
    mov eax, 0101A4E60h
L6:
    test byte ptr [eax + 4], 32
    je L8
    push 2
    push 0
    push ebx
    call sub_10106AE9
L7:
    add esp, 12
L8:
    mov eax, dword ptr [esi + 8]
    mov cl, byte ptr [ebp + 8]
    mov byte ptr [eax], cl
    jmp L10
L9:
    xor edi, edi
    inc edi
    push edi
    lea eax, [ebp + 8]
    push eax
    push ebx
    call sub_100FBE9B
    add esp, 12
    mov dword ptr [ebp + 12], eax
L10:
    cmp dword ptr [ebp + 12], edi
    pop edi
    je L11
    or dword ptr [esi + 12], 32
    jmp L13
L11:
    mov eax, dword ptr [ebp + 8]
    and eax, 0000000FFh
    jmp L14
L12:
    or eax, 32
    mov dword ptr [esi + 12], eax
L13:
    or eax, 0FFFFFFFFh
L14:
    pop esi
    pop ebx
    pop ebp
    ret
__flsbuf ENDP
END
