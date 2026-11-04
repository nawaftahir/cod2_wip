.686
.MODEL FLAT, C
EXTRN sub_100FC2A0:PROC
EXTRN sub_100FCD2A:PROC
EXTRN sub_100FCD36:PROC
EXTRN sub_100FCD88:PROC
EXTRN sub_100FCD96:PROC
EXTRN sub_101076E7:PROC
EXTRN sub_1010771C:PROC
EXTRN sub_10107733:PROC
EXTRN sub_1010773C:PROC
EXTRN sub_10107748:PROC
EXTRN EXTRN fp_1010C054:DWORD:DWORD
EXTRN EXTRN fp_1010C084:DWORD:DWORD
.CODE
__close_lk PROC
    push push esi
    mov mov esi, dword ptr [esp + 8]
    push push edi
    push push esi
    call sub_1010771C
    cmp cmp eax, -1
    pop pop ecx
    je L2
    cmp cmp esi, 1
    je L0
    cmp cmp esi, 2
    jne L1
    push push 2
    call sub_10107733
    push push 1
    mov mov edi, eax
    call sub_1010773C
    cmp cmp eax, edi
    pop pop ecx
    pop pop ecx
    je L3
    push push esi
L0:
    call sub_10107748
    pop pop ecx
    push push eax
    call dword ptr [fp_1010C084]
    test test eax, eax
    jne sub_100FCD2A
    call dword ptr [fp_1010C054]
    mov mov edi, eax
    jmp sub_100FCD36
L1:
    xor xor edi, edi
    push push esi
    call sub_101076E7
    mov mov eax, esi
    sar sar eax, 5
    mov mov eax, dword ptr [eax*4 + 01076ACA0h]
    and and esi, 31
    test test edi, edi
    pop pop ecx
    lea lea ecx, [esi + esi*8]
    mov mov byte ptr [eax + ecx*4 + 4], 0
    je sub_100FCD88
    push push edi
    call sub_100FC2A0
    pop pop ecx
    or or eax, -1
    jmp sub_100FCD96
    xor xor eax, eax
L3:
    pop pop edi
    pop pop esi
    ret ret
__close_lk ENDP
END
