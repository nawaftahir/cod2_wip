.686
.MODEL FLAT, C
EXTRN sub_100FC22C:PROC
EXTRN sub_100FC276:PROC
EXTRN sub_1010771B:PROC
EXTRN fp_1010C054:DWORD
EXTRN fp_1010C0CC:DWORD
.CODE
__lseek_lk PROC
    push esi
    mov esi, dword ptr [esp + 8]
    push esi
    call sub_1010771B
    cmp eax, -1
    pop ecx
    jne L0
    call sub_100FC22C
    mov dword ptr [eax], 9
    or eax, 0FFFFFFFFh
    pop esi
    ret
L0:
    push edi
    push dword ptr [esp + 20]
    push 0
    push dword ptr [esp + 24]
    push eax
    call dword ptr [fp_1010C0CC]
    mov edi, eax
    cmp edi, -1
    jne L1
    call dword ptr [fp_1010C054]
    jmp L2
L1:
    xor eax, eax
L2:
    test eax, eax
    je L3
    push eax
    call sub_100FC276
    pop ecx
    or eax, 0FFFFFFFFh
    jmp L4
L3:
    mov ecx, esi
    and esi, 31
    sar ecx, 5
    mov ecx, dword ptr [ecx*4 + 01076ACA0h]
    mov eax, esi
    lea eax, [eax + eax*8]
    lea eax, [ecx + eax*4 + 4]
    and byte ptr [eax], 0000000FDh
    mov eax, edi
L4:
    pop edi
    pop esi
    ret
__lseek_lk ENDP
END
