.686
.MODEL FLAT, C
EXTRN sub_10064034:PROC
EXTRN sub_10064081:PROC
EXTRN sub_10064286:PROC
EXTRN sub_1006437C:PROC
EXTRN sub_100643DC:PROC
EXTRN sub_10064416:PROC
EXTRN sub_10064455:PROC
EXTRN sub_1006449F:PROC
EXTRN sub_10064515:PROC
EXTRN sub_100650AB:PROC
EXTRN sub_100650BC:PROC
EXTRN sub_10065152:PROC
EXTRN sub_10065227:PROC
EXTRN sub_10065348:PROC
EXTRN sub_10065362:PROC
EXTRN sub_10065394:PROC
EXTRN sub_100653EB:PROC
EXTRN sub_100654E1:PROC
EXTRN sub_1006618B:PROC
EXTRN sub_100678BB:PROC
EXTRN sub_10067E31:PROC
EXTRN sub_10067F96:PROC
EXTRN sub_10082BAC:PROC
EXTRN sub_10082D67:PROC
.CODE
FUN_100665f9 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 64
    push ebx
    push esi
    push edi
    mov esi, ecx
    xor ebx, ebx
    xor edi, edi
    cmp dword ptr [esi + 68], ebx
    jne L22
    mov ecx, dword ptr [ebp + 12]
    jmp L1
L0:
    mov eax, dword ptr [esi + 92]
    dec ecx
    cmp eax, ebx
    je L2
    mov edx, dword ptr [eax + 8]
    mov dword ptr [ebp + ecx*4 - 64], edx
    mov edx, dword ptr [eax + 12]
    mov dword ptr [esi + 92], edx
    mov dword ptr [eax + 8], ebx
    mov edx, dword ptr [esi + 96]
    mov dword ptr [eax + 12], edx
    mov dword ptr [esi + 96], eax
L1:
    cmp ecx, ebx
    ja L0
    mov eax, dword ptr [ebp + 8]
    cmp eax, 46
    ja L20
    jmp dword ptr [eax*4 + 0x1006695d]
L2:
    push 01010C97Ch
    jmp L26
    mov eax, dword ptr [ebp - 64]
    push 1
    push dword ptr [eax + 24]
    mov ecx, esi
    call sub_1006618B
    jmp L20
    mov eax, dword ptr [ebp - 64]
    push dword ptr [eax + 24]
    mov ecx, esi
    call sub_10065227
    jmp L20
    push ebx
L3:
    mov eax, dword ptr [ebp - 64]
    push dword ptr [eax + 24]
    mov ecx, esi
    call sub_10064034
    jmp L20
    mov eax, dword ptr [ebp - 60]
    push dword ptr [eax + 24]
    jmp L3
    mov ecx, esi
    call sub_10064081
    jmp L20
    mov ecx, esi
    call sub_10064286
    jmp L20
    mov eax, dword ptr [ebp - 64]
    push dword ptr [eax + 24]
L4:
    mov ecx, esi
    call sub_1006437C
    jmp L20
    mov eax, dword ptr [ebp - 64]
    push ebx
    push ebx
    push dword ptr [eax + 24]
    mov ecx, esi
    call sub_100650AB
    jmp L5
    mov eax, dword ptr [ebp - 64]
    push ebx
    push ebx
    push dword ptr [eax + 24]
    mov ecx, esi
    call sub_100650BC
    neg eax
    sbb eax, eax
    inc eax
L5:
    push eax
    jmp L4
    mov eax, dword ptr [ebp - 64]
    push dword ptr [eax + 24]
    mov ecx, esi
    call sub_10064416
    jmp L20
    mov ecx, esi
    call sub_1006449F
    jmp L20
    mov ecx, esi
    call sub_10064515
    jmp L20
    push 1
    mov ecx, esi
    call sub_100643DC
L6:
    mov ecx, dword ptr [esi + 00000026Ch]
    call sub_100678BB
    jmp L20
    push 1
    mov ecx, esi
    call sub_10064455
    jmp L6
    mov ecx, esi
    call sub_10065362
    jmp L20
    mov edi, dword ptr [ebp - 64]
    jmp L20
    mov edi, dword ptr [ebp - 64]
    push dword ptr [edi + 24]
    mov ecx, esi
    mov dword ptr [edi + 16], 2
    call sub_100654E1
    jmp L8
    mov edi, dword ptr [ebp - 64]
    push ebx
    push ebx
    push dword ptr [edi + 24]
    mov ecx, esi
    mov dword ptr [edi + 16], 2
    call sub_10065152
    mov dword ptr [edi + 24], eax
    mov dword ptr [esi + 88], 1
    jmp L9
    mov edi, dword ptr [ebp - 64]
    xor eax, eax
    cmp dword ptr [edi + 24], ebx
    sete al
L7:
    mov dword ptr [edi + 24], eax
    jmp L20
    mov edi, dword ptr [ebp - 64]
    neg dword ptr [edi + 24]
    jmp L20
    mov eax, dword ptr [ebp - 60]
    mov edi, dword ptr [ebp - 64]
    mov eax, dword ptr [eax + 24]
    imul eax, dword ptr [edi + 24]
    jmp L7
    mov eax, dword ptr [ebp - 60]
    mov ecx, dword ptr [eax + 24]
    cmp ecx, ebx
    mov edi, dword ptr [ebp - 64]
    je L10
    mov eax, dword ptr [edi + 24]
    xor edx, edx
    div ecx
L8:
    mov dword ptr [edi + 24], eax
L9:
    xor ebx, ebx
    jmp L20
L10:
    push 01010C950h
    push 0000005DFh
    lea eax, [esi + 000000278h]
    push eax
    lea eax, [esi + 24]
    push eax
    call sub_10067E31
    add esp, 16
    mov dword ptr [esi + 68], 1
    jmp L20
    mov eax, dword ptr [ebp - 60]
    mov edi, dword ptr [ebp - 64]
    mov eax, dword ptr [eax + 24]
    add dword ptr [edi + 24], eax
    jmp L20
    mov eax, dword ptr [ebp - 60]
    mov edi, dword ptr [ebp - 64]
    mov eax, dword ptr [eax + 24]
    sub dword ptr [edi + 24], eax
    jmp L20
    mov edi, dword ptr [ebp - 64]
    mov eax, dword ptr [edi + 24]
    mov ecx, dword ptr [ebp - 60]
    cmp eax, dword ptr [ecx + 24]
    jmp L11
    mov edi, dword ptr [ebp - 64]
    mov eax, dword ptr [edi + 24]
    mov ecx, dword ptr [ebp - 60]
    cmp dword ptr [ecx + 24], eax
L11:
    sbb eax, eax
    neg eax
    jmp L7
    mov edi, dword ptr [ebp - 64]
    mov eax, dword ptr [edi + 24]
    mov ecx, dword ptr [ebp - 60]
    cmp dword ptr [ecx + 24], eax
L12:
    sbb eax, eax
    jmp L13
    mov edi, dword ptr [ebp - 64]
    mov eax, dword ptr [edi + 24]
    mov ecx, dword ptr [ebp - 60]
    cmp eax, dword ptr [ecx + 24]
    jmp L12
    mov edi, dword ptr [ebp - 64]
    mov eax, dword ptr [edi + 24]
    mov ecx, dword ptr [ebp - 60]
    sub eax, dword ptr [ecx + 24]
    neg eax
    sbb eax, eax
L13:
    inc eax
    jmp L7
    mov edi, dword ptr [ebp - 64]
    mov eax, dword ptr [edi + 24]
    mov edx, dword ptr [ebp - 60]
    xor ecx, ecx
    cmp eax, dword ptr [edx + 24]
    setne cl
    mov dword ptr [edi + 24], ecx
    jmp L9
    mov edi, dword ptr [ebp - 64]
    cmp dword ptr [edi + 24], ebx
    je L16
L14:
    mov eax, dword ptr [ebp - 60]
    cmp dword ptr [eax + 24], ebx
    je L16
L15:
    xor eax, eax
    inc eax
    jmp L7
    mov edi, dword ptr [ebp - 64]
    cmp dword ptr [edi + 24], ebx
    jne L15
    jmp L14
L16:
    xor eax, eax
    jmp L7
    mov edi, dword ptr [ebp - 64]
    cmp dword ptr [edi + 24], ebx
    mov eax, dword ptr [ebp - 60]
    jne L17
    mov eax, dword ptr [ebp - 56]
L17:
    mov eax, dword ptr [eax + 24]
    jmp L7
    push 48
    call sub_10065348
    cmp eax, ebx
    je L18
    lea ecx, [esi + 000000278h]
    push ecx
    mov ecx, eax
    call sub_10082D67
    mov edi, eax
    jmp L19
L18:
    xor edi, edi
L19:
    push edi
    mov ecx, esi
    call sub_100653EB
L20:
    cmp dword ptr [esi + 68], ebx
    jne L22
    mov eax, dword ptr [esi + 96]
    cmp eax, ebx
    je L23
    mov ecx, dword ptr [eax + 12]
    mov dword ptr [esi + 96], ecx
    mov dword ptr [eax + 8], edi
    mov ecx, dword ptr [esi + 92]
    mov dword ptr [eax + 12], ecx
L21:
    mov dword ptr [esi + 92], eax
L22:
    pop edi
    pop esi
    pop ebx
    leave
    ret 8
L23:
    push 20
    call sub_10065394
    cmp eax, ebx
    je L24
    push 01010C948h
    push dword ptr [esi + 92]
    mov ecx, eax
    push edi
    call sub_10082BAC
    jmp L25
L24:
    xor eax, eax
L25:
    cmp eax, ebx
    jne L21
    push 01010C928h
L26:
    push ebx
    lea eax, [esi + 000000278h]
    push eax
    lea eax, [esi + 24]
    push eax
    call sub_10067F96
    add esp, 16
    mov dword ptr [esi + 68], 1
    jmp L22
FUN_100665f9 ENDP
END
