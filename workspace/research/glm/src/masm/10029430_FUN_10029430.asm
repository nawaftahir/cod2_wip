.686
.MODEL FLAT, C
.CODE
FUN_10029430 PROC
    push esi
    xor dl, dl
    mov eax, 010696C44h
    or ecx, 0FFFFFFFFh
    push edi
    lea esp, [esp]
L0:
    mov byte ptr [eax - 4], dl
    mov dword ptr [eax], ecx
    lea edi, [eax + 4]
    mov esi, ecx
    mov dword ptr [edi], esi
    mov dword ptr [edi + 4], esi
    mov dword ptr [edi + 8], esi
    mov dword ptr [edi + 12], esi
    mov dword ptr [eax + 20], ecx
    add eax, 28
    cmp eax, 010696CD0h
    jne L0
    pop edi
    pop esi
    ret
FUN_10029430 ENDP
END
