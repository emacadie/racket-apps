#lang racket
#| Realm Of Racket chapter two
|#
;; first, define some variables
 (define lower 1)
 (define upper 100)

;; define a function guess
(define (guess)
  ;; guess takes no arguments
  (quotient (+ lower upper) 2))

(define (smaller)
  ;; (set! variable expression)
  ;; set! will set upper to the function call which follows it
  (set! upper (max lower (sub1 (guess))))
  (guess))

(define (bigger)
  (set! lower (min upper (add1 (guess))))
  (guess))

#| This is sort of like the main function in C/C++/Java/etc
|#
(define (start n m)
  (set! lower (min n m))
  (set! upper (max n m))
  (guess))
