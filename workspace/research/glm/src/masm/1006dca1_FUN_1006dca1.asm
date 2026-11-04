.686
.MODEL FLAT, C
EXTRN sub_10067C98:PROC
EXTRN sub_1006DC7D:PROC
EXTRN sub_100F61E7:PROC
.CODE
FUN_1006dca1 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 000000100h
    push esi
    mov esi, dword ptr [ebp + 8]
    lea eax, [ebp + 24]
    push eax
    push dword ptr [ebp + 20]
    lea eax, [ebp - 000000100h]
    push 000000100h
    push eax
    mov dword ptr [esi + 76], 1
    call sub_100F61E7
    add esp, 16
    lea eax, [ebp - 000000100h]
    push eax
    push 010193358h
    push dword ptr [ebp + 16]
    mov ecx, esi
    push dword ptr [ebp + 12]
    mov byte ptr [ebp - 1], 0
    call sub_1006DC7D
    push eax
    mov eax, dword ptr [esi]
    add eax, 24
    push eax
    call sub_10067C98
    add esp, 20
    xor eax, eax
    pop esi
    leave
    ret
FUN_1006dca1 ENDP
END
