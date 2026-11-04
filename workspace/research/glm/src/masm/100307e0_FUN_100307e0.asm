.686
.MODEL FLAT, C
EXTRN g_101D1BF8:DWORD
EXTRN g_101D4934:DWORD
.CODE
FUN_100307e0 PROC
    sub esp, 000000600h
    push esi
    lea edx, [esp + 000000204h]
    lea esi, [esp + 000000404h]
    push edi
    sub edx, eax
    sub esi, eax
    mov edi, 000000100h
    nop
L0:
    mov cx, word ptr [eax]
    mov word ptr [edx + eax - 000000200h], cx
    mov word ptr [edx + eax], cx
    mov word ptr [esi + eax], cx
    add eax, 2
    dec edi
    jne L0
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    lea edx, [esp + 8]
    push edx
    mov edx, dword ptr [g_101D4934]
    push 0
    push edx
    push eax
    call dword ptr [ecx + 0x54]
    pop edi
    pop esi
    add esp, 000000600h
    ret
FUN_100307e0 ENDP
END
