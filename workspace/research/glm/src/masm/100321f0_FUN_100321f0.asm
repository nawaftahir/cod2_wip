.686
.MODEL FLAT, C
EXTRN sub_1002E481:PROC
EXTRN sub_1003221C:PROC
EXTRN sub_1003A8F6:PROC
EXTRN sub_1003E787:PROC
EXTRN g_101D4C6C:DWORD
EXTRN g_101D4C70:DWORD
EXTRN g_1072D9D0:DWORD
EXTRN g_1072D9E0:DWORD
EXTRN g_1072DDB4:DWORD
EXTRN g_1072DDB8:DWORD
EXTRN g_1072DDBC:DWORD
EXTRN g_1072DDC0:DWORD
EXTRN g_1072DDC4:DWORD
EXTRN g_1072DDC8:DWORD
EXTRN g_1072DDCC:DWORD
EXTRN g_1072DDD0:DWORD
EXTRN g_1072DDD4:DWORD
EXTRN g_1072DDD8:DWORD
EXTRN g_1072DDDC:DWORD
EXTRN g_1072DDE0:DWORD
EXTRN g_1072DDE4:DWORD
EXTRN g_1072DDE8:DWORD
EXTRN g_1072DDEC:DWORD
EXTRN g_1072DE30:DWORD
EXTRN g_1072DE34:DWORD
EXTRN g_1072DE38:DWORD
EXTRN g_1072DE3C:DWORD
EXTRN g_10766724:DWORD
.CODE
FUN_100321f0 PROC
    push ebp
    mov ebp, esp
    and esp, 0FFFFFFF8h
    push ecx
    mov eax, dword ptr [g_1072D9D0]
    test eax, eax
    push ebx
    mov ebx, dword ptr [ebp + 8]
    push esi
    mov esi, dword ptr [ebx]
    push edi
    jne L0
    mov eax, dword ptr [g_1072D9E0]
    test eax, eax
    je L1
L0:
    call sub_1003A8F6
L1:
    mov eax, dword ptr [esi + 44]
    mov dword ptr [g_1072DDB4], eax
    lea ecx, [esi + 4]
    mov edx, dword ptr [ecx]
    mov dword ptr [g_1072DDB8], edx
    mov eax, dword ptr [ecx + 4]
    mov dword ptr [g_1072DDBC], eax
    mov edx, dword ptr [ecx + 8]
    mov dword ptr [g_1072DDC0], edx
    mov eax, dword ptr [ecx + 12]
    mov dword ptr [g_1072DDC4], eax
    mov eax, dword ptr [esi + 20]
    mov dword ptr [g_1072DDC8], eax
    add esi, 24
    mov ecx, dword ptr [esi]
    mov dword ptr [g_1072DDCC], ecx
    mov edx, dword ptr [esi + 4]
    mov dword ptr [g_1072DDD0], edx
    mov ecx, dword ptr [esi + 8]
    mov dword ptr [g_1072DDD4], ecx
    mov edx, dword ptr [esi + 12]
    mov dword ptr [g_1072DDD8], edx
    mov ecx, dword ptr [esi + 16]
    mov dword ptr [g_1072DDDC], ecx
    mov edx, dword ptr [eax + 48]
    mov dword ptr [g_1072DDE0], edx
    mov ecx, dword ptr [eax + 52]
    mov dword ptr [g_1072DDE4], ecx
    mov edx, dword ptr [eax + 56]
    mov dword ptr [g_1072DDE8], edx
    mov ecx, dword ptr [eax + 60]
    mov edx, dword ptr [g_101D4C6C]
    mov dword ptr [g_1072DDEC], ecx
    lea esi, [eax + 0000000C8h]
    mov eax, dword ptr [g_101D4C70]
    mov ecx, 16
    mov edi, 01072DDF0h
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov dword ptr [g_1072DE3C], eax
    mov eax, dword ptr [g_10766724]
    test eax, eax
    mov dword ptr [g_1072DE30], 0
    mov dword ptr [g_1072DE34], 1
    mov dword ptr [g_1072DE38], edx
    jne L2
    call sub_1003E787
L2:
    call sub_1003221C
    call sub_1002E481
    mov eax, dword ptr [ebx]
    movzx ecx, word ptr [eax + 2]
    pop edi
    add ecx, eax
    pop esi
    mov dword ptr [ebx], ecx
    pop ebx
    mov esp, ebp
    pop ebp
    ret
FUN_100321f0 ENDP
END
