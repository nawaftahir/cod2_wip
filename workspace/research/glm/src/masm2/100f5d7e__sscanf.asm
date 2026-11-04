.686
.MODEL FLAT, C
EXTRN sub_100F94B1:PROC
EXTRN sub_100FA21C:PROC
.CODE
_sscanf PROC
    push push ebp
    mov mov ebp, esp
    sub sub esp, 32
    mov mov eax, dword ptr [ebp + 8]
    push push eax
    mov mov dword ptr [ebp - 20], 73
    mov mov dword ptr [ebp - 24], eax
    mov mov dword ptr [ebp - 32], eax
    call sub_100FA21C
    mov mov dword ptr [ebp - 28], eax
    lea lea eax, [ebp + 16]
    push push eax
    push push dword ptr [ebp + 12]
    lea lea eax, [ebp - 32]
    push push eax
    call sub_100F94B1
    add add esp, 16
    leave leave
    ret ret
_sscanf ENDP
END
