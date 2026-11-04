.686
.MODEL FLAT, C
EXTRN sub_100FBDC8:PROC
EXTRN sub_100FBDE0:PROC
EXTRN sub_100FBDF3:PROC
EXTRN sub_100FBDF6:PROC
EXTRN sub_100FBE0A:PROC
EXTRN sub_100FBE69:PROC
EXTRN sub_100FBE74:PROC
EXTRN sub_100FBE8C:PROC
EXTRN sub_100FBE8F:PROC
EXTRN sub_100FBEB2:PROC
EXTRN sub_100FBEB9:PROC
EXTRN sub_100FBED5:PROC
EXTRN sub_100FBF0A:PROC
EXTRN sub_100FBF13:PROC
EXTRN sub_100FBF15:PROC
EXTRN sub_100FBF33:PROC
EXTRN sub_100FBF4A:PROC
EXTRN sub_100FC34F:PROC
EXTRN sub_100FC363:PROC
EXTRN sub_100FC3AB:PROC
EXTRN sub_100FC3B9:PROC
EXTRN sub_100FC3CD:PROC
EXTRN sub_10100F13:PROC
EXTRN sub_1010753E:PROC
EXTRN EXTRN fp_1010C054:DWORD:DWORD
EXTRN EXTRN fp_1010C124:DWORD:DWORD
EXTRN EXTRN g_101A50D0:DWORD:DWORD
.CODE
__write_lk PROC
    push push ebp
    lea lea ebp, [esp - 03A0h]
    sub sub esp, 0420h
    mov mov eax, dword ptr [g_101A50D0]
    push push edi
    xor xor edi, edi
    cmp cmp dword ptr [ebp + 03B0h], edi
    mov mov dword ptr [ebp + 039Ch], eax
    mov mov dword ptr [ebp - 120], edi
    mov mov dword ptr [ebp - 124], edi
    jne L0
    xor xor eax, eax
    jmp sub_100FBDC8
    mov mov eax, dword ptr [ebp + 03A8h]
    push push ebx
    mov mov ebx, dword ptr [ebp + 03A8h]
    and and eax, 31
    sar sar ebx, 5
    push push esi
    lea lea esi, [eax + eax*8]
    lea lea ebx, [ebx*4 + 01076ACA0h]
    mov mov eax, dword ptr [ebx]
    shl shl esi, 2
    test test byte ptr [eax + esi + 4], 32
    je L1
L0:
    push push 2
    push push edi
    push push edi
    push push dword ptr [ebp + 03A8h]
    call sub_1010753E
    add add esp, 16
    mov mov eax, dword ptr [ebx]
    add add eax, esi
    test test byte ptr [eax + 4], 080h
    je L6
    cmp cmp dword ptr [ebp + 03B0h], edi
    mov mov eax, dword ptr [ebp + 03ACh]
    mov mov dword ptr [ebp - 116], eax
    mov mov dword ptr [ebp - 108], edi
    jbe sub_100FBDF6
    mov mov ecx, dword ptr [ebp - 116]
    sub sub ecx, dword ptr [ebp + 03ACh]
    lea lea eax, [ebp - 104]
    mov mov dword ptr [ebp - 112], edi
    cmp cmp ecx, dword ptr [ebp + 03B0h]
    jae L4
    mov mov edx, dword ptr [ebp - 116]
    inc inc dword ptr [ebp - 116]
    mov mov dl, byte ptr [edx]
    inc inc ecx
    cmp cmp dl, 10
    jne L3
    inc inc dword ptr [ebp - 124]
    mov mov byte ptr [eax], 13
    inc inc eax
    inc inc dword ptr [ebp - 112]
    mov mov byte ptr [eax], dl
    inc inc eax
    inc inc dword ptr [ebp - 112]
L1:
    cmp cmp dword ptr [ebp - 112], 0400h
    jl L2
    mov mov edi, eax
    lea lea eax, [ebp - 104]
    sub sub edi, eax
    push push 0
    lea lea eax, [ebp - 080h]
    push push eax
    push push edi
    lea lea eax, [ebp - 104]
    push push eax
    mov mov eax, dword ptr [ebx]
    push push dword ptr [eax + esi]
    call dword ptr [fp_1010C124]
    test test eax, eax
    je sub_100FBDE0
    mov mov eax, dword ptr [ebp - 080h]
    add add dword ptr [ebp - 120], eax
    cmp cmp eax, edi
    jl sub_100FBDF3
    mov mov eax, dword ptr [ebp - 116]
    sub sub eax, dword ptr [ebp + 03ACh]
    xor xor edi, edi
    cmp cmp eax, dword ptr [ebp + 03B0h]
    jb L5
    jmp sub_100FBE0A
    call dword ptr [fp_1010C054]
    mov mov dword ptr [ebp - 108], eax
    xor xor edi, edi
    mov mov eax, dword ptr [ebp - 120]
    cmp cmp eax, edi
    jne sub_100FBEB9
    cmp cmp dword ptr [ebp - 108], edi
    je sub_100FBE8F
    push push 5
    pop pop esi
    cmp cmp dword ptr [ebp - 108], esi
    jne sub_100FBE8C
    call sub_100FC34F
    mov mov dword ptr [eax], 9
    call sub_100FC363
    mov mov dword ptr [eax], esi
    jmp sub_100FBED5
    push push edi
    lea lea ecx, [ebp - 080h]
    push push ecx
    push push dword ptr [ebp + 03B0h]
    push push dword ptr [ebp + 03ACh]
    push push dword ptr [eax]
    call dword ptr [fp_1010C124]
    test test eax, eax
    je sub_100FBEB2
    mov mov eax, dword ptr [ebp - 080h]
    mov mov dword ptr [ebp - 108], edi
    mov mov dword ptr [ebp - 120], eax
    jmp sub_100FBE69
    call dword ptr [fp_1010C054]
    mov mov dword ptr [ebp - 108], eax
    jmp sub_100FBE74
L4:
    push push dword ptr [ebp - 108]
    call sub_100FC3AB
    pop pop ecx
    jmp sub_100FBF13
    mov mov eax, dword ptr [ebx]
    test test byte ptr [eax + esi + 4], 64
    je sub_100FBF0A
    mov mov eax, dword ptr [ebp + 03ACh]
    cmp cmp byte ptr [eax], 26
    jne sub_100FBF15
    xor xor eax, eax
    jmp sub_100FBF33
    call sub_100FC3B9
    mov mov dword ptr [eax], 28
    call sub_100FC3CD
    mov mov dword ptr [eax], edi
    or or eax, -1
    jmp sub_100FBF4A
    sub sub eax, dword ptr [ebp - 124]
    pop pop esi
    pop pop ebx
    mov mov ecx, dword ptr [ebp + 039Ch]
    pop pop edi
    call sub_10100F13
    add add ebp, 03A0h
    leave leave
    ret ret
__write_lk ENDP
END
