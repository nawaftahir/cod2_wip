.686
.MODEL FLAT, C
EXTRN sub_10067C98:PROC
EXTRN sub_1006DC7D:PROC
EXTRN sub_100F61E7:PROC
.CODE
FUN_1006dca1 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0100h
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    lea lea eax, [ebp + 24]
    push push eax
    push push dword ptr [ebp + 20]
    lea lea eax, [ebp - 0100h]
    push push 0100h
    push push eax
    mov mov dword ptr [esi + 76], 1
    call sub_100F61E7
    add add esp, 16
    lea lea eax, [ebp - 0100h]
    push push eax
    push push 010193358h
    push push dword ptr [ebp + 16]
    mov mov ecx, esi
    push push dword ptr [ebp + 12]
    mov mov byte ptr [ebp - 1], 0
    call sub_1006DC7D
    push push eax
    mov mov eax, dword ptr [esi]
    add add eax, 24
    push push eax
    call sub_10067C98
    add add esp, 20
    xor xor eax, eax
    pop pop esi
    leave leave
    ret ret
FUN_1006dca1 ENDP
END
