#lang racket

#|

This example creates a sfRenderWindow and loops forever processing
events and rendering to the window (clearing and presenting) until
the escape key is pressed.

|#

(require csfml)

;; recursively process all events for a window
(define (process-events window)
  (let ([event (sfRenderWindow_pollEvent window)])
    (when event
      (case (sfEvent-type event)
        ('sfEvtKeyPressed
         (case (sfKeyEvent-code (sfEvent-key event))
           ('sfKeyEscape (sfRenderWindow_close window)))))

      ;; there may be more events to process
      (process-events window))))

;; render the contents of the window
(define (render window)
  (sfRenderWindow_clear window sfRed)
  (sfRenderWindow_display window))

;; loop forever until the window is closed
(define (run-loop window)
  (process-events window)
  (render window)

  ;; loop forever until closed
  (when (sfRenderWindow_isOpen window)
    (run-loop window)))

;; create the main window
(define mode (make-sfVideoMode 640 480 32))
(define window (sfRenderWindow_create mode "Example" '(sfDefaultStyle) #f))

;; run
(run-loop window)
