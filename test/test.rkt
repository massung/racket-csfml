#lang racket

#|

CSFML Wrapper for Racket

Copyright (c) 2025 by Jeffrey Massung
All rights reserved.

|#

(require "../main.rkt")

;; ----------------------------------------------------

(define (process-events window)
  (let ([event (sfRenderWindow_pollEvent window)])
    (when event
      (when (eq? (sfEvent-type event) 'sfEvtClosed)
        (sfRenderWindow_close window))

      ;; handle more events
      (process-events window))))

;; ----------------------------------------------------

(define (game-loop window)
  (when (sfRenderWindow_isOpen window)
    (sfRenderWindow_clear window sfBlue)
    (sfRenderWindow_display window)

    ;; handle events
    (process-events window)

    ;; loop
    (game-loop window)))

;; ----------------------------------------------------

(define (play-game)
  (let ([window (sfRenderWindow_create (make-sfVideoMode 800 600 32) "SFML Window" '(sfDefaultStyle) 'sfWindowed #f)])
    (when window
      (game-loop window))))
