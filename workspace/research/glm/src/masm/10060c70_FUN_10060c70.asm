.686
.MODEL FLAT, C
EXTRN sub_10061D30:PROC
EXTRN sub_100F61F8:PROC
EXTRN fp_101D4B84:DWORD
.CODE
FUN_10060c70 PROC
    push esi
    push 1
    call dword ptr [fp_101D4B84]
    mov ecx, dword ptr [eax + 000000800h]
    mov esi, ecx
    shl esi, 10
    add esi, eax
    inc ecx
    and ecx, 080000001h
    jns L0
    dec ecx
    or ecx, 0FFFFFFFEh
    inc ecx
L0:
    mov dword ptr [eax + 000000800h], ecx
    mov ecx, dword ptr [esp + 12]
    lea eax, [esp + 16]
    push eax
    push ecx
    push 000000400h
    push esi
    call sub_100F61F8
    add esp, 20
    test eax, eax
    mov byte ptr [esi + 0000003FFh], 0
    jl L1
    cmp eax, 000000400h
    jl L2
L1:
    push 01019BBF8h
    push 1
    call sub_10061D30
    add esp, 8
L2:
    mov eax, esi
    pop esi
    ret
FUN_10060c70 ENDP
END
