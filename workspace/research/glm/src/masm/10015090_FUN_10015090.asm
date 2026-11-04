.686
.MODEL FLAT, C
EXTRN sub_1000D229:PROC
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
L0:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L0
    sub eax, edx
    mov edi, eax
    je L1
    push 1
    mov eax, 5
    call sub_1000D229
    mov dword ptr [ebx], eax
    add esp, 4
    lea eax, [edi + esi + 1]
    pop edi
    pop esi
    pop ecx
    ret
L1:
    lea eax, [edi + esi + 1]
    pop edi
    mov dword ptr [ebx], 0
    pop esi
    pop ecx
    ret
FUN_10015090 ENDP
END
