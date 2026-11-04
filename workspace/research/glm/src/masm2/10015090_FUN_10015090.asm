.686
.MODEL FLAT, C
EXTRN sub_1000D229:PROC
EXTRN sub_100150E3:PROC
.CODE
FUN_10015090 PROC
    push push ecx
    push push esi
    mov mov esi, eax
    mov mov al, byte ptr [esi]
    inc inc esi
    mov mov byte ptr [ebx + 4], al
    mov mov eax, esi
    push push edi
    lea lea edx, [eax + 1]
    mov mov cl, byte ptr [eax]
    inc inc eax
    test test cl, cl
    jne L0
    sub sub eax, edx
    mov mov edi, eax
    je sub_100150E3
    push push 1
    mov mov eax, 5
    call sub_1000D229
    mov mov dword ptr [ebx], eax
    add add esp, 4
    lea lea eax, [edi + esi + 1]
    pop pop edi
    pop pop esi
    pop pop ecx
    ret ret
    lea lea eax, [edi + esi + 1]
    pop pop edi
    mov mov dword ptr [ebx], 0
    pop pop esi
    pop pop ecx
    ret ret
FUN_10015090 ENDP
END
