.686
.MODEL FLAT, C
EXTRN sub_10018B58:PROC
EXTRN sub_10018B60:PROC
EXTRN sub_10018B6E:PROC
EXTRN sub_10018B7D:PROC
EXTRN sub_10018B81:PROC
EXTRN EXTRN g_101D496C:DWORD:DWORD
.CODE
FUN_10018af0 PROC
    mov mov al, byte ptr [g_101D496C]
    test test al, al
    jne sub_10018B58
    mov mov eax, dword ptr [ebx]
    push push edi
    xor xor edi, edi
    test test eax, eax
    jle sub_10018B60
    lea lea edx, [ebx + 20]
    push push esi
    jmp L0
    lea lea esp, [esp]
    nop nop
    mov mov esi, dword ptr [edx + 8]
    test test esi, 0700h
    je sub_10018B6E
    mov mov eax, dword ptr [edx]
    mov mov ecx, eax
    sar sar ecx, 8
    and and ecx, 7
    cmp cmp ecx, 1
L0:
    je sub_10018B7D
    test test ecx, ecx
    je sub_10018B81
    or or esi, 07FFh
    and and eax, 0FFFFF911h
    or or eax, 0111h
    mov mov dword ptr [edx + 8], esi
    mov mov dword ptr [edx], eax
    mov mov eax, dword ptr [ebx]
    inc inc edi
FUN_10018af0 ENDP
END
