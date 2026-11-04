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
EXTRN sub_1001099A:PROC
EXTRN sub_10010A0D:PROC
EXTRN sub_10020B71:PROC
EXTRN sub_10061E7E:PROC
.CODE
FUN_100108a0 PROC
    push ebp
    push esi
    push edi
    mov edi, 010193508h
    mov esi, eax
    mov ecx, 7
    xor ebp, ebp
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L0
    push edx
    push ebx
    push 1
    push eax
    call sub_1000CC2F
    mov esi, eax
    push 0000000FFh
    push esi
    or al, 0000000FFh
    or cl, 0000000FFh
    or dl, 0000000FFh
    call sub_10010124
    add esp, 24
    mov eax, esi
    pop edi
    pop esi
    pop ebp
    ret
L0:
    mov edi, 010193500h
    mov esi, eax
    mov ecx, 7
    xor ebp, ebp
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L1
    push edx
    push ebx
    push 1
    push eax
    call sub_1000CC69
    mov esi, eax
    push 0000000FFh
    push esi
    xor al, al
    xor cl, cl
    xor dl, dl
    call sub_1001015C
    add esp, 24
    mov eax, esi
    pop edi
    pop esi
    pop ebp
    ret
L1:
    mov edi, 0101934E0h
    mov esi, eax
    mov ecx, 19
    xor ebp, ebp
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L2
    push edx
    push ebx
    push 1
    push eax
    call sub_1000CCA1
    mov esi, eax
    mov cl, 000000080h
    push 000000080h
    push esi
    or al, 0000000FFh
    mov dl, cl
    call sub_10010194
    add esp, 24
    mov eax, esi
    pop edi
    pop esi
    pop ebp
    ret
L2:
    mov edi, 0101934D0h
    mov esi, eax
    mov ecx, 13
    xor ebp, ebp
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L3
    push edx
    push ebx
    push 1
    push eax
    call sub_1000CCD9
    mov esi, eax
    add esp, 16
    mov ecx, esi
    call sub_1000FDB5
    mov eax, esi
    pop edi
    pop esi
    pop ebp
    ret
L3:
    mov edi, 0101938B8h
    mov esi, eax
    mov ecx, 9
    xor ebp, ebp
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L4
    push edx
    push ebx
    push 1
    push eax
    call sub_1000CD07
    add esp, 16
    mov esi, eax
    call sub_10020B71
    mov eax, esi
    pop edi
    pop esi
    pop ebp
    ret
L4:
    mov edi, 010193494h
    mov esi, eax
    mov ecx, 17
    xor ebp, ebp
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L5
    push edx
    push ebx
    push 1
    push eax
    call sub_1000CD33
    mov esi, eax
    push esi
    call sub_1000FFBB
    add esp, 20
    mov eax, esi
    pop edi
    pop esi
    pop ebp
    ret
L5:
    mov edi, 0101934BCh
    mov esi, eax
    mov ecx, 19
    xor ebp, ebp
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L6
    push edx
    push ebx
    push 1
    push eax
    call sub_1000CD60
    mov esi, eax
    push ebp
    mov edx, esi
    call sub_100107DA
    add esp, 20
    mov eax, esi
    pop edi
    pop esi
    pop ebp
    ret
L6:
    mov edi, 0101934A8h
    mov esi, eax
    mov ecx, 19
    xor ebp, ebp
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L7
    push edx
    push ebx
    push 1
    push eax
    call sub_1000CD8F
    mov esi, eax
    push 1
    mov edx, esi
    call sub_1001080A
    add esp, 20
    mov eax, esi
    pop edi
    pop esi
    pop ebp
    ret
L7:
    mov edi, 0101934F4h
    mov esi, eax
    mov ecx, 12
    xor ebp, ebp
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L8
    push edx
    push ebx
    push 1
    push eax
    call sub_1000CDBF
    mov esi, eax
    push 51
    push esi
    mov dl, 77
    mov cl, 64
    call sub_10010A0D
    add esp, 24
    mov eax, esi
    pop edi
    pop esi
    pop ebp
    ret
L8:
    mov edi, 0101825B4h
    mov esi, eax
    mov ecx, 14
    xor ebp, ebp
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L9
    push edx
    push ebx
    push 1
    push eax
    call sub_1000CDF2
    mov esi, eax
    push esi
    call sub_1001099A
    add esp, 20
    mov eax, esi
    pop edi
    pop esi
    pop ebp
    ret
L9:
    push eax
    push 010193894h
    call sub_10061E7E
    add esp, 8
    pop edi
    pop esi
    xor eax, eax
    pop ebp
    ret
FUN_100108a0 ENDP
END
