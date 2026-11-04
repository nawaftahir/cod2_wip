.686
.MODEL FLAT, C
EXTRN sub_1002E8FB:PROC
EXTRN sub_10035441:PROC
EXTRN sub_10035564:PROC
EXTRN sub_1003A983:PROC
EXTRN sub_1003EAAA:PROC
EXTRN g_1073055C:DWORD
.CODE
FUN_10035490 PROC
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 12]
    mov eax, dword ptr [ebp]
    push esi
    push edi
    xor edi, edi
    test eax, eax
    jle sub_10035564
    jmp L0
    lea esp, [esp]
    mov edi, edi
L0:
    mov eax, edi
    imul eax, eax, 000000098h
    lea esi, [eax + ebp + 4]
    mov eax, edi
    and eax, 1
    test edi, edi
    jne L1
    mov ecx, dword ptr [ebp + 000000984h]
    mov dword ptr [g_1073055C], ecx
    jmp L2
L1:
    mov edx, 000000264h
    sub edx, eax
    mov ecx, dword ptr [ebp + edx*4]
    lea ecx, [ecx + ecx*4]
    mov edx, dword ptr [ecx*4 + 0101D4820h]
    mov dword ptr [g_1073055C], edx
L2:
    mov ecx, dword ptr [ebp]
    dec ecx
    cmp edi, ecx
    jne L3
    mov eax, dword ptr [ebp + 000000988h]
    jmp L4
L3:
    mov eax, dword ptr [ebp + eax*4 + 00000098Ch]
L4:
    call sub_1003EAAA
    mov ecx, esi
    call sub_10035441
    fild dword ptr [esi + 16]
    mov edx, dword ptr [esi + 8]
    mov eax, dword ptr [esi + 4]
    push edx
    push eax
    mov eax, dword ptr [esi]
    push 0
    push 0
    sub esp, 8
    fstp dword ptr [esp + 4]
    or ebx, 0FFFFFFFFh
    fild dword ptr [esi + 12]
    fstp dword ptr [esp]
    push 0
    push 0
    call sub_1002E8FB
    add esp, 32
    call sub_1003A983
    mov eax, dword ptr [ebp]
    inc edi
    cmp edi, eax
FUN_10035490 ENDP
END
