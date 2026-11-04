.686
.MODEL FLAT, C
EXTRN sub_1002C969:PROC
EXTRN sub_10038914:PROC
EXTRN sub_10038922:PROC
EXTRN g_101CE700:DWORD
EXTRN g_101CE7A0:DWORD
EXTRN g_101CE7F0:DWORD
EXTRN g_101D1B10:DWORD
.CODE
FUN_10038920 PROC
    push ecx
    mov eax, dword ptr [edx]
    cmp dword ptr [eax], 3
    jne L0
    movzx ecx, byte ptr [edi + 5]
    cmp ecx, 5
    ja L0
    jmp dword ptr [ecx*4 + 0x10038984]
    mov eax, dword ptr [g_101CE7A0]
    mov ecx, esi
    call sub_10038914
    pop ecx
    ret
    mov eax, dword ptr [g_101CE700]
    mov ecx, esi
    call sub_10038922
    pop ecx
    ret
    mov eax, dword ptr [g_101CE7F0]
    cmp dword ptr [eax + 8], 1
    jne L0
    mov ecx, dword ptr [g_101D1B10]
    mov dword ptr [edx], ecx
    mov byte ptr [esi], 1
    pop ecx
    ret
    mov edx, dword ptr [edi + 8]
    mov ecx, dword ptr [edx + 28]
    push ecx
    push eax
    call sub_1002C969
    add esp, 8
    mov byte ptr [esi], 6
L0:
    pop ecx
    ret
FUN_10038920 ENDP
END
