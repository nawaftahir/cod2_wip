.686
.MODEL FLAT, C
EXTRN sub_100F762A:PROC
EXTRN sub_100F7654:PROC
EXTRN sub_100F7667:PROC
EXTRN sub_100F784F:PROC
EXTRN sub_100F7875:PROC
EXTRN sub_100F7888:PROC
EXTRN sub_100F78EC:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FE259:PROC
EXTRN sub_100FE29D:PROC
EXTRN g_101ADD7C:DWORD
EXTRN g_1076BDD0:DWORD
.CODE
entry PROC
    push 12
    push 01017C4A8h
    call sub_100FB61C
    xor eax, eax
    inc eax
    mov dword ptr [ebp - 28], eax
    mov esi, dword ptr [ebp + 12]
    xor edi, edi
    cmp esi, edi
    jne L0
    cmp dword ptr [g_101ADD7C], edi
    je sub_100F784F
L0:
    mov dword ptr [ebp - 4], edi
    cmp esi, eax
    je L1
    cmp esi, 2
    jne L3
L1:
    mov eax, dword ptr [g_1076BDD0]
    cmp eax, edi
    je L2
    push dword ptr [ebp + 16]
    push esi
    push dword ptr [ebp + 8]
    call eax
    mov dword ptr [ebp - 28], eax
L2:
    cmp dword ptr [ebp - 28], edi
    je sub_100F7875
    push dword ptr [ebp + 16]
    push esi
    push dword ptr [ebp + 8]
    call sub_100F762A
    mov dword ptr [ebp - 28], eax
    cmp eax, edi
    je sub_100F7888
L3:
    mov ebx, dword ptr [ebp + 16]
    push ebx
    push esi
    push dword ptr [ebp + 8]
    call sub_100FE259
    mov dword ptr [ebp - 28], eax
    cmp esi, 1
    jne L4
    cmp eax, edi
    jne L4
    push ebx
    push edi
    push dword ptr [ebp + 8]
    call sub_100F7654
L4:
    cmp esi, edi
    je L5
    cmp esi, 3
    jne L7
L5:
    push ebx
    push esi
    push dword ptr [ebp + 8]
    call sub_100F7667
    test eax, eax
    jne L6
    mov dword ptr [ebp - 28], edi
L6:
    cmp dword ptr [ebp - 28], edi
    je L7
    mov eax, dword ptr [g_1076BDD0]
    cmp eax, edi
    je L7
    push ebx
    push esi
    push dword ptr [ebp + 8]
    call eax
    mov dword ptr [ebp - 28], eax
L7:
    or dword ptr [ebp - 4], 0FFFFFFFFh
    mov eax, dword ptr [ebp - 28]
    jmp sub_100F78EC
    mov eax, dword ptr [ebp - 20]
    mov ecx, dword ptr [eax]
    mov ecx, dword ptr [ecx]
    push eax
    push ecx
    call sub_100FE29D
entry ENDP
END
