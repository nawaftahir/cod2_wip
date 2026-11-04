.686
.MODEL FLAT, C
EXTRN sub_1000D4B8:PROC
EXTRN sub_100F6C83:PROC
EXTRN sub_100F6CE3:PROC
EXTRN sub_100F6D3F:PROC
EXTRN sub_100F6DA0:PROC
EXTRN g_101CE7EC:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_10764584:DWORD
EXTRN g_10766728:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_1002eaa0 PROC
    push esi
    mov esi, eax
    call sub_1000D4B8
    mov esi, eax
    lea ebx, [ebx]
L0:
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L1
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L1
    push 0101980C8h
    push 010193358h
    push eax
    call sub_100F6D3F
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100F6C83
    add esp, 16
L1:
    mov ecx, dword ptr [g_10766728]
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    push 2
    push 0
    push esi
    push 0
    push ecx
    push eax
    call dword ptr [edx + 0x88]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L0
    mov edi, edi
L2:
    mov edx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L3
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L3
    push 0101980ACh
    push 010193358h
    push eax
    call sub_100F6DA0
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6CE3
    add esp, 16
L3:
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx + 8]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L2
    pop esi
    ret
FUN_1002eaa0 ENDP
END
