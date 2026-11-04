.686
.MODEL FLAT, C
EXTRN sub_100FC281:PROC
EXTRN sub_100FC295:PROC
EXTRN sub_10107725:PROC
EXTRN sub_10107726:PROC
EXTRN sub_10107727:PROC
EXTRN sub_1010772A:PROC
EXTRN sub_1010772B:PROC
EXTRN sub_10107735:PROC
EXTRN sub_10107736:PROC
EXTRN sub_1010773A:PROC
EXTRN sub_10107773:PROC
EXTRN EXTRN fp_1010C0C0:DWORD:DWORD
EXTRN EXTRN g_101ADD8C:DWORD:DWORD
EXTRN EXTRN g_1076AC9C:DWORD:DWORD
.CODE
__free_osfhnd PROC
    mov mov ecx, dword ptr [esp + 4]
    cmp cmp ecx, dword ptr [g_1076AC9C]
    push push esi
    push push edi
    jae L0
    mov mov eax, ecx
    sar sar eax, 5
    lea lea edi, [eax*4 + 01076ACA0h]
    mov mov eax, ecx
    and and eax, 31
    lea lea esi, [eax + eax*8]
    mov mov eax, dword ptr [edi]
    shl shl esi, 2
    add add eax, esi
    test test byte ptr [eax + 4], 1
    je sub_10107726
    cmp cmp dword ptr [eax], -1
    je sub_1010772B
    cmp cmp dword ptr [g_101ADD8C], 1
    jne sub_1010772A
    xor xor eax, eax
    sub sub ecx, eax
    je sub_10107727
    dec dec ecx
    je sub_10107725
    dec dec ecx
    jne sub_10107736
    push push eax
    push push -12
    jmp sub_10107735
    push push eax
    push push -11
    jmp sub_1010773A
    push push eax
    push push -10
    call dword ptr [fp_1010C0C0]
    mov mov eax, dword ptr [edi]
    or or dword ptr [esi + eax], -1
    xor xor eax, eax
    jmp sub_10107773
    call sub_100FC281
    mov mov dword ptr [eax], 9
    call sub_100FC295
    and and dword ptr [eax], 0
    or or eax, -1
    pop pop edi
    pop pop esi
    ret ret
__free_osfhnd ENDP
END
