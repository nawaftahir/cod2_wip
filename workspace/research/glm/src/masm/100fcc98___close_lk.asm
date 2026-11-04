.686
.MODEL FLAT, C
EXTRN sub_100FC2A0:PROC
EXTRN sub_101076E7:PROC
EXTRN sub_1010771C:PROC
EXTRN sub_10107733:PROC
EXTRN sub_1010773C:PROC
EXTRN sub_10107748:PROC
EXTRN fp_1010C054:DWORD
EXTRN fp_1010C084:DWORD
.CODE
__close_lk PROC
    push esi
    mov esi, dword ptr [esp + 8]
    push edi
    push esi
    call sub_1010771C
    cmp eax, -1
    pop ecx
    je L2
    cmp esi, 1
    je L0
    cmp esi, 2
    jne L1
L0:
    push 2
    call sub_10107733
    push 1
    mov edi, eax
    call sub_1010773C
    cmp eax, edi
    pop ecx
    pop ecx
    je L2
L1:
    push esi
    call sub_10107748
    pop ecx
    push eax
    call dword ptr [fp_1010C084]
    test eax, eax
    jne L2
    call dword ptr [fp_1010C054]
    mov edi, eax
    jmp L3
L2:
    xor edi, edi
L3:
    push esi
    call sub_101076E7
    mov eax, esi
    sar eax, 5
    mov eax, dword ptr [eax*4 + 01076ACA0h]
    and esi, 31
    test edi, edi
    pop ecx
    lea ecx, [esi + esi*8]
    mov byte ptr [eax + ecx*4 + 4], 0
    je L4
    push edi
    call sub_100FC2A0
    pop ecx
    or eax, 0FFFFFFFFh
    jmp L5
L4:
    xor eax, eax
L5:
    pop edi
    pop esi
    ret
__close_lk ENDP
END
