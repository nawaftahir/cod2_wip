.686
.MODEL FLAT, C
EXTRN sub_1003BD32:PROC
EXTRN sub_1003BFBC:PROC
EXTRN sub_1003C0E6:PROC
EXTRN sub_1003C0F6:PROC
EXTRN EXTRN g_101CE684:DWORD:DWORD
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
EXTRN EXTRN g_1072DDB8:DWORD:DWORD
.CODE
FUN_1003c050 PROC
    push push ecx
    mov mov ecx, dword ptr [g_1072DDB8]
    push push esi
    lea lea esi, [eax + eax*2]
    shl shl esi, 4
    add add esi, 010764590h
    mov mov eax, dword ptr [esi + 12]
    test test eax, eax
    push push edi
    je L0
    cmp cmp eax, ecx
    jg L1
    mov mov edi, ecx
    sub sub edi, eax
    jmp L2
    mov mov edi, 10
    mov mov eax, dword ptr [g_101CE684]
    mov mov dword ptr [esi + 12], ecx
    mov mov cl, byte ptr [eax + 8]
    test test cl, cl
    je sub_1003C0E6
    mov mov ecx, dword ptr [g_101D1B9C]
    mov mov al, byte ptr [ecx + 0160h]
L1:
    test test al, al
    je sub_1003C0F6
    push push edi
    mov mov edx, esi
    call sub_1003BD32
    add add esp, 4
    mov mov edx, esi
    call sub_1003BFBC
    pop pop edi
    pop pop esi
    pop pop ecx
    ret ret
FUN_1003c050 ENDP
END
