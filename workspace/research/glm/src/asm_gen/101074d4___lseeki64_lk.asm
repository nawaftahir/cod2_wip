; __lseeki64_lk @ 0x101074d4 — auto-synthesized
    EXTRN fp_1010c054:DWORD
    EXTRN fp_1010c0cc:DWORD
    sub_100fc23f PROTO C
    sub_100fc281 PROTO C
    sub_1010772c PROTO C
.CODE
__lseeki64_lk PROC
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    mov eax, dword ptr [ebp + 0xc]
    push esi
    mov esi, dword ptr [ebp + 8]
    mov dword ptr [ebp - 8], eax
    mov eax, dword ptr [ebp + 0x10]
    push edi
    push esi
    mov dword ptr [ebp - 4], eax
    call sub_1010772c
    or edi, 0xffffffff
    cmp eax, edi
    pop ecx
    jne L0
    call sub_100fc23f
    mov dword ptr [eax], 9
    jmp L1
    push dword ptr [ebp + 0x14]
    lea ecx, [ebp - 4]
    push ecx
    push dword ptr [ebp - 8]
    push eax
    call dword ptr [fp_1010c0cc]
    cmp eax, edi
    mov dword ptr [ebp - 8], eax
    jne L2
    call dword ptr [fp_1010c054]
    test eax, eax
    je L2
    push eax
    call sub_100fc281
    pop ecx
    mov eax, edi
    mov edx, edi
    jmp L3
    mov eax, esi
    sar eax, 5
    mov eax, dword ptr [eax*4 + 0x1076aca0]
    and esi, 0x1f
    lea ecx, [esi + esi*8]
    lea eax, [eax + ecx*4 + 4]
    and byte ptr [eax], 0xfd
    mov eax, dword ptr [ebp - 8]
    mov edx, dword ptr [ebp - 4]
    pop edi
    pop esi
    leave
    ret
__lseeki64_lk ENDP
END