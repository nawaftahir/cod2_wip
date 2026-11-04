.686
.MODEL FLAT, C
EXTRN sub_100165F0:PROC
.CODE
FUN_100174c0 PROC
    push ecx
    push ebx
    push ebp
    push esi
    push edi
    mov ebp, 0101D7FCCh
    mov dword ptr [esp + 16], 32
L0:
    cmp dword ptr [ebp], 0
    je L2
    lea ebx, [ebp + 8]
    mov esi, 01018EAC8h
    mov edi, ebx
L1:
    mov eax, dword ptr [ebx - 4]
    mov ecx, dword ptr [ebp]
    push esi
    push eax
    push ecx
    call sub_100165F0
    mov dword ptr [edi], eax
    add esi, 21
    add esp, 12
    add edi, 4
    cmp esi, 01018EB1Ch
    jl L1
L2:
    mov eax, dword ptr [esp + 16]
    add ebp, 24
    dec eax
    mov dword ptr [esp + 16], eax
    jne L0
    pop edi
    pop esi
    pop ebp
    pop ebx
    pop ecx
    ret
FUN_100174c0 ENDP
END
