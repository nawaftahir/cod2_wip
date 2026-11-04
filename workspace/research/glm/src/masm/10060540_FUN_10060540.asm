.686
.MODEL FLAT, C
EXTRN sub_100FD5E1:PROC
EXTRN sub_100FD5F3:PROC
EXTRN sub_100FD618:PROC
EXTRN sub_100FD63B:PROC
EXTRN sub_100FD657:PROC
EXTRN sub_100FD676:PROC
EXTRN sub_100FD695:PROC
.CODE
FUN_10060540 PROC
    push ebx
    mov ebx, dword ptr [esp + 8]
    push ebp
    push esi
    mov esi, dword ptr [esp + 20]
    mov eax, ebx
    mov ecx, esi
    shrd eax, ecx, 8
    movzx eax, al
    cdq
    push edi
    mov edi, eax
    movzx eax, bl
    push 0
    mov ebp, edx
    cdq
    push 000000100h
    push edx
    push eax
    shr ecx, 8
    call sub_100FD5E1
    push 0
    add edi, eax
    push 000000100h
    adc ebp, edx
    push ebp
    push edi
    call sub_100FD5F3
    mov ecx, eax
    mov edi, edx
    mov edx, ebx
    mov eax, esi
    shrd edx, eax, 16
    shr eax, 16
    movzx eax, dl
    cdq
    push 0
    add ecx, eax
    push 000000100h
    adc edi, edx
    push edi
    push ecx
    call sub_100FD618
    mov edi, edx
    mov edx, esi
    shrd ebx, edx, 24
    mov ecx, eax
    movzx eax, bl
    shr edx, 24
    cdq
    push 0
    add ecx, eax
    push 000000100h
    adc edi, edx
    push edi
    push ecx
    call sub_100FD63B
    mov ecx, eax
    movzx eax, byte ptr [esp + 24]
    mov edi, edx
    cdq
    push 0
    add ecx, eax
    push 000000100h
    adc edi, edx
    push edi
    push ecx
    call sub_100FD657
    mov edi, edx
    mov ecx, eax
    mov edx, esi
    shr edx, 8
    movzx eax, dl
    cdq
    push 0
    add ecx, eax
    push 000000100h
    adc edi, edx
    push edi
    push ecx
    call sub_100FD676
    mov edi, edx
    mov ecx, eax
    mov edx, esi
    shr edx, 16
    movzx eax, dl
    cdq
    push 0
    add ecx, eax
    push 000000100h
    adc edi, edx
    push edi
    push ecx
    call sub_100FD695
    mov edi, edx
    mov edx, esi
    shr edx, 24
    mov ecx, eax
    movzx eax, dl
    cdq
    add ecx, eax
    adc edi, edx
    mov edx, edi
    pop edi
    pop esi
    pop ebp
    mov eax, ecx
    pop ebx
    ret
FUN_10060540 ENDP
END
