#lang racket

"HIGHER ORDER FUNCTION"

(sort '(1 5 3 9 10 4) <)

"order by last 2 digits"

(sort '(2345 7698 1246 9513 8034)
      (lambda (x y) (< (modulo x 100) (modulo y 100))))


"MAP"

(map + '(1 2 3) '(3 4 5))


"FOR EACH"

(define sum(lambda (lst)
             (if (null? lst) '()
                 (let ((sum1 0) (lst1 lst))
                 (for-each (lambda (x)
                            (set! sum1 (+ sum1 x))) lst1)
                   (display sum1)))))

(sum '( 1 2 3 4))


"A function that makes it twice that each item of a list of numbers."

(map (lambda (x)
       (* x 2)) '(1 2 3 4)) 


"takes 3 list 1. list square each items and sum 2. list then substruct 3. item"

(map (lambda (x y z)
      (- (+  (* x x) y) z)) '(1 2 3) '(2 4 6) '(2 5 7))

"FILTERING just defined in MIT-scheme keep-matching-items and delete-matching-items"

(map (lambda (x)
       (if (> x 0)
           x
           null))
       '(1 -23 3 -4 6))

"or"



"filtering out even numbers in a list."

(map (lambda (x)
       (if (equal? (modulo x 2) 0)
           x
           null)) '(1 2 4 5 7))


"sort length list"

(sort '((1 2 3 4) (1 2 3 8 9 4) (1 2 8 3 4) (1 2 3 4 9 8 6))
      (lambda (lst0 lst1)
        (< (length lst0) (length lst1))
        ))
                            

"Apply"
"Write a function that squares each item of a list, then sums them and then makes square root of it."

(define func(lambda (lst)
              (sqrt (apply + (map (lambda (x)
                     (* x x)) lst)))))

(func '( 1 2 3 4))

"occurance numbers"

(define find_occurance(lambda (p lst)
                        (if (null? lst) 0
                            (if (equal? p (car lst)) (+ 1 (find_occurance p (cdr lst)))
                                (find_occurance p (cdr lst))))))

(find_occurance 4 '(1 2 4 5 4 7 8 4 5)) 

"create a func that provides what you want like positive? in below case"
"if found predicate then return that one and others in the list"

(define (member-if proc ls)
  (cond
   ((null? ls) #f)
   ((proc (car ls)) ls)
   (else (member-if proc (cdr ls)))))

(member-if positive? '(0 -1 -2 3 5 -7))







       
       















                        
       
