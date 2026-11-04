.686
.MODEL FLAT, C
EXTRN sub_100386BB:PROC
EXTRN sub_100386CC:PROC
EXTRN sub_100F6CA3:PROC
EXTRN sub_100F6D5F:PROC
EXTRN g_101CE6B8:DWORD
EXTRN g_101CE764:DWORD
EXTRN g_101CE7EC:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_1072DEBD:DWORD
EXTRN g_10764584:DWORD
.CODE
FUN_10038610 PROC
    mov al, byte ptr [g_1072DEBD]
    test al, al
    jne L0
    mov eax, dword ptr [g_101CE764]
    mov ecx, dword ptr [esi + 8]
    cmp ecx, dword ptr [eax + 8]
    jl sub_100386BB
    mov edx, dword ptr [g_101CE6B8]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L0
    cmp ecx, eax
    jg sub_100386CC
    jmp L0
    lea esp, [esp]
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
    push 010198E68h
    push 010193358h
    push eax
    call sub_100F6D5F
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100F6CA3
    add esp, 16
L1:
    mov ecx, dword ptr [esi + 8]
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    push ecx
    mov ecx, dword ptr [esi + 16]
    push ecx
    mov ecx, dword ptr [esi + 4]
    push ecx
    mov ecx, dword ptr [esi]
    push ecx
    mov ecx, dword ptr [esi + 12]
    push ecx
    push 4
    push eax
    call dword ptr [edx + 0x148]
FUN_10038610 ENDP
END
