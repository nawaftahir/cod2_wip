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
EXTRN sub_10066968:PROC
EXTRN sub_1006697A:PROC
EXTRN sub_1006698D:PROC
EXTRN sub_1006699A:PROC
EXTRN sub_100669A1:PROC
EXTRN sub_100669AD:PROC
EXTRN sub_100669BF:PROC
EXTRN sub_100669D9:PROC
EXTRN sub_100669F9:PROC
EXTRN sub_10066A05:PROC
EXTRN sub_10066A0D:PROC
EXTRN sub_10066A11:PROC
EXTRN sub_10066A2A:PROC
EXTRN sub_10066A3E:PROC
EXTRN sub_10066A41:PROC
EXTRN sub_10066A49:PROC
EXTRN sub_10066A4F:PROC
EXTRN sub_10066A5F:PROC
EXTRN sub_10066A65:PROC
EXTRN sub_10066A69:PROC
EXTRN sub_10066A94:PROC
EXTRN sub_10066A9F:PROC
EXTRN sub_10066AB1:PROC
EXTRN sub_10066AC5:PROC
EXTRN sub_10066ACC:PROC
EXTRN sub_10066AF5:PROC
EXTRN sub_10066B06:PROC
EXTRN sub_10066B17:PROC
EXTRN sub_10066B4B:PROC
EXTRN sub_10066B51:PROC
EXTRN sub_10066B53:PROC
EXTRN sub_10066B8C:PROC
EXTRN sub_10066BC7:PROC
EXTRN sub_10066BDB:PROC
EXTRN sub_10066C10:PROC
EXTRN sub_10066C1E:PROC
EXTRN sub_10066C50:PROC
EXTRN sub_10066C5F:PROC
EXTRN sub_10066C73:PROC
EXTRN sub_10066C75:PROC
EXTRN sub_100678BB:PROC
EXTRN sub_10067E31:PROC
EXTRN sub_10067F96:PROC
EXTRN sub_10082BAC:PROC
EXTRN sub_10082D67:PROC
.CODE
FUN_100665f9 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 64
    push push ebx
    push push esi
    push push edi
    mov mov esi, ecx
    xor xor ebx, ebx
    xor xor edi, edi
    cmp cmp dword ptr [esi + 68], ebx
    jne L7
    mov mov ecx, dword ptr [ebp + 12]
    jmp L0
    mov mov eax, dword ptr [esi + 92]
    dec dec ecx
    cmp cmp eax, ebx
    je L2
    mov mov edx, dword ptr [eax + 8]
    mov mov dword ptr [ebp + ecx*4 - 64], edx
    mov mov edx, dword ptr [eax + 12]
    mov mov dword ptr [esi + 92], edx
    mov mov dword ptr [eax + 8], ebx
    mov mov edx, dword ptr [esi + 96]
    mov mov dword ptr [eax + 12], edx
    mov mov dword ptr [esi + 96], eax
    cmp cmp ecx, ebx
    ja L1
    mov mov eax, dword ptr [ebp + 8]
    cmp cmp eax, 46
    ja L9
    jmp jmp dword ptr [eax*4 + 01006695Dh]
    push push 01010C97Ch
    jmp sub_100669A1
    mov mov eax, dword ptr [ebp - 64]
    push push 1
    push push dword ptr [eax + 24]
    mov mov ecx, esi
    call sub_1006618B
    jmp sub_10066968
    mov mov eax, dword ptr [ebp - 64]
    push push dword ptr [eax + 24]
    mov mov ecx, esi
    call sub_10065227
    jmp sub_1006697A
    push push ebx
    mov mov eax, dword ptr [ebp - 64]
    push push dword ptr [eax + 24]
    mov mov ecx, esi
    call sub_10064034
    jmp sub_1006698D
    mov mov eax, dword ptr [ebp - 60]
    push push dword ptr [eax + 24]
    jmp L3
    mov mov ecx, esi
    call sub_10064081
    jmp sub_100669A1
    mov mov ecx, esi
    call sub_10064286
    jmp sub_100669AD
    mov mov eax, dword ptr [ebp - 64]
    push push dword ptr [eax + 24]
    mov mov ecx, esi
    call sub_1006437C
    jmp sub_100669BF
    mov mov eax, dword ptr [ebp - 64]
    push push ebx
    push push ebx
    push push dword ptr [eax + 24]
    mov mov ecx, esi
    call sub_100650AB
    jmp L5
    mov mov eax, dword ptr [ebp - 64]
    push push ebx
    push push ebx
    push push dword ptr [eax + 24]
    mov mov ecx, esi
    call sub_100650BC
    neg neg eax
    sbb sbb eax, eax
    inc inc eax
    push push eax
    jmp L4
    mov mov eax, dword ptr [ebp - 64]
    push push dword ptr [eax + 24]
    mov mov ecx, esi
    call sub_10064416
    jmp sub_100669F9
    mov mov ecx, esi
    call sub_1006449F
    jmp sub_10066A05
    mov mov ecx, esi
    call sub_10064515
    jmp sub_10066A11
    push push 1
    mov mov ecx, esi
    call sub_100643DC
    mov mov ecx, dword ptr [esi + 026Ch]
    call sub_100678BB
    jmp sub_10066A2A
    push push 1
    mov mov ecx, esi
    call sub_10064455
    jmp L6
    mov mov ecx, esi
    call sub_10065362
    jmp sub_10066A41
    mov mov edi, dword ptr [ebp - 64]
    jmp sub_10066A49
    mov mov edi, dword ptr [ebp - 64]
    push push dword ptr [edi + 24]
    mov mov ecx, esi
    mov mov dword ptr [edi + 16], 2
    call sub_100654E1
    jmp L8
    mov mov edi, dword ptr [ebp - 64]
    push push ebx
    push push ebx
    push push dword ptr [edi + 24]
    mov mov ecx, esi
    mov mov dword ptr [edi + 16], 2
    call sub_10065152
    mov mov dword ptr [edi + 24], eax
    mov mov dword ptr [esi + 88], 1
    jmp L11
    mov mov edi, dword ptr [ebp - 64]
    xor xor eax, eax
    cmp cmp dword ptr [edi + 24], ebx
    sete sete al
    mov mov dword ptr [edi + 24], eax
    jmp sub_10066A94
    mov mov edi, dword ptr [ebp - 64]
    neg neg dword ptr [edi + 24]
    jmp sub_10066A9F
    mov mov eax, dword ptr [ebp - 60]
    mov mov edi, dword ptr [ebp - 64]
    mov mov eax, dword ptr [eax + 24]
    imul imul eax, dword ptr [edi + 24]
    jmp L10
    mov mov eax, dword ptr [ebp - 60]
    mov mov ecx, dword ptr [eax + 24]
    cmp cmp ecx, ebx
    mov mov edi, dword ptr [ebp - 64]
    je sub_1006699A
    mov mov eax, dword ptr [edi + 24]
    xor xor edx, edx
    div div ecx
    mov mov dword ptr [edi + 24], eax
    xor xor ebx, ebx
    jmp sub_10066ACC
    push push 01010C950h
    push push 05DFh
    lea lea eax, [esi + 0278h]
    push push eax
    lea lea eax, [esi + 24]
    push push eax
    call sub_10067E31
    add add esp, 16
    mov mov dword ptr [esi + 68], 1
    jmp sub_10066AF5
    mov mov eax, dword ptr [ebp - 60]
    mov mov edi, dword ptr [ebp - 64]
    mov mov eax, dword ptr [eax + 24]
    add add dword ptr [edi + 24], eax
    jmp sub_10066B06
    mov mov eax, dword ptr [ebp - 60]
    mov mov edi, dword ptr [ebp - 64]
    mov mov eax, dword ptr [eax + 24]
    sub sub dword ptr [edi + 24], eax
    jmp sub_10066B17
    mov mov edi, dword ptr [ebp - 64]
    mov mov eax, dword ptr [edi + 24]
    mov mov ecx, dword ptr [ebp - 60]
    cmp cmp eax, dword ptr [ecx + 24]
    jmp sub_10066A69
    mov mov edi, dword ptr [ebp - 64]
    mov mov eax, dword ptr [edi + 24]
    mov mov ecx, dword ptr [ebp - 60]
    cmp cmp dword ptr [ecx + 24], eax
    sbb sbb eax, eax
    neg neg eax
    jmp sub_100669D9
    mov mov edi, dword ptr [ebp - 64]
    mov mov eax, dword ptr [edi + 24]
    mov mov ecx, dword ptr [ebp - 60]
    cmp cmp dword ptr [ecx + 24], eax
    sbb sbb eax, eax
    jmp sub_10066AC5
    mov mov edi, dword ptr [ebp - 64]
    mov mov eax, dword ptr [edi + 24]
    mov mov ecx, dword ptr [ebp - 60]
    cmp cmp eax, dword ptr [ecx + 24]
    jmp sub_10066AB1
    mov mov edi, dword ptr [ebp - 64]
    mov mov eax, dword ptr [edi + 24]
    mov mov ecx, dword ptr [ebp - 60]
    sub sub eax, dword ptr [ecx + 24]
    neg neg eax
    sbb sbb eax, eax
    inc inc eax
    jmp sub_10066A0D
    mov mov edi, dword ptr [ebp - 64]
    mov mov eax, dword ptr [edi + 24]
    mov mov edx, dword ptr [ebp - 60]
    xor xor ecx, ecx
    cmp cmp eax, dword ptr [edx + 24]
    setne setne cl
    mov mov dword ptr [edi + 24], ecx
    jmp sub_10066A5F
    mov mov edi, dword ptr [ebp - 64]
    cmp cmp dword ptr [edi + 24], ebx
    je sub_10066B4B
    mov mov eax, dword ptr [ebp - 60]
    cmp cmp dword ptr [eax + 24], ebx
    je sub_10066B53
    xor xor eax, eax
    inc inc eax
    jmp sub_10066A3E
    mov mov edi, dword ptr [ebp - 64]
    cmp cmp dword ptr [edi + 24], ebx
    jne sub_10066B51
    jmp sub_10066B4B
    xor xor eax, eax
    jmp sub_10066A4F
    mov mov edi, dword ptr [ebp - 64]
    cmp cmp dword ptr [edi + 24], ebx
    mov mov eax, dword ptr [ebp - 60]
    jne sub_10066B8C
    mov mov eax, dword ptr [ebp - 56]
    mov mov eax, dword ptr [eax + 24]
    jmp sub_10066A65
    push push 48
    call sub_10065348
    cmp cmp eax, ebx
    je sub_10066BC7
    lea lea ecx, [esi + 0278h]
    push push ecx
    mov mov ecx, eax
    call sub_10082D67
    mov mov edi, eax
    jmp sub_10066BDB
    xor xor edi, edi
    push push edi
    mov mov ecx, esi
    call sub_100653EB
    cmp cmp dword ptr [esi + 68], ebx
    jne sub_10066C10
    mov mov eax, dword ptr [esi + 96]
    cmp cmp eax, ebx
    je sub_10066C1E
    mov mov ecx, dword ptr [eax + 12]
    mov mov dword ptr [esi + 96], ecx
    mov mov dword ptr [eax + 8], edi
    mov mov ecx, dword ptr [esi + 92]
    mov mov dword ptr [eax + 12], ecx
    mov mov dword ptr [esi + 92], eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 8
    push push 20
    call sub_10065394
    cmp cmp eax, ebx
    je sub_10066C5F
    push push 01010C948h
    push push dword ptr [esi + 92]
L7:
    mov mov ecx, eax
    push push edi
    call sub_10082BAC
    jmp sub_10066C73
    xor xor eax, eax
    cmp cmp eax, ebx
    jne sub_10066C50
    push push 01010C928h
    push push ebx
    lea lea eax, [esi + 0278h]
    push push eax
    lea lea eax, [esi + 24]
    push push eax
    call sub_10067F96
    add add esp, 16
    mov mov dword ptr [esi + 68], 1
    jmp sub_10066C75
FUN_100665f9 ENDP
END
