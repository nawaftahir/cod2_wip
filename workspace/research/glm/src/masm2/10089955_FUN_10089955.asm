.686
.MODEL FLAT, C
EXTRN sub_10086190:PROC
EXTRN sub_100899C8:PROC
EXTRN sub_100899CA:PROC
EXTRN sub_100899F1:PROC
.CODE
FUN_10089955 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    mov mov edx, dword ptr [ebp + 16]
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    push push edi
    mov mov edi, dword ptr [ebp + 12]
    lea lea eax, [edx + edi*4]
    lea lea esi, [esi + eax*4]
    cmp cmp dword ptr [esi], -1
    jne sub_100899CA
    mov mov eax, dword ptr [ecx + 20]
    push push ebx
    mov mov ebx, dword ptr [ebp + 20]
    shl shl ebx, 2
    mov mov eax, dword ptr [ebx + eax]
    cmp cmp dword ptr [eax + 12], -1
    jne sub_100899C8
    mov mov eax, dword ptr [ecx + 20]
    mov mov eax, dword ptr [ebx + eax]
    mov mov dword ptr [eax + 12], edi
    mov mov eax, dword ptr [ecx + 20]
    mov mov eax, dword ptr [ebx + eax]
    mov mov dword ptr [eax + 16], edx
    mov mov eax, dword ptr [ebp + 20]
    jmp sub_100899F1
    fld fld qword ptr [eax + 32]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push edx
    push push edi
    push push dword ptr [ecx + 120]
    call sub_10086190
    mov mov dword ptr [esi], eax
    pop pop ebx
    mov mov eax, dword ptr [esi]
    pop pop edi
    pop pop esi
    pop pop ebp
    ret ret 16
FUN_10089955 ENDP
END
