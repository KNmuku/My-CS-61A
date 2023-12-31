(define (deep-map fn lst)  
    (cond ((null? lst) nil)
          ((number? (car lst)) (cons (fn (car lst)) (deep-map fn (cdr lst))))
          ((list? (car lst)) (cons (deep-map fn (car lst)) (deep-map fn (cdr lst))))
    )
)