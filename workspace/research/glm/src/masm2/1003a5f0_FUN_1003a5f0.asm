.686
.MODEL FLAT, C
EXTRN sub_10037946:PROC
EXTRN sub_1003A690:PROC
EXTRN sub_10060C94:PROC
EXTRN sub_100F6C97:PROC
EXTRN sub_100F6D54:PROC
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_1072D9B8:DWORD:DWORD
EXTRN EXTRN g_1072D9BC:DWORD:DWORD
EXTRN EXTRN g_1072D9C0:DWORD:DWORD
EXTRN EXTRN g_1072D9C4:DWORD:DWORD
EXTRN EXTRN g_1072D9CC:DWORD:DWORD
EXTRN EXTRN g_1072D9D0:DWORD:DWORD
EXTRN EXTRN g_1072D9D4:DWORD:DWORD
EXTRN EXTRN g_1072D9D8:DWORD:DWORD
EXTRN EXTRN g_1072D9DC:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
.CODE
FUN_1003a5f0 PROC
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    push push ebx
    xor xor ebx, ebx
    cmp cmp ecx, ebx
    je L0
    mov mov eax, esi
    call sub_10037946
    mov mov ecx, dword ptr [edi]
    push push eax
    push push ecx
    push push 01019892Ch
    call sub_10060C94
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [edx + 8]
    add add esp, 12
    cmp cmp ecx, ebx
    je L1
    mov mov edx, dword ptr [g_10764584]
    cmp cmp edx, ebx
    setne setne cl
    cmp cmp cl, bl
    je sub_1003A690
    push push eax
    push push 010193358h
    push push edx
    call sub_100F6D54
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6C97
    add add esp, 16
    mov mov ecx, dword ptr [esp + 8]
    mov mov dword ptr [g_1072D9CC], ebx
    mov mov dword ptr [g_1072D9B8], ebx
    mov mov dword ptr [g_1072D9D0], ebx
    mov mov dword ptr [g_1072D9D4], ebx
    mov mov dword ptr [g_1072D9D8], ebx
    mov mov dword ptr [g_1072D9DC], ebx
    mov mov dword ptr [g_1072D9BC], edi
    mov mov dword ptr [g_1072D9C0], esi
L1:
    mov mov dword ptr [g_1072D9C4], ecx
    pop pop ebx
    ret ret
FUN_1003a5f0 ENDP
END
