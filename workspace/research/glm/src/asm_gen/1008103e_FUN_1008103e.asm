; FUN_1008103e @ 0x1008103e — auto-synthesized
    sub_100636d9 PROTO C
.CODE
FUN_1008103e PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [ecx + 4]
    cmp eax, 1
    push esi
    lea esi, [eax - 1]
    mov dword ptr [ecx + 4], esi
    jne L0
    push eax
    call sub_100636d9
    mov eax, esi
    pop esi
    pop ebp
    ret 4
FUN_1008103e ENDP
END