.686
.MODEL FLAT, C
EXTRN sub_1008B0EC:PROC
.CODE
FUN_100c445e PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 16]
    mov edx, dword ptr [ebp + 12]
    mov dword ptr [eax], 1
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + 12]
    mov dword ptr [edx], eax
    cmp eax, dword ptr [ecx + 40]
    jb L0
    mov eax, dword ptr [ecx + 000000100h]
    push 010119EA8h
    push 00000119Ah
    push dword ptr [eax + 60]
    push ecx
    call sub_1008B0EC
    add esp, 16
    mov eax, 080004005h
    jmp L1
L0:
    xor eax, eax
L1:
    pop ebp
    ret 12
FUN_100c445e ENDP
END
