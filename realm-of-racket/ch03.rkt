#lang racket
#| Chapter three of Realm Of Racket |#

(display "Here is '(zero? 1): ")
(display (zero? 1))
(display "\n")

(print "Here is '(zero? 1): (zero? 1)" )
(display "\n")
(printf "Here is (zero? 1): ~a \n" (zero? 1))

;; you don't need to escape a function call to print it in its raw form
(printf "here is (zero? (sub1 1)): ~a \n" (zero? (sub1 1)))

;; single quote makes it a symbol, unlike Clojure which causes a function to not be evaluated
(printf "Are these two symbols identical? (symbol=? 'foo 'FoO): ~a \n\n" (symbol=? 'foo 'FoO))

;; Numbers:
(printf "-------- Numbers -----\n")
;; 53 to the 52nd power
(printf "53 to the 52nd power: (expt 53 52): ~a \n" (expt 53 52) )
(printf "Here is a complex number: (sqrt -1): ~a \n" (sqrt -1) )
(printf "Dividing two integers: (/ 4 6): ~a \n" (/ 4 6) )
(printf "Dividing with an inexact number: (/ 4.0 6): ~a \n\n" (/ 4.0 6))

;; strings
(printf "Here we are appending strings: (string-append \"~a\" \"~a\"): ~a \n\n" "tutti" "frutti" (string-append "tutti" "frutti") ) 

;; lists
(printf "---- Lists -----\n")
(printf "here is a cons cell: (cons 1 2): ~a \n" (cons 1 2))
(define cell (cons 'a 'b))
(printf "Let's define a cell: (define cell (cons 'a 'b)): ~a \n" cell)
(printf "Calling (car cell): ~a \n" (car cell) )
(printf "Calling (cdr cell): ~a \n" (cdr cell) )
(printf "Calling (cons 'chicken empty): ~a \n" (cons 'chicken empty))
(printf "Calling (cons 'chicken '()): ~a \n" (cons 'chicken '()))
(printf "Adding pork to the front of a list: (cons 'pork '(beef chicken)): ~a \n" (cons 'pork '(beef chicken)))
(printf "One way to create beef and chicken list: (cons 'beef (cons 'chicken '())): ~a \n" (cons 'beef (cons 'chicken '())))
(printf "Here is another way: (cons 'pork (cons 'beef (cons 'chicken '()))): ~a \n" (cons 'pork (cons 'beef (cons 'chicken '()))) )
(printf "Use the list function: (list 'pork 'beef 'chicken): ~a \n" (list 'pork 'beef 'chicken))
(printf "Getting the first item in a list: (first (cons 'pork (cons 'beef (cons 'chicken empty)))): ~a \n" (first (cons 'pork (cons 'beef (cons 'chicken empty)))))
(printf "Getting the rest of a list: (rest (list 'pork 'beef 'chicken)): ~a \n" (rest (list 'pork 'beef 'chicken)))
(printf "Calling first and rest on a list: (first (rest '(pork beef chicken))): ~a \n" (first (rest '(pork beef chicken))))
(printf "A list can contain other lists: (list 'cat (list 'duck 'bat) 'ant): ~a \n" (list 'cat (list 'duck 'bat) 'ant))
(printf "Page 46: Pulling nested lists: (first '((peas carrots tomatoes) (pork beef chicken))): ~a \n" (first '((peas carrots tomatoes) (pork beef chicken))))
(printf "Get the rest of the list: (rest '(peas carrots tomatoes)): ~a \n" (rest '(peas carrots tomatoes)))
(printf "Get the rest of the first: (rest (first '((peas carrots tomatoes) (pork beef chicken)))): ~a \n" (rest (first '((peas carrots tomatoes) (pork beef chicken)))))
(printf "Creating the nested list with lots of cons: (cons (cons 'peas (cons 'carrots (cons 'tomatoes '())))
(cons (cons 'pork (cons 'beef (cons 'chicken '()))) '())): ~a \n" (cons (cons 'peas (cons 'carrots (cons 'tomatoes '())))
(cons (cons 'pork (cons 'beef (cons 'chicken '()))) '())))
(printf "Using second is waaay better than CL caaaar nonsense: (second '((peas carrots tomatoes) (pork beef chicken) duck)): ~a \n" (second '((peas carrots tomatoes) (pork beef chicken) duck)))
(printf "Getting third item in a list: (third '((peas carrots tomatoes) (pork beef chicken) duck)): ~a \n" (third '((peas carrots tomatoes) (pork beef chicken) duck)))
(printf "Getting the first item in the second list: (first (second '((peas carrots tomatoes)
(pork beef chicken)
duck))): ~a \n" (first (second '((peas carrots tomatoes)
(pork beef chicken)
duck))))

;; -------- Structures ---------
(printf "\n\nStructures\n")
(struct student (name id# dorm))
(printf "creating a structure called student: (struct student (name id# dorm)): ~a \n" student)
(define freshman1 (student 'Joe 1234 'NewHall))
(printf "creating an instance: (define freshman1 (student 'Joe 1234 'NewHall)): ~a \n" freshman1)
(printf "Field selector for name of freshman1: (student-name freshman1): ~a \n" (student-name freshman1))
(printf "So it's structure_name-field_name instance_name \n")
(printf "Seector for ID of freshman1: (student-id# freshman1): ~a \n" (student-id# freshman1))
(define mimi (student 'Mimi 1234 'NewHall))
(printf "Define new student mimi: (define mimi (student 'Mimi 1234 'NewHall)): ~a \n" mimi)
(define nicole (student 'Nicole 5678 'NewHall))
(define rose (student 'Rose 8765 'NewHall))
(define eric (student 'Eric 4321 'NewHall))
(define in-class (list mimi nicole rose eric))
(printf "defined students Nicole, Rose and Eric\n")
(printf "Defining new list of students: (define in-class (list mimi nicole rose eric)): ~a \n" in-class )
(printf "Id of third student in list: (student-id# (third in-class)): ~a \n" (student-id# (third in-class)))
(struct student-body (freshmen sophomores juniors seniors))
(printf "Defined structure student-body: (struct student-body (freshmen sophomores juniors seniors)): ~a \n" student-body)
(define all-students
  (student-body (list freshman1 (student 'Mary 0101 'OldHall))
                (list (student 'Jeff 5678 'OldHall))
                (list (student 'Bob 4321 'Apartment))
                empty))
(printf "Creating all-students, an instance of student-body: ~a \n" all-students)
(printf "Getting the name of the first item on freshman list of all-students: (student-name (first (student-body-freshmen all-students))): ~a \n"
        (student-name (first (student-body-freshmen all-students))))
(printf "Getting name of second freshman in all-students: (student-name (second (student-body-freshmen all-students))): ~a \n"
        (student-name (second (student-body-freshmen all-students))))
(printf "Getting name of first junior in all-students: (student-name (first (student-body-juniors all-students))): ~a \n"
        (student-name (first (student-body-juniors all-students))))
; left off page 47
(struct example2 (p q r) #:transparent)
(printf "Create a structure with \"#:transparent\" option: (struct example2 (p q r) #:transparent): ~a \n" example2)
(define ex2 (example2 9 8 7))
(printf "Instantiate ex2 from example2: (define ex2 (example2 9 8 7)): ~a \n" ex2)



