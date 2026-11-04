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
.CODE
FUN_100baba8 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push ebx
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 000000100h]
    mov eax, dword ptr [eax]
    mov ecx, eax
    and ecx, 0FFF00000h
    cmp ecx, 011400000h
    push edi
    jne L9
    and eax, 0000FFFFFh
    cmp eax, 1
    jne L9
    test byte ptr [esi + 112], 4
    jne L0
    mov eax, dword ptr [esi + 000000100h]
    push 01011A088h
    push 0000011C8h
    push dword ptr [eax + 60]
    push esi
    call sub_1008B10A
    add esp, 16
    mov eax, 080004005h
    jmp L10
L0:
    push 116
    call sub_1008587D
    xor ebx, ebx
    cmp eax, ebx
    je L1
    mov ecx, eax
    call sub_100853EF
    mov edi, eax
    jmp L2
L1:
    xor edi, edi
L2:
    cmp edi, ebx
    jne L3
    mov eax, 08007000Eh
    jmp L10
L3:
    push ebx
    push 1
    push 2
    push 074500001h
    mov ecx, edi
    call sub_100858FA
    cmp eax, ebx
    mov dword ptr [ebp - 4], eax
    mov ecx, edi
    jl L5
    push dword ptr [esi + 000000100h]
    call sub_1008545F
    cmp eax, ebx
    mov dword ptr [ebp - 4], eax
    jl L4
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    push ebx
    push ebx
    push ebx
    mov ecx, esi
    call sub_10086200
    cmp eax, -1
    mov dword ptr [ebp - 8], eax
    jne L6
L4:
    mov ecx, edi
L5:
    push 1
    call sub_1006C4F0
    mov eax, dword ptr [ebp - 4]
    jmp L10
L6:
    mov ecx, dword ptr [esi + 20]
    mov ebx, dword ptr [ecx + eax*4]
    mov eax, dword ptr [esi + 000000100h]
    mov eax, dword ptr [eax + 8]
    mov eax, dword ptr [eax]
    push dword ptr [ecx + eax*4]
    mov ecx, ebx
    call sub_10085D60
    mov eax, dword ptr [esi + 000000100h]
    mov eax, dword ptr [eax + 16]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [edi + 16]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [esi + 000000100h]
    mov eax, dword ptr [eax + 8]
    mov ecx, dword ptr [edi + 8]
    mov eax, dword ptr [eax]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [edi + 8]
    mov ecx, dword ptr [ebp - 8]
    mov dword ptr [eax + 4], ecx
    cmp dword ptr [ebx + 56], -1
    jne L7
    mov eax, dword ptr [esi + 000000100h]
    mov eax, dword ptr [eax + 8]
    mov eax, dword ptr [eax]
    or byte ptr [ebx + 62], 8
    mov dword ptr [ebx + 56], eax
    jmp L8
L7:
    xor dword ptr [ebx + 60], 000080000h
L8:
    mov ecx, dword ptr [esi + 000000100h]
    push edi
    call sub_10085C0F
    push 1
    mov ecx, edi
    mov esi, eax
    call sub_1006C574
    mov eax, esi
    jmp L10
L9:
    xor eax, eax
    inc eax
L10:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100baba8 ENDP
END
