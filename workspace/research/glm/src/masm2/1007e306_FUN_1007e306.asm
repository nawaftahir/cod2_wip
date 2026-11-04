.686
.MODEL FLAT, C
EXTRN sub_100F789D:PROC
EXTRN sub_100F78A7:PROC
EXTRN sub_100F78AF:PROC
.CODE
FUN_1007e306 PROC
    mov mov edi, edi
    push push esi
    mov mov esi, ecx
    cmp cmp dword ptr [esi + 20], 0
    mov mov dword ptr [esi], 01010FD70h
    je L2
    push push edi
    xor xor edi, edi
    cmp cmp dword ptr [esi + 24], edi
    jbe L1
    mov mov eax, dword ptr [esi + 20]
    mov mov ecx, dword ptr [eax + edi*4]
    test test ecx, ecx
    je L3
    push push 1
    call L0
    inc inc edi
    cmp cmp edi, dword ptr [esi + 24]
    jb L1
    push push dword ptr [esi + 20]
    call sub_100F789D
    pop pop ecx
    pop pop edi
    push push dword ptr [esi + 8]
    call sub_100F78A7
    push push dword ptr [esi + 28]
    call sub_100F78AF
    pop pop ecx
L2:
    pop pop ecx
    pop pop esi
L3:
    ret ret
FUN_1007e306 ENDP
END
