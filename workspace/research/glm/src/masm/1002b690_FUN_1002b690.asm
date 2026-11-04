.686
.MODEL FLAT, C
EXTRN sub_1001D769:PROC
EXTRN sub_1001EED1:PROC
EXTRN sub_1002AEA4:PROC
EXTRN sub_1002B48D:PROC
EXTRN sub_100592BF:PROC
EXTRN sub_100592CE:PROC
EXTRN sub_100592DD:PROC
EXTRN fp_101D4B78:DWORD
EXTRN g_101CE708:DWORD
EXTRN g_101D1B9C:DWORD
.CODE
FUN_1002b690 PROC
    push ebp
    mov ebp, esp
    and esp, 0FFFFFFF0h
    sub esp, 116
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [eax]
    push ebx
    mov ebx, dword ptr [ecx + 8]
    push esi
    mov esi, dword ptr [eax + 4]
    mov eax, dword ptr [g_101D1B9C]
    mov dword ptr [esp + 8], ecx
    mov ecx, dword ptr [eax + 0000000F8h]
    lea esi, [esi + esi*2]
    shl esi, 5
    mov edx, dword ptr [esi + ecx + 16]
    add esi, ecx
    movsx ecx, word ptr [ebx + 6]
    push edi
    push ecx
    push edx
    call dword ptr [fp_101D4B78]
    mov ecx, eax
    lea eax, [esp + 24]
    call sub_1001D769
    mov eax, dword ptr [esi + 80]
    push eax
    lea ecx, [esp + 28]
    lea edx, [esi + 44]
    push ecx
    add esi, 4
    lea ecx, [esp + 96]
    call sub_1001EED1
    add esp, 16
    lea esi, [esp + 16]
    mov edi, ecx
    call sub_100592BF
    fstp st(0)
    lea esi, [esp + 28]
    lea edi, [esp + 92]
    call sub_100592CE
    fstp st(0)
    lea esi, [esp + 40]
    lea edi, [esp + 104]
    call sub_100592DD
    fstp st(0)
    mov ecx, dword ptr [ebx + 12]
    movsx edx, word ptr [ebx + 2]
    mov ebx, dword ptr [g_101CE708]
    cmp dword ptr [ebx + 8], 2
    mov edi, dword ptr [ebp + 8]
    mov esi, dword ptr [esp + 12]
    mov eax, dword ptr [edi + 4]
    mov esi, dword ptr [esi]
    jne L0
    mov ebx, dword ptr [ebp + 12]
    mov edi, dword ptr [edi + 8]
    add ebx, 000002000h
    push ebx
    push edi
    push ecx
    push edx
    lea edx, [esp + 32]
    push esi
    push edx
    lea ecx, [esp + 104]
    call sub_1002B48D
    add esp, 24
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
L0:
    mov edi, dword ptr [ebp + 12]
    add edi, 000002000h
    push edi
    push ecx
    push edx
    lea ecx, [esp + 92]
    push esi
    push ecx
    mov ecx, eax
    lea eax, [esp + 36]
    call sub_1002AEA4
    add esp, 20
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
FUN_1002b690 ENDP
END
