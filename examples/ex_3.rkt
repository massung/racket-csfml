#lang racket

#|

Creating a shape and rendering it.

|#

(require racket/flonum)
(require csfml)

;; create the main window
(define mode (make-sfVideoMode 640 480 32))
(define window (sfRenderWindow_create mode "Example" '(sfDefaultStyle) #f))

;; create a circle shape
(define circle (sfCircleShape_create))

(sfCircleShape_setRadius circle 20.0)
(sfCircleShape_setFillColor circle (sfColor_fromRGBA 0 0 255 255))
(sfCircleShape_setOutlineColor circle sfYellow)
(sfCircleShape_setOutlineThickness circle 3.0)
(sfCircleShape_setOrigin circle (make-sfVector2f 20.0 20.0))

;; convert x/y integer pair to vector in view space
(define (map-pixel x y)
  (let ([pos (make-sfVector2i x y)]
        [view (sfRenderWindow_getView window)])
    (sfRenderWindow_mapPixelToCoords window pos view)))

;; move the circle to the mouse
(define (process-events)
  (let ([event (sfRenderWindow_pollEvent window)])
    (when event
      (case (sfEvent-type event)
        ('sfEvtMouseMoved
         (let* ([move (sfEvent-mouseMove event)]
                [pos (map-pixel (sfMouseMoveEvent-x move)
                                (sfMouseMoveEvent-y move))])
           (sfCircleShape_setPosition circle pos)))
        ('sfEvtKeyPressed
         (case (sfKeyEvent-code (sfEvent-key event))
           ('sfKeyEscape (sfRenderWindow_close window)))))

      ;; there may be more events to process
      (process-events))))

;; render the contents of the window
(define (render)
  (sfRenderWindow_clear window sfBlack)
  (sfRenderWindow_drawCircleShape window circle #f)
  (sfRenderWindow_display window))

;; loop forever until the window is closed
(define (run-loop)
  (process-events)
  (render)

  ;; loop forever until closed
  (when (sfRenderWindow_isOpen window)
    (run-loop)))

;; run - close window on exception
(with-handlers
    ([exn? (λ (exn)
             (displayln exn)
             (sfRenderWindow_close window))])
  (run-loop))
  
;; free memory when done
(sfRenderWindow_destroy window)
(sfCircleShape_destroy circle)
