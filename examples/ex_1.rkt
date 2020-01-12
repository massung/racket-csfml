#lang racket

#|

This example creates a sfWindow and immediately closes it.

|#

(require csfml)

;; define the size and bit depth of the window
(define mode (make-sfVideoMode 640 480 32))

;; create the window
(define window (sfWindow_create mode "Example" '(sfDefaultStyle) #f))

;; destroy the window
(sfWindow_destroy window)
