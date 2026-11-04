.686
.MODEL FLAT, C
EXTRN sub_100C5131:PROC
.CODE
FUN_100a6e56 PROC
    mov edi, edi
    push esi
    push edi
    mov esi, ecx
    call sub_100C5131
    or dword ptr [esi + 00000043Ch], 0FFFFFFFFh
    xor edx, edx
    push 16
    pop ecx
    xor eax, eax
    lea edi, [esi + 0000002C4h]
    mov dword ptr [esi], 010116AC0h
    mov dword ptr [esi + 00000022Ch], edx
    mov dword ptr [esi + 000000230h], edx
    mov dword ptr [esi + 000000448h], edx
    mov dword ptr [esi + 0000002B4h], edx
    mov dword ptr [esi + 0000002B8h], edx
    mov dword ptr [esi + 0000002C0h], edx
    mov dword ptr [esi + 0000002BCh], edx
    rep stosd dword ptr es:[edi], eax
    pop edi
    mov dword ptr [esi + 000000404h], edx
    mov eax, esi
    pop esi
    ret
FUN_100a6e56 ENDP
END
