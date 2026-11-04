.686
.MODEL FLAT, C
EXTRN sub_1002E481:PROC
EXTRN sub_100323D9:PROC
EXTRN sub_1003A8F6:PROC
EXTRN sub_1003E787:PROC
EXTRN EXTRN g_101D4C6C:DWORD:DWORD
EXTRN EXTRN g_101D4C70:DWORD:DWORD
EXTRN EXTRN g_1072D9D0:DWORD:DWORD
EXTRN EXTRN g_1072D9E0:DWORD:DWORD
EXTRN EXTRN g_1072DDB4:DWORD:DWORD
EXTRN EXTRN g_1072DDB8:DWORD:DWORD
EXTRN EXTRN g_1072DDBC:DWORD:DWORD
EXTRN EXTRN g_1072DDC0:DWORD:DWORD
EXTRN EXTRN g_1072DDC4:DWORD:DWORD
EXTRN EXTRN g_1072DDC8:DWORD:DWORD
EXTRN EXTRN g_1072DDCC:DWORD:DWORD
EXTRN EXTRN g_1072DDD0:DWORD:DWORD
EXTRN EXTRN g_1072DDD4:DWORD:DWORD
EXTRN EXTRN g_1072DDD8:DWORD:DWORD
EXTRN EXTRN g_1072DDDC:DWORD:DWORD
EXTRN EXTRN g_1072DDE0:DWORD:DWORD
EXTRN EXTRN g_1072DDE4:DWORD:DWORD
EXTRN EXTRN g_1072DDE8:DWORD:DWORD
EXTRN EXTRN g_1072DDEC:DWORD:DWORD
EXTRN EXTRN g_1072DE30:DWORD:DWORD
EXTRN EXTRN g_1072DE34:DWORD:DWORD
EXTRN EXTRN g_1072DE38:DWORD:DWORD
EXTRN EXTRN g_1072DE3C:DWORD:DWORD
EXTRN EXTRN g_10766724:DWORD:DWORD
.CODE
FUN_100321f0 PROC
    push push ebp
    mov mov ebp, esp
    and and esp, -8
    push push ecx
    mov mov eax, dword ptr [g_1072D9D0]
    test test eax, eax
    push push ebx
    mov mov ebx, dword ptr [ebp + 8]
    push push esi
    mov mov esi, dword ptr [ebx]
    push push edi
    jne L1
    mov mov eax, dword ptr [g_1072D9E0]
    test test eax, eax
    je L2
    call sub_1003A8F6
    mov mov eax, dword ptr [esi + 44]
    mov mov dword ptr [g_1072DDB4], eax
    lea lea ecx, [esi + 4]
    mov mov edx, dword ptr [ecx]
    mov mov dword ptr [g_1072DDB8], edx
L1:
    mov mov eax, dword ptr [ecx + 4]
    mov mov dword ptr [g_1072DDBC], eax
    mov mov edx, dword ptr [ecx + 8]
    mov mov dword ptr [g_1072DDC0], edx
    mov mov eax, dword ptr [ecx + 12]
    mov mov dword ptr [g_1072DDC4], eax
    mov mov eax, dword ptr [esi + 20]
    mov mov dword ptr [g_1072DDC8], eax
    add add esi, 24
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [g_1072DDCC], ecx
    mov mov edx, dword ptr [esi + 4]
    mov mov dword ptr [g_1072DDD0], edx
    mov mov ecx, dword ptr [esi + 8]
    mov mov dword ptr [g_1072DDD4], ecx
    mov mov edx, dword ptr [esi + 12]
    mov mov dword ptr [g_1072DDD8], edx
    mov mov ecx, dword ptr [esi + 16]
    mov mov dword ptr [g_1072DDDC], ecx
    mov mov edx, dword ptr [eax + 48]
    mov mov dword ptr [g_1072DDE0], edx
    mov mov ecx, dword ptr [eax + 52]
    mov mov dword ptr [g_1072DDE4], ecx
    mov mov edx, dword ptr [eax + 56]
    mov mov dword ptr [g_1072DDE8], edx
    mov mov ecx, dword ptr [eax + 60]
    mov mov edx, dword ptr [g_101D4C6C]
    mov mov dword ptr [g_1072DDEC], ecx
    lea lea esi, [eax + 0C8h]
    mov mov eax, dword ptr [g_101D4C70]
    mov mov ecx, 16
    mov mov edi, 01072DDF0h
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov dword ptr [g_1072DE3C], eax
    mov mov eax, dword ptr [g_10766724]
    test test eax, eax
    mov mov dword ptr [g_1072DE30], 0
    mov mov dword ptr [g_1072DE34], 1
    mov mov dword ptr [g_1072DE38], edx
    jne sub_100323D9
    call sub_1003E787
    call L0
    call sub_1002E481
    mov mov eax, dword ptr [ebx]
    movzx movzx ecx, word ptr [eax + 2]
    pop pop edi
    add add ecx, eax
    pop pop esi
    mov mov dword ptr [ebx], ecx
    pop pop ebx
    mov mov esp, ebp
    pop pop ebp
    ret ret
FUN_100321f0 ENDP
END
