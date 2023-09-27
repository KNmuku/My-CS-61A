(define (factorial x)
  (if (zero? x)
      1
      (* x (factorial (- x 1))))
)

(define (fib n)
  (if (<= n 1)
      n
      (+ (fib (- n 2)) (fib (- n 1)))  
  )
)

(define (my-append a b)
  (if (null? a)
      b
      (cons (car a) (my-append (cdr a) b))
  )
)

; (car (cdr (cdr (cdr s))))

(define (duplicate lst)
  (cond ((null? lst) nil)
        (else (define first (car lst)) (cons first (cons first (duplicate (cdr lst)))))
  )
)

(define (insert element lst index)
  (cond ((null? lst) (cons element nil))
        ((equal? index 0) (cons element lst))
        (else (cons (car lst) (insert element (cdr lst) (- index 1))))
  )
)
