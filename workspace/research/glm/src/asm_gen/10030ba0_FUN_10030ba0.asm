; FUN_10030ba0 @ 0x10030ba0 — auto-synthesized
    EXTRN g_1072d9d0:DWORD
    EXTRN g_1072d9e0:DWORD
    EXTRN g_10730558:DWORD
    EXTRN g_10766718:DWORD
    sub_1003091e PROTO C
    sub_10030a7f PROTO C
    sub_10030aff PROTO C
    sub_1003a8f6 PROTO C
    sub_1003ea89 PROTO C
.CODE
FUN_10030ba0 PROC
    push ebp
    mov ebp, esp
    and esp, 0xfffffff8
    push ecx
    mov eax, dword ptr [g_1072d9d0]
    test eax, eax
    push ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    push edi
    mov edi, dword ptr [esi]
    jne L0
    mov eax, dword ptr [g_1072d9e0]
    test eax, eax
    je L1
    call sub_1003a8f6
    mov ebx, dword ptr [g_10766718]
    mov dword ptr [g_10730558], 0xe
    mov eax, dword ptr [edi + 4]
    push eax
    call sub_10030a7f
    add esp, 4
    test al, al
    je L2
    mov ecx, dword ptr [edi + 4]
    push ecx
    call sub_10030aff
    add esp, 4
    mov eax, ebx
    call sub_1003ea89
    call sub_1003091e
    mov eax, dword ptr [esi]
    movzx edx, word ptr [eax + 2]
    add edx, eax
    pop edi
    mov dword ptr [esi], edx
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
FUN_10030ba0 ENDP
END