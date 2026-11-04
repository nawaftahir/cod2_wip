.686
.MODEL FLAT, C
EXTRN sub_10037946:PROC
EXTRN sub_10060C94:PROC
EXTRN sub_100F6C97:PROC
EXTRN sub_100F6D54:PROC
EXTRN g_101CE7EC:DWORD
EXTRN g_1072D9B8:DWORD
EXTRN g_1072D9BC:DWORD
EXTRN g_1072D9C0:DWORD
EXTRN g_1072D9C4:DWORD
EXTRN g_1072D9CC:DWORD
EXTRN g_1072D9D0:DWORD
EXTRN g_1072D9D4:DWORD
EXTRN g_1072D9D8:DWORD
EXTRN g_1072D9DC:DWORD
EXTRN g_10764584:DWORD
.CODE
FUN_1003a5f0 PROC
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    push ebx
    xor ebx, ebx
    cmp ecx, ebx
    je L0
    mov eax, esi
    call sub_10037946
    mov ecx, dword ptr [edi]
    push eax
    push ecx
    push 01019892Ch
    call sub_10060C94
    mov edx, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [edx + 8]
    add esp, 12
    cmp ecx, ebx
    je L0
    mov edx, dword ptr [g_10764584]
    cmp edx, ebx
    setne cl
    cmp cl, bl
    je L0
    push eax
    push 010193358h
    push edx
    call sub_100F6D54
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6C97
    add esp, 16
L0:
    mov ecx, dword ptr [esp + 8]
    mov dword ptr [g_1072D9CC], ebx
    mov dword ptr [g_1072D9B8], ebx
    mov dword ptr [g_1072D9D0], ebx
    mov dword ptr [g_1072D9D4], ebx
    mov dword ptr [g_1072D9D8], ebx
    mov dword ptr [g_1072D9DC], ebx
    mov dword ptr [g_1072D9BC], edi
    mov dword ptr [g_1072D9C0], esi
    mov dword ptr [g_1072D9C4], ecx
    pop ebx
    ret
FUN_1003a5f0 ENDP
END
