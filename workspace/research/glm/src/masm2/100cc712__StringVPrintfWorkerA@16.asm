.686
.MODEL FLAT, C
EXTRN sub_100CC76D:PROC
EXTRN sub_100CC77E:PROC
EXTRN sub_100CC782:PROC
EXTRN sub_100CC78B:PROC
EXTRN sub_100CC78D:PROC
EXTRN sub_100F61E4:PROC
.CODE
_StringVPrintfWorkerA@16 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    mov mov eax, dword ptr [ebp + 12]
    push push ebx
    xor xor ebx, ebx
    test test eax, eax
    jne L0
    mov mov ebx, 080070057h
    jmp sub_100CC76D
    push push esi
    push push edi
    push push dword ptr [ebp + 20]
    mov mov edi, dword ptr [ebp + 8]
    push push dword ptr [ebp + 16]
    lea lea esi, [eax - 1]
    push push esi
L0:
    push push edi
    call sub_100F61E4
    add add esp, 16
    test test eax, eax
    jl sub_100CC77E
    cmp cmp eax, esi
    ja sub_100CC782
    jne sub_100CC78D
    jmp sub_100CC78B
    mov mov ebx, 08007007Ah
    mov mov byte ptr [esi + edi], 0
    pop pop edi
    pop pop esi
    mov mov eax, ebx
    pop pop ebx
    pop pop ebp
    ret ret 16
_StringVPrintfWorkerA@16 ENDP
END
