.686
.MODEL FLAT, C
EXTRN sub_1006C4E5:PROC
EXTRN sub_100853EA:PROC
EXTRN sub_10085469:PROC
EXTRN sub_1008587A:PROC
EXTRN sub_10085904:PROC
EXTRN sub_10086189:PROC
.CODE
FUN_100b4147 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 16
    push ebx
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 8]
    xor ebx, ebx
    test eax, eax
    push edi
    jbe L2
    mov edx, dword ptr [esi + 000000088h]
    mov ecx, dword ptr [esi + 20]
    mov edi, eax
L0:
    mov eax, dword ptr [ecx]
    cmp edx, dword ptr [eax + 4]
    jne L1
    mov eax, dword ptr [eax + 12]
    cmp eax, ebx
    jb L1
    lea ebx, [eax + 1]
L1:
    add ecx, 4
    dec edi
    jne L0
L2:
    xor edi, edi
L3:
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    push edi
    push ebx
    push dword ptr [esi + 000000088h]
    mov ecx, esi
    call sub_10086189
    cmp eax, -1
    mov dword ptr [ebp + edi*4 - 16], eax
    je L6
    inc edi
    cmp edi, 4
    jb L3
    push 116
    call sub_1008587A
    test eax, eax
    je L4
    mov ecx, eax
    call sub_100853EA
    jmp L5
L4:
    xor eax, eax
L5:
    test eax, eax
    mov edi, dword ptr [ebp + 8]
    mov dword ptr [edi], eax
    jne L7
L6:
    mov eax, 08007000Eh
    jmp L13
L7:
    mov ebx, dword ptr [ebp + 12]
    push 0
    push ebx
    mov ecx, ebx
    and ecx, 0000FFFFFh
    or ecx, 010000000h
    push ebx
    push ecx
    mov ecx, eax
    call sub_10085904
    test eax, eax
    mov ecx, dword ptr [edi]
    mov dword ptr [ebp + 8], eax
    jl L8
    push dword ptr [esi + 000000100h]
    call sub_10085469
    test eax, eax
    mov dword ptr [ebp + 8], eax
    jge L10
    mov ecx, dword ptr [edi]
L8:
    test ecx, ecx
    je L9
    push 1
    call sub_1006C4E5
L9:
    mov eax, dword ptr [ebp + 8]
    jmp L13
L10:
    xor eax, eax
    test ebx, ebx
    mov dword ptr [ebp + 8], eax
    jbe L12
L11:
    mov edx, dword ptr [edi]
    mov edx, dword ptr [edx + 8]
    shl eax, 2
    mov ecx, dword ptr [ebp + eax - 16]
    mov dword ptr [eax + edx], ecx
    mov edx, dword ptr [esi + 000000100h]
    mov edx, dword ptr [edx + 16]
    mov edx, dword ptr [eax + edx]
    mov ebx, dword ptr [edi]
    mov ebx, dword ptr [ebx + 16]
    mov dword ptr [eax + ebx], edx
    mov edx, dword ptr [esi + 000000100h]
    mov edx, dword ptr [edx + 16]
    mov dword ptr [eax + edx], ecx
    mov eax, dword ptr [ebp + 8]
    inc eax
    cmp eax, dword ptr [ebp + 12]
    mov dword ptr [ebp + 8], eax
    jb L11
L12:
    xor eax, eax
L13:
    pop edi
    pop esi
    pop ebx
    leave
    ret 8
FUN_100b4147 ENDP
END
