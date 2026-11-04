.686
.MODEL FLAT, C
EXTRN sub_100F6237:PROC
EXTRN sub_100F623F:PROC
EXTRN sub_100F624C:PROC
EXTRN sub_100FA36E:PROC
EXTRN sub_100FA513:PROC
.CODE
__vsnprintf PROC
    push push ebp
    mov mov ebp, esp
    sub sub esp, 32
    mov mov eax, dword ptr [ebp + 12]
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    push push edi
    push push dword ptr [ebp + 20]
    mov mov dword ptr [ebp - 28], eax
    push push dword ptr [ebp + 16]
    lea lea eax, [ebp - 32]
    push push eax
    mov mov dword ptr [ebp - 20], 66
    mov mov dword ptr [ebp - 24], esi
    mov mov dword ptr [ebp - 32], esi
    call sub_100FA513
    add add esp, 12
    test test esi, esi
    mov mov edi, eax
    je sub_100F623F
    dec dec dword ptr [ebp - 28]
    js sub_100F6237
    mov mov eax, dword ptr [ebp - 32]
    mov mov byte ptr [eax], 0
    jmp sub_100F624C
    lea lea eax, [ebp - 32]
    push push eax
    push push 0
    call sub_100FA36E
    pop pop ecx
    pop pop ecx
    mov mov eax, edi
    pop pop edi
    pop pop esi
    leave leave
    ret ret
__vsnprintf ENDP
END
