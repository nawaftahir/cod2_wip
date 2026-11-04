.686
.MODEL FLAT, C
EXTRN sub_100FBE4F:PROC
EXTRN sub_100FBEA9:PROC
EXTRN sub_10106AEF:PROC
EXTRN sub_10106B36:PROC
EXTRN sub_10106B6F:PROC
.CODE
__flswbuf PROC
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    push esi
    mov esi, dword ptr [ebp + 12]
    mov eax, dword ptr [esi + 12]
    test al, 000000082h
    mov ecx, dword ptr [esi + 16]
    mov dword ptr [ebp - 4], ecx
    je L13
    test al, 64
    jne L13
    xor ebx, ebx
    test al, 1
    je L0
    test al, 16
    mov dword ptr [esi + 4], ebx
    je L13
    mov edx, dword ptr [esi + 8]
    and eax, 0FFFFFFFEh
    mov dword ptr [esi], edx
    mov dword ptr [esi + 12], eax
L0:
    mov eax, dword ptr [esi + 12]
    and eax, 0FFFFFFEFh
    or eax, 2
    test ax, 00000010Ch
    mov dword ptr [esi + 12], eax
    mov dword ptr [esi + 4], ebx
    mov dword ptr [ebp + 12], ebx
    jne L4
    cmp esi, 0101A48C0h
    je L1
    cmp esi, 0101A48E0h
    jne L2
L1:
    push ecx
    call sub_10106B6F
    test eax, eax
    pop ecx
    jne L3
L2:
    push esi
    call sub_10106B36
    pop ecx
L3:
    mov ecx, dword ptr [ebp - 4]
L4:
    test word ptr [esi + 12], 000000108h
    push edi
    je L10
    mov eax, dword ptr [esi + 8]
    mov edi, dword ptr [esi]
    lea edx, [eax + 2]
    mov dword ptr [esi], edx
    mov edx, dword ptr [esi + 24]
    sub edi, eax
    dec edx
    dec edx
    cmp edi, ebx
    mov dword ptr [esi + 4], edx
    jle L5
    push edi
    push eax
    push ecx
    call sub_100FBE4F
    mov dword ptr [ebp + 12], eax
    jmp L8
L5:
    cmp ecx, -1
    je L6
    mov edx, ecx
    sar edx, 5
    mov edx, dword ptr [edx*4 + 01076ACA0h]
    mov eax, ecx
    and eax, 31
    lea eax, [eax + eax*8]
    lea eax, [edx + eax*4]
    jmp L7
L6:
    mov eax, 0101A4E60h
L7:
    test byte ptr [eax + 4], 32
    je L9
    push 2
    push ebx
    push ecx
    call sub_10106AEF
L8:
    add esp, 12
L9:
    mov eax, dword ptr [esi + 8]
    mov ebx, dword ptr [ebp + 8]
    mov word ptr [eax], bx
    jmp L11
L10:
    mov ebx, dword ptr [ebp + 8]
    push 2
    pop edi
    push edi
    lea eax, [ebp + 12]
    push eax
    push ecx
    mov word ptr [ebp + 12], bx
    call sub_100FBEA9
    add esp, 12
    mov dword ptr [ebp + 12], eax
L11:
    cmp dword ptr [ebp + 12], edi
    pop edi
    je L12
    or dword ptr [esi + 12], 32
    jmp L14
L12:
    mov eax, ebx
    and eax, 00000FFFFh
    jmp L15
L13:
    or eax, 32
    mov dword ptr [esi + 12], eax
L14:
    mov eax, 00000FFFFh
L15:
    pop esi
    pop ebx
    leave
    ret
__flswbuf ENDP
END
