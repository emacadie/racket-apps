#lang racket
(require (prefix-in universe: 2htdp/universe) 
         (prefix-in image: 2htdp/image)) 


;; constants
(define MAX-HEALTH 35)
(define MAX-AGILITY 35)
(define MAX-STRENGTH 35)

;; struct for the world
;; player's attributes, list of monsters, number of attacks left
(struct orc-world (player lom attack#) #:transparent)
;; struct for player
(struct player (health agility strength) #:transparent #:mutable)
;; creating a player: (define player1 (player 1 2 3))
;; get the health: (player-health player1)
;; setting the health: (set-player-health! player1 33)
;; doing this creates a copy of player1: (define player3 player1)
;; make a list of players: (define players (list player1 player2 player3))

;; generic updater for player fields
(define (player-update! setter selector mx)
  (lambda (player delta)
    (setter player (interval+ (selector player) delta mx))))

(define player-health+
  (player-update! set-player-health! player-health MAX-HEALTH))

(define player-agility+ 
  (player-update! set-player-agility! player-agility MAX-AGILITY))

(define player-strength+
  (player-update! set-player-strength! player-strength MAX-STRENGTH))

;; struct for monster, health is mutable, creates "set-monster-health!" mutator
(struct monster ([health #:mutable]) #:transparent)

;; structs for type of monsters (inheritance)
;; you get the health field by calling monster-health: (monster-health my-orc)
(struct orc monster (club) #:transparent)
(struct hydra monster () #:transparent)
(struct slime monster (sliminess) #:transparent)
(struct brigand monster () #:transparent)



