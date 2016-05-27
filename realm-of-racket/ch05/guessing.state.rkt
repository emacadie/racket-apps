#lang racket
;; (require 2htdp/universe 2htdp/image)
(require (prefix-in universe: 2htdp/universe) 
         (prefix-in image: 2htdp/image))
;; state
(struct interval (small big numguesses) #:transparent)

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
  (interval (min (interval-big w) (add1 (guess w))) ; small
            (interval-big w)                        ; big 
            (add1 (interval-numguesses w)) ))       ; numguesses

(define (smaller w)
  (printf "Here is w: ~a \n" w)
  (interval (interval-small w)                        ; small
            (max (interval-small w) (sub1 (guess w))) ; big
            (add1 (interval-numguesses w))))          ; numguesses

(define (guess w)
  (quotient (+ (interval-small w) (interval-big w)) 2))

(define (render w)
  (image:overlay (image:text (number->string (guess w)) SIZE COLOR) MT-SC))

(define (render-last-scene w)
  (image:overlay (image:text "End" SIZE COLOR) MT-SC))

(define (single? w)
  (= (interval-small w) (interval-big w)))

;; main function
;; click "Run" and type "(start 1 100)"
(define (start lower upper)
  (universe:big-bang (interval lower upper 0)
            (universe:on-key deal-with-guess)
            (universe:to-draw render)
            (universe:stop-when single? render-last-scene)))
