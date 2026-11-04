.686
.MODEL FLAT, C
EXTRN sub_10086963:PROC
EXTRN sub_100CBC1F:PROC
EXTRN sub_100CBD80:PROC
.CODE
FUN_100cc1bb PROC
    mov edi, edi
    push esi
    mov esi, ecx
    push edi
    lea eax, [esi + 76]
    push eax
    lea eax, [esi + 80]
    push eax
    call sub_100CBC1F
    xor eax, eax
    cmp dword ptr [esi + 56], eax
    jbe L1
L0:
    mov ecx, dword ptr [esi + 48]
    mov dword ptr [ecx + eax*4], eax
    mov ecx, dword ptr [esi + 60]
    mov ecx, dword ptr [ecx + eax*4]
    mov edx, dword ptr [esi + 64]
    mov dword ptr [edx + eax*4], ecx
    inc eax
    cmp eax, dword ptr [esi + 56]
    jb L0
L1:
    push esi
    push dword ptr [esi + 56]
    push dword ptr [esi + 48]
    push 0100CBB65h
    call sub_10086963
    xor edi, edi
    cmp dword ptr [esi + 56], edi
    jbe L3
L2:
    mov eax, dword ptr [esi + 48]
    push dword ptr [eax + edi*4]
    mov ecx, esi
    call sub_100CBD80
    test eax, eax
    jl L4
    je L5
    inc edi
    cmp edi, dword ptr [esi + 56]
    jb L2
L3:
    xor eax, eax
    inc eax
L4:
    pop edi
    pop esi
    ret
L5:
    xor eax, eax
    jmp L4
FUN_100cc1bb ENDP
END
