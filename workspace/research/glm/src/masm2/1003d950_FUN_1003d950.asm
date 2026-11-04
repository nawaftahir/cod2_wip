.686
.MODEL FLAT, C
EXTRN sub_1003792E:PROC
EXTRN sub_1003DD56:PROC
EXTRN sub_1003DD64:PROC
EXTRN sub_1003DD65:PROC
EXTRN sub_1003DE36:PROC
EXTRN sub_1003DE40:PROC
EXTRN sub_1003DE44:PROC
EXTRN sub_1003DE60:PROC
EXTRN sub_1003DE87:PROC
EXTRN sub_1003DEE9:PROC
EXTRN sub_1003DF36:PROC
EXTRN sub_1003DF3A:PROC
EXTRN sub_1003DF44:PROC
EXTRN sub_1003E00F:PROC
EXTRN sub_1003E016:PROC
EXTRN sub_1003E021:PROC
EXTRN sub_1003E024:PROC
EXTRN sub_1003E0F6:PROC
EXTRN sub_1003E0FB:PROC
EXTRN sub_1003E104:PROC
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
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_101D495C:DWORD:DWORD
EXTRN EXTRN g_1072DEBE:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_1003d950 PROC
    push push ecx
    push push esi
    mov mov esi, eax
    cmp cmp esi, dword ptr [edi*4 + 010766774h]
    je L5
    test test esi, esi
    je L1
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je L0
    mov mov ecx, dword ptr [esi + 32]
    push push ecx
    push push edi
    push push 0101996F8h
    call sub_10060CA4
    add add esp, 12
    mov mov edx, eax
    call sub_1003792E
    mov mov edi, edi
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je L2
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je L3
    push push 0101996B8h
    push push 010193358h
L0:
    push push eax
    call sub_100F6D70
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6CB3
    add add esp, 16
    mov mov edx, dword ptr [esi + 4]
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push edx
    push push edi
    push push eax
    call call dword ptr [ecx + 0104h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne L4
    jmp L8
    jmp L6
    lea lea esp, [esp]
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je L7
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je L9
    push push 01019968Ch
    push push 010193358h
    push push eax
    call sub_100F6DCF
    mov mov ecx, dword ptr [g_10764584]
    push push ecx
    call sub_100F6D13
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [eax]
    push push 0
    push push edi
    push push eax
    call call dword ptr [edx + 0104h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne L9
    mov mov dword ptr [edi*4 + 010766774h], esi
    test test esi, esi
    je sub_1003DE60
    mov mov dl, byte ptr [esp + 12]
    test test dl, 15
    jne L10
L5:
    or or dl, byte ptr [g_1072DEBE]
    mov mov byte ptr [esp + 12], dl
    mov mov al, byte ptr [edi + 010766764h]
    mov mov cl, al
    xor xor cl, dl
    mov mov byte ptr [esp + 7], cl
    je sub_1003DE87
    test test cl, 3
    je L18
    xor xor ecx, ecx
    mov mov cl, dl
    push push ebx
    and and ecx, 3
    mov mov esi, dword ptr [ecx*4 + 010190714h]
    cmp cmp esi, 3
    mov mov ecx, dword ptr [g_101D495C]
    mov mov ebx, esi
    jne L11
    test test ecx, ecx
    mov mov ebx, 2
    jne L12
    mov mov esi, ebx
    and and eax, 3
    mov mov eax, dword ptr [eax*4 + 010190714h]
    cmp cmp eax, 3
    push push ebp
    mov mov ebp, eax
    jne L13
    test test ecx, ecx
    mov mov ebp, 2
    jne L14
    mov mov eax, ebp
    cmp cmp esi, eax
    je L16
    lea lea ebx, [ebx]
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je L15
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je L17
    push push 010199640h
    push push 010193358h
    push push eax
    call sub_100F6EB0
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6DF3
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push esi
    push push 6
    push push edi
    push push eax
    call call dword ptr [ecx + 0114h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne L17
    mov mov dl, byte ptr [esp + 20]
    cmp cmp ebx, ebp
    pop pop ebp
    je sub_1003DD65
    lea lea ecx, [ecx]
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je sub_1003DD56
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_1003DD64
    push push 0101995F0h
    push push 010193358h
    push push eax
    call sub_100F6F10
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6E53
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
L10:
    push push ebx
    push push 5
    push push edi
    push push eax
    call call dword ptr [ecx + 0114h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1003DD64
    mov mov dl, byte ptr [esp + 16]
    mov mov cl, byte ptr [esp + 11]
    pop pop ebx
    test test cl, 12
    je sub_1003DE40
    shr shr edx, 2
    and and edx, 3
    mov mov esi, dword ptr [edx*4 + 010190714h]
    nop nop
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je sub_1003DE36
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_1003DE44
    push push 0101995A0h
    push push 010193358h
    push push eax
    call sub_100F6F80
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6EC3
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push esi
    push push 7
    push push edi
    push push eax
    call call dword ptr [ecx + 0114h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1003DE44
    mov mov cl, byte ptr [esp + 7]
    xor xor edx, edx
    mov mov dl, byte ptr [esp + 12]
    test test cl, 112
    je sub_1003E00F
    test test cl, 16
    je sub_1003DF3A
    and and edx, 16
    or or edx, 8
    shr shr edx, 3
    mov mov esi, edx
    jmp sub_1003DEE9
    lea lea esp, [esp]
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je sub_1003DF36
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_1003DF44
    push push 010199558h
    push push 010193358h
    push push eax
    call sub_100F7000
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6F43
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push esi
    push push 1
    push push edi
    push push eax
    call call dword ptr [ecx + 0114h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1003DF44
    mov mov cl, byte ptr [esp + 7]
    xor xor edx, edx
    mov mov dl, byte ptr [esp + 12]
    test test cl, 32
    je sub_1003E021
    and and edx, 32
    or or edx, 16
    shr shr edx, 4
    mov mov esi, edx
    mov mov edi, edi
    mov mov edx, dword ptr [g_101CE7EC]
L15:
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je sub_1003E016
    mov mov eax, dword ptr [g_10764584]
L16:
    test test eax, eax
L17:
    setne setne cl
    test test cl, cl
    je sub_1003E024
    push push 010199510h
    push push 010193358h
    push push eax
    call sub_100F7070
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6FB3
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push esi
    push push 2
    push push edi
    push push eax
    call call dword ptr [ecx + 0114h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1003E024
    mov mov cl, byte ptr [esp + 7]
    xor xor edx, edx
    mov mov dl, byte ptr [esp + 12]
    test test cl, 64
    je sub_1003E0FB
    and and edx, 64
    or or edx, 32
    shr shr edx, 5
    mov mov esi, edx
    mov mov edi, edi
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je sub_1003E0F6
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_1003E104
    push push 0101994C8h
    push push 010193358h
    push push eax
    call sub_100F70E0
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F7023
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push esi
    push push 3
    push push edi
    push push eax
    call call dword ptr [ecx + 0114h]
    mov mov eax, dword ptr [g_1076A830]
FUN_1003d950 ENDP
END
