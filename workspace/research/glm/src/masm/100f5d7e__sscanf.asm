.686
.MODEL FLAT, C
EXTRN sub_100F94B1:PROC
EXTRN sub_100FA21C:PROC
.CODE
_sscanf PROC
    push ebp
    mov ebp, esp
    sub esp, 32
    mov eax, dword ptr [ebp + 8]
    push eax
    mov dword ptr [ebp - 20], 73
    mov dword ptr [ebp - 24], eax
    mov dword ptr [ebp - 32], eax
    call sub_100FA21C
    mov dword ptr [ebp - 28], eax
    lea eax, [ebp + 16]
    push eax
    push dword ptr [ebp + 12]
    lea eax, [ebp - 32]
    push eax
    call sub_100F94B1
    add esp, 16
    leave
    ret
_sscanf ENDP
END
