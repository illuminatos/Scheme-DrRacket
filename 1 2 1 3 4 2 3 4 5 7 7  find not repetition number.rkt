#lang racket

"1 2 1 3 4 2 3 4 5 7 7  find not repetition number"

(define find_repetition_tail(lambda (lst)

                              (if (find_repetition_rec (cdr lst) (car lst))
                                  (find_repetition_tail (remove (car lst) (cdr lst)))
                                  (car lst))
                              
                              ))

(define find_repetition_rec (lambda (ls0 p)
                             
                             (if (null? ls0)
                                 #f
                                 
                                 (if (equal? (car ls0) p)
                                    #t
                                     (find_repetition_rec (cdr ls0) p)))))




(find_repetition_tail '(2 9 3 2 3 5 9 1 5 7 6 1 6 8 8 11 7))



