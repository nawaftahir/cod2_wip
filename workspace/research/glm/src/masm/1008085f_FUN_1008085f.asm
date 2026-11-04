.686
.MODEL FLAT, C
EXTRN sub_1007DAD6:PROC
EXTRN sub_1007E56D:PROC
EXTRN sub_10080D75:PROC
EXTRN sub_100F7AC0:PROC
.CODE
FUN_1008085f PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + 16]
    mov ecx, dword ptr [eax + 8]
    push ebx
    push esi
    mov esi, dword ptr [ebp + 16]
    mov eax, 0FFFF0000h
    push edi
    xor ebx, ebx
    xor edi, edi
    and ecx, eax
    cmp word ptr [esi + 10], bx
    jne L25
    cmp ecx, 054580000h
    je L21
    cmp ecx, 0FFFE0000h
    je L9
    cmp ecx, eax
    jne L30
    mov eax, dword ptr [ebp + 12]
    movzx eax, word ptr [eax + 4]
    sub eax, ebx
    je L5
    dec eax
    je L2
    dec eax
    jne L30
    movzx eax, word ptr [esi + 2]
    sub eax, ebx
    je L1
    dec eax
    je L0
    dec eax
    jne L26
    mov edi, 01007DD80h
    jmp L30
L0:
    mov edi, 01007DD36h
    jmp L30
L1:
    mov edi, 01007DD18h
    jmp L30
L2:
    movzx eax, word ptr [esi + 2]
    sub eax, ebx
    je L4
    dec eax
    je L3
    dec eax
    je L27
    dec eax
    jne L30
    mov edi, 01007DCB2h
    jmp L30
L3:
    mov edi, 01007DC50h
    jmp L30
L4:
    mov edi, 01007DC32h
    jmp L30
L5:
    movzx eax, word ptr [esi + 2]
    sub eax, ebx
    je L8
    dec eax
    je L7
    dec eax
    je L6
    dec eax
    jne L30
    mov edi, 01007E647h
    jmp L30
L6:
    mov edi, 01007E606h
    jmp L30
L7:
    mov edi, 01007E5E8h
    jmp L30
L8:
    mov edi, 01007E5CAh
    jmp L30
L9:
    mov eax, dword ptr [ebp + 12]
    movzx eax, word ptr [eax + 4]
    sub eax, ebx
    je L18
    dec eax
    je L14
    dec eax
    jne L30
    movzx eax, word ptr [esi + 2]
    sub eax, ebx
    je L13
    dec eax
    je L12
    dec eax
    je L11
L10:
    dec eax
    jne L30
    mov edi, 01007E5ACh
    jmp L30
L11:
    mov edi, 01007E571h
    jmp L30
L12:
    mov edi, 01007E527h
    jmp L30
L13:
    mov edi, 01007E509h
    jmp L30
L14:
    movzx eax, word ptr [esi + 2]
    sub eax, ebx
    je L17
    dec eax
    je L16
    dec eax
    je L15
    dec eax
    jne L30
    mov edi, 01007E4A3h
    jmp L30
L15:
    mov edi, 01007E485h
    jmp L30
L16:
    mov edi, 01007E441h
    jmp L30
L17:
    mov edi, 01007E423h
    jmp L30
L18:
    movzx eax, word ptr [esi + 2]
    sub eax, ebx
    je L20
    dec eax
    je L29
    dec eax
    je L19
    dec eax
    jne L30
    mov edi, 01007E3D1h
    jmp L30
L19:
    mov edi, 01007E390h
    jmp L30
L20:
    mov edi, 01007E354h
    jmp L30
L21:
    mov eax, dword ptr [ebp + 12]
    movzx eax, word ptr [eax + 4]
    dec eax
    dec eax
    jne L30
    movzx eax, word ptr [esi + 2]
    sub eax, ebx
    je L24
    dec eax
    je L23
    dec eax
    je L22
    dec eax
    jne L30
    mov edi, 01007DED0h
    jmp L30
L22:
    mov edi, 01007DE7Ah
    jmp L30
L23:
    mov edi, 01007DE16h
    jmp L30
L24:
    mov edi, 01007DDD9h
    jmp L30
L25:
    cmp ecx, 0FFFE0000h
    je L28
    cmp ecx, eax
    jne L30
    mov eax, dword ptr [ebp + 12]
    movzx eax, word ptr [eax + 4]
    sub eax, ebx
    je L7
    dec eax
    je L27
L26:
    dec eax
    jne L30
    mov edi, 01007DDBBh
    jmp L30
L27:
    mov edi, 01007DC94h
    jmp L30
L28:
    mov eax, dword ptr [ebp + 12]
    movzx eax, word ptr [eax + 4]
    sub eax, ebx
    je L29
    dec eax
    je L15
    jmp L10
L29:
    mov edi, 01007E372h
L30:
    push 68
    call sub_100F7AC0
    cmp eax, ebx
    pop ecx
    je L31
    push dword ptr [ebp + 20]
    mov ecx, eax
    push edi
    push esi
    push dword ptr [ebp + 12]
    push dword ptr [ebp + 8]
    call sub_1007DAD6
    mov esi, eax
    jmp L32
L31:
    xor esi, esi
L32:
    cmp esi, ebx
    je L33
    mov ecx, esi
    call sub_10080D75
    test eax, eax
    jge L34
    push 1
    mov ecx, esi
    call sub_1007E56D
L33:
    xor eax, eax
    jmp L35
L34:
    mov eax, esi
L35:
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 16
FUN_1008085f ENDP
END
