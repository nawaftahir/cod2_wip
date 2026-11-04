.686
.MODEL FLAT, C
EXTRN sub_100FB61C:PROC
EXTRN sub_100FB6DE:PROC
EXTRN sub_100FC0B1:PROC
EXTRN sub_101010FE:PROC
EXTRN sub_101077EC:PROC
EXTRN sub_101077F3:PROC
EXTRN sub_10107804:PROC
EXTRN sub_10107841:PROC
EXTRN sub_10107856:PROC
EXTRN sub_10107AB1:PROC
EXTRN EXTRN fp_1010C030:DWORD:DWORD
.CODE
__lock_fhandle PROC
    push push 8
    push push 010182210h
    call sub_100FB61C
    mov mov edi, dword ptr [ebp + 8]
    mov mov ecx, edi
    sar sar ecx, 5
    mov mov eax, edi
    and and eax, 31
    lea lea eax, [eax + eax*8]
    mov mov ecx, dword ptr [ecx*4 + 01076ACA0h]
    lea lea esi, [ecx + eax*4]
    xor xor ebx, ebx
    cmp cmp dword ptr [esi + 8], ebx
    jne sub_101077EC
    push push 10
    call sub_100FC0B1
    pop pop ecx
    mov mov dword ptr [ebp - 4], ebx
    cmp cmp dword ptr [esi + 8], ebx
    jne sub_101077F3
    push push 0FA0h
    lea lea eax, [esi + 12]
    push push eax
    call sub_10107AB1
    pop pop ecx
    pop pop ecx
    test test eax, eax
    jne sub_10107804
    push push -1
    lea lea eax, [ebp - 16]
    push push eax
    call sub_101010FE
    pop pop ecx
    pop pop ecx
    xor xor eax, eax
    jmp sub_10107841
    inc inc dword ptr [esi + 8]
    or or dword ptr [ebp - 4], -1
    call sub_10107856
    mov mov eax, edi
    sar sar eax, 5
    and and edi, 31
    lea lea ecx, [edi + edi*8]
    mov mov eax, dword ptr [eax*4 + 01076ACA0h]
    lea lea eax, [eax + ecx*4 + 12]
    push push eax
    call dword ptr [fp_1010C030]
    xor xor eax, eax
    inc inc eax
    call sub_100FB6DE
    ret ret
__lock_fhandle ENDP
END
