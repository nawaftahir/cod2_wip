.686
.MODEL FLAT, C
EXTRN sub_1000124B:PROC
EXTRN sub_10001367:PROC
EXTRN sub_1000136F:PROC
EXTRN sub_10004F71:PROC
EXTRN sub_100051D0:PROC
EXTRN sub_100051EE:PROC
EXTRN sub_1005ECB2:PROC
EXTRN EXTRN g_101CE708:DWORD:DWORD
.CODE
FUN_10001050 PROC
    push push ecx
    mov mov ecx, dword ptr [g_101CE708]
    mov mov edx, dword ptr [ecx + 8]
    push push ebx
    mov mov ebx, eax
    xor xor eax, eax
    cmp cmp edx, 2
    setne setne al
    push push ebp
    mov mov ebp, dword ptr [esp + 16]
    push push esi
    push push edi
    lea lea edi, [esp + 16]
    dec dec eax
    and and eax, -36
    add add eax, 68
    imul imul eax, ebx
    mov mov esi, eax
    call sub_10004F71
    mov mov edx, dword ptr [g_101CE708]
    cmp cmp dword ptr [edx + 8], 2
    jne sub_1000124B
    xor xor edi, edi
    cmp cmp ebx, 4
    jl L0
    lea lea esi, [ebx - 4]
    shr shr esi, 2
    inc inc esi
    lea lea ecx, [eax + 28]
    lea lea edx, [ebp + 40]
    lea lea edi, [esi*4]
    mov mov ebp, dword ptr [edx - 40]
    mov mov dword ptr [ecx - 28], ebp
    mov mov ebp, dword ptr [edx - 36]
    mov mov dword ptr [ecx - 24], ebp
    mov mov ebp, dword ptr [edx - 32]
    mov mov dword ptr [ecx - 20], ebp
    mov mov ebp, dword ptr [edx - 16]
    mov mov dword ptr [ecx - 16], ebp
    mov mov ebp, dword ptr [edx - 12]
    mov mov dword ptr [ecx - 12], ebp
    mov mov ebp, dword ptr [edx - 8]
    mov mov dword ptr [ecx - 8], ebp
    mov mov ebp, dword ptr [edx - 4]
    mov mov dword ptr [ecx - 4], ebp
    mov mov ebp, dword ptr [edx]
    mov mov dword ptr [ecx], ebp
    mov mov ebp, dword ptr [edx + 28]
    mov mov dword ptr [ecx + 4], ebp
    mov mov ebp, dword ptr [edx + 32]
    mov mov dword ptr [ecx + 8], ebp
    mov mov ebp, dword ptr [edx + 36]
    mov mov dword ptr [ecx + 12], ebp
    mov mov ebp, dword ptr [edx + 52]
    mov mov dword ptr [ecx + 16], ebp
    mov mov ebp, dword ptr [edx + 56]
    mov mov dword ptr [ecx + 20], ebp
    mov mov ebp, dword ptr [edx + 60]
    mov mov dword ptr [ecx + 24], ebp
    mov mov ebp, dword ptr [edx + 64]
    mov mov dword ptr [ecx + 28], ebp
    mov mov ebp, dword ptr [edx + 68]
    mov mov dword ptr [ecx + 32], ebp
    mov mov ebp, dword ptr [edx + 96]
    mov mov dword ptr [ecx + 36], ebp
    mov mov ebp, dword ptr [edx + 100]
    mov mov dword ptr [ecx + 40], ebp
    mov mov ebp, dword ptr [edx + 104]
    mov mov dword ptr [ecx + 44], ebp
    mov mov ebp, dword ptr [edx + 120]
    mov mov dword ptr [ecx + 48], ebp
    mov mov ebp, dword ptr [edx + 124]
    mov mov dword ptr [ecx + 52], ebp
    mov mov ebp, dword ptr [edx + 080h]
    mov mov dword ptr [ecx + 56], ebp
    mov mov ebp, dword ptr [edx + 084h]
    mov mov dword ptr [ecx + 60], ebp
    mov mov ebp, dword ptr [edx + 088h]
    mov mov dword ptr [ecx + 64], ebp
    mov mov ebp, dword ptr [edx + 0A4h]
    mov mov dword ptr [ecx + 68], ebp
    mov mov ebp, dword ptr [edx + 0A8h]
    mov mov dword ptr [ecx + 72], ebp
    mov mov ebp, dword ptr [edx + 0ACh]
    mov mov dword ptr [ecx + 76], ebp
    mov mov ebp, dword ptr [edx + 0BCh]
    mov mov dword ptr [ecx + 80], ebp
    mov mov ebp, dword ptr [edx + 0C0h]
    mov mov dword ptr [ecx + 84], ebp
    mov mov ebp, dword ptr [edx + 0C4h]
    mov mov dword ptr [ecx + 88], ebp
    mov mov ebp, dword ptr [edx + 0C8h]
    mov mov dword ptr [ecx + 92], ebp
    mov mov ebp, dword ptr [edx + 0CCh]
    mov mov dword ptr [ecx + 96], ebp
    add add ecx, 080h
    add add edx, 0110h
    dec dec esi
    jne L1
    mov mov ebp, dword ptr [esp + 24]
    cmp cmp edi, ebx
    jge sub_1000136F
    mov mov edx, edi
    imul imul edx, edx, 68
    mov mov ecx, edi
    shl shl ecx, 5
    lea lea eax, [ecx + eax + 28]
    lea lea ecx, [edx + ebp + 40]
    sub sub ebx, edi
    mov mov edi, edi
    mov mov edx, dword ptr [ecx - 40]
    mov mov dword ptr [eax - 28], edx
    mov mov edx, dword ptr [ecx - 36]
    mov mov dword ptr [eax - 24], edx
    mov mov edx, dword ptr [ecx - 32]
    mov mov dword ptr [eax - 20], edx
    mov mov edx, dword ptr [ecx - 16]
    mov mov dword ptr [eax - 16], edx
    mov mov edx, dword ptr [ecx - 12]
    mov mov dword ptr [eax - 12], edx
    mov mov edx, dword ptr [ecx - 8]
    mov mov dword ptr [eax - 8], edx
    mov mov edx, dword ptr [ecx - 4]
    mov mov dword ptr [eax - 4], edx
    mov mov edx, dword ptr [ecx]
    mov mov dword ptr [eax], edx
    add add eax, 32
    add add ecx, 68
    dec dec ebx
    jne sub_10001367
    mov mov esi, dword ptr [esp + 16]
    call sub_100051D0
    mov mov eax, dword ptr [esp + 16]
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    pop pop ecx
    ret ret
    push push esi
    push push ebp
    push push eax
    call sub_1005ECB2
    add add esp, 12
    mov mov esi, dword ptr [esp + 16]
    call sub_100051EE
    mov mov eax, dword ptr [esp + 16]
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    pop pop ecx
    ret ret
FUN_10001050 ENDP
END
