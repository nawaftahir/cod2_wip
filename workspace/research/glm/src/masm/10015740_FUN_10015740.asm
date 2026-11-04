.686
.MODEL FLAT, C
EXTRN sub_1001562A:PROC
EXTRN sub_1005DA5B:PROC
EXTRN g_101D1B9C:DWORD
.CODE
FUN_10015740 PROC
L0:
    push ebx
    mov ebx, dword ptr [esp + 12]
    push ebp
    mov ebp, dword ptr [esp + 32]
    push esi
    mov esi, dword ptr [esp + 16]
    cmp dword ptr [esi + 8], -2
    push edi
    mov edi, dword ptr [esp + 28]
    jne L5
    lea ebx, [ebx]
L1:
    mov eax, dword ptr [esi + 12]
    push eax
    push edi
    push ebx
    call sub_1005DA5B
    add esp, 12
    cmp eax, 1
    jne L2
    mov esi, dword ptr [esi + 16]
    jmp L4
L2:
    cmp eax, 2
    je L3
    mov ecx, dword ptr [esp + 36]
    mov edx, dword ptr [esp + 32]
    mov eax, dword ptr [esi + 16]
    push ebp
    push ecx
    push edx
    push edi
    push ebx
    push eax
    call L0
    add esp, 24
L3:
    mov esi, dword ptr [esi + 20]
L4:
    cmp dword ptr [esi + 8], -2
    je L1
L5:
    mov esi, dword ptr [esi + 8]
    cmp esi, -1
    je L6
    mov ecx, dword ptr [esp + 36]
    imul esi, esi, 60
    mov edx, dword ptr [esp + 32]
    mov eax, dword ptr [g_101D1B9C]
    push ebp
    push ecx
    push edx
    mov edx, dword ptr [eax + 000000100h]
    push edi
    add esi, edx
    push ebx
    push esi
    call sub_1001562A
    add esp, 24
L6:
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
FUN_10015740 ENDP
END
