.686
.MODEL FLAT, C
EXTRN sub_1002E8FB:PROC
EXTRN sub_10035441:PROC
EXTRN sub_10035564:PROC
EXTRN sub_10035573:PROC
EXTRN sub_1003A983:PROC
EXTRN sub_1003EAAA:PROC
EXTRN EXTRN g_1073055C:DWORD:DWORD
.CODE
FUN_10035490 PROC
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 12]
    mov mov eax, dword ptr [ebp]
    push push esi
    push push edi
    xor xor edi, edi
    test test eax, eax
    jle sub_10035564
    jmp L0
    lea lea esp, [esp]
    mov mov edi, edi
    mov mov eax, edi
    imul imul eax, eax, 098h
    lea lea esi, [eax + ebp + 4]
    mov mov eax, edi
    and and eax, 1
    test test edi, edi
    jne L1
    mov mov ecx, dword ptr [ebp + 0984h]
    mov mov dword ptr [g_1073055C], ecx
    jmp L2
    mov mov edx, 0264h
    sub sub edx, eax
    mov mov ecx, dword ptr [ebp + edx*4]
    lea lea ecx, [ecx + ecx*4]
    mov mov edx, dword ptr [ecx*4 + 0101D4820h]
    mov mov dword ptr [g_1073055C], edx
    mov mov ecx, dword ptr [ebp]
    dec dec ecx
    cmp cmp edi, ecx
    jne sub_10035564
    mov mov eax, dword ptr [ebp + 0988h]
    jmp sub_10035573
    mov mov eax, dword ptr [ebp + eax*4 + 098Ch]
    call sub_1003EAAA
    mov mov ecx, esi
    call sub_10035441
    fild fild dword ptr [esi + 16]
    mov mov edx, dword ptr [esi + 8]
    mov mov eax, dword ptr [esi + 4]
    push push edx
    push push eax
    mov mov eax, dword ptr [esi]
    push push 0
    push push 0
    sub sub esp, 8
    fstp fstp dword ptr [esp + 4]
    or or ebx, -1
    fild fild dword ptr [esi + 12]
    fstp fstp dword ptr [esp]
    push push 0
    push push 0
    call sub_1002E8FB
    add add esp, 32
    call sub_1003A983
    mov mov eax, dword ptr [ebp]
    inc inc edi
    cmp cmp edi, eax
FUN_10035490 ENDP
END
