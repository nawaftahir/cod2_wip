.686
.MODEL FLAT, C
EXTRN sub_10018B58:PROC
EXTRN sub_10018B60:PROC
EXTRN g_101D496C:DWORD
.CODE
FUN_10018af0 PROC
    mov al, byte ptr [g_101D496C]
    test al, al
    jne sub_10018B58
    mov eax, dword ptr [ebx]
    push edi
    xor edi, edi
    test eax, eax
    jle sub_10018B60
    lea edx, [ebx + 20]
    push esi
    jmp L0
    lea esp, [esp]
    nop
L0:
    mov esi, dword ptr [edx + 8]
    test esi, 000000700h
    je L1
    mov eax, dword ptr [edx]
    mov ecx, eax
    sar ecx, 8
    and ecx, 7
    cmp ecx, 1
    je L1
    test ecx, ecx
    je L1
    or esi, 0000007FFh
    and eax, 0FFFFF911h
    or eax, 000000111h
    mov dword ptr [edx + 8], esi
    mov dword ptr [edx], eax
L1:
    mov eax, dword ptr [ebx]
    inc edi
FUN_10018af0 ENDP
END
