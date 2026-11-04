.686
.MODEL FLAT, C
EXTRN sub_100138E4:PROC
EXTRN sub_10016C4A:PROC
EXTRN EXTRN g_101DA560:DWORD:DWORD
.CODE
FUN_10016cf0 PROC
    push push ecx
    mov mov eax, dword ptr [g_101DA560]
    inc inc eax
    cmp cmp eax, 0100h
    mov mov dword ptr [g_101DA560], eax
    jne L0
    push push 0FFh
    push push 010194458h
    push push 1
    call sub_100138E4
    add add esp, 12
    mov mov ecx, dword ptr [esp + 12]
    mov mov edx, dword ptr [esp + 8]
    lea lea eax, [esp]
    push push eax
    push push ecx
    push push edx
    call sub_10016C4A
L0:
    mov mov eax, dword ptr [esp + 12]
    mov mov ecx, dword ptr [esp + 28]
    mov mov dword ptr [eax*4 + 0101DA564h], ecx
    add add esp, 16
    ret ret
FUN_10016cf0 ENDP
END
