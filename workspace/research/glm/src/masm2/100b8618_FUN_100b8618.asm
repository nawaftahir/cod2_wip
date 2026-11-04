.686
.MODEL FLAT, C
EXTRN sub_10063791:PROC
.CODE
FUN_100b8618 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 12
    push push esi
    lea lea eax, [ebp - 12]
    push push eax
    push push 0
    push push 01010C4BCh
    mov mov esi, ecx
    call sub_10063791
    mov mov eax, dword ptr [ebp - 8]
    and and dword ptr [esi + 48], 0
    or or byte ptr [esi + 113], 2
    mov mov dword ptr [esi + 0108h], eax
    push push 64
    pop pop eax
    mov mov dword ptr [esi + 40], eax
    mov mov dword ptr [esi + 44], eax
    mov mov eax, dword ptr [esi + 108]
    and and eax, 0FFFFFEFEh
    or or eax, 080000202h
    mov mov dword ptr [esi + 108], eax
    mov mov dword ptr [esi + 56], 02000h
    xor xor eax, eax
    pop pop esi
    leave leave
    ret ret
FUN_100b8618 ENDP
END
