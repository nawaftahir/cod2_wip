; FUN_10015090 @ 0x10015090 — auto-synthesized
    sub_1000d229 PROTO C
.CODE
FUN_10015090 PROC
    push ecx
    push esi
    mov esi, eax
    mov al, byte ptr [esi]
    inc esi
    mov byte ptr [ebx + 4], al
    mov eax, esi
    push edi
    lea edx, [eax + 1]
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L0
    sub eax, edx
    mov edi, eax
    je L1
    push 1
    mov eax, 5
    call sub_1000d229
    mov dword ptr [ebx], eax
    add esp, 4
    lea eax, [edi + esi + 1]
    pop edi
    pop esi
    pop ecx
    ret
    lea eax, [edi + esi + 1]
    pop edi
    mov dword ptr [ebx], 0
    pop esi
    pop ecx
    ret
FUN_10015090 ENDP
END