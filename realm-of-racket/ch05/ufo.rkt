#lang racket
(require (prefix-in universe: 2htdp/universe) 
         (prefix-in image: 2htdp/image)) 

(define WIDTH 200)
(define HEIGHT 300)
(define IMAGE-of-UFO (image:bitmap "120px-Moonbeam_UFO.JPG"))
(define (add-3-to-state current-state)
  (+ current-state 3))

;; You can also run this in the interactions window
(define (draw-a-ufo-onto-an-empty-scene current-state)
  (image:place-image IMAGE-of-UFO (/ WIDTH 2) current-state
               (image:empty-scene WIDTH HEIGHT)))

;; not in 'Realm Of Racket'
(define (state-is-300 current-state)
  (>= current-state 300))

;; in 2htdp/universe, big-bang is sort of like main, creates a "world" with state and view
;; but per the included source, I am going to wrap it in a main
;; on-tick means the next function is called every time the system clock ticks
;; docs say it clicks 28 times per second. Maybe it's a Racket clock of some sort (cuz the chip is faster than that)
;; big-bang has specs (or clauses) with handler functions
(define (main)
  (universe:big-bang 0                                      ; initial state
          (universe:on-tick add-3-to-state)                 ; what to do when clock ticks
          (universe:to-draw draw-a-ufo-onto-an-empty-scene) ; what to do when state changes
          (universe:stop-when state-is-300)))               ; when to stop

;; to run the program, click run and enter 
;;   > (main) 
;; at the prompt. 
