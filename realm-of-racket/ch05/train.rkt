#lang racket
(require (prefix-in universe: 2htdp/universe) 
         (prefix-in image: 2htdp/image)) 
;; state
;; constants
(define WIDTH 500)
(define HEIGHT 300)
(define IMAGE-of-TRAIN (image:bitmap "train.jpg"))

;; handlers
;; You can also run this in the interactions window
(define (draw-a-train-onto-an-empty-scene current-state)
  (image:place-image 
   IMAGE-of-TRAIN ; image
   current-state ; x co-ordinate
   (/ HEIGHT 2) ; y-coordinate
   (image:empty-scene WIDTH HEIGHT))) ;; scene

(define (state-is-WIDTH current-state)
  (>= current-state (+ WIDTH (/ (image:image-width IMAGE-of-TRAIN) 2))))

;; tick-handler
(define (add-3-to-state current-state)
  (+ current-state 3))

;; main
(define (main)
  (printf "Width of image is ~a\n" (image:image-width IMAGE-of-TRAIN))
  (universe:big-bang 0                                      ; initial state
          (universe:on-tick add-3-to-state)                 ; what to do when clock ticks
          (universe:to-draw draw-a-train-onto-an-empty-scene) ; what to do when state changes
          (universe:stop-when state-is-WIDTH)))               ; when to stop
