.686
.MODEL FLAT, C
EXTRN sub_10001959:PROC
EXTRN sub_10004707:PROC
EXTRN sub_1000471D:PROC
EXTRN EXTRN fp_101D49D4:DWORD:DWORD
EXTRN EXTRN g_101AE490:DWORD:DWORD
EXTRN EXTRN g_101AE498:DWORD:DWORD
.CODE
FUN_10004670 PROC
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 12]
    push push esi
    push push edi
    mov mov ebx, 2
    mov mov edx, 21
    mov mov eax, ebp
    call sub_10001959
    mov mov esi, eax
    mov mov eax, dword ptr [ebp]
    mov mov edi, dword ptr [eax + 0B4h]
    mov mov eax, dword ptr [ebp + 4]
    lea lea ecx, [esi*4]
    push push ecx
    add add edi, eax
    call dword ptr [fp_101D49D4]
    add add esp, 4
    xor xor ecx, ecx
    test test esi, esi
    mov mov dword ptr [g_101AE490], eax
    jle sub_1000471D
    jmp sub_10004707
    lea lea esp, [esp]
    mov mov edi, edi
    movsx movsx edx, word ptr [edi + ecx*2]
    mov mov ebx, dword ptr [g_101AE498]
    lea lea edx, [edx + edx*8]
    lea lea edx, [ebx + edx*4]
    mov mov dword ptr [eax + ecx*4], edx
    inc inc ecx
FUN_10004670 ENDP
END
