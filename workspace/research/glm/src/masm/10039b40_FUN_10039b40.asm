.686
.MODEL FLAT, C
EXTRN sub_1002CC7A:PROC
EXTRN sub_10034D3A:PROC
EXTRN sub_100387A1:PROC
EXTRN sub_10038BF6:PROC
EXTRN sub_10039693:PROC
EXTRN sub_10039BF1:PROC
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
EXTRN g_101CE700:DWORD
EXTRN g_101CE7A0:DWORD
EXTRN g_101CE7EC:DWORD
EXTRN g_101CE7F0:DWORD
EXTRN g_101D1B08:DWORD
EXTRN g_101D1B0C:DWORD
EXTRN g_101D1B10:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_1072D9BC:DWORD
EXTRN g_1072DEBD:DWORD
EXTRN g_10764584:DWORD
EXTRN g_10766680:DWORD
EXTRN g_10766684:DWORD
EXTRN g_10766714:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_10039b40 PROC
    sub esp, 44
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 56]
    mov ecx, dword ptr [ebp]
    push esi
    mov esi, eax
    push edi
    lea eax, [esp + 24]
    push eax
    mov eax, dword ptr [g_1072D9BC]
    push ecx
    add eax, 44
    call sub_10039693
    mov edi, dword ptr [esp + 32]
    add esp, 8
    test esi, esi
    je L0
    mov ebx, dword ptr [esi]
    mov ecx, dword ptr [esi + 4]
    mov edx, dword ptr [esi + 8]
    mov eax, dword ptr [esi + 12]
    and edi, ebx
    mov ebx, dword ptr [esp + 28]
    and ebx, ecx
    or edi, edx
    or ebx, eax
    mov dword ptr [esp + 28], ebx
    jmp L1
L0:
    mov ebx, dword ptr [esp + 28]
L1:
    mov al, byte ptr [g_1072DEBD]
    test al, al
    je L2
    mov eax, dword ptr [esp + 28]
    and eax, 0FFFFFFCFh
    mov dword ptr [esp + 28], eax
    mov ebx, eax
L2:
    mov edx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L5
    mov ecx, dword ptr [g_10764584]
    test ecx, ecx
    setne al
    test al, al
    je L3
    push 010198A6Ch
    push 010193358h
    push ecx
    call sub_100F6D9A
    mov eax, dword ptr [g_10764584]
    add esp, 12
    push eax
    call sub_100F6CE0
    add esp, 4
L3:
    mov ecx, dword ptr [ebp]
    mov edx, dword ptr [ecx]
    push edx
    push 010198AC4h
    call sub_10060D26
    mov ecx, dword ptr [g_101CE7EC]
    mov edx, dword ptr [ecx + 8]
    add esp, 8
    test edx, edx
    je L4
    mov ecx, dword ptr [g_10764584]
    test ecx, ecx
    setne dl
    test dl, dl
    je L4
    push eax
    push 010193358h
    push ecx
    call sub_100F6DE6
    mov edx, dword ptr [g_10764584]
    add esp, 12
    push edx
    call sub_100F6D2D
    add esp, 4
L4:
    mov eax, dword ptr [esp + 28]
    push eax
    mov eax, dword ptr [g_1072D9BC]
    mov ecx, dword ptr [eax + 48]
    mov edx, dword ptr [eax + 44]
    push edi
    push ecx
    push edx
    push 010198A88h
    call sub_10060D80
    mov ecx, dword ptr [g_101CE7EC]
    mov edx, dword ptr [ecx + 8]
    add esp, 20
    test edx, edx
    je L5
    mov ecx, dword ptr [g_10764584]
    test ecx, ecx
    setne dl
    test dl, dl
    je L5
    push eax
    push 010193358h
    push ecx
    call sub_100F6E40
    mov edx, dword ptr [g_10764584]
    add esp, 12
    push edx
    call sub_100F6D87
    add esp, 4
L5:
    cmp edi, dword ptr [g_10766680]
    je L6
    push edi
    call sub_1003C58B
    add esp, 4
    mov dword ptr [g_10766680], edi
L6:
    cmp ebx, dword ptr [g_10766684]
    je L7
    push ebx
    call sub_1003CDD2
    add esp, 4
    mov dword ptr [g_10766684], ebx
L7:
    mov al, byte ptr [ebp + 8]
    neg al
    sbb eax, eax
    and eax, 2
    call sub_10034D3A
    mov al, byte ptr [ebp + 4]
    cmp al, byte ptr [g_10766714]
    je L10
L8:
    mov ecx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [ecx + 8]
    test eax, eax
    je L9
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L9
    push 010198A20h
    push 010193358h
    push eax
    call sub_100F6EC5
    mov edx, dword ptr [g_10764584]
    add esp, 12
    push edx
    call sub_100F6E0C
    add esp, 4
L9:
    mov bl, byte ptr [ebp + 4]
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    xor edx, edx
    test bl, bl
    setne dl
    push edx
    push 000000089h
    push eax
    call dword ptr [ecx + 0xe4]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L8
    mov al, byte ptr [ebp + 4]
    mov byte ptr [g_10766714], al
L10:
    mov ecx, dword ptr [esp + 68]
    mov esi, dword ptr [ecx*4 + 0101906A0h]
    call sub_100387A1
    mov al, byte ptr [ebp + 7]
    test al, al
    je L11
    lea esi, [esp + 68]
    call sub_10039BF1
    mov esi, dword ptr [esp + 68]
    jmp L12
L11:
    or esi, 0FFFFFFFFh
L12:
    call sub_1003D67F
    mov ebx, dword ptr [esp + 64]
    mov esi, dword ptr [esp + 68]
    xor ebp, ebp
    add ebx, 16
    mov dword ptr [esp + 20], ebx
L13:
    cmp word ptr [ebx - 4], 3
    jne L14
    mov ebx, dword ptr [ebx]
    lea edi, [esp + 16]
    lea esi, [esp + 68]
    call sub_10038BF6
    mov esi, dword ptr [esp + 68]
    mov ebx, dword ptr [esp + 20]
    jmp L21
L14:
    mov eax, dword ptr [g_1072D9BC]
    movzx edx, word ptr [eax + 52]
    mov edi, dword ptr [ebx]
    xor ecx, ecx
    test edx, edx
    jle L21
    mov eax, dword ptr [eax + 60]
    jmp L15
    lea ecx, [ecx]
L15:
    cmp edi, dword ptr [eax]
    je L16
    inc ecx
    add eax, 12
    cmp ecx, edx
    jl L15
    jmp L21
L16:
    mov dl, byte ptr [eax + 5]
    cmp dl, 5
    mov ecx, dword ptr [eax + 8]
    jne L17
    mov esi, dword ptr [ecx + 28]
    mov esi, dword ptr [esi + 64]
    jmp L18
L17:
    mov esi, ecx
L18:
    mov al, byte ptr [eax + 4]
    mov byte ptr [esp + 16], al
    cmp dword ptr [esi], 3
    mov dword ptr [esp + 68], esi
    jne L21
    movzx eax, dl
    cmp eax, 5
    ja L21
    jmp dword ptr [eax*4 + 0x10039fa8]
    mov ecx, dword ptr [g_101CE7A0]
    mov eax, dword ptr [ecx + 8]
    test eax, eax
    je L21
    mov ecx, 1
    cmp eax, ecx
    jne L19
    mov esi, dword ptr [g_101D1B08]
    mov dword ptr [esp + 68], esi
    mov byte ptr [esp + 16], cl
    jmp L21
L19:
    cmp eax, 2
    jne L21
    mov esi, dword ptr [g_101D1B0C]
    mov dword ptr [esp + 68], esi
    mov byte ptr [esp + 16], cl
    jmp L21
    mov edx, dword ptr [g_101CE700]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L21
    cmp eax, 1
    jne L20
    mov esi, dword ptr [g_101D1B08]
    mov dword ptr [esp + 68], esi
    mov byte ptr [esp + 16], al
    jmp L21
L20:
    cmp eax, 2
    jne L21
    mov esi, dword ptr [g_101D1B0C]
    mov dword ptr [esp + 68], esi
    mov byte ptr [esp + 16], 1
    jmp L21
    mov eax, dword ptr [g_101CE7F0]
    cmp dword ptr [eax + 8], 1
    jne L21
    mov esi, dword ptr [g_101D1B10]
    mov dword ptr [esp + 68], esi
    mov byte ptr [esp + 16], 1
    jmp L21
    mov ecx, dword ptr [ecx + 28]
    push ecx
    push esi
    call sub_1002CC7A
    add esp, 8
    mov byte ptr [esp + 16], 6
L21:
    mov edx, dword ptr [esp + 16]
    push edx
    mov eax, esi
    mov edi, ebp
    call sub_1003DCD0
    mov eax, dword ptr [esp + 68]
    mov al, byte ptr [eax + ebp + 9]
    mov cl, byte ptr [ebp + 010766715h]
    add esp, 4
    cmp cl, al
    mov byte ptr [esp + 24], al
    jne L22
    cmp al, 2
    jne L23
L22:
    mov ecx, dword ptr [esp + 24]
    push ecx
    push ebp
    call sub_1003D868
    add esp, 8
L23:
    inc ebp
    add ebx, 8
    cmp ebp, 2
    mov dword ptr [esp + 20], ebx
    jl L13
    mov edi, dword ptr [esp + 64]
    xor esi, esi
    add edi, 60
    mov ebx, 4
    mov ebp, 27
    nop
L24:
    mov eax, dword ptr [edi - 32]
    cmp dword ptr [esi*4 + 010766694h], eax
    je L25
    push 0107666D4h
    push eax
    mov dword ptr [esi*4 + 010766694h], eax
    push esi
    lea eax, [esp + 36]
    mov dword ptr [esp + 36], 1
    mov dword ptr [esp + 40], 2
    mov dword ptr [esp + 44], 3
    mov dword ptr [esp + 48], 26
    call sub_1003D643
    add esp, 12
L25:
    mov eax, dword ptr [edi]
    cmp dword ptr [esi*4 + 0107666B4h], eax
    je L26
    push 0107666F4h
    push eax
    mov dword ptr [esi*4 + 0107666B4h], eax
    push esi
    lea eax, [esp + 52]
    mov dword ptr [esp + 52], ebx
    mov dword ptr [esp + 56], 5
    mov dword ptr [esp + 60], 6
    mov dword ptr [esp + 64], ebp
    call sub_1003D680
    add esp, 12
L26:
    inc esi
    add edi, ebx
    cmp esi, 8
    jl L24
    pop edi
    pop esi
    pop ebp
    pop ebx
FUN_10039b40 ENDP
END
