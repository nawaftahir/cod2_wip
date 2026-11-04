.686
.MODEL FLAT, C
EXTRN sub_10035C3D:PROC
EXTRN sub_10035CD3:PROC
EXTRN sub_10035CDB:PROC
EXTRN sub_10035D00:PROC
EXTRN sub_10035D15:PROC
EXTRN sub_10035D2E:PROC
EXTRN EXTRN g_10764578:DWORD:DWORD
EXTRN EXTRN g_1076457C:DWORD:DWORD
.CODE
FUN_10035c40 PROC
    push push ebp
    push push esi
    mov mov esi, dword ptr [g_1076457C]
    push push edi
    dec dec esi
    xor xor edi, edi
    test test esi, esi
    jl L0
    mov mov edx, dword ptr [g_10764578]
    lea lea eax, [edi + esi]
    sar sar eax, 1
    lea lea ecx, [eax + eax*2]
    movzx movzx ebp, word ptr [edx + ecx*2]
    lea lea edx, [edx + ecx*2]
    mov mov ecx, ebx
    sub sub ecx, ebp
    jne L1
    movzx movzx ebp, word ptr [edx + 2]
    mov mov ecx, dword ptr [esp + 16]
    sub sub ecx, ebp
    jne L2
    movzx movzx edx, word ptr [edx + 4]
    mov mov ecx, dword ptr [esp + 20]
    sub sub ecx, edx
    je sub_10035D00
    test test ecx, ecx
    jge sub_10035CD3
    lea lea esi, [eax - 1]
    jmp sub_10035CDB
    lea lea edi, [eax + 1]
    cmp cmp edi, esi
    jle L0
    mov mov eax, dword ptr [esp + 24]
    test test eax, eax
    je sub_10035D15
    mov mov eax, dword ptr [esp + 20]
    mov mov ecx, dword ptr [esp + 16]
L0:
    push push eax
    push push ecx
    push push ebx
    mov mov edx, edi
    call sub_10035C3D
    add add esp, 12
    test test al, al
    je sub_10035D2E
    mov mov eax, edi
    pop pop edi
    pop pop esi
    pop pop ebp
    ret ret
L2:
    or or eax, -1
    pop pop edi
    pop pop esi
    pop pop ebp
    ret ret
FUN_10035c40 ENDP
END
