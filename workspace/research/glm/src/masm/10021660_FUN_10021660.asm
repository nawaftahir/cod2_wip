.686
.MODEL FLAT, C
EXTRN sub_1002C12F:PROC
EXTRN g_1042E778:DWORD
.CODE
FUN_10021660 PROC
    mov ecx, dword ptr [g_1042E778]
    mov edx, dword ptr [ecx + 000030000h]
    mov eax, 000030000h
    push esi
    mov esi, dword ptr [ecx + 000030004h]
    sub eax, edx
    lea eax, [eax + esi - 000002000h]
    cmp eax, 28
    jge L0
    mov dword ptr [ecx + 000030008h], 0
    pop esi
    ret
L0:
    mov esi, dword ptr [esp + 24]
    lea eax, [edx + ecx]
    mov dword ptr [ecx + 000030008h], eax
    add edx, 28
    mov dword ptr [ecx + 000030000h], edx
    mov ecx, dword ptr [esp + 28]
    mov edx, dword ptr [esp + 8]
    mov word ptr [eax], 20
    mov word ptr [eax + 2], 28
    mov dword ptr [eax + 4], ecx
    mov ecx, dword ptr [esp + 12]
    mov dword ptr [eax + 8], edx
    mov edx, dword ptr [esp + 16]
    mov dword ptr [eax + 12], ecx
    mov ecx, dword ptr [esp + 20]
    push edi
    lea edi, [eax + 24]
    mov dword ptr [eax + 16], edx
    mov dword ptr [eax + 20], ecx
    call sub_1002C12F
    pop edi
    pop esi
    ret
FUN_10021660 ENDP
END
