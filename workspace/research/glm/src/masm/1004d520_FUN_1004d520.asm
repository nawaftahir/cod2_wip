.686
.MODEL FLAT, C
.CODE
FUN_1004d520 PROC
    push esi
    mov esi, dword ptr [esp + 8]
    mov eax, dword ptr [esi + 000000198h]
    mov dword ptr [eax], 01004D460h
    mov byte ptr [eax + 16], 0
    mov byte ptr [eax + 17], 0
    mov byte ptr [eax + 20], 1
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax + 0x10]
    mov ecx, dword ptr [esi + 00000019Ch]
    push esi
    call dword ptr [ecx]
    add esp, 8
    mov dword ptr [esi + 000000094h], 0
    pop esi
    ret
FUN_1004d520 ENDP
END
