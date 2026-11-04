.686
.MODEL FLAT, C
EXTRN sub_100C9AE7:PROC
EXTRN sub_100C9B0F:PROC
EXTRN sub_100CB31F:PROC
EXTRN sub_100CB909:PROC
EXTRN sub_100CB90C:PROC
EXTRN sub_100CB90E:PROC
EXTRN sub_100CB93E:PROC
EXTRN sub_100CB966:PROC
EXTRN sub_100CB98E:PROC
EXTRN sub_100CB991:PROC
EXTRN sub_100CB992:PROC
EXTRN sub_100CB997:PROC
.CODE
FUN_100cb84b PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ecx
    push push esi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 0100h]
    mov mov eax, dword ptr [eax]
    and and eax, 0FFFFFh
    dec dec eax
    push push edi
    je sub_100CB90E
    dec dec eax
    dec dec eax
    je sub_100CB90C
    dec dec eax
    je sub_100CB909
    mov mov eax, dword ptr [esi]
    xor xor edi, edi
    push push edi
    push push edi
    push push 2
    lea lea ecx, [ebp - 8]
    push push ecx
    push push dword ptr [esi + 0FCh]
    mov mov ecx, esi
    call call dword ptr [eax + 080h]
    cmp cmp eax, edi
    jl sub_100CB93E
    mov mov eax, dword ptr [esi + 0100h]
    mov mov eax, dword ptr [eax + 8]
    push push edi
    push push edi
    push push edi
    push push edi
    push push 2
    push push edi
    lea lea ecx, [eax + 8]
    push push ecx
    push push eax
    push push 2
    lea lea eax, [ebp - 8]
    push push eax
    push push 5
    mov mov ecx, esi
    call sub_100C9AE7
    cmp cmp eax, edi
    jl sub_100CB966
    mov mov eax, dword ptr [esi + 0100h]
    push push edi
    push push edi
    push push edi
    push push edi
    push push 1
    push push edi
    lea lea ecx, [ebp - 4]
    push push ecx
    lea lea ecx, [ebp - 8]
    push push ecx
    push push dword ptr [eax + 12]
    mov mov ecx, esi
    push push dword ptr [eax + 16]
    push push 2
    call sub_100C9B0F
    cmp cmp eax, edi
    jl sub_100CB98E
    xor xor eax, eax
    jmp sub_100CB992
    push push 0
    push push 9
    jmp sub_100CB991
    push push 0
    push push 8
    jmp sub_100CB997
    push push 0
    push push 5
    mov mov ecx, esi
    call sub_100CB31F
    pop pop edi
    pop pop esi
    leave leave
    ret ret
FUN_100cb84b ENDP
END
