.686
.MODEL FLAT, C
EXTRN sub_100674D9:PROC
EXTRN sub_10067789:PROC
EXTRN sub_10067E91:PROC
EXTRN sub_10067E92:PROC
EXTRN sub_10067EA3:PROC
EXTRN sub_10067EAD:PROC
EXTRN sub_10067EC6:PROC
EXTRN sub_10067ED6:PROC
EXTRN sub_10067EDE:PROC
EXTRN sub_10067EE6:PROC
EXTRN sub_10067EF1:PROC
EXTRN sub_10067EF6:PROC
EXTRN sub_10067F28:PROC
EXTRN sub_10067F3D:PROC
EXTRN sub_10067F73:PROC
EXTRN sub_10067FB5:PROC
EXTRN sub_100F62E8:PROC
EXTRN sub_100F793F:PROC
EXTRN sub_100F7966:PROC
EXTRN sub_100F798C:PROC
EXTRN sub_100F883F:PROC
.CODE
FUN_10067d05 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    mov mov eax, 0100Ch
    call sub_100F883F
    mov mov ecx, dword ptr [ebp + 8]
    push push esi
    push push edi
    lea lea eax, [ebp - 4]
    push push eax
    push push dword ptr [ebp + 16]
    lea lea esi, [ebp - 0100Ch]
    mov mov edi, 0FFEh
    call sub_100674D9
    test test eax, eax
    jl sub_10067E91
    mov mov ecx, dword ptr [ebp - 4]
    mov mov edx, dword ptr [ebp + 8]
    mov mov eax, dword ptr [edx + 28]
    shl shl ecx, 2
    mov mov eax, dword ptr [ecx + eax]
    mov mov dword ptr [ebp - 12], eax
    and and eax, 15
    cmp cmp eax, 15
    jne L0
    add add edx, 8
    mov mov dword ptr [ebp - 8], 01010C714h
    mov mov dword ptr [ebp - 4], edx
    jmp L1
    mov mov edx, dword ptr [ebp + 8]
    add add edx, 12
    mov mov dword ptr [ebp - 4], edx
    mov mov edx, dword ptr [ebp + 8]
    mov mov edx, dword ptr [edx + 16]
    test test edx, edx
    mov mov dword ptr [ebp - 8], 01010C75Ch
    je sub_10067ED6
    test test eax, eax
    je sub_10067EDE
    cmp cmp edx, eax
    jb sub_10067EE6
    test test byte ptr [ebp - 12], 16
    je L2
    test test byte ptr [ebp - 12], 32
    jne sub_10067EF6
    mov mov eax, dword ptr [ebp + 8]
    mov mov eax, dword ptr [eax + 28]
    add add eax, ecx
    or or dword ptr [eax], 32
    push push ebx
    mov mov ebx, dword ptr [ebp + 12]
L0:
    test test ebx, ebx
    je sub_10067EAD
    mov mov eax, dword ptr [ebx + 16]
    test test eax, eax
    je sub_10067E92
    push push eax
    push push 010193358h
    lea lea eax, [ebp - 0100Ch]
    push push edi
    push push eax
    call sub_100F793F
    add add esp, 16
    test test eax, eax
    jge sub_10067EA3
    mov mov eax, edi
    lea lea esi, [ebp + eax - 0100Ch]
    sub sub edi, eax
    mov mov eax, dword ptr [ebx + 20]
    test test eax, eax
    jne sub_10067EC6
    inc inc eax
    push push eax
    push push 01010CA14h
    push push edi
    push push esi
    call sub_100F7966
    add add esp, 16
    test test eax, eax
    jge sub_10067EF1
    mov mov eax, edi
    add add esi, eax
    sub sub edi, eax
    cmp cmp dword ptr [ebp + 16], 0
    pop pop ebx
    je sub_10067F28
    push push dword ptr [ebp + 16]
    push push dword ptr [ebp - 8]
    push push 01010CA1Ch
    push push edi
    push push esi
    call sub_100F798C
    add add esp, 20
    test test eax, eax
    jge sub_10067F3D
    mov mov eax, edi
    add add esi, eax
    sub sub edi, eax
    lea lea eax, [ebp + 24]
    push push eax
    push push dword ptr [ebp + 20]
    push push edi
    push push esi
L2:
    call sub_100F62E8
    add add esp, 16
    test test eax, eax
    jge sub_10067F73
    mov mov eax, edi
    mov mov ecx, dword ptr [ebp + 8]
    add add esi, eax
    mov mov eax, dword ptr [ebp - 4]
    mov mov byte ptr [esi], 10
    mov mov byte ptr [esi + 1], 0
    inc inc dword ptr [eax]
    lea lea eax, [ebp - 0100Ch]
    push push eax
    call sub_10067789
    jmp sub_10067FB5
    xor xor eax, eax
    pop pop edi
    pop pop esi
    leave leave
    ret ret
FUN_10067d05 ENDP
END
