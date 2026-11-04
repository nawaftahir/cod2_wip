.686
.MODEL FLAT, C
EXTRN sub_1007E30C:PROC
EXTRN sub_100F789D:PROC
EXTRN sub_100F78A7:PROC
EXTRN sub_100F78AF:PROC
.CODE
FUN_1007e306 PROC
    mov edi, edi
    push esi
    mov esi, ecx
    cmp dword ptr [esi + 20], 0
    mov dword ptr [esi], 01010FD70h
    je L3
    push edi
    xor edi, edi
    cmp dword ptr [esi + 24], edi
    jbe L2
L0:
    mov eax, dword ptr [esi + 20]
    mov ecx, dword ptr [eax + edi*4]
    test ecx, ecx
    je L1
    push 1
    call sub_1007E30C
L1:
    inc edi
    cmp edi, dword ptr [esi + 24]
    jb L0
L2:
    push dword ptr [esi + 20]
    call sub_100F789D
    pop ecx
    pop edi
L3:
    push dword ptr [esi + 8]
    call sub_100F78A7
    push dword ptr [esi + 28]
    call sub_100F78AF
    pop ecx
    pop ecx
    pop esi
    ret
FUN_1007e306 ENDP
END
