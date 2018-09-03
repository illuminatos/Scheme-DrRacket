#lang racket

"-----------------Recursion-----------------"
"Calculate factorial"

(define factorial(lambda (value)
                     (if (or (equal? value 0) (equal? value 1)) 1      ;write (factorial 5) in terminal
                   (* value (factorial (- value 1))))))



"function that makes all list items twice"

(define twice(lambda (lst)
  (if (null? lst)
      '()
      (cons (car lst)
            (cons (car lst)
                  (twice (cdr lst)))))))          ;(twice '(1 1 (1 2 3)))     return '(1 1 1 1 (1 2 3) (1 2 3))



(define twice2(lambda (lst)
  (if (null? lst)
      '()
      (cons (* 2(car lst))
                  (twice2 (cdr lst))))))          ;(twice2 '(1 2 3))           return '(2 4 6)



"A function that counts the number of list items"

(define count_length ( lambda (ls)
  (if (null? ls)
      0
      (+ 1 (count_length (cdr ls))))))


"A function that sum all numbers in a list."

(define sum_list(lambda (lst)
                  (if (null? lst) 0
                      (+ (car lst) (sum_list (cdr lst))))))

                        

"A function that takes a list  and an object (x) as arguments and returns a list removing x from ls."

(define remove_elem (lambda (x lst)
  (if (null? lst)
      '()
      (if (eqv? x (car lst))
          (remove_elem x (cdr lst))
          (cons (car lst)
                (remove_elem x (cdr lst)))))))



"A function that takes a list (ls) and and an object (x) and returns the first position of x in ls. The position is counted from 0. If x is not found in ls, the function returns #f."

(define find_ps(lambda (x lst)
                 (let ((i 0))
                 (cond
                   ((null? lst) '())
                   ((equal? x (car lst)) i)
                   (else (find_ps (x (cdr lst))) (+ i 1))))))



"Tail recursive"


(define factorial_tail(lambda (n)
                        (factorial_recursive n n)))

(define factorial_recursive(lambda (n p)
                             (if (equal? n 1)  p
                                     (let ((m (- n 1)))
                                     (factorial_recursive m (* p m))))))
(factorial_tail 5)



"reverse the order of list items"

(define reverse_list_tail(lambda (ls)
  (reverse-rec ls '())))

(define reverse-rec(lambda (ls0 ls1)
  (if (null? ls0)
      ls1
      (reverse-rec (cdr ls0) (cons (car ls0) ls1)))))

(reverse_list_tail '(1 2 3 4))


"Sum of items of a list "

(define sum_list_tail(lambda (ls)
                       (sum_list_rec ls 0)))

(define sum_list_rec(lambda (ls p)
                      (if(null? ls) p
                      (sum_list_rec ( cdr ls) (+ p (car ls))))))

(sum_list_tail '(1 2 3 4 5 6))


"named let loop"



(define fact-let(lambda (n)
  (let loop((n1 n) (p n))           ; 1
    (if (= n1 1)                    
	p
	(let ((m (- n1 1)))
	  (loop m (* p m)))))))      ; 2
 
(fact-let 5)


"A function that takes a list (ls) and an object (x) as arguments and returns a list removing x from ls"

(define remove_obj(lambda (x ls)
  (let loop((ls0 ls) (ls1 '()))
    (if (null? ls0) 
	 (reverse ls1)
	(loop
	 (cdr ls0)
          (if (eqv? x (car ls0))
              ls1
            (cons (car ls0) ls1)))))))

(remove_obj  3 '(1 2 3 4 5 3))


" function that takes a list (ls) and and an object (x) and returns the first position of x in ls."

(define return_ps(lambda (x lst)
                   (let loop ((lst0 lst) (n 0))
                     (if (null? lst0)
                         #f
                         (if (equal? x (car lst0))
                             n
                             (loop
                              (cdr lst0) (+ n 1)))))))

(return_ps 3 '(1 2 3 4 5))


"reverse list"

(define reverse_list (lambda (lst)
                       (let loop((lst0 lst) (lst1 '()))
                         (if (null? lst0) lst1
                             (loop
                              (cdr lst0) (cons (car lst0) lst1))))))

(reverse_list '(1 2 3 4 5 6))



"The function range that returns a list of numbers from 0 to n (not including n)."

(define return_range_list(lambda (n)
                           (let loop ((n1 n) (lst '()))
                             (if (equal? n1 0) lst
                                 (let ((m (- n1 1)))
                                   (loop
                                    m (cons m lst)))))))

(return_range_list 6)


"reverse list (1 2 3 ( 1 2)) "

(define reverse_sublist(lambda (lst)
                         (let loop ((lst0 lst) (lst1 '()))
                           (if (null? lst0) lst1
                               (loop
                                (cdr lst0)
                                (if (list? (car lst0))
                                    (cons (loop (car lst0) '()) lst1)
                                    (cons (car lst0) lst1)))))))

(reverse_sublist '(1 2 3 ( 1 2) (1 4 ( 2 4) 67)))



"letrec"

(define fact_letrec(lambda (n)
                     (letrec ((iter (lambda (n1 p)
                                      (if (equal? n1 1) p
                                          (let (( m (- n1 1)))
                                            (iter m (* p m)))))))
                       (iter n n ))))

(fact_letrec 1)


"do loop"

(define do_loop(lambda (n)
                 (do (( n1 n (- n1 1)) (p n (* p (- n1 1)))) ((= n1 1) p))))  

(do_loop 5)

"sum of elem in list"

(define letrec_sum(lambda (lst)
                    (letrec ((iter (lambda (lst1 p)
                                   
                      (if (null? lst1) p
                          (iter (cdr lst1)
                                (if (list? (car lst1))
                                    (iter (cdr lst1) (+ p (car lst1)))   ;???????
                                    (+ p (car lst1)))))))) 
                      (iter lst 0)))) 

(letrec_sum '(1 2 3 4 5 (1 2)))





                              



