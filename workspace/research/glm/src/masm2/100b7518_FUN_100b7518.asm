.686
.MODEL FLAT, C
EXTRN sub_100B75BB:PROC
EXTRN sub_100B75C7:PROC
EXTRN sub_100B75CD:PROC
EXTRN sub_100B75DF:PROC
EXTRN sub_100B75F9:PROC
EXTRN sub_100B760E:PROC
EXTRN sub_100B7612:PROC
EXTRN sub_100B7614:PROC
EXTRN sub_100B761D:PROC
EXTRN sub_100B7624:PROC
EXTRN sub_100B762B:PROC
EXTRN sub_100C99CC:PROC
EXTRN sub_100C9A4B:PROC
.CODE
FUN_100b7518 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push esi
    push push edi
    mov mov edi, dword ptr [ebp + 8]
    or or edi, dword ptr [ebp + 12]
    mov mov esi, ecx
    push push edi
    call sub_100C99CC
    test test eax, eax
    jl sub_100B75C7
    test test edi, 02000h
    je sub_100B75CD
    mov mov eax, dword ptr [esi + 0C8h]
    and and eax, 0FFFFh
    cmp cmp eax, 0200h
    jb sub_100B75DF
    mov mov eax, dword ptr [ebp + 16]
    mov mov ecx, dword ptr [esi + 20]
    mov mov edx, dword ptr [esi + 16]
    shl shl eax, 2
    mov mov ecx, dword ptr [ecx + eax]
    mov mov ecx, dword ptr [ecx + 4]
    mov mov ecx, dword ptr [edx + ecx*4]
    test test byte ptr [ecx + 4], 16
    je sub_100B75BB
    mov mov eax, 0F0E40800h
    jmp sub_100B75F9
    mov mov ecx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [eax + ecx]
    mov mov eax, dword ptr [ecx + 12]
    mov mov ecx, dword ptr [ecx + 16]
    and and eax, 07FFh
    or or eax, 0B0000000h
    sub sub ecx, 0
    je sub_100B7614
    dec dec ecx
    je sub_100B7612
    dec dec ecx
    je sub_100B760E
    dec dec ecx
    jne sub_100B761D
    or or eax, 0FF0000h
    jmp sub_100B7624
    or or eax, 0AA0000h
    jmp sub_100B762B
    or or eax, 0550000h
    push push eax
    mov mov ecx, esi
    call sub_100C9A4B
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebp
    ret ret 12
FUN_100b7518 ENDP
END
