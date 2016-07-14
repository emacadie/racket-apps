#lang racket

;; constants
(define MAX-HEALTH 35)
(define MAX-AGILITY 35)
(define MAX-STRENGTH 35)

;; struct for the world
;; player's attributes, list of monsters, number of attacks left
(struct orc-world (player lom attack#) #:transparent)
;; struct for player
(struct player (health agility strength) #:transparent)

;; struct for monster
(struct monster (health) #:transparent)

;; structs for type of monsters
;; you get the health field by calling monster-health: (monster-health my-orc)
(struct orc monster (club) #:transparent)
(struct hydra monster () #:transparent)
(struct slime monster (sliminess) #:transparent)
(struct brigand monster () #:transparent)



