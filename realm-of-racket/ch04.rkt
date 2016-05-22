#lang racket
(require rackunit)

#| Chapter 4 of 'Realm Of Racket' |#
(printf "Chapter Four: Conditions and Decisions\n\n")
(printf "Is 42 equal to 0? (zero? 42): ~a \n" (zero? 42))
(printf "Is 0 equal to 0? (zero? 0): ~a \n" (zero? 0))
(printf "Are these symbols equal? (symbol=? 'a 'b): ~a \n" (symbol=? 'a 'b))

(struct student (name id# dorm) #:transparent)
(printf "Defining structure student: (struct student (name id# dorm) #:transparent): ~a \n" student)(require rackunit)
(define sophomore3 (student 'David 100234 'PG))
(printf "Defining instance sophomore3: (define sophomore3 (student 'David 100234 'PG)): ~a \n" sophomore3 )
(printf "Is this structure a student: (student? 'a): ~a \n" (student? 'a))
(printf "Is this structure a student: (student? sophomore3): ~a \n" (student? sophomore3))
(printf "Is this structure a student: (student? (student 1 2 3)): ~a \n" (student? (student 1 2 3)))
(printf "Is this structure a student: (student? \"i am student\"): ~a \n"  (student? "i am student"))
(printf "\tType predicates\n")
(printf "A Racket predicate is just a function that returns either true or false\n")
(printf "Here is a type predicate: (number? 'a): ~a \n" (number? 'a))
(printf "Here is a type predicate: (string? \"hello world\"): ~a \n" (string? "hello world"))
(printf "Here is a type predicate: (symbol? 'a): ~a \n" (symbol? 'a))
;; (printf "Here is a type predicate: (image? 10): ~a \n" (image? 10))
(printf "Here is a type predicate: (boolean? \"false\"): ~a \n" (boolean? "false"))
(printf "Here is a list predicate: (list? 'eh): ~a \n" (list? 'eh) )
(printf "Here is a list predicate: (cons? '(what is that aboot?)): ~a \n" (cons? '(what is that aboot?)) )
(printf "Here is a list predicate: (empty? 'a): ~a \n"(empty? 'a) )
(printf "Here is a number predicate: (real? 10): ~a \n" (real? 10))
(printf "Here is a number predicate: (real? (sqrt -1)): ~a \n" (real? (sqrt -1))) 
(printf "Here is a number predicate: (rational? 2/3): ~a \n" (rational? 2/3))
(printf "Here is a number predicate: (integer? 1.0): ~a \n" (integer? 1.0))
(printf "Here is a number predicate: (integer? 1): ~a \n" (integer? 1))
(printf "Here is a number predicate: (exact-integer? 1.0): ~a \n" (exact-integer? 1.0))
(printf "\tHere are Equality Predicates\n")
(printf "Here is an equality predicate: (= 1 2): ~a \n" (= 1 2))
(printf "Here is an equality predicate: (= (sqrt -1) 0+1i): ~a \n" (= (sqrt -1) 0+1i))
(printf "Here is an equality predicate: (boolean=? #f #f): ~a \n" (boolean=? #f #f))
(printf "Here is an equality predicate: (string=? \"hello world\" \"good bye\"): ~a \n" (string=? "hello world" "good bye"))
(printf "Here is an equality predicate: (equal? (student 'David 100234 'PG) sophomore3): ~a \n" (equal? (student 'David 100234 'PG) sophomore3))
(printf "Here is an equality predicate: (equal? '(1 2 3) '(1 2 3)): ~a \n" (equal? '(1 2 3) '(1 2 3)))
(printf "Here is an equality predicate: (equal? 'a 'b): ~a \n" (equal? 'a 'b))
(printf "Here is an equality predicate: (equal? \"hello world\" 'a): ~a \n" (equal? "hello world" 'a))
(printf "Here is an equality predicate: (equal? 10 10): ~a \n" (equal? 10 10))
(printf "Here is an equality predicate: (equal? #t 10): ~a \n" (equal? #t 10))

(define (add-to-front-of-123 x)
  (cons x '(1 2 3)))

(printf "Defined function add-to-front-of-123\n")
;; (define a-in-front (add-to-front-of-123 'a))
(printf "Adding 'a to the front: (add-to-front-of-123 'a): ~a \n" (add-to-front-of-123 'a))
(printf "Adding 0 to the front: (add-to-front-of-123 0): ~a \n" (add-to-front-of-123 0)) 
(printf "Adding '(a b c) to the front: (add-to-front-of-123 '(a b c)): ~a \n"  (add-to-front-of-123 '(a b c)))


(printf "\n\tConditionals: If and Beyond\n")
(printf "Here is if:
(if (= (+ 1 2) 3)
   'yup
   'nope)
Result: ~a \n"
        (if (= (+ 1 2) 3)
            'yup
            'nope))
(printf "Here is another one:
(if (= (+ 1 2) 4)
   'yup
   'nope)
Result: ~a \n"
        (if (= (+ 1 2) 4)
            'yup
            'nope))
(printf "Anything that is not false is true:
(if '(1)
   'everything-except-#f-counts-as-#t
   'aw-heck-no)
Result: ~a \n"
        (if '(1)
            'everything-except-#f-counts-as-#t
            'aw-heck-no))
(printf "Anything that is not false is true:
(if empty
   'everything-except-#f-counts-as-#t
   'aw-heck-no)
Result: ~a \n"
        (if empty
            'everything-except-#f-counts-as-#t
            'aw-heck-no))
(printf "Anything that is not false is true:
(if false
   'everything-except-#f-counts-as-#t
   'aw-heck-no)
Result: ~a \n"
        (if false
            'everything-except-#f-counts-as-#t
            'aw-heck-no))
(printf "Is this number odd in this one-line if: (if (odd? 5) 'odd-number 'even-number): ~a \n" (if (odd? 5) 'odd-number 'even-number))
(define x 7)
(printf "We set x to 7. Now here is a nested if:
(define x 7)
(if (even? x)
   'even-number
   (if (= x 7)
      5
      'odd-number))
Result: ~a \n"
(if (even? x)
    'even-number
    (if (= x 7)
        5
        'odd-number)))
(define xx 7)
(printf "Here it is with cond (with brackets separating the branches):
(cond [(= xx 7) 5]
      [(odd? xx) 'odd-number]
      [else 'even-number])
Result: ~a \n"
        (cond [(= xx 7) 5]
              [(odd? xx) 'odd-number]
              [else 'even-number]))
(printf "Here it is as a nested if:
(if (= xx 7)
   5
   (if (odd? xx)
      'odd-number
      'even-number))
Result: ~a \n"
        (if (= xx 7)
            5
            (if (odd? xx)
                'odd-number
                'even-number)))


(define (my-length a-list)
  (if (empty? a-list)
      0
      (add1 (my-length (rest a-list)))))
(printf "Here is our recursive function:
(define (my-length a-list)
  (if (empty? a-list)
      0
      (add1 (my-length (rest a-list)))))
")
(printf "Here is (my-length '(list with four symbols)): ~a \n" (my-length '(list with four symbols)))
(printf "Here is (my-length '(42)): ~a \n" (my-length '(42)))
(printf "\tBoolean logic\n")
(define xq 5)
(define y 7)
(define z 9)
(printf "Defined xq = 5, y = 7, z = 9\n")
(printf "Here is some boolean logic: (and (odd? xq) (odd? y) (odd? z)): ~a \n" (and (odd? xq) (odd? y) (odd? z)))
(define w 4)
(printf "Defined w = 4, here is more boolean logic: (or (odd? w) (odd? y) (odd? z)): ~a \n" (or (odd? w) (odd? y) (odd? z)))
(define is-it-even #f)
(printf "Defined is-it-even as false: is-it-even: ~a \n" is-it-even)
(printf "Some boolean logic: (or (odd? x) (set! is-it-even #t)): ~a \n" (or (odd? x) (set! is-it-even #t)) )
(printf "is-it-even: ~a \n" is-it-even) 
(printf "Some boolean logic: (and (even? x) (set! is-it-even #t)): ~a \n" (and (even? x) (set! is-it-even #t)))
(printf "is-it-even: ~a \n" is-it-even)
(printf "Calling (or (odd? w) (set! is-it-even #t)): ~a \n" (or (odd? w) (set! is-it-even #t)))
(printf "is-it-even should now be true: ~a \n" is-it-even)
(printf "And will stop when it finds something false, no need to worry about divide by 0: (and (odd? 5) (even? 5) (/ 1 0)): ~a \n"
        (and (odd? 5) (even? 5) (/ 1 0)))
(printf "(if (member 4 (list 3 4 1 5)) '4-is-in 'not-in): ~a \n" (if (member 4 (list 3 4 1 5)) '4-is-in 'not-in))
(printf "That works because member funciton does not return false: (member 4 (list 3 4 1 5): ~a \n"(member 4 (list 3 4 1 5)))
(define tasks '(1 clean 3 homework 4 party))
(printf "Defining list called 'tasks': (define tasks '(1 clean 3 homework 4 party))\n")
(printf "Calling (member 3 tasks): ~a \n" (member 3 tasks))

(printf "\tMore Equality predicates\n")
(struct point (x y) #:transparent)
(define (distance-to-origin p)
  (sqrt (+ (sqr (point-x p)) (sqr (point-y p)))))
(printf "Created struct point and function distance-to-origin \n")
(printf "Calling (distance-to-origin (point 3 4)): ~a \n" (distance-to-origin (point 3 4)))
(printf "Calling (distance-to-origin (point 12 5)): ~a \n" (distance-to-origin (point 12 5)))
(define pt1 (point -1 2))
(define pt2 (point -1 2))
(printf "Defined point pt1: ~a and point pt2: ~a\n" pt1 pt2)
(printf "equal? checks that both arguments belong to the same class of data,
namely points, and that all their pieces— x and y here—are equal? , too\n")
(printf "So it checks value\n")
(printf "Is pt1 equal to pt2: (equal? pt1 pt2): ~a \n" (equal? pt1 pt2))
(printf "eq? whether the two given concrete structures were created via the exact same call to the constructor\n")
(printf "(eq? pt1 pt2): ~a\n" (eq? pt1 pt2))
(printf "(eq? pt1 pt1): ~a\n" (eq? pt1 pt1))
(printf "(eq? pt2 pt2): ~a\n" (eq? pt2 pt2))
(define pt3 pt1)
(printf "You can give a new name to an existing value: (define pt3 pt1)\n")
(printf "You can then call eq? on that: (eq? pt1 pt3): ~a \n" (eq? pt1 pt3))
(define (eq-first-items list1 list2)
  (eq? (first list1) (first list2)))
(printf "Defined eq-first-items function to check equality on the first item of a composite/nested structure\n")
(printf "(eq-first-items (cons pt1 empty) (cons pt3 empty)): ~a \n" (eq-first-items (cons pt1 empty) (cons pt3 empty)))
(printf "(eq-first-items (cons pt1 empty) (cons pt2 empty)): ~a \n" (eq-first-items (cons pt1 empty) (cons pt2 empty)))
(printf "(eq-first-items '(1 2 3) '(2 2 3)): ~a \n"(eq-first-items '(1 2 3) '(2 2 3)))
(printf "(eq-first-items '(1 2 3) '(1 2 3)): ~a \n"(eq-first-items '(1 2 3) '(1 2 3)))

(define (equal-first-items list1 list2)
  (equal? (first list1) (first list2)))
(printf "Defined equal-first-items function to check equality on the first item of a composite/nested structure\n")
(printf "(equal-first-items (cons pt1 empty) (cons pt3 empty)): ~a \n" (equal-first-items (cons pt1 empty) (cons pt3 empty)))
(printf "(equal-first-items (cons pt1 empty) (cons pt2 empty)): ~a \n" (equal-first-items (cons pt1 empty) (cons pt2 empty)))
(printf "(equal-first-items '(1 2 3) '(2 2 3)): ~a \n"(equal-first-items '(1 2 3) '(2 2 3)))
(printf "(equal-first-items '(1 2 3) '(1 2 3)): ~a \n"(equal-first-items '(1 2 3) '(1 2 3)))
;; left off page 68
(printf "\tTesting\n")
(printf "Added (require rackunit) to the top to do unit tests\n")
(printf "Most commonly used function: check-equal?: (check-equal? (add1 5) 6): ~a \n" (check-equal? (add1 5) 6))
(printf "Let's try: (check-equal? (add1 5) 7): ~a \n" (check-equal? (add1 5) 7))
(printf "Let's try: (check-equal? (sub1 (add1 5)) 5): ~a\n" (check-equal? (sub1 (add1 5)) 5))
(printf "check-equal? also takes a string arg for printing a message\n")
(printf "Let's try: (check-equal? 5 6 \"NUMBERS MATTER!\"): ~a \n" (check-equal? 5 6 "NUMBERS MATTER!"))
(printf "\nLet's try some other tests in the book\n")
(printf "check-not-equal? (check-not-equal? 5 4): ~a \n" (check-not-equal? 5 4))
(printf "check-not-equal? (check-not-equal? pt1 pt2): ~a \n" (check-not-equal? pt1 pt2))
(printf "check-not-equal? (check-not-equal? pt1 pt3): ~a \n" (check-not-equal? pt1 pt3))
(define pt4 (point 1 2))
(printf "Defined pt4 with different coordinates than the others\n")
(printf "check-not-equal? checks if things are not equal\n")
(printf "check-not-equal? (check-not-equal? pt1 pt4): ~a \n" (check-not-equal? pt1 pt4))
(printf "check-not-equal? (check-not-equal? '(1 2 3 4) '(1 2 3 5)): ~a \n" (check-not-equal? '(1 2 3 4) '(1 2 3 5) "Are they equal?"))
(printf "check-not-equal? (check-not-equal? '(1 2 3 4) '(1 2 3 4)): ~a \n" (check-not-equal? '(1 2 3 4) '(1 2 3 4) "Are they equal?"))
(printf "check-pred Checks the second argument against the predicate\n")
(printf "(check-pred number? 5): ~a \n" (check-pred number? 5))
(printf "(check-pred number? 'a): ~a \n" (check-pred number? 'a "That is a symbol"))
(printf "(check-pred symbol? 'a): ~a \n" (check-pred symbol? 'a))
(printf "(check-pred list? '(1 2 3)): ~a \n" (check-pred list? '(1 2 3)))
(printf "check-= will if two numbers are within a certain range of each other\n")
(printf "(check-= 1 3 2): ~a \n" (check-= 1 3 2))
(printf "(check-= 10 30 20): ~a \n" (check-= 10 30 20))
(printf "(check-= 10 30 15): ~a \n" (check-= 10 30 15 "10 and 30 not within that range (15)"))
(printf "check-true will check if the argument is #t\n")
(printf "(check-true (odd? 71)): ~a \n" (check-true (odd? 71) "Will this message print?"))
(printf "(check-true (odd? 72)): ~a \n" (check-true (odd? 72) "72 is not an odd number"))
(printf "check-false will check if the argument is #f\n")
(printf "(check-false (odd? 42)): ~a \n" (check-false (odd? 42)) )
(printf "(check-false (odd? 43)): ~a \n" (check-false (odd? 43) "Checking odd on 43 returns true") )
(printf "check-not-false will check if the argument is not #f\n")
(printf "(check-not-false
    (member 5 '(1 2 5))): ~a \n"
        (check-not-false
         (member 5 '(1 2 5))))



