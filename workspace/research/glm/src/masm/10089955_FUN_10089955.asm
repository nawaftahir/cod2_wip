.686
.MODEL FLAT, C
EXTRN sub_10086190:PROC
.CODE
FUN_10089955 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov edx, dword ptr [ebp + 16]
    push esi
    mov esi, dword ptr [ebp + 8]
    push edi
    mov edi, dword ptr [ebp + 12]
    lea eax, [edx + edi*4]
    lea esi, [esi + eax*4]
    cmp dword ptr [esi], -1
    jne L2
    mov eax, dword ptr [ecx + 20]
    push ebx
    mov ebx, dword ptr [ebp + 20]
    shl ebx, 2
    mov eax, dword ptr [ebx + eax]
    cmp dword ptr [eax + 12], -1
    jne L0
    mov eax, dword ptr [ecx + 20]
    mov eax, dword ptr [ebx + eax]
    mov dword ptr [eax + 12], edi
    mov eax, dword ptr [ecx + 20]
    mov eax, dword ptr [ebx + eax]
    mov dword ptr [eax + 16], edx
    mov eax, dword ptr [ebp + 20]
    jmp L1
L0:
    fld qword ptr [eax + 32]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push edx
    push edi
    push dword ptr [ecx + 120]
    call sub_10086190
L1:
    mov dword ptr [esi], eax
    pop ebx
L2:
    mov eax, dword ptr [esi]
    pop edi
    pop esi
    pop ebp
    ret 16
FUN_10089955 ENDP
END
