.686
.MODEL FLAT, C
EXTRN sub_10086963:PROC
EXTRN sub_100CBC1F:PROC
EXTRN sub_100CBD80:PROC
EXTRN sub_100CC268:PROC
EXTRN sub_100CC27C:PROC
EXTRN sub_100CC281:PROC
EXTRN sub_100CC28E:PROC
.CODE
FUN_100cc1bb PROC
    mov mov edi, edi
    push push esi
    mov mov esi, ecx
    push push edi
    lea lea eax, [esi + 76]
    push push eax
    lea lea eax, [esi + 80]
    push push eax
    call sub_100CBC1F
    xor xor eax, eax
    cmp cmp dword ptr [esi + 56], eax
    jbe L0
    mov mov ecx, dword ptr [esi + 48]
    mov mov dword ptr [ecx + eax*4], eax
    mov mov ecx, dword ptr [esi + 60]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov edx, dword ptr [esi + 64]
    mov mov dword ptr [edx + eax*4], ecx
    inc inc eax
    cmp cmp eax, dword ptr [esi + 56]
    jb L0
    push push esi
    push push dword ptr [esi + 56]
    push push dword ptr [esi + 48]
    push push 0100CBB65h
    call sub_10086963
    xor xor edi, edi
    cmp cmp dword ptr [esi + 56], edi
    jbe sub_100CC268
    mov mov eax, dword ptr [esi + 48]
    push push dword ptr [eax + edi*4]
    mov mov ecx, esi
    call sub_100CBD80
    test test eax, eax
    jl sub_100CC27C
    je sub_100CC281
    inc inc edi
    cmp cmp edi, dword ptr [esi + 56]
    jb sub_100CC268
    xor xor eax, eax
    inc inc eax
    pop pop edi
    pop pop esi
    ret ret
    xor xor eax, eax
    jmp sub_100CC28E
FUN_100cc1bb ENDP
END
