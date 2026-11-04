.686
.MODEL FLAT, C
.CODE
FUN_1004d520 PROC
    push push esi
    mov mov esi, dword ptr [esp + 8]
    mov mov eax, dword ptr [esi + 0198h]
    mov mov dword ptr [eax], 01004D460h
    mov mov byte ptr [eax + 16], 0
    mov mov byte ptr [eax + 17], 0
    mov mov byte ptr [eax + 20], 1
    mov mov eax, dword ptr [esi]
    push push esi
    call call dword ptr [eax + 16]
    mov mov ecx, dword ptr [esi + 019Ch]
    push push esi
    call call dword ptr [ecx]
    add add esp, 8
    mov mov dword ptr [esi + 094h], 0
    pop pop esi
    ret ret
FUN_1004d520 ENDP
END
