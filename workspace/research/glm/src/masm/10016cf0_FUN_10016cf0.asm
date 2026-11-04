.686
.MODEL FLAT, C
EXTRN sub_100138E4:PROC
EXTRN sub_10016C4A:PROC
EXTRN g_101DA560:DWORD
.CODE
FUN_10016cf0 PROC
    push ecx
    mov eax, dword ptr [g_101DA560]
    inc eax
    cmp eax, 000000100h
    mov dword ptr [g_101DA560], eax
    jne L0
    push 0000000FFh
    push 010194458h
    push 1
    call sub_100138E4
    add esp, 12
L0:
    mov ecx, dword ptr [esp + 12]
    mov edx, dword ptr [esp + 8]
    lea eax, [esp]
    push eax
    push ecx
    push edx
    call sub_10016C4A
    mov eax, dword ptr [esp + 12]
    mov ecx, dword ptr [esp + 28]
    mov dword ptr [eax*4 + 0101DA564h], ecx
    add esp, 16
    ret
FUN_10016cf0 ENDP
END
