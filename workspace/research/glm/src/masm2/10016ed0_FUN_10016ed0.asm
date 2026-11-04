.686
.MODEL FLAT, C
EXTRN sub_1001390F:PROC
EXTRN sub_10016F64:PROC
EXTRN EXTRN g_101D0B00:DWORD:DWORD
EXTRN EXTRN g_101D0B04:DWORD:DWORD
.CODE
FUN_10016ed0 PROC
    mov mov dword ptr [g_101D0B00], 1
    mov mov word ptr [eax + 8], cx
    mov mov dx, word ptr [g_101D0B04]
    mov mov word ptr [eax + 10], dx
    mov mov edx, dword ptr [g_101D0B04]
    movzx movzx ecx, cx
    mov mov dword ptr [edx*4 + 0101D0B08h], eax
    mov mov dword ptr [ecx*4 + 0101D4D28h], eax
    mov mov eax, dword ptr [g_101D0B04]
    inc inc eax
    cmp cmp eax, 0400h
    mov mov dword ptr [g_101D0B04], eax
    jne sub_10016F64
    push push eax
    push push 0101943DCh
    push push 0
    call sub_1001390F
    add add esp, 12
    ret ret
FUN_10016ed0 ENDP
END
