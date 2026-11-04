.686
.MODEL FLAT, C
EXTRN sub_100CBA3B:PROC
EXTRN sub_100CBAC5:PROC
EXTRN sub_100CBACA:PROC
EXTRN sub_100CBACB:PROC
EXTRN sub_100CBB0D:PROC
.CODE
FUN_100cba4c PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    mov mov eax, dword ptr [ecx + 4]
    mov mov edx, dword ptr [eax + 20]
    mov mov eax, dword ptr [eax + 16]
    push push esi
    mov mov esi, dword ptr [ebp + 12]
    mov mov edx, dword ptr [edx + esi*4]
    mov mov esi, dword ptr [edx + 4]
    mov mov eax, dword ptr [eax + esi*4]
    test test byte ptr [eax + 4], 32
    mov mov esi, dword ptr [ebp + 8]
    jne sub_100CBAC5
    cmp cmp dword ptr [edx + 92], 0
    je sub_100CBACB
    mov mov eax, dword ptr [ecx + 36]
    test test eax, eax
    je sub_100CBACA
    push push ebx
    mov mov ebx, dword ptr [ecx + 28]
    push push edi
    mov mov edi, dword ptr [ecx + 32]
    shl shl esi, 2
    mov mov edi, dword ptr [edi + esi]
    add add edi, dword ptr [ebx + esi]
    mov mov esi, dword ptr [ebp + 12]
    mov mov dword ptr [eax + edi*4], esi
    mov mov esi, dword ptr [ebp + 8]
    pop pop edi
    pop pop ebx
    mov mov eax, dword ptr [ecx + 28]
    lea lea eax, [eax + esi*4]
    inc inc dword ptr [eax]
    mov mov edx, dword ptr [edx + 20]
    cmp cmp edx, -1
    je sub_100CBB0D
    push push edx
    push push esi
    call sub_100CBA3B
    pop pop esi
    pop pop ebp
    ret ret 8
FUN_100cba4c ENDP
END
