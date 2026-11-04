.686
.MODEL FLAT, C
EXTRN sub_1007DAD6:PROC
EXTRN sub_1007E56D:PROC
EXTRN sub_10080AF7:PROC
EXTRN sub_10080B05:PROC
EXTRN sub_10080B0C:PROC
EXTRN sub_10080B28:PROC
EXTRN sub_10080B2B:PROC
EXTRN sub_10080B32:PROC
EXTRN sub_10080B3C:PROC
EXTRN sub_10080B43:PROC
EXTRN sub_10080B4A:PROC
EXTRN sub_10080B55:PROC
EXTRN sub_10080B5F:PROC
EXTRN sub_10080B69:PROC
EXTRN sub_10080B6C:PROC
EXTRN sub_10080B73:PROC
EXTRN sub_10080B88:PROC
EXTRN sub_10080B92:PROC
EXTRN sub_10080B9C:PROC
EXTRN sub_10080BA6:PROC
EXTRN sub_10080BB0:PROC
EXTRN sub_10080BBE:PROC
EXTRN sub_10080BC9:PROC
EXTRN sub_10080BD2:PROC
EXTRN sub_10080BDE:PROC
EXTRN sub_10080BE8:PROC
EXTRN sub_10080BF2:PROC
EXTRN sub_10080BFC:PROC
EXTRN sub_10080C06:PROC
EXTRN sub_10080C1B:PROC
EXTRN sub_10080C25:PROC
EXTRN sub_10080C2F:PROC
EXTRN sub_10080C33:PROC
EXTRN sub_10080C37:PROC
EXTRN sub_10080C39:PROC
EXTRN sub_10080C3B:PROC
EXTRN sub_10080C43:PROC
EXTRN sub_10080C4D:PROC
EXTRN sub_10080C5C:PROC
EXTRN sub_10080C66:PROC
EXTRN sub_10080C70:PROC
EXTRN sub_10080C7A:PROC
EXTRN sub_10080C85:PROC
EXTRN sub_10080C96:PROC
EXTRN sub_10080C9D:PROC
EXTRN sub_10080C9E:PROC
EXTRN sub_10080CA4:PROC
EXTRN sub_10080CAB:PROC
EXTRN sub_10080CAD:PROC
EXTRN sub_10080CB2:PROC
EXTRN sub_10080CBE:PROC
EXTRN sub_10080CD3:PROC
EXTRN sub_10080CDA:PROC
EXTRN sub_10080CE1:PROC
EXTRN sub_10080CE7:PROC
EXTRN sub_10080D2B:PROC
EXTRN sub_10080D43:PROC
EXTRN sub_10080D61:PROC
EXTRN sub_10080D70:PROC
EXTRN sub_10080D75:PROC
EXTRN sub_10080D7F:PROC
EXTRN sub_100F7AC0:PROC
.CODE
FUN_1008085f PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    mov mov eax, dword ptr [ebp + 8]
    mov mov eax, dword ptr [eax + 16]
    mov mov ecx, dword ptr [eax + 8]
    push push ebx
    push push esi
    mov mov esi, dword ptr [ebp + 16]
    mov mov eax, 0FFFF0000h
    push push edi
    xor xor ebx, ebx
    xor xor edi, edi
    and and ecx, eax
    cmp cmp word ptr [esi + 10], bx
    jne L11
    cmp cmp ecx, 054580000h
    je L10
    cmp cmp ecx, 0FFFE0000h
    je L4
    cmp cmp ecx, eax
    jne sub_10080AF7
    mov mov eax, dword ptr [ebp + 12]
    movzx movzx eax, word ptr [eax + 4]
    sub sub eax, ebx
    je L3
    dec dec eax
    je L1
    dec dec eax
    jne sub_10080B0C
    movzx movzx eax, word ptr [esi + 2]
    sub sub eax, ebx
    je L2
    dec dec eax
    je L0
    dec dec eax
    jne L16
    mov mov edi, 01007DD80h
    jmp sub_10080B28
    mov mov edi, 01007DD36h
    jmp sub_10080B32
    mov mov edi, 01007DD18h
    jmp sub_10080B3C
    movzx movzx eax, word ptr [esi + 2]
    sub sub eax, ebx
    je L6
    dec dec eax
    je L5
    dec dec eax
    je sub_10080B2B
    dec dec eax
    jne sub_10080B55
    mov mov edi, 01007DCB2h
    jmp sub_10080B5F
    mov mov edi, 01007DC50h
    jmp sub_10080B69
    mov mov edi, 01007DC32h
    jmp sub_10080B73
    movzx movzx eax, word ptr [esi + 2]
    sub sub eax, ebx
    je L9
    dec dec eax
    je L8
    dec dec eax
    je L7
    dec dec eax
    jne sub_10080B88
    mov mov edi, 01007E647h
    jmp sub_10080B92
    mov mov edi, 01007E606h
    jmp sub_10080B9C
    mov mov edi, 01007E5E8h
    jmp sub_10080BA6
    mov mov edi, 01007E5CAh
    jmp sub_10080BB0
    mov mov eax, dword ptr [ebp + 12]
    movzx movzx eax, word ptr [eax + 4]
    sub sub eax, ebx
    je sub_10080B05
    dec dec eax
    je L14
    dec dec eax
    jne sub_10080BC9
    movzx movzx eax, word ptr [esi + 2]
    sub sub eax, ebx
    je L15
    dec dec eax
    je L13
    dec dec eax
    je L12
    dec dec eax
    jne sub_10080BDE
    mov mov edi, 01007E5ACh
    jmp sub_10080BE8
    mov mov edi, 01007E571h
    jmp sub_10080BF2
    mov mov edi, 01007E527h
    jmp sub_10080BFC
    mov mov edi, 01007E509h
    jmp sub_10080C06
    movzx movzx eax, word ptr [esi + 2]
    sub sub eax, ebx
    je sub_10080B4A
    dec dec eax
    je sub_10080B43
    dec dec eax
    je sub_10080B3C
    dec dec eax
    jne sub_10080C1B
    mov mov edi, 01007E4A3h
    jmp sub_10080C25
    mov mov edi, 01007E485h
    jmp sub_10080C2F
    mov mov edi, 01007E441h
    jmp sub_10080C39
    mov mov edi, 01007E423h
    jmp sub_10080C43
    movzx movzx eax, word ptr [esi + 2]
    sub sub eax, ebx
    je sub_10080BBE
    dec dec eax
    je sub_10080C4D
    dec dec eax
    je sub_10080BBE
    dec dec eax
    jne sub_10080C5C
    mov mov edi, 01007E3D1h
    jmp sub_10080C66
    mov mov edi, 01007E390h
    jmp sub_10080C70
    mov mov edi, 01007E354h
    jmp sub_10080C7A
    mov mov eax, dword ptr [ebp + 12]
    movzx movzx eax, word ptr [eax + 4]
    dec dec eax
    dec dec eax
    jne sub_10080C85
    movzx movzx eax, word ptr [esi + 2]
    sub sub eax, ebx
    je sub_10080C3B
    dec dec eax
    je sub_10080C37
    dec dec eax
    je sub_10080C33
    dec dec eax
    jne sub_10080C96
    mov mov edi, 01007DED0h
    jmp sub_10080C9D
    mov mov edi, 01007DE7Ah
    jmp sub_10080CA4
    mov mov edi, 01007DE16h
    jmp sub_10080CAB
    mov mov edi, 01007DDD9h
    jmp sub_10080CB2
    cmp cmp ecx, 0FFFE0000h
    je sub_10080C9E
    cmp cmp ecx, eax
    jne sub_10080CBE
    mov mov eax, dword ptr [ebp + 12]
    movzx movzx eax, word ptr [eax + 4]
    sub sub eax, ebx
    je sub_10080B6C
    dec dec eax
    je sub_10080CAD
    dec dec eax
    jne sub_10080CD3
    mov mov edi, 01007DDBBh
    jmp sub_10080CDA
    mov mov edi, 01007DC94h
    jmp sub_10080CE1
    mov mov eax, dword ptr [ebp + 12]
    movzx movzx eax, word ptr [eax + 4]
    sub sub eax, ebx
    je sub_10080CE7
    dec dec eax
    je sub_10080C1B
    jmp sub_10080BD2
    mov mov edi, 01007E372h
    push push 68
    call sub_100F7AC0
    cmp cmp eax, ebx
    pop pop ecx
    je sub_10080D2B
    push push dword ptr [ebp + 20]
    mov mov ecx, eax
    push push edi
    push push esi
    push push dword ptr [ebp + 12]
    push push dword ptr [ebp + 8]
    call sub_1007DAD6
    mov mov esi, eax
    jmp sub_10080D43
L15:
    xor xor esi, esi
    cmp cmp esi, ebx
    je sub_10080D61
    mov mov ecx, esi
    call sub_10080D75
    test test eax, eax
    jge sub_10080D70
    push push 1
    mov mov ecx, esi
    call sub_1007E56D
    xor xor eax, eax
    jmp sub_10080D7F
    mov mov eax, esi
    pop pop edi
L16:
    pop pop esi
    pop pop ebx
    pop pop ebp
    ret ret 16
FUN_1008085f ENDP
END
