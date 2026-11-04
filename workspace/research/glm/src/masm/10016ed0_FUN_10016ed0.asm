.686
.MODEL FLAT, C
EXTRN sub_1001390F:PROC
EXTRN g_101D0B00:DWORD
EXTRN g_101D0B04:DWORD
.CODE
FUN_10016ed0 PROC
    mov dword ptr [g_101D0B00], 1
    mov word ptr [eax + 8], cx
    mov dx, word ptr [g_101D0B04]
    mov word ptr [eax + 10], dx
    mov edx, dword ptr [g_101D0B04]
    movzx ecx, cx
    mov dword ptr [edx*4 + 0101D0B08h], eax
    mov dword ptr [ecx*4 + 0101D4D28h], eax
    mov eax, dword ptr [g_101D0B04]
    inc eax
    cmp eax, 000000400h
    mov dword ptr [g_101D0B04], eax
    jne L0
    push eax
    push 0101943DCh
    push 0
    call sub_1001390F
    add esp, 12
L0:
    ret
FUN_10016ed0 ENDP
END
