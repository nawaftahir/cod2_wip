.686
.MODEL FLAT, C
EXTRN sub_1006C4E5:PROC
EXTRN sub_100853EA:PROC
EXTRN sub_10085469:PROC
EXTRN sub_1008587A:PROC
EXTRN sub_10085904:PROC
EXTRN sub_10086189:PROC
EXTRN sub_100B42B7:PROC
EXTRN sub_100B42D9:PROC
EXTRN sub_100B42DA:PROC
EXTRN sub_100B42E7:PROC
EXTRN sub_100B4331:PROC
EXTRN sub_100B4338:PROC
.CODE
FUN_100b4147 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 16
    push push ebx
    push push esi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 8]
    xor xor ebx, ebx
    test test eax, eax
    push push edi
    jbe L0
    mov mov edx, dword ptr [esi + 088h]
    mov mov ecx, dword ptr [esi + 20]
    mov mov edi, eax
    mov mov eax, dword ptr [ecx]
    cmp cmp edx, dword ptr [eax + 4]
    jne L2
    mov mov eax, dword ptr [eax + 12]
    cmp cmp eax, ebx
    jb L3
    lea lea ebx, [eax + 1]
    add add ecx, 4
    dec dec edi
    jne L1
    xor xor edi, edi
    push push ecx
    fldz fldz
    push push ecx
    fstp fstp qword ptr [esp]
    push push edi
    push push ebx
    push push dword ptr [esi + 088h]
    mov mov ecx, esi
    call sub_10086189
    cmp cmp eax, -1
    mov mov dword ptr [ebp + edi*4 - 16], eax
    je L5
L1:
    inc inc edi
L2:
    cmp cmp edi, 4
    jb L4
    push push 116
L3:
    call sub_1008587A
    test test eax, eax
    je L6
    mov mov ecx, eax
    call sub_100853EA
    jmp L7
    xor xor eax, eax
    test test eax, eax
    mov mov edi, dword ptr [ebp + 8]
    mov mov dword ptr [edi], eax
    jne L8
    mov mov eax, 08007000Eh
    jmp sub_100B42E7
    mov mov ebx, dword ptr [ebp + 12]
    push push 0
    push push ebx
    mov mov ecx, ebx
    and and ecx, 0FFFFFh
    or or ecx, 010000000h
    push push ebx
    push push ecx
    mov mov ecx, eax
    call sub_10085904
    test test eax, eax
    mov mov ecx, dword ptr [edi]
    mov mov dword ptr [ebp + 8], eax
    jl sub_100B42B7
    push push dword ptr [esi + 0100h]
    call sub_10085469
    test test eax, eax
    mov mov dword ptr [ebp + 8], eax
    jge sub_100B42D9
    mov mov ecx, dword ptr [edi]
    test test ecx, ecx
    je sub_100B42DA
    push push 1
    call sub_1006C4E5
    mov mov eax, dword ptr [ebp + 8]
    jmp sub_100B4331
    xor xor eax, eax
    test test ebx, ebx
    mov mov dword ptr [ebp + 8], eax
    jbe sub_100B4338
    mov mov edx, dword ptr [edi]
L6:
    mov mov edx, dword ptr [edx + 8]
    shl shl eax, 2
    mov mov ecx, dword ptr [ebp + eax - 16]
    mov mov dword ptr [eax + edx], ecx
    mov mov edx, dword ptr [esi + 0100h]
    mov mov edx, dword ptr [edx + 16]
    mov mov edx, dword ptr [eax + edx]
    mov mov ebx, dword ptr [edi]
    mov mov ebx, dword ptr [ebx + 16]
    mov mov dword ptr [eax + ebx], edx
    mov mov edx, dword ptr [esi + 0100h]
    mov mov edx, dword ptr [edx + 16]
    mov mov dword ptr [eax + edx], ecx
    mov mov eax, dword ptr [ebp + 8]
    inc inc eax
    cmp cmp eax, dword ptr [ebp + 12]
    mov mov dword ptr [ebp + 8], eax
    jb sub_100B4338
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 8
FUN_100b4147 ENDP
END
