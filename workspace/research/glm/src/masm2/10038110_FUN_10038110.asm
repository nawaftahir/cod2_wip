.686
.MODEL FLAT, C
EXTRN sub_10037C38:PROC
EXTRN sub_10037CBE:PROC
EXTRN sub_10037CD9:PROC
.CODE
FUN_10038110 PROC
    sub sub esp, 56
    push push ebp
    mov mov ebp, dword ptr [esp + 64]
    push push esi
    push push edi
    push push 0101984ECh
    push push 0101983F4h
    mov mov edi, 4
    push push 0101983D8h
    mov mov eax, 1
    mov mov ecx, ebx
    mov mov edx, ebp
    mov mov dword ptr [esp + 48], 2
    mov mov dword ptr [esp + 52], 0101984ECh
    mov mov dword ptr [esp + 56], edi
    mov mov dword ptr [esp + 60], 010195D3Ch
    mov mov dword ptr [esp + 64], 8
    mov mov dword ptr [esp + 68], 010195D34h
    mov mov dword ptr [esp + 72], 12
    mov mov dword ptr [esp + 76], 010195E28h
    mov mov dword ptr [esp + 24], 0
    mov mov dword ptr [esp + 28], 010195D28h
    mov mov dword ptr [esp + 32], 16
    mov mov dword ptr [esp + 36], 010195D24h
    mov mov dword ptr [esp + 40], 32
    mov mov dword ptr [esp + 44], 010195D20h
    call sub_10037C38
    push push ebp
    push push 0101983CCh
    lea lea esi, [esp + 56]
    mov mov eax, 14
    mov mov edx, ebx
    call sub_10037CBE
    push push ebp
    push push 0101983BCh
    mov mov edi, 3
    lea lea esi, [esp + 40]
    mov mov eax, 48
    mov mov edx, ebx
    call sub_10037CD9
    add add esp, 28
    pop pop edi
    pop pop esi
    pop pop ebp
    add add esp, 56
    ret ret
FUN_10038110 ENDP
END
