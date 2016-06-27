#lang racket

(define (my-map func lst)
  (cond [(empty? lst) empty]
        [else (cons (func (first lst))
                    (my-map func (rest lst)))]))

(printf "calling my-map on a list: (my-map add1 '(1 3 5 7)): ~a\n" (my-map add1 '(1 3 5 7)))
(printf "calling ((lambda (num) (- num 2)) 5): ~a\n" ((lambda (num) (- num 2)) 5))

(define (my-filter pred lst)
  (cond [(empty? lst) empty]
        [(pred (first lst))
         (cons (first lst) (my-filter pred (rest lst)))]
        [else (my-filter pred (rest lst))]))

(printf "(my-filter (lambda (f) (even? f)) '(1 2 3 4 5 6 7 8 9) ): ~a\n"
        (my-filter (lambda (f) (even? f)) '(1 2 3 4 5 6 7 8 9) ))

;; is something true for any element of the list
(define (my-ormap pred lst)
  (cond [(empty? lst) #f]
        [else (or (pred (first lst))
                  (my-ormap pred (rest lst)))]))

;; is something true for all elements of the list
(define (my-andmap pred lst)
  (cond [(empty? lst) #t]
        [else (and (pred (first lst))
                  (my-andmap pred (rest lst)))]))

(printf "(my-andmap number? '(1 2 3 \"a\")): ~a\n" (my-andmap number? '(1 2 3 "a")))
(printf "(my-ormap number? '(1 2 3 \"a\")): ~a\n" (my-ormap number? '(1 2 3 "a")))

;; this is "reduce" in Clojure: takes a function of two args, a base value, and a list
;; from book: If list is empty, return the base
;; otherwise, perform function on first element, and recuresively on the rest of the list
(define (my-foldr f base lst)
  (cond [(empty? lst) base]
        [else (f (first lst) (my-foldr f base (rest lst)))]))

(printf "(my-foldr + 0 '(1 2 3)): ~a\n" (my-foldr + 0 '(1 2 3)))

;; this applies the function to the first element of the list AND the base value
(define (my-foldl f base lst)
  (cond [(empty? lst) base]
        [else (my-foldl f (f (first lst) base) (rest lst))]))

(printf "(my-foldl cons empty '(a b c)): ~a \n" (my-foldl cons empty '(a b c)))
(printf "(my-foldr cons empty '(a b c)): ~a \n" (my-foldr cons empty '(a b c)))
(printf "(my-foldl  + 0 '(1 2 3)): ~a \n" (my-foldl  + 0 '(1 2 3)))

;; it looks like "range" in clojure
(define (my-build-list n f)
  (define (builder k)
    (cond [(= n k) empty]
          [else (cons (f k) (builder (add1 k)))]))
  (builder 0))

(printf "(my-build-list 5 add1): ~a \n" (my-build-list 5 add1))
(printf "(my-build-list 10 (lambda (n) (* n 2))): ~a \n\n" (my-build-list 10 (lambda (n) (* n 2))))

;; they use a symbol that looks like a backwards 6 this according to some yahoo on Yahoo is a partial derivative
(define (d/dx fun)
  (define part-div-c (/ 1 100000))
    (lambda (x)
      (/ (- (fun (+ x part-div-c)) (fun (- x part-div-c))) 2 part-div-c)))

(define two (d/dx (lambda (x) (* 2 x))))
(printf "\ndefined a derivative function, and a function called two\n")
(printf "(two 17): ~a\n" (two 17))
(printf "(map two '(2 -1 0 1 24)): ~a \n" (map two '(2 -1 0 1 24)))
(define newcos (d/dx sin))
(printf "(newcos 0): ~a \n" (newcos 0))
(printf "(map newcos (list (/ pi 2) pi)): ~a \n" (map newcos (list (/ pi 2) pi)))

(define (sum lon) (apply + lon))
(printf "\nusing apply: (sum '(1 2 3 4 5 6)): ~a \n" (sum '(1 2 3 4 5 6)))
(define (highest lon) (apply max lon))
(printf "(highest '(58 64 77 77 22 94 93 78)): ~a \n" (highest '(58 64 77 77 22 94 93 78)))
;; they also use it on images, but I am not going to do that here



