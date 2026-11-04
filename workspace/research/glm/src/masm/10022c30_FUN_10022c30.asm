.686
.MODEL FLAT, C
EXTRN sub_1000CAD2:PROC
EXTRN sub_1000CB02:PROC
EXTRN sub_1000CB68:PROC
EXTRN sub_1000CECC:PROC
EXTRN sub_1000D519:PROC
EXTRN sub_1002296A:PROC
EXTRN g_101A59D0:DWORD
EXTRN g_101CE8E2:DWORD
EXTRN g_101CE8E4:DWORD
EXTRN g_101CE8F6:DWORD
EXTRN g_101CE8F8:DWORD
.CODE
FUN_10022c30 PROC
    push ebx
    push esi
    mov esi, dword ptr [g_101A59D0]
    xor ebx, ebx
    mov dword ptr [g_101CE8F8], esi
    mov byte ptr [g_101CE8F6], 6
    mov byte ptr [g_101CE8E2], bl
    mov byte ptr [g_101CE8E4], bl
    call sub_1000CB68
    mov esi, 0101CE8D8h
    push ebx
    mov dword ptr [eax*4 + 0101CEA68h], esi
    mov eax, 000000080h
    push 1
    push 1
    mov ebx, 21
    mov ecx, eax
    mov dword ptr [edi], esi
    call sub_1000CECC
    push 1
    push 000000080h
    push 000000080h
    push 3
    push esi
    mov eax, ebx
    call sub_1000CAD2
    mov esi, dword ptr [edi]
    call sub_1000D519
    push 1
    push 000000080h
    mov dword ptr [edi + 4], eax
    mov eax, dword ptr [edi]
    push 000000080h
    push 3
    push eax
    mov eax, ebx
    mov dword ptr [edi + 12], 000000080h
    mov dword ptr [edi + 16], 000000080h
    call sub_1000CB02
    add esp, 52
    call sub_1002296A
    pop esi
    mov dword ptr [edi + 8], eax
    pop ebx
    ret
FUN_10022c30 ENDP
END
