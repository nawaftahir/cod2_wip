.686
.MODEL FLAT, C
EXTRN sub_1002E3B4:PROC
EXTRN sub_1003B596:PROC
EXTRN sub_1003BF4F:PROC
EXTRN sub_1003C053:PROC
EXTRN sub_1003C058:PROC
EXTRN sub_1003C068:PROC
EXTRN EXTRN g_101CE684:DWORD:DWORD
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
EXTRN EXTRN g_1072DEBD:DWORD:DWORD
.CODE
FUN_1003bff0 PROC
    push push ebp
    mov mov ebp, esp
    and and esp, -8
    push push ecx
    push push esi
    mov mov esi, eax
    mov mov eax, dword ptr [g_101CE684]
    mov mov cl, byte ptr [eax + 8]
    test test cl, cl
    je sub_1003C058
    mov mov ecx, dword ptr [g_101D1B9C]
    mov mov al, byte ptr [ecx + 0160h]
    test test al, al
    je sub_1003C068
    mov mov al, byte ptr [g_1072DEBD]
    test test al, al
    je sub_1003C053
    call sub_1002E3B4
    lea lea esi, [esi + esi*2]
    shl shl esi, 4
    add add esi, 010764590h
    push push esi
    call sub_1003B596
    add add esp, 4
    push push esi
    call sub_1003BF4F
    add add esp, 4
    pop pop esi
    mov mov esp, ebp
    pop pop ebp
    ret ret
FUN_1003bff0 ENDP
END
