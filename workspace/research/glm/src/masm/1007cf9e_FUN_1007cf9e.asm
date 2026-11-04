.686
.MODEL FLAT, C
EXTRN sub_1006387E:PROC
EXTRN sub_1006390D:PROC
EXTRN sub_10063D09:PROC
EXTRN sub_1006DCE2:PROC
EXTRN sub_1006DDC1:PROC
EXTRN sub_1006DE25:PROC
EXTRN sub_1006DFAA:PROC
EXTRN sub_1006E060:PROC
EXTRN sub_1006E075:PROC
EXTRN sub_1006E098:PROC
EXTRN sub_1006E0C2:PROC
EXTRN sub_1007AE73:PROC
EXTRN sub_1007B89C:PROC
EXTRN sub_1007D26D:PROC
EXTRN sub_10082665:PROC
EXTRN sub_10082B81:PROC
EXTRN sub_10085B8F:PROC
EXTRN sub_10085CBD:PROC
EXTRN sub_10086105:PROC
EXTRN sub_10086236:PROC
EXTRN sub_100996BE:PROC
EXTRN sub_1009AE20:PROC
EXTRN sub_100A4B59:PROC
EXTRN sub_100A4BC9:PROC
EXTRN sub_100A7116:PROC
EXTRN sub_100B2EAE:PROC
EXTRN sub_100B5E59:PROC
EXTRN sub_100B86D8:PROC
EXTRN sub_100B884B:PROC
EXTRN sub_100F78C8:PROC
EXTRN sub_100F7944:PROC
EXTRN sub_100F7A88:PROC
EXTRN sub_100F7AB3:PROC
EXTRN sub_100F7AFD:PROC
EXTRN sub_100F7B1E:PROC
EXTRN sub_100F7B49:PROC
EXTRN sub_100F7BFD:PROC
EXTRN sub_100F7D33:PROC
.CODE
FUN_1007cf9e PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 000000094h
    push ebx
    push esi
    push edi
    push 000010000h
    mov esi, ecx
    push 000100000h
    lea ecx, [ebp - 52]
    call sub_10082665
    mov ebx, dword ptr [ebp + 40]
    xor edi, edi
    test ebx, 0FFFFF800h
    mov dword ptr [ebp - 8], edi
    mov dword ptr [ebp - 12], edi
    je L1
L0:
    mov ebx, 08876086Ch
    jmp L45
L1:
    cmp dword ptr [ebp + 12], edi
    je L2
    test bl, 24
    jne L0
L2:
    cmp dword ptr [ebp + 44], edi
    je L0
    mov ecx, dword ptr [esi + 8]
    cmp ecx, edi
    je L3
    mov eax, dword ptr [ecx]
    push 1
    call dword ptr [eax]
L3:
    push dword ptr [esi + 24]
    call sub_100F78C8
    mov eax, dword ptr [ebp + 8]
    or dword ptr [esi + 72], 0FFFFFFFFh
    cmp dword ptr [ebp + 24], edi
    pop ecx
    mov ecx, dword ptr [ebp + 32]
    mov dword ptr [esi], eax
    mov eax, dword ptr [ebp + 36]
    mov dword ptr [esi + 4], edi
    mov dword ptr [esi + 8], edi
    mov dword ptr [esi + 24], edi
    mov dword ptr [esi + 28], edi
    mov dword ptr [esi + 76], edi
    mov dword ptr [esi + 80], edi
    mov dword ptr [esi + 84], edi
    mov dword ptr [esi + 88], edi
    mov dword ptr [esi + 92], edi
    mov dword ptr [esi + 96], edi
    mov dword ptr [esi + 100], edi
    mov dword ptr [esi + 12], eax
    mov dword ptr [esi + 20], ebx
    mov dword ptr [esi + 56], edi
    mov dword ptr [esi + 60], edi
    mov dword ptr [esi + 64], edi
    mov dword ptr [esi + 68], edi
    mov dword ptr [esi + 104], edi
    mov dword ptr [esi + 108], edi
    mov dword ptr [esi + 112], edi
    mov dword ptr [esi + 116], edi
    mov dword ptr [esi + 120], edi
    mov dword ptr [esi + 124], edi
    mov dword ptr [esi + 000000080h], edi
    mov dword ptr [esi + 000000084h], ecx
    je L6
    push 0000001FCh
    mov dword ptr [esi + 16], 046580200h
    call sub_100F7944
    cmp eax, edi
    pop ecx
    je L4
    mov ecx, eax
    call sub_100B86D8
    jmp L5
L4:
    xor eax, eax
L5:
    or byte ptr [esi + 21], 1
    jmp L25
L6:
    test bl, 0000000C0h
    je L12
    lea ecx, [ebp - 28]
    push ecx
    push 2
    push eax
    call sub_1006387E
    test eax, eax
    jge L8
L7:
    push dword ptr [esi + 12]
    push 01010FCA4h
    push 000000DB2h
    push edi
    push esi
    call sub_1006DDC1
    add esp, 20
    jmp L0
L8:
    mov eax, dword ptr [ebp - 24]
    mov ecx, eax
    mov edx, 0FFFF0000h
    and ecx, edx
    cmp ecx, 0FFFE0000h
    je L10
    cmp ecx, edx
    jne L12
    test bl, bl
    jns L12
    and eax, 00000FF00h
    or ebx, 5
    cmp eax, 000000300h
    jne L9
    mov dword ptr [esi + 12], 01010C4C0h
    jmp L12
L9:
    mov dword ptr [esi + 12], 01010C4D8h
    jmp L12
L10:
    test bl, 64
    je L12
    and eax, 00000FF00h
    or ebx, 5
    cmp eax, 000000300h
    jne L11
    mov dword ptr [esi + 12], 01010C430h
    jmp L12
L11:
    mov dword ptr [esi + 12], 01010C448h
L12:
    lea eax, [ebp - 28]
    push eax
    push 2
    push dword ptr [esi + 12]
    call sub_1006390D
    test eax, eax
    jl L7
    mov eax, dword ptr [ebp - 24]
    cmp eax, 0FFFE0100h
    mov dword ptr [esi + 16], eax
    mov dword ptr [esi + 20], ebx
    jne L13
    mov dword ptr [esi + 16], 0FFFE0101h
    mov dword ptr [ebp - 8], 1
L13:
    cmp dword ptr [esi + 16], 0FFFF0100h
    mov edx, 0FFFF0101h
    jne L14
    mov dword ptr [esi + 16], edx
    mov dword ptr [ebp - 12], 1
L14:
    mov eax, dword ptr [esi + 16]
    mov ecx, 0FFFE03FFh
    cmp eax, ecx
    ja L17
    je L23
    cmp eax, 054580100h
    je L16
    cmp eax, 0FFFE0101h
    je L15
    cmp eax, 0FFFE0200h
    je L15
    cmp eax, 0FFFE0202h
    je L15
    cmp eax, 0FFFE02FFh
    je L15
    cmp eax, 0FFFE0300h
    jmp L21
L15:
    push 0000001F8h
    call sub_100F7A88
    cmp eax, edi
    pop ecx
    je L24
    push dword ptr [ebp + 32]
    mov ecx, eax
    call sub_100B5E59
    jmp L25
L16:
    or ebx, 000000100h
    push 0000001FCh
    mov dword ptr [esi + 20], ebx
    call sub_100F7AB3
    cmp eax, edi
    pop ecx
    je L24
    mov ecx, eax
    call sub_100B884B
    jmp L25
L17:
    mov ecx, 0FFFF02FFh
    cmp eax, ecx
    ja L20
    je L18
    cmp eax, edx
    jb L22
    cmp eax, 0FFFF0104h
    jbe L19
    cmp eax, 0FFFF0200h
    je L18
    cmp eax, 0FFFF0201h
    jbe L22
    cmp eax, 0FFFF0203h
    ja L22
L18:
    push 00000022Ch
    call sub_100F7AFD
    cmp eax, edi
    pop ecx
    je L24
    push dword ptr [ebp + 32]
    mov ecx, eax
    call sub_100B2EAE
    jmp L25
L19:
    and ebx, 0FFFFFFFBh
    push 000000484h
    mov dword ptr [esi + 20], ebx
    call sub_100F7B1E
    cmp eax, edi
    pop ecx
    je L24
    mov ecx, eax
    call sub_100A7116
    jmp L25
L20:
    cmp eax, 0FFFF0300h
    je L23
    cmp eax, 0FFFF03FFh
L21:
    je L23
L22:
    mov dword ptr [esi + 8], edi
    jmp L26
L23:
    push 0000001F8h
    call sub_100F7B49
    cmp eax, edi
    pop ecx
    je L24
    push dword ptr [ebp + 32]
    mov ecx, eax
    call sub_100A4BC9
    jmp L25
L24:
    xor eax, eax
L25:
    mov dword ptr [esi + 8], eax
L26:
    cmp dword ptr [esi + 8], edi
    jne L28
L27:
    mov ebx, 08007000Eh
    jmp L45
L28:
    mov eax, dword ptr [ebp + 12]
    cmp eax, edi
    jne L29
    lea eax, [esi + 4]
    push eax
    mov eax, dword ptr [esi + 20]
    or eax, 080000000h
    push eax
    push dword ptr [esi]
    lea ecx, [ebp - 000000094h]
    call sub_100996BE
    mov ecx, eax
    call sub_100A4B59
    lea ecx, [ebp - 000000094h]
    mov ebx, eax
    call sub_1009AE20
    cmp ebx, edi
    jl L43
    jmp L30
L29:
    mov dword ptr [esi + 4], eax
L30:
    cmp dword ptr [ebp - 8], edi
    mov ebx, 000000DB1h
    je L31
    push 01010F738h
    push ebx
    push edi
    push esi
    call sub_1006E060
    add esp, 16
L31:
    cmp dword ptr [ebp - 12], edi
    je L32
    push 01010F70Ch
    push ebx
    push edi
    push esi
    call sub_1006E075
    add esp, 16
L32:
    lea ebx, [esi + 000000088h]
    cmp dword ptr [ebx], edi
    jne L33
    push 000004000h
    mov dword ptr [esi + 00000008Ch], 000001000h
    call sub_100F7BFD
    cmp eax, edi
    pop ecx
    mov dword ptr [ebx], eax
    je L27
L33:
    lea eax, [ebp - 52]
    push eax
    call sub_10086105
    lea eax, [ebp - 52]
    push eax
    call sub_10085B8F
    mov ecx, esi
    call sub_1007B89C
    mov ebx, eax
    cmp ebx, edi
    jl L43
    cmp dword ptr [ebp + 24], edi
    mov ecx, esi
    je L34
    push dword ptr [ebp + 24]
    call sub_1007D26D
    jmp L40
L34:
    cmp dword ptr [ebp + 16], edi
    je L36
    push dword ptr [ebp + 16]
    call sub_1006DCE2
    cmp eax, edi
    jne L35
    push dword ptr [ebp + 16]
    push 01010FC88h
    push 000000DADh
    push edi
    push esi
    call sub_1006E098
    add esp, 20
    jmp L37
L35:
    xor ecx, ecx
    jmp L39
L36:
    lea eax, [ebp + 16]
    push eax
    push dword ptr [ebp + 20]
    call sub_1006DE25
    cmp eax, edi
    jne L38
    push 01010FC68h
    push 000000DADh
    push edi
    push esi
    call sub_1006E0C2
    add esp, 16
L37:
    mov ebx, 080004005h
    jmp L43
L38:
    xor ecx, ecx
    inc ecx
L39:
    push ecx
    push 1
    push edi
    push dword ptr [ebp + 28]
    mov ecx, esi
    push eax
    push dword ptr [ebp + 16]
    call sub_1007AE73
L40:
    mov ebx, eax
    cmp ebx, edi
    jl L43
    cmp dword ptr [esi + 76], edi
    jne L37
    mov ecx, esi
    call sub_1006DFAA
    mov ebx, eax
    cmp ebx, edi
    jl L43
    mov ecx, dword ptr [esi + 8]
    mov eax, dword ptr [ecx]
    lea edx, [ebp - 4]
    push edx
    call dword ptr [eax + 8]
    mov ebx, eax
    cmp ebx, edi
    jl L43
    cmp dword ptr [ebp + 48], edi
    je L41
    lea eax, [ebp - 16]
    push eax
    mov eax, dword ptr [ebp - 4]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 0xc]
    push eax
    call sub_10063D09
    mov ebx, eax
    cmp ebx, edi
    jge L41
    mov eax, dword ptr [ebp - 4]
    cmp eax, edi
    je L43
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    mov dword ptr [ebp - 4], edi
    jmp L43
L41:
    mov eax, dword ptr [ebp - 4]
    mov ecx, dword ptr [ebp + 44]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [ebp + 48]
    cmp eax, edi
    je L42
    mov ecx, dword ptr [ebp - 16]
    mov dword ptr [eax], ecx
L42:
    xor ebx, ebx
L43:
    mov ecx, dword ptr [esi + 8]
    cmp ecx, edi
    mov dword ptr [esi + 4], edi
    je L44
    mov eax, dword ptr [ecx]
    push 1
    call dword ptr [eax]
L44:
    push dword ptr [esi + 24]
    mov dword ptr [esi + 8], edi
    call sub_100F7D33
    pop ecx
    push edi
    mov dword ptr [esi + 24], edi
    call sub_10086236
    push edi
    call sub_10085CBD
L45:
    lea ecx, [ebp - 52]
    call sub_10082B81
    pop edi
    pop esi
    mov eax, ebx
    pop ebx
    leave
    ret 44
FUN_1007cf9e ENDP
END
