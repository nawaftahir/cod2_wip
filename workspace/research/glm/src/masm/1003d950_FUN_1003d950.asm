.686
.MODEL FLAT, C
EXTRN sub_1003792E:PROC
EXTRN sub_1003DE60:PROC
EXTRN sub_1003DE87:PROC
EXTRN sub_1003E00F:PROC
EXTRN sub_1003E0FB:PROC
EXTRN sub_10060CA4:PROC
EXTRN sub_100F6CB3:PROC
EXTRN sub_100F6D13:PROC
EXTRN sub_100F6D70:PROC
EXTRN sub_100F6DCF:PROC
EXTRN sub_100F6DF3:PROC
EXTRN sub_100F6E53:PROC
EXTRN sub_100F6EB0:PROC
EXTRN sub_100F6EC3:PROC
EXTRN sub_100F6F10:PROC
EXTRN sub_100F6F43:PROC
EXTRN sub_100F6F80:PROC
EXTRN sub_100F6FB3:PROC
EXTRN sub_100F7000:PROC
EXTRN sub_100F7023:PROC
EXTRN sub_100F7070:PROC
EXTRN sub_100F70E0:PROC
EXTRN g_101CE7EC:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_101D495C:DWORD
EXTRN g_1072DEBE:DWORD
EXTRN g_10764584:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_1003d950 PROC
    push ecx
    push esi
    mov esi, eax
    cmp esi, dword ptr [edi*4 + 010766774h]
    je L5
    test esi, esi
    je L2
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L0
    mov ecx, dword ptr [esi + 32]
    push ecx
    push edi
    push 0101996F8h
    call sub_10060CA4
    add esp, 12
    mov edx, eax
    call sub_1003792E
    mov edi, edi
L0:
    mov edx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L1
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L1
    push 0101996B8h
    push 010193358h
    push eax
    call sub_100F6D70
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6CB3
    add esp, 16
L1:
    mov edx, dword ptr [esi + 4]
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push edx
    push edi
    push eax
    call dword ptr [ecx + 0x104]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L0
    jmp L4
    jmp L2
    lea esp, [esp]
L2:
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L3
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L3
    push 01019968Ch
    push 010193358h
    push eax
    call sub_100F6DCF
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100F6D13
    add esp, 16
L3:
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    push 0
    push edi
    push eax
    call dword ptr [edx + 0x104]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L2
L4:
    mov dword ptr [edi*4 + 010766774h], esi
L5:
    test esi, esi
    je sub_1003DE60
    mov dl, byte ptr [esp + 12]
    test dl, 15
    jne L6
    or dl, byte ptr [g_1072DEBE]
    mov byte ptr [esp + 12], dl
L6:
    mov al, byte ptr [edi + 010766764h]
    mov cl, al
    xor cl, dl
    mov byte ptr [esp + 7], cl
    je sub_1003DE87
    test cl, 3
    je L15
    xor ecx, ecx
    mov cl, dl
    push ebx
    and ecx, 3
    mov esi, dword ptr [ecx*4 + 010190714h]
    cmp esi, 3
    mov ecx, dword ptr [g_101D495C]
    mov ebx, esi
    jne L7
    test ecx, ecx
    mov ebx, 2
    jne L7
    mov esi, ebx
L7:
    and eax, 3
    mov eax, dword ptr [eax*4 + 010190714h]
    cmp eax, 3
    push ebp
    mov ebp, eax
    jne L8
    test ecx, ecx
    mov ebp, 2
    jne L8
    mov eax, ebp
L8:
    cmp esi, eax
    je L11
    lea ebx, [ebx]
L9:
    mov edx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L10
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L10
    push 010199640h
    push 010193358h
    push eax
    call sub_100F6EB0
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6DF3
    add esp, 16
L10:
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push esi
    push 6
    push edi
    push eax
    call dword ptr [ecx + 0x114]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L9
    mov dl, byte ptr [esp + 20]
L11:
    cmp ebx, ebp
    pop ebp
    je L14
    lea ecx, [ecx]
L12:
    mov edx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L13
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L13
    push 0101995F0h
    push 010193358h
    push eax
    call sub_100F6F10
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6E53
    add esp, 16
L13:
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push ebx
    push 5
    push edi
    push eax
    call dword ptr [ecx + 0x114]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L12
    mov dl, byte ptr [esp + 16]
L14:
    mov cl, byte ptr [esp + 11]
    pop ebx
L15:
    test cl, 12
    je L18
    shr edx, 2
    and edx, 3
    mov esi, dword ptr [edx*4 + 010190714h]
    nop
L16:
    mov edx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L17
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L17
    push 0101995A0h
    push 010193358h
    push eax
    call sub_100F6F80
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6EC3
    add esp, 16
L17:
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push esi
    push 7
    push edi
    push eax
    call dword ptr [ecx + 0x114]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L16
    mov cl, byte ptr [esp + 7]
    xor edx, edx
    mov dl, byte ptr [esp + 12]
L18:
    test cl, 112
    je sub_1003E00F
    test cl, 16
    je L21
    and edx, 16
    or edx, 8
    shr edx, 3
    mov esi, edx
    jmp L19
    lea esp, [esp]
L19:
    mov edx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L20
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L20
    push 010199558h
    push 010193358h
    push eax
    call sub_100F7000
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6F43
    add esp, 16
L20:
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push esi
    push 1
    push edi
    push eax
    call dword ptr [ecx + 0x114]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L19
    mov cl, byte ptr [esp + 7]
    xor edx, edx
    mov dl, byte ptr [esp + 12]
L21:
    test cl, 32
    je L24
    and edx, 32
    or edx, 16
    shr edx, 4
    mov esi, edx
    mov edi, edi
L22:
    mov edx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L23
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L23
    push 010199510h
    push 010193358h
    push eax
    call sub_100F7070
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6FB3
    add esp, 16
L23:
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push esi
    push 2
    push edi
    push eax
    call dword ptr [ecx + 0x114]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L22
    mov cl, byte ptr [esp + 7]
    xor edx, edx
    mov dl, byte ptr [esp + 12]
L24:
    test cl, 64
    je sub_1003E0FB
    and edx, 64
    or edx, 32
    shr edx, 5
    mov esi, edx
    mov edi, edi
    mov edx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L25
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L25
    push 0101994C8h
    push 010193358h
    push eax
    call sub_100F70E0
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F7023
    add esp, 16
L25:
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push esi
    push 3
    push edi
    push eax
    call dword ptr [ecx + 0x114]
    mov eax, dword ptr [g_1076A830]
FUN_1003d950 ENDP
END
