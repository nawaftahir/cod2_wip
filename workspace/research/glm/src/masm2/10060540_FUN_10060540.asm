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
    push push ebx
    mov mov ebx, dword ptr [esp + 8]
    push push ebp
    push push esi
    mov mov esi, dword ptr [esp + 20]
    mov mov eax, ebx
    mov mov ecx, esi
    shrd shrd eax, ecx, 8
    movzx movzx eax, al
    cdq cdq
    push push edi
    mov mov edi, eax
    movzx movzx eax, bl
    push push 0
    mov mov ebp, edx
    cdq cdq
    push push 0100h
    push push edx
    push push eax
    shr shr ecx, 8
    call sub_100FD5E1
    push push 0
    add add edi, eax
    push push 0100h
    adc adc ebp, edx
    push push ebp
    push push edi
    call sub_100FD5F3
    mov mov ecx, eax
    mov mov edi, edx
    mov mov edx, ebx
    mov mov eax, esi
    shrd shrd edx, eax, 16
    shr shr eax, 16
    movzx movzx eax, dl
    cdq cdq
    push push 0
    add add ecx, eax
    push push 0100h
    adc adc edi, edx
    push push edi
    push push ecx
    call sub_100FD618
    mov mov edi, edx
    mov mov edx, esi
    shrd shrd ebx, edx, 24
    mov mov ecx, eax
    movzx movzx eax, bl
    shr shr edx, 24
    cdq cdq
    push push 0
    add add ecx, eax
    push push 0100h
    adc adc edi, edx
    push push edi
    push push ecx
    call sub_100FD63B
    mov mov ecx, eax
    movzx movzx eax, byte ptr [esp + 24]
    mov mov edi, edx
    cdq cdq
    push push 0
    add add ecx, eax
    push push 0100h
    adc adc edi, edx
    push push edi
    push push ecx
    call sub_100FD657
    mov mov edi, edx
    mov mov ecx, eax
    mov mov edx, esi
    shr shr edx, 8
    movzx movzx eax, dl
    cdq cdq
    push push 0
    add add ecx, eax
    push push 0100h
    adc adc edi, edx
    push push edi
    push push ecx
    call sub_100FD676
    mov mov edi, edx
    mov mov ecx, eax
    mov mov edx, esi
    shr shr edx, 16
    movzx movzx eax, dl
    cdq cdq
    push push 0
    add add ecx, eax
    push push 0100h
    adc adc edi, edx
    push push edi
    push push ecx
    call sub_100FD695
    mov mov edi, edx
    mov mov edx, esi
    shr shr edx, 24
    mov mov ecx, eax
    movzx movzx eax, dl
    cdq cdq
    add add ecx, eax
    adc adc edi, edx
    mov mov edx, edi
    pop pop edi
    pop pop esi
    pop pop ebp
    mov mov eax, ecx
    pop pop ebx
    ret ret
FUN_10060540 ENDP
END
