(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

; Some utility functions that you may find useful to implement

(define (zip pairs)
  'replace-this-line
  (cond ((null? pairs) (cons nil (cons nil nil)))
        (else (car (cdar pairs))
              (list (cons (caar pairs) (car (zip (cdr pairs)))) 
              (cons (car (cdar pairs)) (cadr (zip (cdr pairs)))))
        )  
  )
)


;; Problem 15
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 15
  'replace-this-line
  (define (helper s index)
    (cond ((null? s) nil)
          (else (cons (list index (car s)) (helper (cdr s) (+ index 1))))))
  (helper s 0))
  ; END PROBLEM 15

;; Problem 16

;; Merge two lists LIST1 and LIST2 according to COMP and return
;; the merged lists.
(define (merge comp list1 list2)
  ; BEGIN PROBLEM 16
  'replace-this-line
  (cond ((null? list1) list2)
        ((null? list2) list1)
        (else (if (comp (car list1) (car list2))
                  (cons (car list1) (merge comp (cdr list1) list2))
                  (cons (car list2) (merge comp list1 (cdr list2)))))))
  ; END PROBLEM 16


(merge < '(1 5 7 9) '(4 8 10))
; expect (1 4 5 7 8 9 10)
(merge > '(9 7 5 1) '(10 8 4 3))
; expect (10 9 8 7 5 4 3 1)

;; Problem 17

(define (nondecreaselist s)
    ; BEGIN PROBLEM 17
    'replace-this-line
    (if (null? s) nil 
        (begin (define lst (list (car s))) (define tail (car s)) (define s (cdr s)))
    )
    (cond ((null? s) (cons lst nil))
          ((> tail (car s)) (cons lst (nondecreaselist s)))
          (else (cons (append lst (car (nondecreaselist s))) (cdr (nondecreaselist s))))
    )
    
)
    ; END PROBLEM 17

;; Problem EC
;; Returns a function that checks if an expression is the special form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))
(define define? (check-special 'define))
(define quoted? (check-special 'quote))
(define let?    (check-special 'let))

;; Converts all let special forms in EXPR into equivalent forms using lambda
(define (let-to-lambda expr)
  (cond ((atom? expr)
         ; BEGIN PROBLEM EC
         expr
         ; END PROBLEM EC
         )
        ((quoted? expr)
         ; BEGIN PROBLEM EC
         expr
         ; END PROBLEM EC
         )
        ((or (lambda? expr)
             (define? expr))
         (let ((form   (car expr))
               (params (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM EC
           (append (list form params) (map let-to-lambda body)) ; define?
           ; END PROBLEM EC
           ; (let-to-lambda '(define (f x) (let ((x 4)) x)))
           ; (define (f x) ((lambda (x) x) 4))
           ))
        ((let? expr)
         (let ((values (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM EC
           (define zipped_values (zip values))
           (cons (append (list 'lambda (car zipped_values)) (map let-to-lambda body)) (map let-to-lambda (cadr zipped_values)))
           ; END PROBLEM EC
           ))
        (else ; call expression or special formal expression
         ; BEGIN PROBLEM EC
         (let ((opt (car expr))
               (opds (map let-to-lambda (cdr expr))))
               (cons opt opds)
         ; END PROBLEM EC
         ))))
(define let-to-lambda-code
'(define (let-to-lambda expr)
  (cond ((atom? expr)
         ; BEGIN PROBLEM EC
         expr
         ; END PROBLEM EC
         )
        ((quoted? expr)
         ; BEGIN PROBLEM EC
         expr
         ; END PROBLEM EC
         )
        ((or (lambda? expr)
             (define? expr))
         (let ((form   (car expr))
               (params (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM EC
           (append (list form params) (map let-to-lambda body)) ; define?
           ; END PROBLEM EC
           ; (let-to-lambda '(define (f x) (let ((x 4)) x)))
           ; (define (f x) ((lambda (x) x) 4))
           ))
        ((let? expr)
         (let ((values (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM EC
           (define zipped_values (zip values))
           (cons (append (list 'lambda (car zipped_values)) (map let-to-lambda body)) (map let-to-lambda (cadr zipped_values)))
           ; END PROBLEM EC
           ))
        (else ; call expression or special formal expression
         ; BEGIN PROBLEM EC
         (let ((opt (car expr))
               (opds (map let-to-lambda (cdr expr))))
               (cons opt opds)
         ; END PROBLEM EC
         ))))
)