#lang racket


"ASSCİATİON LİST"

(define word '((hi . 1) (aydin . 2) (kadir . 3) (wc . 4) (selma . 5) (1 . naber)))

(assq 'aydin word)


(assoc 'selma word)

(assq '1 word)
(assq 'naber word)
(cdr (assq '1 word))

(define word2 '((1 2) (3 4) (10 11) (29 16) (10 10) (5) () ( 2 . 3 )))

(assq 1 word2)
(assq '1 word2)
(assq 5 word2)

(assv 5 word2)

(define word3 '((1 2 3) (4 5 6 7) (8 9 10)))

(assv '1 word3)
(assv '2 word3)
(assv '(1 2) word3)

