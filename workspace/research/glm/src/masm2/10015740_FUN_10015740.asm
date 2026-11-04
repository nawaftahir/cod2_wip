.686
.MODEL FLAT, C
EXTRN sub_1001562A:PROC
EXTRN sub_100157D3:PROC
EXTRN sub_10015834:PROC
EXTRN sub_1005DA5B:PROC
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
.CODE
FUN_10015740 PROC
    push push ebx
    mov mov ebx, dword ptr [esp + 12]
    push push ebp
    mov mov ebp, dword ptr [esp + 32]
    push push esi
    mov mov esi, dword ptr [esp + 16]
    cmp cmp dword ptr [esi + 8], -2
    push push edi
    mov mov edi, dword ptr [esp + 28]
    jne L2
    lea lea ebx, [ebx]
    mov mov eax, dword ptr [esi + 12]
    push push eax
    push push edi
    push push ebx
    call sub_1005DA5B
    add add esp, 12
    cmp cmp eax, 1
    jne L1
    mov mov esi, dword ptr [esi + 16]
    jmp L4
    cmp cmp eax, 2
    je sub_100157D3
    mov mov ecx, dword ptr [esp + 36]
    mov mov edx, dword ptr [esp + 32]
    mov mov eax, dword ptr [esi + 16]
    push push ebp
    push push ecx
    push push edx
    push push edi
    push push ebx
    push push eax
    call L0
L0:
    add add esp, 24
    mov mov esi, dword ptr [esi + 20]
    cmp cmp dword ptr [esi + 8], -2
    je L3
    mov mov esi, dword ptr [esi + 8]
    cmp cmp esi, -1
    je sub_10015834
    mov mov ecx, dword ptr [esp + 36]
L1:
    imul imul esi, esi, 60
    mov mov edx, dword ptr [esp + 32]
    mov mov eax, dword ptr [g_101D1B9C]
    push push ebp
    push push ecx
L2:
    push push edx
    mov mov edx, dword ptr [eax + 0100h]
    push push edi
    add add esi, edx
    push push ebx
    push push esi
    call sub_1001562A
    add add esp, 24
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
L4:
    ret ret
FUN_10015740 ENDP
END
