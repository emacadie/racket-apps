#lang racket
(require 2htdp/universe ;; big-bang
2htdp/image) ;; bitmap, empty-scene, place-image
;; those are libraries
;; it would be nice if I could do something like Clojure or Java/Groovy:
;; have a way to tell either in the require statement or each usage where something is from

(define WIDTH 200)
(define HEIGHT 300)
(define IMAGE-of-UFO (bitmap "120px-Moonbeam_UFO.JPG"))
(define (add-3-to-state current-state)
  (+ current-state 3))

;; You can also run this in the interactions window
(define (draw-a-ufo-onto-an-empty-scene current-state)
  (place-image IMAGE-of-UFO (/ WIDTH 2) current-state
               (empty-scene WIDTH HEIGHT)))

;; not in 'Realm Of Racket'
(define (state-is-300 current-state)
  (>= current-state 300))

;; in 2htdp/universe, big-bang is sort of like main, creates a "world" with state and view
;; but per the included source, I am going to wrap it in a main
;; on-tick means the next function is called every time the system clock ticks
;; docs say it clicks 28 times per second. Maybe it's a Racket clock of some sort (cuz the chip is faster than that)
;; big-bang has specs (or clauses) with handler functions
(define (main)
  (big-bang 0                                      ; initial state
          (on-tick add-3-to-state)                 ; what to do when clock ticks
          (to-draw draw-a-ufo-onto-an-empty-scene) ; what to do when state changes
          (stop-when state-is-300)))               ; when to stop

;; to run the program, click run and enter 
;;   > (main) 
;; at the prompt. 
