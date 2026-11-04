.686
.MODEL FLAT, C
EXTRN sub_100670B9:PROC
EXTRN sub_1009EBA8:PROC
EXTRN sub_100F7907:PROC
EXTRN sub_100F7C5D:PROC
EXTRN sub_100F831C:PROC
EXTRN sub_100F8339:PROC
EXTRN sub_100F8356:PROC
.CODE
FUN_1009f7dc PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push ebx
    push esi
    mov ebx, ecx
    push edi
    mov dword ptr [ebp - 4], ebx
    lea esi, [ebx + 32]
L0:
    mov ecx, dword ptr [ebx + 4]
    push esi
    call sub_100670B9
    test eax, eax
    jge L2
    mov dword ptr [ebx + 64], 1
    or eax, 0FFFFFFFFh
L1:
    pop edi
    pop esi
    pop ebx
    leave
    ret
L2:
    mov eax, dword ptr [esi]
    cmp eax, 13
    ja L0
    jmp dword ptr [eax*4 + 0x100a02a3]
    mov cl, byte ptr [ebx + 41]
    test cl, cl
    jne L3
    movsx eax, byte ptr [ebx + 40]
    jmp L1
L3:
    cmp byte ptr [ebx + 42], 0
    jne L62
    cmp cl, 61
    jne L12
    movsx eax, byte ptr [ebx + 40]
    cmp eax, 45
    jg L8
    je L7
    sub eax, 33
    je L6
    sub eax, 4
    je L5
    sub eax, 5
    je L4
    dec eax
    jne L62
    mov eax, 000000145h
    jmp L1
L4:
    mov eax, 000000142h
    jmp L1
L5:
    mov eax, 000000144h
    jmp L1
L6:
    mov eax, 00000013Fh
    jmp L1
L7:
    mov eax, 000000146h
    jmp L1
L8:
    sub eax, 47
    je L11
    sub eax, 13
    je L10
    dec eax
    je L9
    dec eax
    jne L62
    mov eax, 00000013Dh
    jmp L1
L9:
    mov eax, 00000013Eh
    jmp L1
L10:
    mov eax, 00000013Ch
    jmp L1
L11:
    mov eax, 000000143h
    jmp L1
L12:
    mov al, byte ptr [ebx + 40]
    cmp al, cl
    jne L62
    movsx eax, al
    sub eax, 38
    je L15
    sub eax, 5
    je L14
    dec eax
    dec eax
    je L13
    sub eax, 79
    jne L62
    mov eax, 000000141h
    jmp L1
L13:
    mov eax, 00000013Bh
    jmp L1
L14:
    mov eax, 00000013Ah
    jmp L1
L15:
    mov eax, 000000140h
    jmp L1
    mov eax, 000000147h
    jmp L1
    mov eax, 000000148h
    jmp L1
    mov eax, 000000149h
    jmp L1
    mov eax, 00000014Ah
    jmp L1
    mov eax, 00000014Bh
    jmp L1
    mov eax, 00000014Ch
    jmp L1
    mov eax, 00000014Dh
    jmp L1
    mov eax, dword ptr [ebx + 40]
    movsx ecx, byte ptr [eax]
    mov dword ptr [ebp - 8], ecx
    add ecx, -97
    cmp ecx, 22
    ja L26
    jmp dword ptr [ecx*4 + 0x100a02db]
    push 5
    mov edi, 010193094h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L62
    mov esi, eax
    push 13
    mov edi, 010115020h
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L26
    mov eax, 000000102h
    jmp L1
    push 5
    mov edi, 010114858h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L16
    mov eax, 000000103h
    jmp L1
L16:
    mov edi, 01010EA80h
L17:
    push 6
L18:
    mov esi, eax
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L26
    jmp L62
    push 5
    mov edi, 010115018h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L62
    push 6
    mov edi, 010115010h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L62
    push 5
    mov edi, 010115008h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L62
    push 6
    mov edi, 010115000h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L62
    push 13
    mov edi, 01010C6F0h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L19
    mov eax, 000000104h
    jmp L1
L19:
    push 8
    mov edi, 010114FF8h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L20
    mov eax, 000000105h
    jmp L1
L20:
    push 17
    mov edi, 010114FE4h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L21
    mov eax, 000000106h
    jmp L1
L21:
    push 6
    mov edi, 010114FDCh
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L22
    mov eax, 000000107h
    jmp L1
L22:
    push 11
    mov edi, 010114FD0h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L62
    mov edi, 010114FC4h
    jmp L38
    push 8
    mov edi, 010192F58h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L62
    push 7
    pop edx
    mov edi, 010114FBCh
    mov esi, eax
    mov ecx, edx
    xor ebx, ebx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L62
    push 8
    mov edi, 010114FB4h
    mov esi, eax
    pop ecx
    xor ebx, ebx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L23
    mov eax, 000000109h
    jmp L1
L23:
    push 3
    mov edi, 010114FB0h
    mov esi, eax
    pop ecx
    xor ebx, ebx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L24
    mov eax, 00000010Bh
    jmp L1
L24:
    mov ecx, edx
    mov edi, 01011483Ch
    mov esi, eax
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L25
    mov eax, 00000010Ah
    jmp L1
L25:
    mov esi, eax
    push 13
    mov edi, 010114FA0h
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L62
    mov ebx, dword ptr [ebp - 4]
L26:
    push dword ptr [ebp - 8]
    call sub_100F7907
    cmp eax, 97
    pop ecx
    je L68
    cmp eax, 100
    je L67
    cmp eax, 112
    je L66
    cmp eax, 116
    jne L69
    push 010114F94h
    push dword ptr [ebx + 40]
    call sub_100F7C5D
    test eax, eax
    pop ecx
    pop ecx
    jne L69
    mov eax, 00000012Bh
    jmp L1
    push 5
    mov edi, 01010C894h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L27
    mov eax, 00000010Ch
    jmp L1
L27:
    push 5
    mov edi, 010114F8Ch
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L62
    push 9
    mov edi, 010114F80h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L62
    mov esi, eax
    push 7
    mov edi, 010114F78h
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L26
    mov eax, 00000010Dh
    jmp L1
    push 6
    mov edi, 0101983FCh
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L28
    mov eax, 00000010Eh
    jmp L1
L28:
    push 6
    mov edi, 010114844h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L29
    mov eax, 00000010Fh
    jmp L1
L29:
    push 4
    mov edi, 010114F74h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L30
    mov eax, 000000110h
    jmp L1
L30:
    mov edi, 010114F6Ch
    push 7
    jmp L18
    mov edi, 010114F64h
    jmp L35
    mov esi, eax
    push 5
    mov edi, 01011484Ch
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L26
    mov eax, 000000111h
    jmp L1
    push 3
    mov edi, 01010C8BCh
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L31
    mov eax, 000000112h
    jmp L1
L31:
    push 3
    mov edi, 010114F60h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L32
    mov eax, 000000113h
    jmp L1
L32:
    push 7
    mov edi, 010114F58h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L33
    mov eax, 000000114h
    jmp L1
L33:
    push 6
    mov edi, 010114F50h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L34
    mov eax, 000000115h
    jmp L1
L34:
    mov esi, eax
    push 4
    mov edi, 010114854h
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L26
    mov eax, 000000116h
    jmp L1
    mov edi, 010114F48h
L35:
    push 5
    jmp L18
    push 7
    mov edi, 010114BD4h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L36
    mov eax, 000000117h
    jmp L1
L36:
    mov edi, 010114F40h
    push 8
    jmp L18
    push 10
    mov edi, 010114F34h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L62
    mov edi, 010114F30h
    push 4
    jmp L18
    push 4
    mov edi, 010114F2Ch
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L37
    mov eax, 000000118h
    jmp L1
L37:
    mov edi, 010114F20h
L38:
    push 9
    jmp L18
    push 14
    mov edi, 0101147A0h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L39
    mov eax, 00000011Ah
    jmp L1
L39:
    push 8
    mov edi, 010114F18h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L62
    push 10
    mov edi, 010114F0Ch
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L62
    push 7
    mov edi, 010114F04h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L62
    cmp dword ptr [ebx + 72], edx
    je L26
    mov esi, eax
    push 12
    mov edi, 0101147C0h
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L26
    mov eax, 00000011Bh
    jmp L1
    push 9
    mov edi, 010114EF8h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L40
    mov eax, 00000011Ch
    jmp L1
L40:
    push 17
    mov edi, 010114EE4h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L62
    push 10
    mov edi, 01010C700h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L41
    mov eax, 00000011Eh
    jmp L1
L41:
    mov esi, eax
    push 7
    mov edi, 010114EDCh
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L26
    mov eax, 00000011Dh
    jmp L1
    push 10
    mov edi, 0101147F0h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L42
    mov eax, 000000120h
    jmp L1
L42:
    push 10
    mov edi, 0101147E4h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L43
    mov eax, 000000121h
    jmp L1
L43:
    push 10
    mov edi, 0101147D8h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L44
    mov eax, 000000122h
    jmp L1
L44:
    push 12
    mov edi, 0101147CCh
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L45
    mov eax, 000000123h
    jmp L1
L45:
    push 14
    mov edi, 010114ECCh
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L46
    mov eax, 000000124h
    jmp L1
L46:
    push 7
    pop edx
    mov edi, 010114EC4h
    mov esi, eax
    mov ecx, edx
    xor ebx, ebx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L47
    mov eax, 000000125h
    jmp L1
L47:
    push 6
    mov edi, 010114EBCh
    mov esi, eax
    pop ecx
    xor ebx, ebx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L62
    mov edi, 010114EB4h
    mov esi, eax
    mov ecx, edx
    xor ebx, ebx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L62
    mov edi, 010114EACh
    mov esi, eax
    mov ecx, edx
    xor ebx, ebx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L62
    push 17
    mov edi, 010114E98h
    mov esi, eax
    pop ecx
    xor ebx, ebx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L48
    mov eax, 000000127h
    jmp L1
L48:
    mov edi, 01019760Ch
    mov esi, eax
    mov ecx, edx
    xor ebx, ebx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L49
    mov eax, 000000128h
    jmp L1
L49:
    push 12
    mov edi, 010114E8Ch
    mov esi, eax
    pop ecx
    xor ebx, ebx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L62
    mov edi, 01011482Ch
    mov esi, eax
    mov ecx, edx
    xor ebx, ebx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L50
    mov eax, 000000129h
    jmp L1
L50:
    mov edi, 010114E84h
    mov esi, eax
    mov ecx, edx
    xor ebx, ebx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L51
    mov eax, 00000012Ah
    jmp L1
L51:
    mov ecx, edx
    mov edi, 010114E7Ch
    mov esi, eax
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L62
    mov ebx, dword ptr [ebp - 4]
    cmp dword ptr [ebx + 72], edx
    je L26
    push 8
    mov edi, 01019558Ch
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L52
    mov eax, 00000011Fh
    jmp L1
L52:
    mov esi, eax
    push 11
    mov edi, 010114784h
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L26
    mov eax, 000000126h
    jmp L1
    push 9
    mov edi, 010114E70h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L62
    push 10
    mov edi, 010114820h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L53
    mov eax, 00000012Dh
    jmp L1
L53:
    push 10
    mov edi, 010114814h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L54
    mov eax, 00000012Eh
    jmp L1
L54:
    push 10
    mov edi, 010114808h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L55
    mov eax, 00000012Fh
    jmp L1
L55:
    push 12
    mov edi, 0101147FCh
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L56
    mov eax, 000000130h
    jmp L1
L56:
    push 5
    mov edi, 010114E68h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L62
    push 6
    mov edi, 010114E60h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L62
    push 5
    mov edi, 010198404h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L57
    mov eax, 000000131h
    jmp L1
L57:
    push 4
    mov edi, 010114E5Ch
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L62
    push 8
    mov edi, 010114E54h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L58
    mov eax, 000000132h
    jmp L1
L58:
    push 9
    mov edi, 010114E48h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L62
    cmp dword ptr [ebx + 72], edx
    je L26
    mov esi, eax
    push 8
    mov edi, 0101950A0h
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L26
    mov eax, 00000012Ch
    jmp L1
    push 8
    mov edi, 010114E40h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L59
    mov eax, 000000133h
    jmp L1
L59:
    push 6
    mov edi, 010114E38h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L62
    push 9
    mov edi, 010114E2Ch
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L62
    mov edi, 010114E24h
    jmp L17
    push 7
    mov edi, 010114BDCh
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L60
    mov eax, 000000134h
    jmp L1
L60:
    push 15
    mov edi, 010114790h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L61
    mov eax, 000000135h
    jmp L1
L61:
    push 8
    mov edi, 010114E1Ch
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L63
L62:
    mov eax, 000000151h
    jmp L1
L63:
    push 5
    mov edi, 010114870h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L64
    mov eax, 000000137h
    jmp L1
L64:
    push 9
    mov edi, 010114E10h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L65
    mov eax, 000000138h
    jmp L1
L65:
    cmp dword ptr [ebx + 72], 0
    je L26
    mov esi, eax
    push 13
    mov edi, 0101147B0h
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L26
    mov eax, 000000136h
    jmp L1
    mov esi, eax
    push 6
    mov edi, 010114E08h
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L26
    mov eax, 000000139h
    jmp L1
L66:
    push 010114B84h
    push dword ptr [ebx + 40]
    call sub_100F831C
    test eax, eax
    pop ecx
    pop ecx
    jne L69
    mov eax, 000000119h
    jmp L1
L67:
    push 010114E00h
    push dword ptr [ebx + 40]
    call sub_100F8339
    test eax, eax
    pop ecx
    pop ecx
    jne L69
    mov eax, 000000108h
    jmp L1
L68:
    push 010114DFCh
    push dword ptr [ebx + 40]
    call sub_100F8356
    test eax, eax
    pop ecx
    pop ecx
    jne L69
    mov eax, 000000101h
    jmp L1
L69:
    xor eax, eax
    push eax
    push eax
    push eax
    push dword ptr [ebx + 16]
    lea ecx, [ebx + 32]
    push eax
    push eax
    push ecx
    push eax
    mov ecx, ebx
    call sub_1009EBA8
    neg eax
    sbb eax, eax
    neg eax
    add eax, 00000014Fh
    jmp L1
    mov eax, 00000014Eh
    jmp L1
FUN_1009f7dc ENDP
END
