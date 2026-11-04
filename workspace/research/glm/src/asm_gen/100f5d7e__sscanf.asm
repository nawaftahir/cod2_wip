; _sscanf @ 0x100f5d7e — auto-synthesized
    sub_100f94b1 PROTO C
    sub_100fa21c PROTO C
.CODE
_sscanf PROC
    push ebp
    mov ebp, esp
    sub esp, 0x20
    mov eax, dword ptr [ebp + 8]
    push eax
    mov dword ptr [ebp - 0x14], 0x49
    mov dword ptr [ebp - 0x18], eax
    mov dword ptr [ebp - 0x20], eax
    call sub_100fa21c
    mov dword ptr [ebp - 0x1c], eax
    lea eax, [ebp + 0x10]
    push eax
    push dword ptr [ebp + 0xc]
    lea eax, [ebp - 0x20]
    push eax
    call sub_100f94b1
    add esp, 0x10
    leave
    ret
_sscanf ENDP
END