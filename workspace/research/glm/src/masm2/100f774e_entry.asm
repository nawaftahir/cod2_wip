.686
.MODEL FLAT, C
EXTRN sub_100F762A:PROC
EXTRN sub_100F7654:PROC
EXTRN sub_100F7667:PROC
EXTRN sub_100F784E:PROC
EXTRN sub_100F784F:PROC
EXTRN sub_100F7852:PROC
EXTRN sub_100F7869:PROC
EXTRN sub_100F7875:PROC
EXTRN sub_100F7888:PROC
EXTRN sub_100F788D:PROC
EXTRN sub_100F7897:PROC
EXTRN sub_100F78AD:PROC
EXTRN sub_100F78B6:PROC
EXTRN sub_100F78EC:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FE259:PROC
EXTRN sub_100FE29D:PROC
EXTRN EXTRN g_101ADD7C:DWORD:DWORD
EXTRN EXTRN g_1076BDD0:DWORD:DWORD
.CODE
entry PROC
    push push 12
    push push 01017C4A8h
    call sub_100FB61C
    xor xor eax, eax
    inc inc eax
    mov mov dword ptr [ebp - 28], eax
    mov mov esi, dword ptr [ebp + 12]
    xor xor edi, edi
    cmp cmp esi, edi
    jne L0
    cmp cmp dword ptr [g_101ADD7C], edi
    je sub_100F784F
    mov mov dword ptr [ebp - 4], edi
    cmp cmp esi, eax
    je L1
    cmp cmp esi, 2
    jne L3
    mov mov eax, dword ptr [g_1076BDD0]
    cmp cmp eax, edi
    je L2
    push push dword ptr [ebp + 16]
    push push esi
    push push dword ptr [ebp + 8]
    call call eax
    mov mov dword ptr [ebp - 28], eax
    cmp cmp dword ptr [ebp - 28], edi
    je sub_100F7875
    push push dword ptr [ebp + 16]
    push push esi
    push push dword ptr [ebp + 8]
    call sub_100F762A
    mov mov dword ptr [ebp - 28], eax
    cmp cmp eax, edi
    je sub_100F7888
    mov mov ebx, dword ptr [ebp + 16]
    push push ebx
    push push esi
    push push dword ptr [ebp + 8]
    call sub_100FE259
    mov mov dword ptr [ebp - 28], eax
    cmp cmp esi, 1
    jne sub_100F784E
    cmp cmp eax, edi
    jne sub_100F7852
    push push ebx
    push push edi
    push push dword ptr [ebp + 8]
    call sub_100F7654
    cmp cmp esi, edi
    je sub_100F7869
    cmp cmp esi, 3
    jne sub_100F7897
    push push ebx
    push push esi
    push push dword ptr [ebp + 8]
    call sub_100F7667
    test test eax, eax
    jne sub_100F788D
    mov mov dword ptr [ebp - 28], edi
    cmp cmp dword ptr [ebp - 28], edi
    je sub_100F78AD
    mov mov eax, dword ptr [g_1076BDD0]
    cmp cmp eax, edi
    je sub_100F78B6
    push push ebx
    push push esi
    push push dword ptr [ebp + 8]
    call call eax
    mov mov dword ptr [ebp - 28], eax
    or or dword ptr [ebp - 4], -1
    mov mov eax, dword ptr [ebp - 28]
    jmp sub_100F78EC
    mov mov eax, dword ptr [ebp - 20]
    mov mov ecx, dword ptr [eax]
    mov mov ecx, dword ptr [ecx]
    push push eax
    push push ecx
    call sub_100FE29D
entry ENDP
END
