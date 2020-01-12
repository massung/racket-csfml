#lang racket

#|

CSFML Wrapper for Racket

Copyright (c) 2020 by Jeffrey Massung
All rights reserved.

|#

(require ffi/unsafe)

;; ----------------------------------------------------

(require "enums.rkt"
         "types.rkt"
         "audio.rkt"
         "graphics.rkt"
         "network.rkt"
         "system.rkt"
         "window.rkt")

;; ----------------------------------------------------

(provide (all-from-out "enums.rkt")
         (all-from-out "types.rkt")
         (all-from-out "audio.rkt")
         (all-from-out "graphics.rkt")
         (all-from-out "network.rkt")
         (all-from-out "system.rkt")
         (all-from-out "window.rkt"))

;; ----------------------------------------------------
;; Example usage
;; ----------------------------------------------------

(define (process-events window)
  (let ([event (sfRenderWindow_pollEvent window)])
    (when event
      (case (sfEvent-type event)
        ('sfEvtKeyPressed
          (case (sfKeyEvent-code (sfEvent-key event))
            ('sfKeyEscape (sfRenderWindow_close window)))))

      ;; there may be more events to process
      (process-events window))))

(define (render window)
  (sfRenderWindow_clear window sfRed)
  (sfRenderWindow_display window))

(define (run-loop window)
  (process-events window)
  (render window)

  ;; loop forever until closed
  (when (sfRenderWindow_isOpen window)
    (run-loop window)))

(define (example title width height #:bpp [bpp 32])
  (let* ([mode (make-sfVideoMode width height bpp)]
         [window (sfRenderWindow_create mode title '(sfDefaultStyle) #f)])
    (run-loop window)))
