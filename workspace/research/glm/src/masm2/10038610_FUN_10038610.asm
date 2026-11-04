.686
.MODEL FLAT, C
EXTRN sub_100386B5:PROC
EXTRN sub_100386BB:PROC
EXTRN sub_100386C3:PROC
EXTRN sub_100386CC:PROC
EXTRN sub_100F6CA3:PROC
EXTRN sub_100F6D5F:PROC
EXTRN EXTRN g_101CE6B8:DWORD:DWORD
EXTRN EXTRN g_101CE764:DWORD:DWORD
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_1072DEBD:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
.CODE
FUN_10038610 PROC
    mov mov al, byte ptr [g_1072DEBD]
    test test al, al
    jne L0
    mov mov eax, dword ptr [g_101CE764]
    mov mov ecx, dword ptr [esi + 8]
    cmp cmp ecx, dword ptr [eax + 8]
    jl sub_100386BB
    mov mov edx, dword ptr [g_101CE6B8]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je L1
    cmp cmp ecx, eax
    jg sub_100386CC
    jmp L2
    lea lea esp, [esp]
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je sub_100386B5
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_100386C3
    push push 010198E68h
    push push 010193358h
    push push eax
    call sub_100F6D5F
    mov mov ecx, dword ptr [g_10764584]
    push push ecx
    call sub_100F6CA3
    add add esp, 16
    mov mov ecx, dword ptr [esi + 8]
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [eax]
    push push ecx
    mov mov ecx, dword ptr [esi + 16]
    push push ecx
    mov mov ecx, dword ptr [esi + 4]
    push push ecx
    mov mov ecx, dword ptr [esi]
    push push ecx
    mov mov ecx, dword ptr [esi + 12]
    push push ecx
    push push 4
    push push eax
    call call dword ptr [edx + 0148h]
FUN_10038610 ENDP
END
