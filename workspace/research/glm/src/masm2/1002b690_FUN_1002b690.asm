.686
.MODEL FLAT, C
EXTRN sub_1001D769:PROC
EXTRN sub_1001EED1:PROC
EXTRN sub_1002AEA4:PROC
EXTRN sub_1002B48D:PROC
EXTRN sub_1002B815:PROC
EXTRN sub_100592BF:PROC
EXTRN sub_100592CE:PROC
EXTRN sub_100592DD:PROC
EXTRN EXTRN fp_101D4B78:DWORD:DWORD
EXTRN EXTRN g_101CE708:DWORD:DWORD
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
.CODE
FUN_1002b690 PROC
    push push ebp
    mov mov ebp, esp
    and and esp, -16
    sub sub esp, 116
    mov mov eax, dword ptr [ebp + 8]
    mov mov ecx, dword ptr [eax]
    push push ebx
    mov mov ebx, dword ptr [ecx + 8]
    push push esi
    mov mov esi, dword ptr [eax + 4]
    mov mov eax, dword ptr [g_101D1B9C]
    mov mov dword ptr [esp + 8], ecx
    mov mov ecx, dword ptr [eax + 0F8h]
    lea lea esi, [esi + esi*2]
    shl shl esi, 5
    mov mov edx, dword ptr [esi + ecx + 16]
    add add esi, ecx
    movsx movsx ecx, word ptr [ebx + 6]
    push push edi
    push push ecx
    push push edx
    call dword ptr [fp_101D4B78]
    mov mov ecx, eax
    lea lea eax, [esp + 24]
    call sub_1001D769
    mov mov eax, dword ptr [esi + 80]
    push push eax
    lea lea ecx, [esp + 28]
    lea lea edx, [esi + 44]
    push push ecx
    add add esi, 4
    lea lea ecx, [esp + 96]
    call sub_1001EED1
    add add esp, 16
    lea lea esi, [esp + 16]
    mov mov edi, ecx
    call sub_100592BF
    fstp fstp st(0)
    lea lea esi, [esp + 28]
    lea lea edi, [esp + 92]
    call sub_100592CE
    fstp fstp st(0)
    lea lea esi, [esp + 40]
    lea lea edi, [esp + 104]
    call sub_100592DD
    fstp fstp st(0)
    mov mov ecx, dword ptr [ebx + 12]
    movsx movsx edx, word ptr [ebx + 2]
    mov mov ebx, dword ptr [g_101CE708]
    cmp cmp dword ptr [ebx + 8], 2
    mov mov edi, dword ptr [ebp + 8]
    mov mov esi, dword ptr [esp + 12]
    mov mov eax, dword ptr [edi + 4]
    mov mov esi, dword ptr [esi]
    jne sub_1002B815
    mov mov ebx, dword ptr [ebp + 12]
    mov mov edi, dword ptr [edi + 8]
    add add ebx, 02000h
    push push ebx
    push push edi
    push push ecx
    push push edx
    lea lea edx, [esp + 32]
    push push esi
    push push edx
    lea lea ecx, [esp + 104]
    call sub_1002B48D
    add add esp, 24
    pop pop edi
    pop pop esi
    pop pop ebx
    mov mov esp, ebp
    pop pop ebp
    ret ret
    mov mov edi, dword ptr [ebp + 12]
    add add edi, 02000h
    push push edi
    push push ecx
    push push edx
    lea lea ecx, [esp + 92]
    push push esi
    push push ecx
    mov mov ecx, eax
    lea lea eax, [esp + 36]
    call sub_1002AEA4
    add add esp, 20
    pop pop edi
    pop pop esi
    pop pop ebx
    mov mov esp, ebp
    pop pop ebp
    ret ret
FUN_1002b690 ENDP
END
