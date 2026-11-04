.686
.MODEL FLAT, C
EXTRN sub_100FA36E:PROC
EXTRN sub_100FA388:PROC
EXTRN sub_1010555A:PROC
.CODE
FID_conflict:vswprintf PROC
    push ebp
    mov ebp, esp
    sub esp, 32
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [ebp - 24], eax
    mov dword ptr [ebp - 32], eax
    mov eax, dword ptr [ebp + 12]
    push esi
    push dword ptr [ebp + 20]
    add eax, eax
    push dword ptr [ebp + 16]
    mov dword ptr [ebp - 28], eax
    lea eax, [ebp - 32]
    push eax
    mov dword ptr [ebp - 20], 66
    call sub_1010555A
    add esp, 12
    dec dword ptr [ebp - 28]
    mov esi, eax
    js L0
    mov eax, dword ptr [ebp - 32]
    mov byte ptr [eax], 0
    inc dword ptr [ebp - 32]
    jmp L1
L0:
    lea eax, [ebp - 32]
    push eax
    push 0
    call sub_100FA36E
    pop ecx
    pop ecx
L1:
    dec dword ptr [ebp - 28]
    js L2
    mov eax, dword ptr [ebp - 32]
    mov byte ptr [eax], 0
    jmp L3
L2:
    lea eax, [ebp - 32]
    push eax
    push 0
    call sub_100FA388
    pop ecx
    pop ecx
L3:
    mov eax, esi
    pop esi
    leave
    ret
FID_conflict:vswprintf ENDP
END
