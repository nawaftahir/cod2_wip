.686
.MODEL FLAT, C
EXTRN sub_1000CC2F:PROC
EXTRN sub_1000CC69:PROC
EXTRN sub_1000CCA1:PROC
EXTRN sub_1000CCD9:PROC
EXTRN sub_1000CD07:PROC
EXTRN sub_1000CD33:PROC
EXTRN sub_1000CD60:PROC
EXTRN sub_1000CD8F:PROC
EXTRN sub_1000CDBF:PROC
EXTRN sub_1000CDF2:PROC
EXTRN sub_1000FDB5:PROC
EXTRN sub_1000FFBB:PROC
EXTRN sub_10010124:PROC
EXTRN sub_1001015C:PROC
EXTRN sub_10010194:PROC
EXTRN sub_100107DA:PROC
EXTRN sub_1001080A:PROC
EXTRN sub_10010AED:PROC
EXTRN sub_10010B49:PROC
EXTRN sub_10010BA8:PROC
EXTRN sub_10010C0B:PROC
EXTRN sub_10010C6B:PROC
EXTRN sub_10020B71:PROC
EXTRN sub_10061E7E:PROC
.CODE
FUN_100108a0 PROC
    push push ebp
    push push esi
    push push edi
    mov mov edi, 010193508h
    mov mov esi, eax
    mov mov ecx, 7
    xor xor ebp, ebp
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L0
    push push edx
    push push ebx
    push push 1
    push push eax
    call sub_1000CC2F
    mov mov esi, eax
    push push 0FFh
    push push esi
    or or al, 0FFh
    or or cl, 0FFh
    or or dl, 0FFh
    call sub_10010124
    add add esp, 24
    mov mov eax, esi
    pop pop edi
    pop pop esi
    pop pop ebp
    ret ret
    mov mov edi, 010193500h
    mov mov esi, eax
    mov mov ecx, 7
    xor xor ebp, ebp
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L1
    push push edx
    push push ebx
    push push 1
    push push eax
    call sub_1000CC69
    mov mov esi, eax
    push push 0FFh
    push push esi
    xor xor al, al
    xor xor cl, cl
    xor xor dl, dl
    call sub_1001015C
    add add esp, 24
    mov mov eax, esi
    pop pop edi
    pop pop esi
    pop pop ebp
    ret ret
    mov mov edi, 0101934E0h
    mov mov esi, eax
    mov mov ecx, 19
    xor xor ebp, ebp
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L3
    push push edx
    push push ebx
    push push 1
    push push eax
    call sub_1000CCA1
    mov mov esi, eax
    mov mov cl, 080h
    push push 080h
    push push esi
    or or al, 0FFh
    mov mov dl, cl
    call sub_10010194
    add add esp, 24
    mov mov eax, esi
    pop pop edi
    pop pop esi
    pop pop ebp
    ret ret
    mov mov edi, 0101934D0h
    mov mov esi, eax
    mov mov ecx, 13
    xor xor ebp, ebp
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L5
    push push edx
    push push ebx
    push push 1
    push push eax
L1:
    call sub_1000CCD9
    mov mov esi, eax
    add add esp, 16
    mov mov ecx, esi
    call sub_1000FDB5
    mov mov eax, esi
    pop pop edi
    pop pop esi
    pop pop ebp
    ret ret
    mov mov edi, 0101938B8h
    mov mov esi, eax
    mov mov ecx, 9
    xor xor ebp, ebp
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L6
    push push edx
    push push ebx
    push push 1
    push push eax
    call sub_1000CD07
    add add esp, 16
L2:
    mov mov esi, eax
    call sub_10020B71
    mov mov eax, esi
    pop pop edi
    pop pop esi
    pop pop ebp
    ret ret
    mov mov edi, 010193494h
    mov mov esi, eax
    mov mov ecx, 17
    xor xor ebp, ebp
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10010AED
    push push edx
    push push ebx
    push push 1
    push push eax
    call sub_1000CD33
    mov mov esi, eax
    push push esi
    call sub_1000FFBB
    add add esp, 20
    mov mov eax, esi
    pop pop edi
    pop pop esi
    pop pop ebp
    ret ret
L3:
    mov mov edi, 0101934BCh
    mov mov esi, eax
    mov mov ecx, 19
    xor xor ebp, ebp
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10010B49
    push push edx
    push push ebx
    push push 1
    push push eax
    call sub_1000CD60
    mov mov esi, eax
    push push ebp
    mov mov edx, esi
    call sub_100107DA
    add add esp, 20
    mov mov eax, esi
    pop pop edi
    pop pop esi
    pop pop ebp
    ret ret
    mov mov edi, 0101934A8h
    mov mov esi, eax
    mov mov ecx, 19
    xor xor ebp, ebp
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10010BA8
    push push edx
    push push ebx
    push push 1
    push push eax
    call sub_1000CD8F
    mov mov esi, eax
    push push 1
    mov mov edx, esi
    call sub_1001080A
    add add esp, 20
    mov mov eax, esi
    pop pop edi
    pop pop esi
    pop pop ebp
    ret ret
    mov mov edi, 0101934F4h
    mov mov esi, eax
L5:
    mov mov ecx, 12
    xor xor ebp, ebp
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10010C0B
    push push edx
    push push ebx
    push push 1
    push push eax
    call sub_1000CDBF
    mov mov esi, eax
    push push 51
    push push esi
    mov mov dl, 77
    mov mov cl, 64
    call L4
    add add esp, 24
    mov mov eax, esi
    pop pop edi
    pop pop esi
    pop pop ebp
    ret ret
    mov mov edi, 0101825B4h
    mov mov esi, eax
    mov mov ecx, 14
    xor xor ebp, ebp
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10010C6B
    push push edx
    push push ebx
    push push 1
    push push eax
    call sub_1000CDF2
    mov mov esi, eax
    push push esi
    call L2
    add add esp, 20
    mov mov eax, esi
    pop pop edi
    pop pop esi
    pop pop ebp
    ret ret
    push push eax
L6:
    push push 010193894h
    call sub_10061E7E
    add add esp, 8
    pop pop edi
    pop pop esi
    xor xor eax, eax
    pop pop ebp
    ret ret
FUN_100108a0 ENDP
END
