(define (over-or-under num1 num2)
  'YOUR-CODE-HERE
  (let ((diff (- num1 num2)))
       (cond ((< diff 0) -1)
             ((= diff 0) 0)
             (else 1)
       ))
)


;;; Tests
(over-or-under 1 2)
; expect -1
(over-or-under)

;(let ((diff (- num1 num2)))
;    (cond ((< diff 0) -1)
;          ((= diff 0) 0)
;          ((> diff 0) 1)))

(define (make-adder num)
  'YOUR-CODE-HERE
  (lambda (inc) (+ inc num))
)

;;; Tests
(define adder (make-adder 5))
(adder 8)
; expect 13


(define (composed f g)
  'YOUR-CODE-HERE
  (lambda (x) (f (g x)))
)


(define lst
  'YOUR-CODE-HERE
  (cons (cons 1 nil) (cons 2 (cons (cons 3 (cons 4 nil)) (cons 5 nil))))
)


(define (remove item lst)
  'YOUR-CODE-HERE
  (cond ((null? lst) nil)
        ((= (car lst) item) (remove item (cdr lst)))
        (else (cons (car lst) (remove item (cdr lst))))
        )
)


;;; Tests
(remove 3 nil)
; expect ()
(remove 3 '(1 3 5))
; expect (1 5)
(remove 5 '(5 3 5 5 1 4 5 4))
; expect (3 1 4 4)

