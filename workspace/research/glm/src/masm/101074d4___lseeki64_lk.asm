.686
.MODEL FLAT, C
EXTRN sub_100FC23F:PROC
EXTRN sub_100FC281:PROC
EXTRN sub_1010772C:PROC
EXTRN fp_1010C054:DWORD
EXTRN fp_1010C0CC:DWORD
.CODE
__lseeki64_lk PROC
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    mov eax, dword ptr [ebp + 12]
    push esi
    mov esi, dword ptr [ebp + 8]
    mov dword ptr [ebp - 8], eax
    mov eax, dword ptr [ebp + 16]
    push edi
    push esi
    mov dword ptr [ebp - 4], eax
    call sub_1010772C
    or edi, 0FFFFFFFFh
    cmp eax, edi
    pop ecx
    jne L0
    call sub_100FC23F
    mov dword ptr [eax], 9
    jmp L1
L0:
    push dword ptr [ebp + 20]
    lea ecx, [ebp - 4]
    push ecx
    push dword ptr [ebp - 8]
    push eax
    call dword ptr [fp_1010C0CC]
    cmp eax, edi
    mov dword ptr [ebp - 8], eax
    jne L2
    call dword ptr [fp_1010C054]
    test eax, eax
    je L2
    push eax
    call sub_100FC281
    pop ecx
L1:
    mov eax, edi
    mov edx, edi
    jmp L3
L2:
    mov eax, esi
    sar eax, 5
    mov eax, dword ptr [eax*4 + 01076ACA0h]
    and esi, 31
    lea ecx, [esi + esi*8]
    lea eax, [eax + ecx*4 + 4]
    and byte ptr [eax], 0000000FDh
    mov eax, dword ptr [ebp - 8]
    mov edx, dword ptr [ebp - 4]
L3:
    pop edi
    pop esi
    leave
    ret
__lseeki64_lk ENDP
END
