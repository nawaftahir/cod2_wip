.686
.MODEL FLAT, C
EXTRN sub_1006C7E7:PROC
EXTRN sub_1006C809:PROC
EXTRN sub_1006C890:PROC
EXTRN sub_100856F4:PROC
EXTRN sub_10085791:PROC
EXTRN sub_10085B84:PROC
EXTRN sub_10085C1F:PROC
EXTRN sub_100A933D:PROC
EXTRN sub_100A934F:PROC
EXTRN sub_100A9351:PROC
EXTRN sub_100A9356:PROC
EXTRN sub_100A9361:PROC
EXTRN sub_100A9365:PROC
EXTRN sub_100A9373:PROC
EXTRN sub_100A9377:PROC
EXTRN sub_100A9384:PROC
EXTRN sub_100A938E:PROC
EXTRN sub_100A9392:PROC
EXTRN sub_100A93A5:PROC
EXTRN sub_100A93AF:PROC
EXTRN sub_100A93C6:PROC
EXTRN sub_100A93D0:PROC
EXTRN sub_100A93FC:PROC
EXTRN sub_100A9429:PROC
EXTRN sub_100A945A:PROC
EXTRN sub_100A9471:PROC
EXTRN sub_100A947E:PROC
EXTRN sub_100A9486:PROC
EXTRN sub_100A948C:PROC
EXTRN sub_100A949A:PROC
EXTRN sub_100A94A5:PROC
EXTRN sub_100A94B1:PROC
EXTRN sub_100A94C7:PROC
EXTRN sub_100A94D0:PROC
EXTRN sub_100A94E6:PROC
EXTRN sub_100A9504:PROC
EXTRN sub_100A952B:PROC
EXTRN sub_100A9534:PROC
EXTRN sub_100A9542:PROC
EXTRN sub_100A9546:PROC
EXTRN sub_100A9555:PROC
EXTRN sub_100A9566:PROC
EXTRN sub_100A959E:PROC
EXTRN sub_100A95AB:PROC
EXTRN sub_100A95C7:PROC
EXTRN sub_100A9602:PROC
EXTRN sub_100A9612:PROC
EXTRN sub_100A9641:PROC
EXTRN sub_100A9681:PROC
EXTRN sub_100A96B0:PROC
EXTRN sub_100A96C0:PROC
EXTRN sub_100A96FF:PROC
EXTRN sub_100A971C:PROC
EXTRN sub_100A972B:PROC
EXTRN sub_100A9744:PROC
EXTRN sub_100A978F:PROC
EXTRN sub_100B9A39:PROC
EXTRN sub_100B9A8A:PROC
EXTRN EXTRN g_1019BEB8:DWORD:DWORD
.CODE
FUN_100a8ea3 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0124h
    push push edi
    mov mov edi, ecx
    mov mov eax, dword ptr [edi + 0C8h]
    and and eax, 0FFFFh
    cmp cmp eax, 0104h
    mov mov dword ptr [ebp - 4], edi
    jb L0
    xor xor eax, eax
    inc inc eax
    jmp sub_100A9356
    mov mov eax, dword ptr [edi + 0100h]
    push push ebx
    push push esi
    xor xor ecx, ecx
    xor xor esi, esi
    push push 3
    inc inc ecx
    pop pop ebx
    mov mov dword ptr [ebp - 24], esi
    mov mov dword ptr [ebp - 68], esi
    mov mov dword ptr [ebp - 64], ecx
    mov mov dword ptr [ebp - 60], 2
    mov mov dword ptr [ebp - 56], ebx
L0:
    mov mov eax, dword ptr [eax]
    and and eax, 0FFFFFh
    cmp cmp eax, ebx
    jne L4
    push push 0
    push push ebx
    lea lea eax, [ebp - 68]
    push push eax
    lea lea eax, [ebp - 0E4h]
    push push eax
    lea lea eax, [ebp - 24]
    push push eax
    lea lea eax, [ebp - 0124h]
    push push eax
    push push dword ptr [esi*4 + 0101A3FA0h]
    mov mov ecx, edi
    push push dword ptr [edi + 0100h]
    call sub_100B9A39
    test test eax, eax
    je L2
    inc inc esi
    cmp cmp esi, 9
    jb L1
    and and dword ptr [ebp - 16], 0
    and and dword ptr [ebp - 20], 0
    cmp cmp esi, 4
    jbe L3
    mov mov dword ptr [ebp - 20], 1
    test test eax, eax
    je L6
    xor xor esi, esi
    push push 0
    push push ebx
    lea lea eax, [ebp - 68]
    push push eax
    lea lea eax, [ebp - 0E4h]
    push push eax
    lea lea eax, [ebp - 24]
    push push eax
    lea lea eax, [ebp - 0124h]
    push push eax
    push push dword ptr [esi*4 + 0101A3FC4h]
    mov mov ecx, edi
    push push dword ptr [edi + 0100h]
    call sub_100B9A8A
    test test eax, eax
    je L7
    inc inc esi
    cmp cmp esi, ebx
    jb L5
    and and dword ptr [ebp - 20], 0
    xor xor ecx, ecx
    inc inc ecx
    cmp cmp esi, ecx
    jbe L8
    mov mov dword ptr [ebp - 20], ecx
    test test eax, eax
    mov mov dword ptr [ebp - 16], ecx
    je L9
    mov mov eax, ecx
    jmp sub_100A9429
    and and dword ptr [ebp - 12], 0
    mov mov ebx, dword ptr [edi + 20]
    mov mov dword ptr [ebp - 28], 12
    lea lea eax, [ebp - 52]
    sub sub dword ptr [ebp - 28], eax
    mov mov edx, dword ptr [ebp - 12]
    mov mov ecx, edx
    shl shl ecx, 2
    mov mov esi, dword ptr [ebp + ecx - 0D4h]
    mov mov eax, dword ptr [ebx + esi*4]
    cmp cmp dword ptr [eax + 16], edx
    jne sub_100A9351
    cmp cmp dword ptr [ebp + 8], 0
    je L11
    cmp cmp dword ptr [eax + 72], -1
    jne sub_100A9365
    mov mov edi, dword ptr [eax + 4]
    mov mov ebx, dword ptr [ebp - 4]
L3:
    cmp cmp edi, dword ptr [ebx + 080h]
    jne sub_100A9377
    movzx movzx edi, byte ptr [eax + 109]
    inc inc edx
    cmp cmp edi, edx
    jne sub_100A9384
    cmp cmp byte ptr [eax + 108], 5
    jne sub_100A938E
    cmp cmp dword ptr [ebp - 20], 0
    mov mov dword ptr [ebp + ecx - 52], esi
    jne L10
    cmp cmp dword ptr [eax + 60], 080000h
    jne sub_100A93A5
    mov mov edi, dword ptr [eax + 56]
    lea lea ebx, [ebp + ecx - 0B4h]
    mov mov edx, dword ptr [ebx]
    cmp cmp edx, edi
    mov mov dword ptr [ebp - 8], edi
    jne sub_100A933D
    mov mov eax, dword ptr [ebp + ecx - 0A4h]
    mov mov esi, dword ptr [ebx - 16]
    cmp cmp eax, esi
    jne sub_100A934F
L6:
    lea lea edx, [ebp + ecx - 094h]
    mov mov eax, dword ptr [edx]
    cmp cmp eax, dword ptr [ebx + 48]
    jne sub_100A9361
    cmp cmp dword ptr [ebp + ecx - 0A4h], eax
    je sub_100A9392
    jmp sub_100A9373
    cmp cmp dword ptr [eax + 60], 0
    jne sub_100A93FC
    lea lea ebx, [ebp + ecx - 0B4h]
L8:
    cmp cmp dword ptr [ebx], esi
    jne L12
    mov mov edi, dword ptr [ebp + ecx - 0A4h]
    mov mov esi, dword ptr [ebx - 16]
    cmp cmp edi, esi
    jne L13
    lea lea edx, [ebp + ecx - 094h]
    mov mov eax, dword ptr [edx]
    cmp cmp eax, dword ptr [ebx + 48]
    jne L14
    cmp cmp edi, eax
    je sub_100A93D0
    mov mov eax, dword ptr [ebp + ecx - 0D4h]
    cmp cmp dword ptr [ebp + ecx - 0A4h], eax
    jmp sub_100A93C6
    cmp cmp dword ptr [ebp - 20], 0
    je L15
    mov mov edx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [eax + 4]
    mov mov edx, dword ptr [edx + 16]
    mov mov eax, dword ptr [edx + eax*4]
    test test byte ptr [eax + 5], 2
    je sub_100A945A
    lea lea edx, [ebp + ecx - 52]
    mov mov dword ptr [edx], esi
    jmp sub_100A93AF
    mov mov eax, dword ptr [eax + 72]
    cmp cmp eax, -1
    je sub_100A9471
    mov mov esi, dword ptr [ebp - 4]
    mov mov edx, dword ptr [esi + 24]
    mov mov eax, dword ptr [edx + eax*4]
    cmp cmp dword ptr [eax], 020500003h
    jne sub_100A9486
    mov mov eax, dword ptr [eax + 8]
    mov mov edx, dword ptr [ecx + eax]
    mov mov esi, dword ptr [esi + 16]
    mov mov dword ptr [ebp - 8], edx
    mov mov edx, dword ptr [ebx + edx*4]
    mov mov edi, dword ptr [edx + 4]
    mov mov edi, dword ptr [esi + edi*4]
    test test byte ptr [edi + 5], 2
    je sub_100A94A5
    mov mov edi, dword ptr [ebp - 12]
    cmp cmp dword ptr [edx + 16], edi
    jne sub_100A94B1
    mov mov edi, dword ptr [ebp - 28]
    add add edi, eax
    lea lea edx, [ebp + ecx - 52]
    mov mov eax, dword ptr [edi + edx]
    mov mov ebx, dword ptr [ebx + eax*4]
    mov mov eax, dword ptr [ebx + 4]
    mov mov eax, dword ptr [esi + eax*4]
    test test byte ptr [eax + 5], 1
    je sub_100A94D0
    fld fld qword ptr [g_1019BEB8]
    fld fld qword ptr [ebx + 32]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp sub_100A94E6
    mov mov eax, dword ptr [ebp - 8]
    mov mov dword ptr [edx], eax
    mov mov edi, dword ptr [edx]
    lea lea ebx, [ebp + ecx - 0B4h]
    mov mov eax, dword ptr [ebx]
    cmp cmp eax, edi
    mov mov dword ptr [ebp - 8], edi
    jne sub_100A947E
    mov mov eax, dword ptr [ebp + ecx - 0A4h]
    mov mov esi, dword ptr [ebx - 16]
    cmp cmp eax, esi
    jne sub_100A948C
    lea lea edx, [ebp + ecx - 094h]
    mov mov eax, dword ptr [edx]
    cmp cmp eax, dword ptr [ebx + 48]
    jne sub_100A949A
    cmp cmp dword ptr [ebp + ecx - 0A4h], eax
    je sub_100A94C7
    cmp cmp dword ptr [ebp + ecx - 0A4h], edi
    jne sub_100A952B
    mov mov edi, dword ptr [ebx]
    mov mov esi, dword ptr [ebx - 16]
    cmp cmp edi, esi
    jne sub_100A9534
    lea lea edx, [ebp + ecx - 094h]
    mov mov eax, dword ptr [edx]
    cmp cmp eax, dword ptr [ebx + 48]
    jne sub_100A9542
    cmp cmp edi, eax
    jne sub_100A9546
    cmp cmp dword ptr [ebp - 16], 0
    mov mov dword ptr [ebp + ecx - 40], esi
    je sub_100A9504
    cmp cmp eax, dword ptr [edx + 32]
    jne sub_100A9555
    mov mov eax, dword ptr [ebp - 4]
    mov mov ebx, dword ptr [eax + 20]
    mov mov eax, dword ptr [ebx + esi*4]
    mov mov eax, dword ptr [eax + 16]
    cmp cmp eax, dword ptr [ebp - 12]
    jne sub_100A9566
    inc inc dword ptr [ebp - 12]
    cmp cmp dword ptr [ebp - 12], 3
    jb L15
    xor xor esi, esi
    xor xor eax, eax
L11:
    cmp cmp dword ptr [ebp - 24], esi
    jbe sub_100A9566
    mov mov ecx, dword ptr [ebp + eax*4 - 0124h]
    inc inc eax
    mov mov dword ptr [ecx], esi
    cmp cmp eax, dword ptr [ebp - 24]
    jb sub_100A9566
    push push 116
    call sub_10085B84
    cmp cmp eax, esi
    je sub_100A959E
    mov mov ecx, eax
    call sub_100856F4
    mov mov ebx, eax
    jmp sub_100A95AB
    xor xor eax, eax
    inc inc eax
    jmp sub_100A96B0
    xor xor ebx, ebx
    cmp cmp ebx, esi
    jne sub_100A95C7
    mov mov eax, 08007000Eh
    jmp sub_100A96C0
    cmp cmp dword ptr [ebp + 8], esi
    push push esi
    mov mov esi, dword ptr [ebp - 4]
    mov mov eax, dword ptr [esi + 0100h]
    push push dword ptr [eax + 12]
    mov mov ecx, ebx
    je sub_100A9602
    push push 6
    push push 072C00003h
    jmp sub_100A9612
    push push 9
    push push 072D00003h
    call sub_10085C1F
    mov mov edi, eax
    test test edi, edi
    mov mov ecx, ebx
    jge sub_100A9641
    push push 1
    call sub_1006C7E7
    mov mov eax, edi
    jmp sub_100A96FF
    push push dword ptr [esi + 0100h]
    call sub_10085791
    test test eax, eax
    mov mov dword ptr [ebp - 16], eax
    jge sub_100A9681
    push push 1
    mov mov ecx, ebx
    call sub_1006C809
    jmp sub_100A971C
    mov mov edx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [edx + 0100h]
    mov mov ecx, dword ptr [eax + 12]
    mov mov esi, dword ptr [eax + 16]
    mov mov edi, dword ptr [ebx + 16]
    shl shl ecx, 2
    mov mov eax, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    push push 12
    pop pop eax
    lea lea ecx, [ebp - 40]
    lea lea esi, [ebp - 52]
    sub sub ecx, eax
    sub sub esi, eax
    mov mov dword ptr [ebp - 8], esi
    cmp cmp dword ptr [ebp + 8], 0
    mov mov esi, dword ptr [edx + 0100h]
    mov mov esi, dword ptr [esi + 8]
    mov mov edi, dword ptr [ebx + 8]
    mov mov esi, dword ptr [esi]
    mov mov dword ptr [eax + edi - 12], esi
    mov mov esi, dword ptr [ebx + 8]
    mov mov edi, dword ptr [ecx + eax]
    mov mov dword ptr [eax + esi], edi
    jne sub_100A9744
    mov mov edi, dword ptr [ebp - 8]
    mov mov esi, dword ptr [ebx + 8]
    mov mov edi, dword ptr [edi + eax]
    mov mov dword ptr [eax + esi + 12], edi
    add add eax, 4
    cmp cmp eax, 24
    jb sub_100A972B
    mov mov ecx, dword ptr [edx + 24]
    lea lea esi, [edx + 0FCh]
    mov mov eax, dword ptr [esi]
    mov mov ecx, dword ptr [ecx + eax*4]
    test test ecx, ecx
    je sub_100A978F
    push push 1
    call sub_1006C890
    mov mov edx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [esi]
    mov mov ecx, dword ptr [edx + 24]
    mov mov dword ptr [ecx + eax*4], ebx
    mov mov eax, dword ptr [ebp - 16]
    pop pop esi
    pop pop ebx
    pop pop edi
    leave leave
    ret ret 4
FUN_100a8ea3 ENDP
END
