.686
.MODEL FLAT, C
EXTRN sub_100FC23F:PROC
EXTRN sub_100FC281:PROC
EXTRN sub_1010755F:PROC
EXTRN sub_1010757D:PROC
EXTRN sub_10107587:PROC
EXTRN sub_101075B3:PROC
EXTRN sub_1010772C:PROC
EXTRN EXTRN fp_1010C054:DWORD:DWORD
EXTRN EXTRN fp_1010C0CC:DWORD:DWORD
.CODE
__lseeki64_lk PROC
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ecx
    mov mov eax, dword ptr [ebp + 12]
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    mov mov dword ptr [ebp - 8], eax
    mov mov eax, dword ptr [ebp + 16]
    push push edi
    push push esi
    mov mov dword ptr [ebp - 4], eax
    call sub_1010772C
    or or edi, -1
    cmp cmp eax, edi
    pop pop ecx
    jne L0
    call sub_100FC23F
    mov mov dword ptr [eax], 9
    jmp sub_1010755F
    push push dword ptr [ebp + 20]
    lea lea ecx, [ebp - 4]
    push push ecx
    push push dword ptr [ebp - 8]
    push push eax
    call dword ptr [fp_1010C0CC]
    cmp cmp eax, edi
    mov mov dword ptr [ebp - 8], eax
    jne sub_1010757D
    call dword ptr [fp_1010C054]
    test test eax, eax
    je sub_10107587
    push push eax
    call sub_100FC281
    pop pop ecx
    mov mov eax, edi
    mov mov edx, edi
    jmp sub_101075B3
    mov mov eax, esi
    sar sar eax, 5
    mov mov eax, dword ptr [eax*4 + 01076ACA0h]
    and and esi, 31
    lea lea ecx, [esi + esi*8]
    lea lea eax, [eax + ecx*4 + 4]
    and and byte ptr [eax], 0FDh
    mov mov eax, dword ptr [ebp - 8]
    mov mov edx, dword ptr [ebp - 4]
    pop pop edi
    pop pop esi
    leave leave
    ret ret
__lseeki64_lk ENDP
END
