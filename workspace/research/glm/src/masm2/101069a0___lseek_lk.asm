.686
.MODEL FLAT, C
EXTRN sub_100FC22C:PROC
EXTRN sub_100FC276:PROC
EXTRN sub_10106A1C:PROC
EXTRN sub_10106A26:PROC
EXTRN sub_10106A3C:PROC
EXTRN sub_10106A65:PROC
EXTRN sub_1010771B:PROC
EXTRN EXTRN fp_1010C054:DWORD:DWORD
EXTRN EXTRN fp_1010C0CC:DWORD:DWORD
.CODE
__lseek_lk PROC
    push push esi
    mov mov esi, dword ptr [esp + 8]
    push push esi
    call sub_1010771B
    cmp cmp eax, -1
    pop pop ecx
    jne L0
    call sub_100FC22C
    mov mov dword ptr [eax], 9
    or or eax, -1
    pop pop esi
    ret ret
    push push edi
    push push dword ptr [esp + 20]
    push push 0
    push push dword ptr [esp + 24]
    push push eax
    call dword ptr [fp_1010C0CC]
    mov mov edi, eax
    cmp cmp edi, -1
    jne sub_10106A1C
    call dword ptr [fp_1010C054]
    jmp sub_10106A26
    xor xor eax, eax
    test test eax, eax
    je sub_10106A3C
    push push eax
    call sub_100FC276
    pop pop ecx
    or or eax, -1
    jmp sub_10106A65
    mov mov ecx, esi
    and and esi, 31
    sar sar ecx, 5
    mov mov ecx, dword ptr [ecx*4 + 01076ACA0h]
    mov mov eax, esi
    lea lea eax, [eax + eax*8]
    lea lea eax, [ecx + eax*4 + 4]
    and and byte ptr [eax], 0FDh
    mov mov eax, edi
    pop pop edi
    pop pop esi
    ret ret
__lseek_lk ENDP
END
