.686
.MODEL FLAT, C
EXTRN sub_100243D0:PROC
EXTRN sub_10024686:PROC
EXTRN sub_10024695:PROC
EXTRN sub_1002469E:PROC
EXTRN EXTRN g_101CE654:DWORD:DWORD
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
.CODE
FUN_10024610 PROC
    mov mov ecx, dword ptr [g_101CE654]
    mov mov dword ptr [eax + 12], 5
    mov mov dl, byte ptr [ecx + 8]
    test test dl, dl
    je sub_10024686
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [eax + 4]
    mov mov ecx, dword ptr [ebp + 24]
    mov mov eax, dword ptr [ebp + 28]
    xor xor ebx, ebx
    test test ecx, ecx
    jle sub_10024695
    push push esi
    push push edi
    lea lea edi, [eax + eax*2]
    shl shl edi, 2
    lea lea ecx, [ecx]
    mov mov edx, dword ptr [g_101D1B9C]
    mov mov eax, dword ptr [edx + 20]
    mov mov ecx, dword ptr [eax + edi + 8]
    movzx movzx esi, word ptr [eax + edi + 4]
    add add eax, edi
    mov mov eax, dword ptr [eax]
    push push ecx
    mov mov ecx, dword ptr [esp + 24]
    call sub_100243D0
    mov mov eax, dword ptr [ebp + 24]
    add add esp, 4
    inc inc ebx
    add add edi, 12
    cmp cmp ebx, eax
    jl sub_1002469E
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    ret ret
FUN_10024610 ENDP
END
