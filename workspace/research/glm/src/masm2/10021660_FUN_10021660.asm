.686
.MODEL FLAT, C
EXTRN sub_1002C12F:PROC
EXTRN EXTRN g_1042E778:DWORD:DWORD
.CODE
FUN_10021660 PROC
    mov mov ecx, dword ptr [g_1042E778]
    mov mov edx, dword ptr [ecx + 030000h]
    mov mov eax, 030000h
    push push esi
    mov mov esi, dword ptr [ecx + 030004h]
    sub sub eax, edx
    lea lea eax, [eax + esi - 02000h]
    cmp cmp eax, 28
    jge L0
    mov mov dword ptr [ecx + 030008h], 0
    pop pop esi
    ret ret
    mov mov esi, dword ptr [esp + 24]
    lea lea eax, [edx + ecx]
    mov mov dword ptr [ecx + 030008h], eax
    add add edx, 28
    mov mov dword ptr [ecx + 030000h], edx
    mov mov ecx, dword ptr [esp + 28]
    mov mov edx, dword ptr [esp + 8]
    mov mov word ptr [eax], 20
    mov mov word ptr [eax + 2], 28
    mov mov dword ptr [eax + 4], ecx
    mov mov ecx, dword ptr [esp + 12]
    mov mov dword ptr [eax + 8], edx
    mov mov edx, dword ptr [esp + 16]
    mov mov dword ptr [eax + 12], ecx
    mov mov ecx, dword ptr [esp + 20]
    push push edi
    lea lea edi, [eax + 24]
    mov mov dword ptr [eax + 16], edx
    mov mov dword ptr [eax + 20], ecx
    call sub_1002C12F
    pop pop edi
    pop pop esi
    ret ret
FUN_10021660 ENDP
END
