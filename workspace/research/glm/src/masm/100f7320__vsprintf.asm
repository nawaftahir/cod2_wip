.686
.MODEL FLAT, C
EXTRN sub_100FA36F:PROC
EXTRN sub_100FA514:PROC
.CODE
_vsprintf PROC
    push ebp
    mov ebp, esp
    sub esp, 32
    push esi
    mov esi, dword ptr [ebp + 8]
    push edi
    push dword ptr [ebp + 16]
    lea eax, [ebp - 32]
    push dword ptr [ebp + 12]
    mov dword ptr [ebp - 28], 07FFFFFFFh
    push eax
    mov dword ptr [ebp - 20], 66
    mov dword ptr [ebp - 24], esi
    mov dword ptr [ebp - 32], esi
    call sub_100FA514
    add esp, 12
    test esi, esi
    mov edi, eax
    je L1
    dec dword ptr [ebp - 28]
    js L0
    mov eax, dword ptr [ebp - 32]
    mov byte ptr [eax], 0
    jmp L1
L0:
    lea eax, [ebp - 32]
    push eax
    push 0
    call sub_100FA36F
    pop ecx
    pop ecx
L1:
    mov eax, edi
    pop edi
    pop esi
    leave
    ret
_vsprintf ENDP
END
