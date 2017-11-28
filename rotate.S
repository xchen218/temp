.intel_syntax noprefix
.text
.global rotate
rotate:
push   rbp
mov    rbp,rsp
mov    [rbp-0x38],rdi
mov    [rbp-0x40],rsi
mov    [rbp-0x48],rdx
and    [rbp-0x40],0x3f
mov    [rbp-0x10],0x0
mov    [rbp-0x28],0x0
mov    [rbp-0x20],0x1
mov    [rbp-0x8],0x1
cmp    [rbp-0x48],0x0
jne    left
mov    [rbp-0x18],0x0
jmp    getlow
start:
mov    rax,[rbp-0x20]
add    [rbp-0x28],rax
shl    [rbp-0x20],1
add    [rbp-0x18],0x1
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
cmp    [rbp-0x48],0x1
jne    return
mov    [rbp-0x18],0x0
jmp    inverse
right:
mov    rax,[rbp-0x20]
add    [rbp-0x28],rax
shl    [rbp-0x20],1
add    [rbp-0x18],0x1
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