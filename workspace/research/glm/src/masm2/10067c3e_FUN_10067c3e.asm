.686
.MODEL FLAT, C
EXTRN sub_100676F6:PROC
EXTRN sub_10067D10:PROC
EXTRN sub_10067D42:PROC
EXTRN sub_10067D54:PROC
EXTRN sub_10067D8A:PROC
EXTRN sub_100F6257:PROC
EXTRN sub_100F78B2:PROC
EXTRN sub_100F78D9:PROC
EXTRN sub_100F78FB:PROC
EXTRN sub_100F883F:PROC
.CODE
FUN_10067c3e PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    mov mov eax, 01000h
    call sub_100F883F
    push push ebx
    mov mov ebx, dword ptr [ebp + 12]
    test test ebx, ebx
    push push esi
    push push edi
    lea lea esi, [ebp - 01000h]
    mov mov edi, 0FFEh
    je L2
    mov mov eax, dword ptr [ebx + 16]
    test test eax, eax
    je L0
    push push eax
    push push 010193358h
    mov mov eax, esi
    push push edi
    push push eax
    call sub_100F78B2
    add add esp, 16
    test test eax, eax
    jge L1
    mov mov eax, edi
    lea lea esi, [ebp + eax - 01000h]
    sub sub edi, eax
    mov mov eax, dword ptr [ebx + 20]
    test test eax, eax
    jne L3
    inc inc eax
    push push eax
    push push 01010CA14h
    push push edi
    push push esi
    call sub_100F78D9
    add add esp, 16
    test test eax, eax
    jge sub_10067D10
    mov mov eax, edi
    add add esi, eax
    sub sub edi, eax
    cmp cmp dword ptr [ebp + 16], 0
    je sub_10067D42
    push push dword ptr [ebp + 16]
L0:
    push push 01010CA08h
    push push edi
    push push esi
    call sub_100F78FB
    add add esp, 16
    test test eax, eax
    jge sub_10067D54
    mov mov eax, edi
    add add esi, eax
    sub sub edi, eax
    lea lea eax, [ebp + 24]
    push push eax
    push push dword ptr [ebp + 20]
    push push edi
    push push esi
    call sub_100F6257
    add add esp, 16
    test test eax, eax
    jge sub_10067D8A
    mov mov eax, edi
L3:
    mov mov ecx, dword ptr [ebp + 8]
    add add esi, eax
    lea lea eax, [ebp - 01000h]
    mov mov byte ptr [esi], 10
    mov mov byte ptr [esi + 1], 0
    inc inc dword ptr [ecx + 8]
    push push eax
    call sub_100676F6
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_10067c3e ENDP
END
