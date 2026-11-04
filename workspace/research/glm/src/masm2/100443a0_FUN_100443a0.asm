.686
.MODEL FLAT, C
EXTRN sub_10044219:PROC
EXTRN sub_10044340:PROC
EXTRN sub_10044535:PROC
EXTRN sub_1004454A:PROC
EXTRN sub_100445F5:PROC
EXTRN sub_10044657:PROC
EXTRN sub_1004465B:PROC
.CODE
FUN_100443a0 PROC
    sub sub esp, 40
    push push ebp
    push push esi
    mov mov esi, dword ptr [esp + 52]
    mov mov eax, dword ptr [esi + 32]
    mov mov ecx, dword ptr [eax]
    mov mov edx, dword ptr [eax + 4]
    mov mov ebp, dword ptr [esi + 0164h]
    push push edi
    lea lea edi, [ebp + 12]
    mov mov dword ptr [esp + 16], ecx
    mov mov eax, edi
    mov mov ecx, dword ptr [eax]
    mov mov dword ptr [esp + 20], edx
    mov mov edx, dword ptr [eax + 4]
    mov mov dword ptr [esp + 24], ecx
    mov mov ecx, dword ptr [eax + 8]
    mov mov dword ptr [esp + 28], edx
    mov mov edx, dword ptr [eax + 12]
    mov mov dword ptr [esp + 32], ecx
    mov mov ecx, dword ptr [eax + 16]
    mov mov dword ptr [esp + 36], edx
    mov mov edx, dword ptr [eax + 20]
    mov mov eax, dword ptr [esi + 0C4h]
    test test eax, eax
    mov mov dword ptr [esp + 40], ecx
    mov mov dword ptr [esp + 44], edx
    mov mov dword ptr [esp + 48], esi
    je L0
    mov mov eax, dword ptr [ebp + 36]
    test test eax, eax
    jne L1
    mov mov eax, dword ptr [ebp + 40]
    push push eax
    lea lea eax, [esp + 20]
    call sub_10044340
    add add esp, 4
    test test al, al
    jne L2
    pop pop edi
    pop pop esi
    pop pop ebp
    add add esp, 40
    ret ret
    mov mov eax, dword ptr [esi + 0108h]
    push push ebx
    xor xor ebx, ebx
    test test eax, eax
    jle sub_10044535
    lea lea ecx, [esi + 010Ch]
    mov mov dword ptr [esp + 60], ecx
    jmp L3
    lea lea esp, [esp]
    mov mov edi, edi
    mov mov edx, dword ptr [esp + 60]
    mov mov eax, dword ptr [edx]
    mov mov ecx, dword ptr [esi + eax*4 + 0F0h]
    mov mov edx, dword ptr [ecx + 24]
    mov mov edx, dword ptr [ebp + edx*4 + 60]
    mov mov ecx, dword ptr [ecx + 20]
    push push edx
    mov mov edx, dword ptr [ebp + ecx*4 + 44]
    mov mov ecx, dword ptr [esp + 68]
    lea lea eax, [esp + eax*4 + 40]
    mov mov dword ptr [esp + 20], eax
    mov mov eax, dword ptr [eax]
    push push edx
    mov mov edx, dword ptr [ecx + ebx*4]
    push push eax
    push push edx
    lea lea eax, [esp + 36]
    call sub_10044219
    add add esp, 16
    test test al, al
    je sub_100445F5
    mov mov eax, dword ptr [esp + 64]
    mov mov ecx, dword ptr [eax + ebx*4]
    movsx movsx edx, word ptr [ecx]
    mov mov eax, dword ptr [esp + 16]
    mov mov ecx, dword ptr [esp + 60]
    mov mov dword ptr [eax], edx
    mov mov eax, dword ptr [esi + 0108h]
    inc inc ebx
    add add ecx, 4
    cmp cmp ebx, eax
    mov mov dword ptr [esp + 60], ecx
    jl sub_1004454A
    mov mov ecx, dword ptr [esi + 32]
    mov mov edx, dword ptr [esp + 20]
    mov mov dword ptr [ecx], edx
    mov mov eax, dword ptr [esi + 32]
    mov mov ecx, dword ptr [esp + 24]
    mov mov edx, dword ptr [esp + 28]
    mov mov dword ptr [eax + 4], ecx
    mov mov eax, dword ptr [esp + 32]
    mov mov ecx, dword ptr [esp + 36]
    mov mov dword ptr [edi], edx
    mov mov edx, dword ptr [esp + 40]
    mov mov dword ptr [edi + 4], eax
    mov mov eax, dword ptr [esp + 44]
    mov mov dword ptr [edi + 8], ecx
    mov mov ecx, dword ptr [esp + 48]
    mov mov dword ptr [edi + 12], edx
    mov mov dword ptr [edi + 16], eax
    mov mov dword ptr [edi + 20], ecx
    mov mov esi, dword ptr [esi + 0C4h]
    test test esi, esi
    je sub_10044657
    mov mov eax, dword ptr [ebp + 36]
    test test eax, eax
    jne sub_1004465B
    mov mov edx, dword ptr [ebp + 40]
    inc inc edx
    and and edx, 7
    mov mov dword ptr [ebp + 36], esi
    mov mov dword ptr [ebp + 40], edx
    dec dec dword ptr [ebp + 36]
    pop pop ebx
    pop pop edi
    pop pop esi
    mov mov al, 1
    pop pop ebp
    add add esp, 40
    ret ret
    pop pop ebx
FUN_100443a0 ENDP
END
