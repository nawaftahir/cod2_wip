.686
.MODEL FLAT, C
EXTRN sub_1000CAD2:PROC
EXTRN sub_1000CB02:PROC
EXTRN sub_1000CB68:PROC
EXTRN sub_1000CECC:PROC
EXTRN sub_1000D519:PROC
EXTRN sub_1002296A:PROC
EXTRN EXTRN g_101A59D0:DWORD:DWORD
EXTRN EXTRN g_101CE8E2:DWORD:DWORD
EXTRN EXTRN g_101CE8E4:DWORD:DWORD
EXTRN EXTRN g_101CE8F6:DWORD:DWORD
EXTRN EXTRN g_101CE8F8:DWORD:DWORD
.CODE
FUN_10022c30 PROC
    push push ebx
    push push esi
    mov mov esi, dword ptr [g_101A59D0]
    xor xor ebx, ebx
    mov mov dword ptr [g_101CE8F8], esi
    mov mov byte ptr [g_101CE8F6], 6
    mov mov byte ptr [g_101CE8E2], bl
    mov mov byte ptr [g_101CE8E4], bl
    call sub_1000CB68
    mov mov esi, 0101CE8D8h
    push push ebx
    mov mov dword ptr [eax*4 + 0101CEA68h], esi
    mov mov eax, 080h
    push push 1
    push push 1
    mov mov ebx, 21
    mov mov ecx, eax
    mov mov dword ptr [edi], esi
    call sub_1000CECC
    push push 1
    push push 080h
    push push 080h
    push push 3
    push push esi
    mov mov eax, ebx
    call sub_1000CAD2
    mov mov esi, dword ptr [edi]
    call sub_1000D519
    push push 1
    push push 080h
    mov mov dword ptr [edi + 4], eax
    mov mov eax, dword ptr [edi]
    push push 080h
    push push 3
    push push eax
    mov mov eax, ebx
    mov mov dword ptr [edi + 12], 080h
    mov mov dword ptr [edi + 16], 080h
    call sub_1000CB02
    add add esp, 52
    call sub_1002296A
    pop pop esi
    mov mov dword ptr [edi + 8], eax
    pop pop ebx
    ret ret
FUN_10022c30 ENDP
END
