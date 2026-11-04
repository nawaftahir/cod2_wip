.686
.MODEL FLAT, C
EXTRN sub_10067D4D:PROC
EXTRN sub_100F61DC:PROC
.CODE
FUN_10099533 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 000000100h
    lea eax, [ebp + 24]
    push eax
    push dword ptr [ebp + 20]
    lea eax, [ebp - 000000100h]
    push 000000100h
    push eax
    call sub_100F61DC
    lea eax, [ebp - 000000100h]
    push eax
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + 4]
    push 010193358h
    push dword ptr [ebp + 16]
    add eax, 24
    push dword ptr [ebp + 12]
    mov byte ptr [ebp - 1], 0
    push eax
    call sub_10067D4D
    add esp, 36
    leave
    ret
FUN_10099533 ENDP
END
