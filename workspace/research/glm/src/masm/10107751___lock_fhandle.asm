.686
.MODEL FLAT, C
EXTRN sub_100FB61C:PROC
EXTRN sub_100FB6DE:PROC
EXTRN sub_100FC0B1:PROC
EXTRN sub_101010FE:PROC
EXTRN sub_10107856:PROC
EXTRN sub_10107AB1:PROC
EXTRN fp_1010C030:DWORD
.CODE
__lock_fhandle PROC
    push 8
    push 010182210h
    call sub_100FB61C
    mov edi, dword ptr [ebp + 8]
    mov ecx, edi
    sar ecx, 5
    mov eax, edi
    and eax, 31
    lea eax, [eax + eax*8]
    mov ecx, dword ptr [ecx*4 + 01076ACA0h]
    lea esi, [ecx + eax*4]
    xor ebx, ebx
    cmp dword ptr [esi + 8], ebx
    jne L2
    push 10
    call sub_100FC0B1
    pop ecx
    mov dword ptr [ebp - 4], ebx
    cmp dword ptr [esi + 8], ebx
    jne L1
    push 000000FA0h
    lea eax, [esi + 12]
    push eax
    call sub_10107AB1
    pop ecx
    pop ecx
    test eax, eax
    jne L0
    push -1
    lea eax, [ebp - 16]
    push eax
    call sub_101010FE
    pop ecx
    pop ecx
    xor eax, eax
    jmp L3
L0:
    inc dword ptr [esi + 8]
L1:
    or dword ptr [ebp - 4], 0FFFFFFFFh
    call sub_10107856
L2:
    mov eax, edi
    sar eax, 5
    and edi, 31
    lea ecx, [edi + edi*8]
    mov eax, dword ptr [eax*4 + 01076ACA0h]
    lea eax, [eax + ecx*4 + 12]
    push eax
    call dword ptr [fp_1010C030]
    xor eax, eax
    inc eax
L3:
    call sub_100FB6DE
    ret
__lock_fhandle ENDP
END
