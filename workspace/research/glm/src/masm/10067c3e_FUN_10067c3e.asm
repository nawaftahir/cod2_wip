.686
.MODEL FLAT, C
EXTRN sub_100676F6:PROC
EXTRN sub_100F6257:PROC
EXTRN sub_100F78B2:PROC
EXTRN sub_100F78D9:PROC
EXTRN sub_100F78FB:PROC
EXTRN sub_100F883F:PROC
.CODE
FUN_10067c3e PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, 000001000h
    call sub_100F883F
    push ebx
    mov ebx, dword ptr [ebp + 12]
    test ebx, ebx
    push esi
    push edi
    lea esi, [ebp - 000001000h]
    mov edi, 000000FFEh
    je L4
    mov eax, dword ptr [ebx + 16]
    test eax, eax
    je L1
    push eax
    push 010193358h
    mov eax, esi
    push edi
    push eax
    call sub_100F78B2
    add esp, 16
    test eax, eax
    jge L0
    mov eax, edi
L0:
    lea esi, [ebp + eax - 000001000h]
    sub edi, eax
L1:
    mov eax, dword ptr [ebx + 20]
    test eax, eax
    jne L2
    inc eax
L2:
    push eax
    push 01010CA14h
    push edi
    push esi
    call sub_100F78D9
    add esp, 16
    test eax, eax
    jge L3
    mov eax, edi
L3:
    add esi, eax
    sub edi, eax
L4:
    cmp dword ptr [ebp + 16], 0
    je L6
    push dword ptr [ebp + 16]
    push 01010CA08h
    push edi
    push esi
    call sub_100F78FB
    add esp, 16
    test eax, eax
    jge L5
    mov eax, edi
L5:
    add esi, eax
    sub edi, eax
L6:
    lea eax, [ebp + 24]
    push eax
    push dword ptr [ebp + 20]
    push edi
    push esi
    call sub_100F6257
    add esp, 16
    test eax, eax
    jge L7
    mov eax, edi
L7:
    mov ecx, dword ptr [ebp + 8]
    add esi, eax
    lea eax, [ebp - 000001000h]
    mov byte ptr [esi], 10
    mov byte ptr [esi + 1], 0
    inc dword ptr [ecx + 8]
    push eax
    call sub_100676F6
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_10067c3e ENDP
END
