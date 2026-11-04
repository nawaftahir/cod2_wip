.686
.MODEL FLAT, C
EXTRN sub_100C8D49:PROC
EXTRN sub_100F789F:PROC
EXTRN sub_100F78AC:PROC
.CODE
FUN_100a6eb2 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi
    mov esi, ecx
    push 8
    xor eax, eax
    pop ecx
    lea edi, [esi + 0000001F8h]
    rep stosd dword ptr es:[edi], eax
    lea edi, [esi + 000000218h]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    and dword ptr [esi + 000000220h], 0
    and dword ptr [esi + 000000224h], 0
    lea edi, [esi + 00000022Ch]
    push dword ptr [edi]
    call sub_100F789F
    lea ebx, [esi + 000000230h]
    push dword ptr [ebx]
    call sub_100F78AC
    and dword ptr [edi], 0
    and dword ptr [ebx], 0
    pop ecx
    pop ecx
    push dword ptr [ebp + 8]
    mov ecx, esi
    call sub_100C8D49
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 4
FUN_100a6eb2 ENDP
END
