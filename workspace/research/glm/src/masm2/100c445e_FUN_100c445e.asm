.686
.MODEL FLAT, C
EXTRN sub_1008B0EC:PROC
EXTRN sub_100C44BD:PROC
EXTRN sub_100C44E2:PROC
.CODE
FUN_100c445e PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    mov mov eax, dword ptr [ebp + 16]
    mov mov edx, dword ptr [ebp + 12]
    mov mov dword ptr [eax], 1
    mov mov eax, dword ptr [ebp + 8]
    mov mov eax, dword ptr [eax + 12]
    mov mov dword ptr [edx], eax
    cmp cmp eax, dword ptr [ecx + 40]
    jb sub_100C44BD
    mov mov eax, dword ptr [ecx + 0100h]
    push push 010119EA8h
    push push 0119Ah
    push push dword ptr [eax + 60]
    push push ecx
    call sub_1008B0EC
    add add esp, 16
    mov mov eax, 080004005h
    jmp sub_100C44E2
    xor xor eax, eax
    pop pop ebp
    ret ret 12
FUN_100c445e ENDP
END
