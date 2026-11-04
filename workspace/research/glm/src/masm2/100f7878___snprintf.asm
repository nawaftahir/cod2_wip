.686
.MODEL FLAT, C
EXTRN sub_100F78F8:PROC
EXTRN sub_100F7900:PROC
EXTRN sub_100F790D:PROC
EXTRN sub_100FA36F:PROC
EXTRN sub_100FA514:PROC
.CODE
__snprintf PROC
    push push ebp
    mov mov ebp, esp
    sub sub esp, 32
    mov mov eax, dword ptr [ebp + 12]
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    mov mov dword ptr [ebp - 28], eax
    push push edi
    lea lea eax, [ebp + 20]
    push push eax
    push push dword ptr [ebp + 16]
    lea lea eax, [ebp - 32]
    push push eax
    mov mov dword ptr [ebp - 20], 66
    mov mov dword ptr [ebp - 24], esi
    mov mov dword ptr [ebp - 32], esi
    call sub_100FA514
    add add esp, 12
    test test esi, esi
    mov mov edi, eax
    je sub_100F7900
    dec dec dword ptr [ebp - 28]
    js sub_100F78F8
    mov mov eax, dword ptr [ebp - 32]
    mov mov byte ptr [eax], 0
    jmp sub_100F790D
    lea lea eax, [ebp - 32]
    push push eax
    push push 0
    call sub_100FA36F
    pop pop ecx
    pop pop ecx
    mov mov eax, edi
    pop pop edi
    pop pop esi
    leave leave
    ret ret
__snprintf ENDP
END
