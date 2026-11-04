.686
.MODEL FLAT, C
EXTRN sub_100F5F96:PROC
EXTRN sub_100F5F9E:PROC
EXTRN sub_100F5FAB:PROC
EXTRN sub_100FA370:PROC
EXTRN sub_100FA515:PROC
.CODE
_sprintf PROC
    push push ebp
    mov mov ebp, esp
    sub sub esp, 32
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    push push edi
    lea lea eax, [ebp + 16]
    push push eax
    push push dword ptr [ebp + 12]
    lea lea eax, [ebp - 32]
    push push eax
    mov mov dword ptr [ebp - 28], 07FFFFFFFh
    mov mov dword ptr [ebp - 20], 66
    mov mov dword ptr [ebp - 24], esi
    mov mov dword ptr [ebp - 32], esi
    call sub_100FA515
    add add esp, 12
    test test esi, esi
    mov mov edi, eax
    je sub_100F5F9E
    dec dec dword ptr [ebp - 28]
    js sub_100F5F96
    mov mov eax, dword ptr [ebp - 32]
    mov mov byte ptr [eax], 0
    jmp sub_100F5FAB
    lea lea eax, [ebp - 32]
    push push eax
    push push 0
    call sub_100FA370
    pop pop ecx
    pop pop ecx
    mov mov eax, edi
    pop pop edi
    pop pop esi
    leave leave
    ret ret
_sprintf ENDP
END
