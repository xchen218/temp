.intel_syntax noprefix
.text
.global rotate
rotate:
push   rbp
mov    rbp,rsp
mov    [rbp-0x38],rdi
mov    [rbp-0x40],rsi
mov    [rbp-0x48],rdx
and    QWORD PTR [rbp-0x40],63	#10
mov    QWORD PTR [rbp-0x10],0	#11
mov    QWORD PTR [rbp-0x28],0	#12
mov    QWORD PTR [rbp-0x20],1	#13
mov    QWORD PTR [rbp-0x8],1	#14
cmp    QWORD PTR [rbp-0x48],0	#15
jne    left
mov    QWORD PTR [rbp-0x18],0	#17
jmp    getlow
start:
mov    rax,[rbp-0x20]
add    [rbp-0x28],rax
shl    QWORD PTR [rbp-0x20],1
add    QWORD PTR [rbp-0x18],1	#23
getlow:
mov    rax,[rbp-0x18]
cmp    rax,[rbp-0x40]
jb     start
mov    rax,[rbp-0x38]
and    rax,[rbp-0x28]
mov    rdx,rax
mov    rax,[rbp-0x40]
mov    rcx,0x40
sub    rcx,rax
mov    rax,rcx
mov    rcx,rax
shl    rdx,cl
mov    rax,rdx
mov    [rbp-0x20],rax
mov    rax,[rbp-0x38]
sub    rax,[rbp-0x28]
mov    rdx,[rbp-0x40]
mov    rcx,rdx
shr    rax,cl
mov    [rbp-0x8],rax
mov    rdx,[rbp-0x20]
mov    rax,[rbp-0x8]
add    rax,rdx
jmp    return
left:
cmp    QWORD PTR [rbp-0x48],1	#50
jne    return
mov    QWORD PTR [rbp-0x18],0	#52
jmp    inverse
right:
mov    rax,[rbp-0x20]
add    [rbp-0x28],rax
shl    QWORD PTR [rbp-0x20],1	#57
add    QWORD PTR [rbp-0x18],1	#58
inverse:
mov    rax,0x40
sub    rax,[rbp-0x40]
cmp    rax,[rbp-0x18]
ja     right
mov    rax,[rbp-0x38]
and    rax,[rbp-0x28]
mov    rdx,[rbp-0x40]
mov    rcx,rdx
shl    rax,cl
mov    [rbp-0x20],rax
mov    rax,[rbp-0x38]
sub    rax,[rbp-0x28]
mov    rdx,rax
mov    rax,[rbp-0x40]
mov    rcx,0x40
sub    rcx,rax
mov    rax,rcx
mov    rcx,rax
shr    rdx,cl
mov    rax,rdx
mov    [rbp-0x8],rax
mov    rdx,[rbp-0x20]
mov    rax,[rbp-0x8]
add    rax,rdx
return:
pop    rbp
ret
