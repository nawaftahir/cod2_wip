.686
.MODEL FLAT, C
EXTRN sub_100188FC:PROC
EXTRN sub_1001891B:PROC
EXTRN sub_10018944:PROC
EXTRN sub_10018967:PROC
EXTRN sub_10018982:PROC
EXTRN sub_1001899D:PROC
EXTRN sub_100189BC:PROC
EXTRN sub_100189DB:PROC
EXTRN sub_100189FA:PROC
EXTRN sub_10018A19:PROC
EXTRN sub_10018A38:PROC
EXTRN sub_10018B40:PROC
EXTRN sub_10018BC3:PROC
.CODE
FUN_10018bf0 PROC
    push ebp
    mov ebp, dword ptr [esp + 8]
    push esi
    mov esi, eax
    lea eax, [esi + 4]
    push eax
    push 01018FED0h
    push 010195AECh
    push ebp
    call sub_100188FC
    add esp, 16
    test al, al
    jne L0
    pop esi
    pop ebp
    ret
L0:
    push edi
    lea edi, [esi + 8]
    push edi
    push 01018FEF0h
    push 01019575Ch
    push ebp
    call sub_1001891B
    add esp, 16
    test al, al
    jne L2
L1:
    pop edi
    pop esi
    xor al, al
    pop ebp
    ret
L2:
    push ebx
    mov ebx, dword ptr [edi]
    call sub_10018B40
    lea edi, [esi + 12]
    push edi
    push 01018FF30h
    push 010195744h
    push ebp
    call sub_10018944
    add esp, 16
    test al, al
    pop ebx
    je L1
    mov edi, dword ptr [edi]
    call sub_10018BC3
    lea ecx, [esi + 16]
    push ecx
    push 01018FF70h
    push 010195AC0h
    push ebp
    call sub_10018967
    add esp, 16
    test al, al
    je L1
    lea edx, [esi + 20]
    push edx
    push 01018FF90h
    push 010195AB4h
    push ebp
    call sub_10018982
    add esp, 16
    test al, al
    je L1
    lea eax, [esi + 24]
    push eax
    push 01018FFB0h
    push 010195AA8h
    push ebp
    call sub_1001899D
    add esp, 16
    test al, al
    je L1
    lea ecx, [esi + 28]
    push ecx
    push 01018FFD0h
    push 010195A9Ch
    push ebp
    call sub_100189BC
    add esp, 16
    test al, al
    je L1
    lea edx, [esi + 32]
    push edx
    push 010190000h
    push 010195A98h
    push ebp
    call sub_100189DB
    add esp, 16
    test al, al
    je L1
    lea eax, [esi + 36]
    push eax
    push 010190020h
    push 010195A88h
    push ebp
    call sub_100189FA
    add esp, 16
    test al, al
    je L1
    lea ecx, [esi + 40]
    push ecx
    push 010190060h
    push 010195A74h
    push ebp
    call sub_10018A19
    add esp, 16
    test al, al
    je L1
    add esi, 44
    push esi
    push 010190040h
    push 010195A7Ch
    push ebp
    call sub_10018A38
    add esp, 16
    pop edi
    test al, al
    pop esi
    setne al
    pop ebp
    ret
FUN_10018bf0 ENDP
END
