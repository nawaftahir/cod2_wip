.686
.MODEL FLAT, C
EXTRN sub_1000195A:PROC
EXTRN fp_101D49D4:DWORD
EXTRN g_101AE374:DWORD
EXTRN g_101AE378:DWORD
.CODE
FUN_10004300 PROC
    push ecx
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 16]
    push esi
    push edi
    mov ebx, 32
    mov edx, 10
    mov eax, ebp
    call sub_1000195A
    mov esi, eax
    mov eax, dword ptr [ebp]
    mov edi, dword ptr [eax + 92]
    mov eax, dword ptr [ebp + 4]
    mov ecx, esi
    shl ecx, 5
    push ecx
    mov dword ptr [esp + 28], esi
    add edi, eax
    call dword ptr [fp_101D49D4]
    add esp, 4
    test esi, esi
    mov dword ptr [g_101AE378], eax
    mov dword ptr [g_101AE374], esi
    jle L4
    mov ebp, edi
    sub ebp, eax
    lea ebx, [eax + 28]
    lea ecx, [eax + 12]
    lea esi, [edi + 24]
    lea edx, [edi + 16]
    sub eax, edi
    mov edi, dword ptr [esp + 24]
    mov dword ptr [esp + 16], ebp
    mov dword ptr [esp + 24], edi
    jmp L1
L0:
    mov ebp, dword ptr [esp + 16]
    lea ecx, [ecx]
L1:
    mov edi, dword ptr [edx - 16]
    mov dword ptr [ecx - 12], edi
    mov edi, dword ptr [ecx + ebp]
    mov dword ptr [ecx], edi
    mov edi, dword ptr [edx - 12]
    mov dword ptr [ecx - 8], edi
    mov edi, dword ptr [edx]
    mov dword ptr [ecx + 4], edi
    mov edi, dword ptr [edx - 8]
    mov dword ptr [ecx - 4], edi
    mov edi, dword ptr [edx + 4]
    mov dword ptr [ecx + 8], edi
    mov edi, dword ptr [esi + 4]
    test edi, edi
    je L2
    mov ebp, dword ptr [esi]
    jmp L3
L2:
    or ebp, 0FFFFFFFFh
L3:
    mov dword ptr [esi + eax], edi
    mov edi, dword ptr [esp + 24]
    mov dword ptr [ebx], ebp
    add ecx, 32
    add edx, 32
    add esi, 32
    add ebx, 32
    dec edi
    mov dword ptr [esp + 24], edi
    jne L0
L4:
    pop edi
    pop esi
    pop ebp
    pop ebx
    pop ecx
    ret
FUN_10004300 ENDP
END
