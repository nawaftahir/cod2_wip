.686
.MODEL FLAT, C
EXTRN sub_1002CC7A:PROC
EXTRN sub_10034D3A:PROC
EXTRN sub_100387A1:PROC
EXTRN sub_10038BF6:PROC
EXTRN sub_10039693:PROC
EXTRN sub_10039FEA:PROC
EXTRN sub_1003A03D:PROC
EXTRN sub_1003A04C:PROC
EXTRN sub_1003A055:PROC
EXTRN sub_1003A080:PROC
EXTRN sub_1003A08A:PROC
EXTRN sub_1003A115:PROC
EXTRN sub_1003A11E:PROC
EXTRN sub_1003A12A:PROC
EXTRN sub_1003A13C:PROC
EXTRN sub_1003A143:PROC
EXTRN sub_1003A16C:PROC
EXTRN sub_1003A178:PROC
EXTRN sub_1003A18C:PROC
EXTRN sub_1003A190:PROC
EXTRN sub_1003A1A9:PROC
EXTRN sub_1003A1AE:PROC
EXTRN sub_1003A1BE:PROC
EXTRN sub_1003A1CB:PROC
EXTRN sub_1003A1E0:PROC
EXTRN sub_1003A1E5:PROC
EXTRN sub_1003A1F6:PROC
EXTRN sub_1003A201:PROC
EXTRN sub_1003A212:PROC
EXTRN sub_1003A276:PROC
EXTRN sub_1003A288:PROC
EXTRN sub_1003A332:PROC
EXTRN sub_1003A36F:PROC
EXTRN sub_1003A3B4:PROC
EXTRN sub_1003C58B:PROC
EXTRN sub_1003CDD2:PROC
EXTRN sub_1003D643:PROC
EXTRN sub_1003D67F:PROC
EXTRN sub_1003D680:PROC
EXTRN sub_1003D868:PROC
EXTRN sub_1003DCD0:PROC
EXTRN sub_10060D26:PROC
EXTRN sub_10060D80:PROC
EXTRN sub_100F6CE0:PROC
EXTRN sub_100F6D2D:PROC
EXTRN sub_100F6D87:PROC
EXTRN sub_100F6D9A:PROC
EXTRN sub_100F6DE6:PROC
EXTRN sub_100F6E0C:PROC
EXTRN sub_100F6E40:PROC
EXTRN sub_100F6EC5:PROC
EXTRN EXTRN g_101CE700:DWORD:DWORD
EXTRN EXTRN g_101CE7A0:DWORD:DWORD
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101CE7F0:DWORD:DWORD
EXTRN EXTRN g_101D1B08:DWORD:DWORD
EXTRN EXTRN g_101D1B0C:DWORD:DWORD
EXTRN EXTRN g_101D1B10:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_1072D9BC:DWORD:DWORD
EXTRN EXTRN g_1072DEBD:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_10766680:DWORD:DWORD
EXTRN EXTRN g_10766684:DWORD:DWORD
EXTRN EXTRN g_10766714:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_10039b40 PROC
    sub sub esp, 44
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 56]
    mov mov ecx, dword ptr [ebp]
    push push esi
    mov mov esi, eax
    push push edi
    lea lea eax, [esp + 24]
    push push eax
    mov mov eax, dword ptr [g_1072D9BC]
    push push ecx
    add add eax, 44
    call sub_10039693
    mov mov edi, dword ptr [esp + 32]
    add add esp, 8
    test test esi, esi
    je L0
    mov mov ebx, dword ptr [esi]
    mov mov ecx, dword ptr [esi + 4]
    mov mov edx, dword ptr [esi + 8]
    mov mov eax, dword ptr [esi + 12]
    and and edi, ebx
    mov mov ebx, dword ptr [esp + 28]
    and and ebx, ecx
    or or edi, edx
    or or ebx, eax
    mov mov dword ptr [esp + 28], ebx
    jmp L1
    mov mov ebx, dword ptr [esp + 28]
    mov mov al, byte ptr [g_1072DEBD]
    test test al, al
    je L3
    mov mov eax, dword ptr [esp + 28]
    and and eax, -49
    mov mov dword ptr [esp + 28], eax
    mov mov ebx, eax
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je L6
    mov mov ecx, dword ptr [g_10764584]
    test test ecx, ecx
    setne setne al
    test test al, al
    je L4
    push push 010198A6Ch
    push push 010193358h
    push push ecx
    call sub_100F6D9A
    mov mov eax, dword ptr [g_10764584]
L1:
    add add esp, 12
    push push eax
    call sub_100F6CE0
    add add esp, 4
    mov mov ecx, dword ptr [ebp]
    mov mov edx, dword ptr [ecx]
    push push edx
    push push 010198AC4h
L2:
    call sub_10060D26
    mov mov ecx, dword ptr [g_101CE7EC]
    mov mov edx, dword ptr [ecx + 8]
    add add esp, 8
    test test edx, edx
    je L5
    mov mov ecx, dword ptr [g_10764584]
    test test ecx, ecx
    setne setne dl
    test test dl, dl
    je L7
    push push eax
    push push 010193358h
    push push ecx
    call sub_100F6DE6
    mov mov edx, dword ptr [g_10764584]
    add add esp, 12
    push push edx
    call sub_100F6D2D
    add add esp, 4
    mov mov eax, dword ptr [esp + 28]
    push push eax
    mov mov eax, dword ptr [g_1072D9BC]
    mov mov ecx, dword ptr [eax + 48]
    mov mov edx, dword ptr [eax + 44]
    push push edi
    push push ecx
    push push edx
    push push 010198A88h
    call sub_10060D80
    mov mov ecx, dword ptr [g_101CE7EC]
    mov mov edx, dword ptr [ecx + 8]
    add add esp, 20
    test test edx, edx
    je L8
    mov mov ecx, dword ptr [g_10764584]
    test test ecx, ecx
    setne setne dl
L4:
    test test dl, dl
    je L9
    push push eax
    push push 010193358h
    push push ecx
    call sub_100F6E40
    mov mov edx, dword ptr [g_10764584]
    add add esp, 12
    push push edx
    call sub_100F6D87
    add add esp, 4
    cmp cmp edi, dword ptr [g_10766680]
    je L10
    push push edi
    call sub_1003C58B
    add add esp, 4
    mov mov dword ptr [g_10766680], edi
    cmp cmp ebx, dword ptr [g_10766684]
    je L11
    push push ebx
    call sub_1003CDD2
    add add esp, 4
    mov mov dword ptr [g_10766684], ebx
    mov mov al, byte ptr [ebp + 8]
    neg neg al
    sbb sbb eax, eax
    and and eax, 2
    call sub_10034D3A
    mov mov al, byte ptr [ebp + 4]
    cmp cmp al, byte ptr [g_10766714]
    je L15
    mov mov ecx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [ecx + 8]
    test test eax, eax
    je L12
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je L13
    push push 010198A20h
    push push 010193358h
    push push eax
    call sub_100F6EC5
    mov mov edx, dword ptr [g_10764584]
    add add esp, 12
    push push edx
    call sub_100F6E0C
    add add esp, 4
    mov mov bl, byte ptr [ebp + 4]
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    xor xor edx, edx
    test test bl, bl
    setne setne dl
    push push edx
    push push 089h
    push push eax
    call call dword ptr [ecx + 0E4h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne L14
    mov mov al, byte ptr [ebp + 4]
    mov mov byte ptr [g_10766714], al
    mov mov ecx, dword ptr [esp + 68]
    mov mov esi, dword ptr [ecx*4 + 0101906A0h]
    call sub_100387A1
    mov mov al, byte ptr [ebp + 7]
    test test al, al
    je L16
    lea lea esi, [esp + 68]
    call L2
    mov mov esi, dword ptr [esp + 68]
    jmp L17
    or or esi, -1
    call sub_1003D67F
    mov mov ebx, dword ptr [esp + 64]
    mov mov esi, dword ptr [esp + 68]
    xor xor ebp, ebp
    add add ebx, 16
    mov mov dword ptr [esp + 20], ebx
    cmp cmp word ptr [ebx - 4], 3
    jne sub_10039FEA
    mov mov ebx, dword ptr [ebx]
    lea lea edi, [esp + 16]
    lea lea esi, [esp + 68]
    call sub_10038BF6
    mov mov esi, dword ptr [esp + 68]
    mov mov ebx, dword ptr [esp + 20]
    jmp sub_1003A115
    mov mov eax, dword ptr [g_1072D9BC]
    movzx movzx edx, word ptr [eax + 52]
    mov mov edi, dword ptr [ebx]
    xor xor ecx, ecx
    test test edx, edx
    jle sub_1003A12A
    mov mov eax, dword ptr [eax + 60]
    jmp sub_1003A03D
    lea lea ecx, [ecx]
    cmp cmp edi, dword ptr [eax]
    je sub_1003A055
    inc inc ecx
    add add eax, 12
    cmp cmp ecx, edx
    jl sub_1003A04C
    jmp sub_1003A143
    mov mov dl, byte ptr [eax + 5]
    cmp cmp dl, 5
    mov mov ecx, dword ptr [eax + 8]
    jne sub_1003A080
    mov mov esi, dword ptr [ecx + 28]
    mov mov esi, dword ptr [esi + 64]
    jmp sub_1003A08A
    mov mov esi, ecx
    mov mov al, byte ptr [eax + 4]
    mov mov byte ptr [esp + 16], al
    cmp cmp dword ptr [esi], 3
    mov mov dword ptr [esp + 68], esi
    jne sub_1003A16C
    movzx movzx eax, dl
    cmp cmp eax, 5
    ja sub_1003A178
    jmp jmp dword ptr [eax*4 + 010039FA8h]
    mov mov ecx, dword ptr [g_101CE7A0]
    mov mov eax, dword ptr [ecx + 8]
    test test eax, eax
    je sub_1003A190
    mov mov ecx, 1
    cmp cmp eax, ecx
    jne sub_1003A11E
L11:
    mov mov esi, dword ptr [g_101D1B08]
    mov mov dword ptr [esp + 68], esi
    mov mov byte ptr [esp + 16], cl
    jmp sub_1003A1A9
    cmp cmp eax, 2
    jne sub_1003A1AE
    mov mov esi, dword ptr [g_101D1B0C]
    mov mov dword ptr [esp + 68], esi
    mov mov byte ptr [esp + 16], cl
    jmp sub_1003A1BE
    mov mov edx, dword ptr [g_101CE700]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je sub_1003A1CB
    cmp cmp eax, 1
    jne sub_1003A18C
    mov mov esi, dword ptr [g_101D1B08]
    mov mov dword ptr [esp + 68], esi
    mov mov byte ptr [esp + 16], al
    jmp sub_1003A1E0
    cmp cmp eax, 2
    jne sub_1003A1E5
    mov mov esi, dword ptr [g_101D1B0C]
    mov mov dword ptr [esp + 68], esi
    mov mov byte ptr [esp + 16], 1
    jmp sub_1003A1F6
    mov mov eax, dword ptr [g_101CE7F0]
    cmp cmp dword ptr [eax + 8], 1
    jne sub_1003A201
    mov mov esi, dword ptr [g_101D1B10]
    mov mov dword ptr [esp + 68], esi
    mov mov byte ptr [esp + 16], 1
    jmp sub_1003A212
    mov mov ecx, dword ptr [ecx + 28]
    push push ecx
    push push esi
    call sub_1002CC7A
    add add esp, 8
    mov mov byte ptr [esp + 16], 6
    mov mov edx, dword ptr [esp + 16]
    push push edx
    mov mov eax, esi
    mov mov edi, ebp
    call sub_1003DCD0
    mov mov eax, dword ptr [esp + 68]
    mov mov al, byte ptr [eax + ebp + 9]
    mov mov cl, byte ptr [ebp + 010766715h]
L14:
    add add esp, 4
    cmp cmp cl, al
    mov mov byte ptr [esp + 24], al
    jne sub_1003A276
    cmp cmp al, 2
    jne sub_1003A288
    mov mov ecx, dword ptr [esp + 24]
    push push ecx
    push push ebp
    call sub_1003D868
    add add esp, 8
    inc inc ebp
    add add ebx, 8
    cmp cmp ebp, 2
    mov mov dword ptr [esp + 20], ebx
    jl sub_1003A13C
    mov mov edi, dword ptr [esp + 64]
    xor xor esi, esi
    add add edi, 60
    mov mov ebx, 4
    mov mov ebp, 27
    nop nop
    mov mov eax, dword ptr [edi - 32]
    cmp cmp dword ptr [esi*4 + 010766694h], eax
    je sub_1003A332
    push push 0107666D4h
    push push eax
    mov mov dword ptr [esi*4 + 010766694h], eax
    push push esi
    lea lea eax, [esp + 36]
    mov mov dword ptr [esp + 36], 1
    mov mov dword ptr [esp + 40], 2
    mov mov dword ptr [esp + 44], 3
    mov mov dword ptr [esp + 48], 26
    call sub_1003D643
    add add esp, 12
    mov mov eax, dword ptr [edi]
    cmp cmp dword ptr [esi*4 + 0107666B4h], eax
    je sub_1003A3B4
    push push 0107666F4h
    push push eax
    mov mov dword ptr [esi*4 + 0107666B4h], eax
    push push esi
    lea lea eax, [esp + 52]
    mov mov dword ptr [esp + 52], ebx
    mov mov dword ptr [esp + 56], 5
L16:
    mov mov dword ptr [esp + 60], 6
    mov mov dword ptr [esp + 64], ebp
    call sub_1003D680
    add add esp, 12
    inc inc esi
    add add edi, ebx
    cmp cmp esi, 8
    jl sub_1003A36F
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
FUN_10039b40 ENDP
END
