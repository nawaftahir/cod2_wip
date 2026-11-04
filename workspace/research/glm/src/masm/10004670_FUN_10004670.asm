.686
.MODEL FLAT, C
EXTRN sub_10001959:PROC
EXTRN sub_1000471D:PROC
EXTRN fp_101D49D4:DWORD
EXTRN g_101AE490:DWORD
EXTRN g_101AE498:DWORD
.CODE
FUN_10004670 PROC
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 12]
    push esi
    push edi
    mov ebx, 2
    mov edx, 21
    mov eax, ebp
    call sub_10001959
    mov esi, eax
    mov eax, dword ptr [ebp]
    mov edi, dword ptr [eax + 0000000B4h]
    mov eax, dword ptr [ebp + 4]
    lea ecx, [esi*4]
    push ecx
    add edi, eax
    call dword ptr [fp_101D49D4]
    add esp, 4
    xor ecx, ecx
    test esi, esi
    mov dword ptr [g_101AE490], eax
    jle sub_1000471D
    jmp L0
    lea esp, [esp]
    mov edi, edi
L0:
    movsx edx, word ptr [edi + ecx*2]
    mov ebx, dword ptr [g_101AE498]
    lea edx, [edx + edx*8]
    lea edx, [ebx + edx*4]
    mov dword ptr [eax + ecx*4], edx
    inc ecx
FUN_10004670 ENDP
END
