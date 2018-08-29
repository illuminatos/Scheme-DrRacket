#lang racket

(define pi (* 4 (atan 1.0)))

(define convert (lambda (degree) (/ (* degree pi) 180.0)))

(define X (lambda (V t) (* V t)))

(define t (lambda (V) (/ (* 2 V) 9.8)))

(define distance (lambda (V degree) (X (* V (cos (convert degree))) (t (* V (sin (convert degree)))))))



;geometric ratio

(define gr (lambda (a0 r n) (* a0 (if (= r 1) n (/ (- 1 (expt r n ) (- 1 r)))))))


;return absolute value of real number

(define abst (lambda (a) (* a (if (< a 0) -1 1))))


;tersi
(define (inv n)
  (if (= n 0) 0 (/ 1 n)))


;convert from int to ascı

(define i2a (lambda (n) (if (<= 33 n 126) (integer->char n) "faqq" )))


(and  1 #f 3)

(or #f #f 2 3)


;function that take 3 arg and return multiply them if all of them positive
(define piap (lambda (a b c) (and (positive? a) (positive? b) (positive? c) (* a b c))))

;A function that takes three real numbers as arguments. It returns the product of these three numbers if at least one of them is negativ
(define pialn (lambda (a b c) (if (or (negative? a) (negative? b) (negative? c)) (* a b c) "ömnsd")))



;The grade (A – F) of exam is determined by the score (score). Write a function that takes a score as an argument and returns a grade.
(define grade (lambda (score)
                (cond
                  ((<= 0 score 59) "F")
                  ((<= 60 score 69) "D")
                  ((<= 70 score 79) "C")
                  ((<= 80 score 89) "B")
                  ((<= 90 score 100) "A")
                  (else "score is not between 0 and 100"))))



;eq compares addresses of two obj
(eq? 1 1) ;dont compare nmbers since return true
(eq? "hello" "hello") ;return true
(eq? "hello" "helloo") ;return false



;eqv? compares types and values of 2 obj
(eqv? 1 1) ;return t
(eqv? (list 123) (list 1 2 3)) ;return false



;equal? compares sequence such as list or sting
(equal? (list 1 2 3) (list 1 2 3)) ;return t
(equal? "hello" "hello") ;return t




(print "-------------------Local Variables-------------------" )

(let ((i 1) (j 2))   ;return 3
  (+ i j))


(let* ((i 1))           ;nested let using let*
  (let* ((j (+ i 2)))   ;return 1*3=3
  (* i j)))



(print "-------------------Quadric Equation-------------------" )

(define quadric_equation (lambda (a b c)         ;ax2+bx+c=0
                           (if (zero? a) 'error
                           (let ((d (- (* b b) (* 4 a c))))  ;b2-4ac=d
                             (if (negative? d) '()
                                 (let ((e (/ b a -2)))
                                   (if (zero? d)
                                       (list e)
                                       (let ((f (/ (sqrt d) 2 a)))
                                         (list (+ e f) (- e f))))))))))







