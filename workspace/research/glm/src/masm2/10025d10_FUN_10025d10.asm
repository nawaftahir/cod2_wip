.686
.MODEL FLAT, C
EXTRN sub_100259F4:PROC
EXTRN sub_10025AAF:PROC
EXTRN sub_10025BD7:PROC
EXTRN sub_10025C60:PROC
EXTRN sub_10025E7C:PROC
EXTRN sub_10025E8C:PROC
EXTRN sub_10025EA5:PROC
EXTRN sub_10025F09:PROC
EXTRN sub_10025F1A:PROC
EXTRN sub_10025F20:PROC
EXTRN sub_10025F67:PROC
EXTRN sub_10025F8A:PROC
EXTRN sub_10025F91:PROC
EXTRN sub_10025FA5:PROC
EXTRN sub_10025FAC:PROC
.CODE
FUN_10025d10 PROC
    mov mov edx, dword ptr [esp + 4]
    sub sub esp, 12
    cmp cmp edx, edi
    push push ebx
    push push ebp
    jle L1
    mov mov eax, dword ptr [esp + 36]
    mov mov dword ptr [esp + 8], eax
    mov mov dword ptr [esp + 12], eax
    mov mov eax, dword ptr [esp + 28]
    test test eax, eax
    jle L3
    mov mov ebx, edx
    mov mov ebp, edi
    imul imul ebx, esi
    imul imul ebp, esi
    mov mov dword ptr [esp + 16], eax
    jmp L0
    mov mov edx, dword ptr [esp + 24]
    lea lea esp, [esp]
    mov mov eax, dword ptr [esp + 12]
    push push eax
    mov mov eax, dword ptr [esp + 12]
    push push esi
    push push 1
    push push edx
    mov mov ecx, edi
    call sub_100259F4
    mov mov edx, dword ptr [esp + 24]
    mov mov ecx, dword ptr [esp + 28]
    mov mov eax, dword ptr [esp + 32]
    add add edx, ebx
    add add ecx, ebp
    add add esp, 16
    dec dec eax
    mov mov dword ptr [esp + 8], edx
    mov mov dword ptr [esp + 12], ecx
    mov mov dword ptr [esp + 16], eax
    jne L2
    jmp L4
    jge L5
    mov mov eax, dword ptr [esp + 28]
    mov mov ecx, dword ptr [esp + 36]
    dec dec eax
    mov mov ebx, eax
L1:
    imul imul ebx, edx
    mov mov ebp, eax
    imul imul ebx, esi
    imul imul ebp, edi
    imul imul ebp, esi
    add add ebx, ecx
    add add ebp, ecx
    test test eax, eax
    jl sub_10025E8C
    mov mov ecx, edx
    imul imul ecx, esi
    mov mov dword ptr [esp + 12], ecx
    mov mov ecx, edi
    imul imul ecx, esi
    inc inc eax
    mov mov dword ptr [esp + 8], ecx
    mov mov dword ptr [esp + 16], eax
    jmp sub_10025E7C
    mov mov edx, dword ptr [esp + 24]
    push push ebx
    push push esi
    push push edi
    mov mov eax, ebp
    mov mov ecx, 1
    call sub_10025BD7
    mov mov edx, dword ptr [esp + 24]
    mov mov ecx, dword ptr [esp + 20]
    mov mov eax, dword ptr [esp + 28]
    add add esp, 12
    sub sub ebx, edx
    sub sub ebp, ecx
    dec dec eax
    mov mov dword ptr [esp + 16], eax
    jne sub_10025EA5
    mov mov ecx, dword ptr [esp + 32]
    mov mov eax, dword ptr [esp + 28]
    cmp cmp eax, ecx
    jle sub_10025F1A
    test test edi, edi
    mov mov ebx, dword ptr [esp + 36]
    jle sub_10025F67
    mov mov ebp, edi
    jmp sub_10025F09
    mov mov ecx, dword ptr [esp + 32]
    lea lea ecx, [ecx]
    mov mov edx, dword ptr [esp + 28]
    push push ebx
    push push esi
L3:
    push push edi
    push push edx
    mov mov eax, ebx
    call sub_10025AAF
    add add esp, 16
    add add ebx, esi
    dec dec ebp
    jne sub_10025F20
    pop pop ebp
    pop pop ebx
    add add esp, 12
    ret ret
    jge sub_10025F91
    mov mov ebx, dword ptr [esp + 36]
    lea lea eax, [edi - 1]
    mov mov edx, eax
    imul imul edx, esi
    add add ebx, edx
    test test eax, eax
    mov mov ebp, ebx
    jl sub_10025FA5
    inc inc eax
    mov mov dword ptr [esp + 24], eax
    jmp sub_10025F8A
    mov mov ecx, dword ptr [esp + 32]
    mov mov edi, edi
    mov mov edx, dword ptr [esp + 28]
    push push ebx
    push push esi
    push push ecx
    mov mov eax, ebp
    mov mov ecx, edi
    call sub_10025C60
    mov mov eax, dword ptr [esp + 36]
    add add esp, 12
    sub sub ebx, esi
L4:
    sub sub ebp, esi
L5:
    dec dec eax
    mov mov dword ptr [esp + 24], eax
    jne sub_10025FAC
    pop pop ebp
    pop pop ebx
    add add esp, 12
    ret ret
FUN_10025d10 ENDP
END
