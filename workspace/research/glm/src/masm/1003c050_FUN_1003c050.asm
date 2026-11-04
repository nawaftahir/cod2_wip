.686
.MODEL FLAT, C
EXTRN sub_1003BD32:PROC
EXTRN sub_1003BFBC:PROC
EXTRN g_101CE684:DWORD
EXTRN g_101D1B9C:DWORD
EXTRN g_1072DDB8:DWORD
.CODE
FUN_1003c050 PROC
    push ecx
    mov ecx, dword ptr [g_1072DDB8]
    push esi
    lea esi, [eax + eax*2]
    shl esi, 4
    add esi, 010764590h
    mov eax, dword ptr [esi + 12]
    test eax, eax
    push edi
    je L0
    cmp eax, ecx
    jg L0
    mov edi, ecx
    sub edi, eax
    jmp L1
L0:
    mov edi, 10
L1:
    mov eax, dword ptr [g_101CE684]
    mov dword ptr [esi + 12], ecx
    mov cl, byte ptr [eax + 8]
    test cl, cl
    je L2
    mov ecx, dword ptr [g_101D1B9C]
    mov al, byte ptr [ecx + 000000160h]
    test al, al
    je L2
    push edi
    mov edx, esi
    call sub_1003BD32
    add esp, 4
    mov edx, esi
    call sub_1003BFBC
L2:
    pop edi
    pop esi
    pop ecx
    ret
FUN_1003c050 ENDP
END
