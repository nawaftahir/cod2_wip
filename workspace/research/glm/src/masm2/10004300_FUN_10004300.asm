.686
.MODEL FLAT, C
EXTRN sub_1000195A:PROC
EXTRN sub_100043D9:PROC
EXTRN sub_10004405:PROC
EXTRN sub_10004425:PROC
EXTRN sub_10004436:PROC
EXTRN sub_1000443D:PROC
EXTRN EXTRN fp_101D49D4:DWORD:DWORD
EXTRN EXTRN g_101AE374:DWORD:DWORD
EXTRN EXTRN g_101AE378:DWORD:DWORD
.CODE
FUN_10004300 PROC
    push push ecx
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 16]
    push push esi
    push push edi
    mov mov ebx, 32
    mov mov edx, 10
    mov mov eax, ebp
    call sub_1000195A
    mov mov esi, eax
    mov mov eax, dword ptr [ebp]
    mov mov edi, dword ptr [eax + 92]
    mov mov eax, dword ptr [ebp + 4]
    mov mov ecx, esi
    shl shl ecx, 5
    push push ecx
    mov mov dword ptr [esp + 28], esi
    add add edi, eax
    call dword ptr [fp_101D49D4]
    add add esp, 4
    test test esi, esi
    mov mov dword ptr [g_101AE378], eax
    mov mov dword ptr [g_101AE374], esi
    jle sub_10004405
    mov mov ebp, edi
    sub sub ebp, eax
    lea lea ebx, [eax + 28]
    lea lea ecx, [eax + 12]
    lea lea esi, [edi + 24]
    lea lea edx, [edi + 16]
    sub sub eax, edi
    mov mov edi, dword ptr [esp + 24]
    mov mov dword ptr [esp + 16], ebp
    mov mov dword ptr [esp + 24], edi
    jmp sub_100043D9
    mov mov ebp, dword ptr [esp + 16]
    lea lea ecx, [ecx]
    mov mov edi, dword ptr [edx - 16]
    mov mov dword ptr [ecx - 12], edi
    mov mov edi, dword ptr [ecx + ebp]
    mov mov dword ptr [ecx], edi
    mov mov edi, dword ptr [edx - 12]
    mov mov dword ptr [ecx - 8], edi
    mov mov edi, dword ptr [edx]
    mov mov dword ptr [ecx + 4], edi
    mov mov edi, dword ptr [edx - 8]
    mov mov dword ptr [ecx - 4], edi
    mov mov edi, dword ptr [edx + 4]
    mov mov dword ptr [ecx + 8], edi
    mov mov edi, dword ptr [esi + 4]
    test test edi, edi
    je sub_10004436
    mov mov ebp, dword ptr [esi]
    jmp sub_1000443D
    or or ebp, -1
    mov mov dword ptr [esi + eax], edi
    mov mov edi, dword ptr [esp + 24]
    mov mov dword ptr [ebx], ebp
    add add ecx, 32
    add add edx, 32
    add add esi, 32
    add add ebx, 32
    dec dec edi
    mov mov dword ptr [esp + 24], edi
    jne sub_10004425
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    pop pop ecx
    ret ret
FUN_10004300 ENDP
END
