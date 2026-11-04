.686
.MODEL FLAT, C
EXTRN sub_100FB11A:PROC
EXTRN sub_100FB141:PROC
EXTRN sub_100FB14F:PROC
EXTRN sub_100FB170:PROC
EXTRN sub_100FB17E:PROC
EXTRN sub_100FC2DC:PROC
EXTRN sub_100FC2E4:PROC
.CODE
__dosmaperr PROC
    push push esi
    call sub_100FB11A
    mov mov ecx, dword ptr [esp + 8]
    mov mov dword ptr [eax + 12], ecx
    xor xor esi, esi
    cmp cmp ecx, dword ptr [esi*8 + 0101A4C48h]
    je L1
    inc inc esi
    cmp cmp esi, 45
    jb L0
    cmp cmp ecx, 19
    jb L2
    cmp cmp ecx, 36
    ja L3
    call sub_100FB141
L0:
    mov mov dword ptr [eax + 8], 13
    pop pop esi
    ret ret
    call sub_100FB14F
    mov mov ecx, dword ptr [esi*8 + 0101A4C4Ch]
    mov mov dword ptr [eax + 8], ecx
    pop pop esi
    ret ret
    cmp cmp ecx, 0BCh
    jb sub_100FC2DC
    cmp cmp ecx, 0CAh
    ja sub_100FC2E4
    call sub_100FB170
    mov mov dword ptr [eax + 8], 8
    pop pop esi
    ret ret
    call sub_100FB17E
L2:
    mov mov dword ptr [eax + 8], 22
    pop pop esi
    ret ret
__dosmaperr ENDP
END
