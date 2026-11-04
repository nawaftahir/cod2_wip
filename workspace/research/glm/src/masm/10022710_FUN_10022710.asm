.686
.MODEL FLAT, C
EXTRN sub_10060CBB:PROC
.CODE
FUN_10022710 PROC
    lea eax, [ecx - 21]
    cmp eax, 59
    ja L0
    movzx eax, byte ptr [eax + 010022780h]
    jmp dword ptr [eax*4 + 0x10022760]
    mov eax, 010196C6Ch
    ret
    mov eax, 010196C5Ch
    ret
    mov eax, 010196C3Ch
    ret
    mov eax, 010196C1Ch
    ret
    mov eax, 010196BFCh
    ret
    mov eax, 010196BDCh
    ret
    mov eax, 010196BBCh
    ret
L0:
    push ecx
    push 010196BA4h
    call sub_10060CBB
    add esp, 8
    ret
FUN_10022710 ENDP
END
