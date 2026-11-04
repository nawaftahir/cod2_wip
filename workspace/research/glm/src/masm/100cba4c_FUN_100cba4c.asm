.686
.MODEL FLAT, C
EXTRN sub_100CBA3B:PROC
.CODE
FUN_100cba4c PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ecx + 4]
    mov edx, dword ptr [eax + 20]
    mov eax, dword ptr [eax + 16]
    push esi
    mov esi, dword ptr [ebp + 12]
    mov edx, dword ptr [edx + esi*4]
    mov esi, dword ptr [edx + 4]
    mov eax, dword ptr [eax + esi*4]
    test byte ptr [eax + 4], 32
    mov esi, dword ptr [ebp + 8]
    jne L1
    cmp dword ptr [edx + 92], 0
    je L1
    mov eax, dword ptr [ecx + 36]
    test eax, eax
    je L0
    push ebx
    mov ebx, dword ptr [ecx + 28]
    push edi
    mov edi, dword ptr [ecx + 32]
    shl esi, 2
    mov edi, dword ptr [edi + esi]
    add edi, dword ptr [ebx + esi]
    mov esi, dword ptr [ebp + 12]
    mov dword ptr [eax + edi*4], esi
    mov esi, dword ptr [ebp + 8]
    pop edi
    pop ebx
L0:
    mov eax, dword ptr [ecx + 28]
    lea eax, [eax + esi*4]
    inc dword ptr [eax]
L1:
    mov edx, dword ptr [edx + 20]
    cmp edx, -1
    je L2
    push edx
    push esi
    call sub_100CBA3B
L2:
    pop esi
    pop ebp
    ret 8
FUN_100cba4c ENDP
END
