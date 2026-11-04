.686
.MODEL FLAT, C
EXTRN sub_10060CBB:PROC
.CODE
FUN_10022710 PROC
    lea lea eax, [ecx - 21]
    cmp cmp eax, 59
    ja L0
    movzx movzx eax, byte ptr [eax + 010022780h]
    jmp jmp dword ptr [eax*4 + 010022760h]
    mov mov eax, 010196C6Ch
    ret ret
    mov mov eax, 010196C5Ch
    ret ret
    mov mov eax, 010196C3Ch
    ret ret
    mov mov eax, 010196C1Ch
    ret ret
    mov mov eax, 010196BFCh
    ret ret
    mov mov eax, 010196BDCh
    ret ret
    mov mov eax, 010196BBCh
    ret ret
    push push ecx
    push push 010196BA4h
    call sub_10060CBB
    add add esp, 8
    ret ret
FUN_10022710 ENDP
END
