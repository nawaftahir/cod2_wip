.686
.MODEL FLAT, C
EXTRN sub_1006C4F0:PROC
EXTRN sub_1006C574:PROC
EXTRN sub_100853EF:PROC
EXTRN sub_1008545F:PROC
EXTRN sub_1008587D:PROC
EXTRN sub_100858FA:PROC
EXTRN sub_10085C0F:PROC
EXTRN sub_10085D60:PROC
EXTRN sub_10086200:PROC
EXTRN sub_1008B10A:PROC
EXTRN sub_100BAD1D:PROC
EXTRN sub_100BAD2D:PROC
EXTRN sub_100BAD30:PROC
EXTRN sub_100BAD3E:PROC
EXTRN sub_100BAD57:PROC
EXTRN sub_100BAD6D:PROC
EXTRN sub_100BAD95:PROC
EXTRN sub_100BADEB:PROC
EXTRN sub_100BAE10:PROC
EXTRN sub_100BAE2B:PROC
EXTRN sub_100BAE6B:PROC
.CODE
FUN_100baba8 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ecx
    push push ebx
    push push esi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 0100h]
    mov mov eax, dword ptr [eax]
    mov mov ecx, eax
    and and ecx, 0FFF00000h
    cmp cmp ecx, 011400000h
    push push edi
    jne sub_100BAD30
    and and eax, 0FFFFFh
    cmp cmp eax, 1
    jne sub_100BAD3E
    test test byte ptr [esi + 112], 4
    jne L0
    mov mov eax, dword ptr [esi + 0100h]
    push push 01011A088h
    push push 011C8h
    push push dword ptr [eax + 60]
    push push esi
    call sub_1008B10A
    add add esp, 16
    mov mov eax, 080004005h
    jmp sub_100BAD6D
    push push 116
    call sub_1008587D
    xor xor ebx, ebx
    cmp cmp eax, ebx
    je L1
    mov mov ecx, eax
    call sub_100853EF
    mov mov edi, eax
    jmp L2
    xor xor edi, edi
    cmp cmp edi, ebx
    jne L3
    mov mov eax, 08007000Eh
    jmp sub_100BAD95
    push push ebx
    push push 1
    push push 2
    push push 074500001h
    mov mov ecx, edi
    call sub_100858FA
    cmp cmp eax, ebx
    mov mov dword ptr [ebp - 4], eax
    mov mov ecx, edi
    jl sub_100BAD1D
    push push dword ptr [esi + 0100h]
    call sub_1008545F
    cmp cmp eax, ebx
    mov mov dword ptr [ebp - 4], eax
    jl sub_100BAD2D
    push push ecx
    fldz fldz
    push push ecx
    fstp fstp qword ptr [esp]
    push push ebx
    push push ebx
    push push ebx
    mov mov ecx, esi
    call sub_10086200
    cmp cmp eax, -1
    mov mov dword ptr [ebp - 8], eax
    jne sub_100BAD57
    mov mov ecx, edi
    push push 1
    call sub_1006C4F0
    mov mov eax, dword ptr [ebp - 4]
    jmp sub_100BADEB
    mov mov ecx, dword ptr [esi + 20]
    mov mov ebx, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [esi + 0100h]
    mov mov eax, dword ptr [eax + 8]
    mov mov eax, dword ptr [eax]
    push push dword ptr [ecx + eax*4]
    mov mov ecx, ebx
L2:
    call sub_10085D60
    mov mov eax, dword ptr [esi + 0100h]
    mov mov eax, dword ptr [eax + 16]
    mov mov eax, dword ptr [eax]
    mov mov ecx, dword ptr [edi + 16]
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [esi + 0100h]
    mov mov eax, dword ptr [eax + 8]
    mov mov ecx, dword ptr [edi + 8]
    mov mov eax, dword ptr [eax]
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [edi + 8]
    mov mov ecx, dword ptr [ebp - 8]
    mov mov dword ptr [eax + 4], ecx
    cmp cmp dword ptr [ebx + 56], -1
    jne sub_100BAE10
    mov mov eax, dword ptr [esi + 0100h]
    mov mov eax, dword ptr [eax + 8]
    mov mov eax, dword ptr [eax]
    or or byte ptr [ebx + 62], 8
    mov mov dword ptr [ebx + 56], eax
    jmp sub_100BAE2B
    xor xor dword ptr [ebx + 60], 080000h
    mov mov ecx, dword ptr [esi + 0100h]
    push push edi
    call sub_10085C0F
    push push 1
    mov mov ecx, edi
    mov mov esi, eax
    call sub_1006C574
    mov mov eax, esi
    jmp sub_100BAE6B
    xor xor eax, eax
    inc inc eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_100baba8 ENDP
END
