#lang racket
(require 2htdp/universe 2htdp/image)
(require (prefix-in universe: 2htdp/universe) 
         (prefix-in image: 2htdp/image))
;; state
(struct interval (small big) #:transparent)

;; constants
(define TEXT-SIZE 20)
(define WIDTH 800)
(define HEIGHT 400)
(define SIZE 20)
(define TEXT-X 3)
(define TEXT-UPPER-Y 10)
(define TEXT-LOWER-Y (- HEIGHT 10))
(define HELP-TEXT
  (image:text "arrow-up for larger numers, arrow-down for smaller numbers"
        TEXT-SIZE
        "blue"))
(define HELP-TEXT2
  (image:text "Press = when your number is guessed; q to quit"
        TEXT-SIZE
        "blue"))
(define COLOR "red")

(define MT-SC
  (image:place-image/align
   HELP-TEXT TEXT-X TEXT-UPPER-Y "left" "top"
   (image:place-image/align
    HELP-TEXT2 TEXT-X TEXT-LOWER-Y "left" "bottom"
    (image:empty-scene WIDTH HEIGHT))))

;; handlers
(define (deal-with-guess w key)
  (cond [(universe:key=? key "up") (bigger w)]
        [(universe:key=? key "down") (smaller w) ]
        [(universe:key=? key "q") (universe:stop-with w)]
        [(universe:key=? key "=") (universe:stop-with w)]
        [else w]))

;; "bigger" can be defined after it is used
(define (bigger w)
  (printf "w: ~a\n" w)
  (interval (min (interval-big w) (add1 (guess w)))
            (interval-big w)))

(define (smaller w)
  (interval (interval-small w)
            (max (interval-small w) (sub1 (guess w)))))

(define (guess w)
  (quotient (+ (interval-small w) (interval-big w)) 2))

(define (render w)
  (image:overlay (text (number->string (guess w)) SIZE COLOR) MT-SC))

(define (render-last-scene w)
  (image:overlay (text "End" SIZE COLOR) MT-SC))

(define (single? w)
  (= (interval-small w) (interval-big w)))

;; main function
;; click "Run" and type "(start 1 100)"
(define (start lower upper)
  (universe:big-bang (interval lower upper)
            (universe:on-key deal-with-guess)
            (universe:to-draw render)
            (universe:stop-when single? render-last-scene)))

;; from https://github.com/racket/realm/tree/master/chapter5
;; tests                                    

(module+ test
  
  (require rackunit rackunit/text-ui)
  
  ;; testing the 'model' functions for basic guesses 
  
  (check-true (single? (interval 50 50)))
  (check-false (single? (interval 50 51)))
  
  (check-equal? (guess (interval 0 100)) 50)
  (check-equal? (guess (interval 50 100)) 75)
  (check-equal? (guess (interval 0 50)) 25)
  
  (check-equal? (smaller (interval 0 100)) (interval 0 49))
  (check-equal? (smaller (interval 0 000)) (interval 0 0))
  (check-equal? (smaller (interval 0 50)) (interval 0 24))
  (check-equal? (smaller (interval 50 100)) (interval 50 74))
  (check-equal? (smaller (bigger (bigger (interval 0 100))))
                (interval 76 87))
  
  (check-equal? (bigger (interval 0 100)) (interval 51 100))
  (check-equal? (bigger (interval 0 000)) (interval 0 0))
  (check-equal? (bigger (interval 0 100)) (interval 51 100))
  (check-equal? (bigger (interval 51 100)) (interval 76 100))
  (check-equal? (bigger (interval 0 50)) (interval 26 50))
  
  (check-equal? (deal-with-guess (interval 0 100) "up") (interval 51 100))
  (check-equal? (deal-with-guess (interval 0 100) "down") (interval 0 49))
  (check-equal? (deal-with-guess (interval 0 100) "=") 
                (universe:stop-with (interval 0 100)))
  (check-equal? (deal-with-guess (interval 0 100) "q") 
                (universe:stop-with (interval 0 100)))
  (check-equal? (deal-with-guess (interval 0 100) "up") 
                (interval 51 100))
  (check-equal? (deal-with-guess (interval 50 100) "up") 
                (interval 76 100))
  (check-equal? (deal-with-guess (interval 0 100) "down")
                (interval 0 49))
  (check-equal? (deal-with-guess (interval 0 50) "down") 
                (interval 0 24))
  (check-equal? (deal-with-guess (interval 50 100) "e") 
                (interval 50 100))
  (check-equal? (deal-with-guess (interval 0 100) "f") 
                (interval 0 100))
  (check-equal? (deal-with-guess (deal-with-guess (interval 1 10) "up") 
                                 "down")
                (interval 6 7))

  ;; testing the view functions 
  
  (check-equal? (render (interval 0 100))
                (image:overlay (image:text "50" 20 "red") MT-SC))  
  (check-equal? (render (interval 0 100))
                (image:overlay (image:text "50" SIZE COLOR) MT-SC))
  (check-equal? (render (interval 0 50))
                (image:overlay (image:text "25" SIZE COLOR) MT-SC))
  (check-equal? (render (interval 50 100))
                (image:overlay (image:text "75" SIZE COLOR) MT-SC))
  
"all tests run")

