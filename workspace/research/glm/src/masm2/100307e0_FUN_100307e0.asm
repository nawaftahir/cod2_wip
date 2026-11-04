.686
.MODEL FLAT, C
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_101D4934:DWORD:DWORD
.CODE
FUN_100307e0 PROC
    sub sub esp, 0600h
    push push esi
    lea lea edx, [esp + 0204h]
    lea lea esi, [esp + 0404h]
    push push edi
    sub sub edx, eax
    sub sub esi, eax
    mov mov edi, 0100h
    nop nop
    mov mov cx, word ptr [eax]
    mov mov word ptr [edx + eax - 0200h], cx
    mov mov word ptr [edx + eax], cx
    mov mov word ptr [esi + eax], cx
    add add eax, 2
    dec dec edi
    jne L0
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    lea lea edx, [esp + 8]
    push push edx
    mov mov edx, dword ptr [g_101D4934]
    push push 0
    push push edx
    push push eax
    call call dword ptr [ecx + 84]
    pop pop edi
    pop pop esi
    add add esp, 0600h
    ret ret
FUN_100307e0 ENDP
END
