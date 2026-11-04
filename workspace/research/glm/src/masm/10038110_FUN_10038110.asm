.686
.MODEL FLAT, C
EXTRN sub_10037C38:PROC
EXTRN sub_10037CBE:PROC
EXTRN sub_10037CD9:PROC
.CODE
FUN_10038110 PROC
    sub esp, 56
    push ebp
    mov ebp, dword ptr [esp + 64]
    push esi
    push edi
    push 0101984ECh
    push 0101983F4h
    mov edi, 4
    push 0101983D8h
    mov eax, 1
    mov ecx, ebx
    mov edx, ebp
    mov dword ptr [esp + 48], 2
    mov dword ptr [esp + 52], 0101984ECh
    mov dword ptr [esp + 56], edi
    mov dword ptr [esp + 60], 010195D3Ch
    mov dword ptr [esp + 64], 8
    mov dword ptr [esp + 68], 010195D34h
    mov dword ptr [esp + 72], 12
    mov dword ptr [esp + 76], 010195E28h
    mov dword ptr [esp + 24], 0
    mov dword ptr [esp + 28], 010195D28h
    mov dword ptr [esp + 32], 16
    mov dword ptr [esp + 36], 010195D24h
    mov dword ptr [esp + 40], 32
    mov dword ptr [esp + 44], 010195D20h
    call sub_10037C38
    push ebp
    push 0101983CCh
    lea esi, [esp + 56]
    mov eax, 14
    mov edx, ebx
    call sub_10037CBE
    push ebp
    push 0101983BCh
    mov edi, 3
    lea esi, [esp + 40]
    mov eax, 48
    mov edx, ebx
    call sub_10037CD9
    add esp, 28
    pop edi
    pop esi
    pop ebp
    add esp, 56
    ret
FUN_10038110 ENDP
END
