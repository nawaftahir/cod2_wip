.686
.MODEL FLAT, C
EXTRN sub_100F9436:PROC
EXTRN sub_100F944E:PROC
EXTRN sub_100F946D:PROC
EXTRN sub_100F9482:PROC
EXTRN sub_100FA36E:PROC
EXTRN sub_100FA388:PROC
EXTRN sub_1010555A:PROC
.CODE
FID_conflict:vswprintf PROC
    push push ebp
    mov mov ebp, esp
    sub sub esp, 32
    mov mov eax, dword ptr [ebp + 8]
    mov mov dword ptr [ebp - 24], eax
    mov mov dword ptr [ebp - 32], eax
    mov mov eax, dword ptr [ebp + 12]
    push push esi
    push push dword ptr [ebp + 20]
    add add eax, eax
    push push dword ptr [ebp + 16]
    mov mov dword ptr [ebp - 28], eax
    lea lea eax, [ebp - 32]
    push push eax
    mov mov dword ptr [ebp - 20], 66
    call sub_1010555A
    add add esp, 12
    dec dec dword ptr [ebp - 28]
    mov mov esi, eax
    js sub_100F9436
    mov mov eax, dword ptr [ebp - 32]
    mov mov byte ptr [eax], 0
    inc inc dword ptr [ebp - 32]
    jmp sub_100F944E
    lea lea eax, [ebp - 32]
    push push eax
    push push 0
    call sub_100FA36E
    pop pop ecx
    pop pop ecx
    dec dec dword ptr [ebp - 28]
    js sub_100F946D
    mov mov eax, dword ptr [ebp - 32]
    mov mov byte ptr [eax], 0
    jmp sub_100F9482
    lea lea eax, [ebp - 32]
    push push eax
    push push 0
    call sub_100FA388
    pop pop ecx
    pop pop ecx
    mov mov eax, esi
    pop pop esi
    leave leave
    ret ret
FID_conflict:vswprintf ENDP
END
