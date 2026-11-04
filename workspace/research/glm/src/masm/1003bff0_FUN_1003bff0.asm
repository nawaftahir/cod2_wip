.686
.MODEL FLAT, C
EXTRN sub_1002E3B4:PROC
EXTRN sub_1003B596:PROC
EXTRN sub_1003BF4F:PROC
EXTRN g_101CE684:DWORD
EXTRN g_101D1B9C:DWORD
EXTRN g_1072DEBD:DWORD
.CODE
FUN_1003bff0 PROC
    push ebp
    mov ebp, esp
    and esp, 0FFFFFFF8h
    push ecx
    push esi
    mov esi, eax
    mov eax, dword ptr [g_101CE684]
    mov cl, byte ptr [eax + 8]
    test cl, cl
    je L1
    mov ecx, dword ptr [g_101D1B9C]
    mov al, byte ptr [ecx + 000000160h]
    test al, al
    je L1
    mov al, byte ptr [g_1072DEBD]
    test al, al
    je L0
    call sub_1002E3B4
L0:
    lea esi, [esi + esi*2]
    shl esi, 4
    add esi, 010764590h
    push esi
    call sub_1003B596
    add esp, 4
    push esi
    call sub_1003BF4F
    add esp, 4
L1:
    pop esi
    mov esp, ebp
    pop ebp
    ret
FUN_1003bff0 ENDP
END
