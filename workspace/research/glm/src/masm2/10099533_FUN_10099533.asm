.686
.MODEL FLAT, C
EXTRN sub_10067D4D:PROC
EXTRN sub_100F61DC:PROC
.CODE
FUN_10099533 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0100h
    lea lea eax, [ebp + 24]
    push push eax
    push push dword ptr [ebp + 20]
    lea lea eax, [ebp - 0100h]
    push push 0100h
    push push eax
    call sub_100F61DC
    lea lea eax, [ebp - 0100h]
    push push eax
    mov mov eax, dword ptr [ebp + 8]
    mov mov eax, dword ptr [eax + 4]
    push push 010193358h
    push push dword ptr [ebp + 16]
    add add eax, 24
    push push dword ptr [ebp + 12]
    mov mov byte ptr [ebp - 1], 0
    push push eax
    call sub_10067D4D
    add add esp, 36
    leave leave
    ret ret
FUN_10099533 ENDP
END
