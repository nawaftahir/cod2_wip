.686
.MODEL FLAT, C
EXTRN sub_10001957:PROC
EXTRN sub_1000417D:PROC
EXTRN sub_10004199:PROC
EXTRN sub_10004228:PROC
EXTRN sub_10004239:PROC
EXTRN EXTRN fp_101D49D4:DWORD:DWORD
EXTRN EXTRN g_101AE49C:DWORD:DWORD
.CODE
FUN_10004080 PROC
    sub sub esp, 8
    push push ebx
    push push esi
    push push edi
    mov mov ebx, 12
    mov mov edx, 17
    mov mov edi, eax
    call sub_10001957
    mov mov esi, eax
    mov mov eax, dword ptr [edi]
    mov mov ebx, dword ptr [eax + 094h]
    mov mov eax, dword ptr [edi + 4]
    lea lea ecx, [esi + esi*2]
    shl shl ecx, 2
    push push ecx
    add add ebx, eax
    call dword ptr [fp_101D49D4]
    add add esp, 4
    xor xor edi, edi
    cmp cmp esi, 4
    mov mov dword ptr [g_101AE49C], eax
    jl sub_1000417D
    mov mov edi, ebx
    sub sub edi, eax
    mov mov dword ptr [esp + 12], edi
    lea lea edi, [esi - 4]
    shr shr edi, 2
    inc inc edi
    push push ebp
    lea lea ebp, [edi*4]
    lea lea edx, [ebx + 12]
    lea lea ecx, [eax + 4]
    mov mov dword ptr [esp + 20], ebp
    mov mov ebp, dword ptr [edx - 12]
    mov mov dword ptr [ecx - 4], ebp
    mov mov ebp, dword ptr [esp + 16]
    mov mov ebp, dword ptr [ecx + ebp]
    mov mov dword ptr [ecx], ebp
    mov mov ebp, dword ptr [edx - 4]
    mov mov dword ptr [ecx + 4], ebp
    mov mov ebp, dword ptr [edx]
    mov mov dword ptr [ecx + 8], ebp
    mov mov ebp, dword ptr [edx + 4]
    mov mov dword ptr [ecx + 12], ebp
    mov mov ebp, dword ptr [edx + 8]
    mov mov dword ptr [ecx + 16], ebp
    mov mov ebp, dword ptr [edx + 12]
    mov mov dword ptr [ecx + 20], ebp
    mov mov ebp, dword ptr [edx + 16]
    mov mov dword ptr [ecx + 24], ebp
    mov mov ebp, dword ptr [edx + 20]
    mov mov dword ptr [ecx + 28], ebp
    mov mov ebp, dword ptr [edx + 24]
    mov mov dword ptr [ecx + 32], ebp
    mov mov ebp, dword ptr [edx + 28]
    mov mov dword ptr [ecx + 36], ebp
    mov mov ebp, dword ptr [edx + 32]
    mov mov dword ptr [ecx + 40], ebp
    add add edx, 48
    add add ecx, 48
    dec dec edi
    jne sub_10004199
    mov mov edi, dword ptr [esp + 20]
    pop pop ebp
    cmp cmp edi, esi
    jge sub_10004228
    lea lea ecx, [edi + edi*2]
    shl shl ecx, 2
    lea lea edx, [ecx + ebx]
    sub sub ebx, eax
    lea lea ecx, [ecx + eax + 4]
    sub sub esi, edi
    mov mov eax, dword ptr [edx]
    mov mov dword ptr [ecx - 4], eax
    mov mov eax, dword ptr [ebx + ecx]
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [edx + 8]
    mov mov dword ptr [ecx + 4], eax
    add add edx, 12
    add add ecx, 12
    dec dec esi
    jne sub_10004239
    pop pop edi
    pop pop esi
    pop pop ebx
    add add esp, 8
    ret ret
FUN_10004080 ENDP
END
