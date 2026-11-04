.686
.MODEL FLAT, C
EXTRN sub_10063791:PROC
.CODE
FUN_100b8618 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 12
    push esi
    lea eax, [ebp - 12]
    push eax
    push 0
    push 01010C4BCh
    mov esi, ecx
    call sub_10063791
    mov eax, dword ptr [ebp - 8]
    and dword ptr [esi + 48], 0
    or byte ptr [esi + 113], 2
    mov dword ptr [esi + 000000108h], eax
    push 64
    pop eax
    mov dword ptr [esi + 40], eax
    mov dword ptr [esi + 44], eax
    mov eax, dword ptr [esi + 108]
    and eax, 0FFFFFEFEh
    or eax, 080000202h
    mov dword ptr [esi + 108], eax
    mov dword ptr [esi + 56], 000002000h
    xor eax, eax
    pop esi
    leave
    ret
FUN_100b8618 ENDP
END
