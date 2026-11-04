.686
.MODEL FLAT, C
EXTRN sub_100FB11A:PROC
EXTRN sub_100FB141:PROC
EXTRN sub_100FB14F:PROC
EXTRN sub_100FB170:PROC
EXTRN sub_100FB17E:PROC
.CODE
__dosmaperr PROC
    push esi
    call sub_100FB11A
    mov ecx, dword ptr [esp + 8]
    mov dword ptr [eax + 12], ecx
    xor esi, esi
L0:
    cmp ecx, dword ptr [esi*8 + 0101A4C48h]
    je L1
    inc esi
    cmp esi, 45
    jb L0
    cmp ecx, 19
    jb L2
    cmp ecx, 36
    ja L2
    call sub_100FB141
    mov dword ptr [eax + 8], 13
    pop esi
    ret
L1:
    call sub_100FB14F
    mov ecx, dword ptr [esi*8 + 0101A4C4Ch]
    mov dword ptr [eax + 8], ecx
    pop esi
    ret
L2:
    cmp ecx, 0000000BCh
    jb L3
    cmp ecx, 0000000CAh
    ja L3
    call sub_100FB170
    mov dword ptr [eax + 8], 8
    pop esi
    ret
L3:
    call sub_100FB17E
    mov dword ptr [eax + 8], 22
    pop esi
    ret
__dosmaperr ENDP
END
