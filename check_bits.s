.text

checkBits:
    push %rcx
    push %r12
    push %r14
    mov 32(%rsp), %cl
    mov 48(%rsp), %r12d
    shr %cl, %r12d
    and $1, %r12d
    mov 40(%rsp), %cl
    mov 48(%rsp), %r14d
    shr %cl, %r14d
    and $1, %r14d
    and %r14d, %r12d
    cmp $1, %r12d
    je true
    mov $0, %eax
    jmp end

true:
    mov $1, %eax

end:
    pop %r14
    pop %r12
    pop %rcx
    ret

