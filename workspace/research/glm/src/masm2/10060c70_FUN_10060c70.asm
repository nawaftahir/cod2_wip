.686
.MODEL FLAT, C
EXTRN sub_10060D11:PROC
EXTRN sub_10060D27:PROC
EXTRN sub_10061D30:PROC
EXTRN sub_100F61F8:PROC
EXTRN EXTRN fp_101D4B84:DWORD:DWORD
.CODE
FUN_10060c70 PROC
    push push esi
    push push 1
    call dword ptr [fp_101D4B84]
    mov mov ecx, dword ptr [eax + 0800h]
    mov mov esi, ecx
    shl shl esi, 10
    add add esi, eax
    inc inc ecx
    and and ecx, 080000001h
    jns L0
    dec dec ecx
    or or ecx, -2
    inc inc ecx
    mov mov dword ptr [eax + 0800h], ecx
    mov mov ecx, dword ptr [esp + 12]
    lea lea eax, [esp + 16]
    push push eax
    push push ecx
    push push 0400h
    push push esi
    call sub_100F61F8
    add add esp, 20
    test test eax, eax
    mov mov byte ptr [esi + 03FFh], 0
    jl sub_10060D11
    cmp cmp eax, 0400h
    jl sub_10060D27
    push push 01019BBF8h
    push push 1
    call sub_10061D30
    add add esp, 8
    mov mov eax, esi
    pop pop esi
    ret ret
FUN_10060c70 ENDP
END
