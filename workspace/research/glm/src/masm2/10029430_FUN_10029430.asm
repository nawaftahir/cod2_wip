.686
.MODEL FLAT, C
EXTRN sub_10029472:PROC
.CODE
FUN_10029430 PROC
    push push esi
    xor xor dl, dl
    mov mov eax, 010696C44h
    or or ecx, -1
    push push edi
    lea lea esp, [esp]
    mov mov byte ptr [eax - 4], dl
    mov mov dword ptr [eax], ecx
    lea lea edi, [eax + 4]
    mov mov esi, ecx
    mov mov dword ptr [edi], esi
    mov mov dword ptr [edi + 4], esi
    mov mov dword ptr [edi + 8], esi
    mov mov dword ptr [edi + 12], esi
    mov mov dword ptr [eax + 20], ecx
    add add eax, 28
    cmp cmp eax, 010696CD0h
    jne sub_10029472
    pop pop edi
    pop pop esi
    ret ret
FUN_10029430 ENDP
END
