#lang racket


#|

CSFML Wrapper for Racket

Copyright (c) 2020 by Jeffrey Massung
All rights reserved.

|#

(require ffi/unsafe)
(require ffi/unsafe/define)

;; ----------------------------------------------------

(define-ffi-definer define-sfml
  (ffi-lib (case (system-type 'os)
             ('windows "csfml-window-2")
             ('unix "libcsfml-window")
             ('macosx "libcsfml-window"))))

;; ----------------------------------------------------

(require (file "enums.rkt"))
(require (file "types.rkt"))

;; ----------------------------------------------------

(provide (except-out (all-defined-out) define-sfml))

;; ----------------------------------------------------
;; Clipboard.h
;; ----------------------------------------------------

(define-sfml sfClipboard_getString
  (_fun -> _string))

(define-sfml sfClipboard_setString
  (_fun _string -> _void))

;; ----------------------------------------------------
;; Context.h
;; ----------------------------------------------------

(define-sfml sfContext_create
  (_fun -> _sfContext*))

(define-sfml sfContext_destroy
  (_fun _sfContext* -> _void))

(define-sfml sfContext_setActive
  (_fun _sfContext* _bool -> _bool))

(define-sfml sfContext_getActiveContextId
  (_fun -> _uint64))

;; ----------------------------------------------------
;; Cursor.h
;; ----------------------------------------------------

(define-sfml sfCursor_createFromPixels
  (_fun (_ptr i _uint8) _sfVector2u _sfVector2u -> _sfCursor*))

(define-sfml sfCursor_createFromSystem
  (_fun _sfCursorType -> _sfCursor*))

(define-sfml sfCursor_destroy
  (_fun _sfCursor* -> _void))

;; ----------------------------------------------------
;; Joystick.h
;; ----------------------------------------------------

(define-sfml sfJoystick_isConnected
  (_fun _uint -> _bool))

(define-sfml sfJoystick_getButtonCount
  (_fun _uint -> _uint))

(define-sfml sfJoystick_hasAxis
  (_fun _uint _sfJoystickAxis -> _bool))

(define-sfml sfJoystick_isButtonPressed
  (_fun _uint _uint -> _bool))

(define-sfml sfJoystick_getAxisPosition
  (_fun _uint _sfJoystickAxis -> _float))

(define-sfml sfJoystick_getIdentification
  (_fun _uint -> _sfJoystickIdentification))

(define-sfml sfJoystick_update
  (_fun -> _void))

;; ----------------------------------------------------
;; Keyboard.h
;; ----------------------------------------------------

(define-sfml sfKeyboard_isKeyPressed
  (_fun _sfKeyCode -> _bool))

(define-sfml sfKeyboard_setVirtualKeyboardVisible
  (_fun _bool -> _void))

;; ----------------------------------------------------
;; Mouse.h
;; ----------------------------------------------------

(define-sfml sfMouse_isButtonPressed
  (_fun _sfMouseButton -> _bool))

(define-sfml sfMouse_getPosition
  (_fun (_or-null _sfWindow*) -> _sfVector2i))

(define-sfml sfMouse_setPosition
  (_fun _sfVector2i (_or-null _sfWindow*) -> _void))

;; ----------------------------------------------------
;; Sensor.h
;; ----------------------------------------------------

(define-sfml sfSensor_isAvailable
  (_fun _sfSensorType -> _bool))

(define-sfml sfSensor_setEnabled
  (_fun _sfSensorType _bool -> _void))

(define-sfml sfSensor_getValue
  (_fun _sfSensorType -> _sfVector3f))

;; ----------------------------------------------------
;; Touch.h
;; ----------------------------------------------------

(define-sfml sfTouch_isDown
  (_fun _uint -> _bool))

(define-sfml sfTouch_getPosition
  (_fun _uint (_or-null _sfWindow*) -> _sfVector2i))

;; ----------------------------------------------------
;; VideoMode.h
;; ----------------------------------------------------

(define-sfml sfVideoMode_getDesktopMode
  (_fun -> _sfVideoMode))

(define-sfml sfVideoMode_getFullscreenModes
  (_fun (n : (_ptr o _uint)) -> (mode : _sfVideoMode*) -> (values mode n)))

(define-sfml sfVideoMode_isValid
  (_fun _sfVideoMode -> _bool))

;; ----------------------------------------------------
;; Window.h
;; ----------------------------------------------------

(define-sfml sfWindow_create
  (_fun _sfVideoMode _string _sfWindowStyle (_or-null _sfContextSettings*) -> _sfWindow*))

(define-sfml sfWindow_destroy
  (_fun _sfWindow* -> _void))

(define-sfml sfWindow_close
  (_fun _sfWindow* -> _void))

(define-sfml sfWindow_isOpen
  (_fun _sfWindow* -> _bool))

(define-sfml sfWindow_getSettings
  (_fun _sfWindow* -> _sfContextSettings))

(define-sfml sfWindow_pollEvent
  (_fun _sfWindow* (e : (_ptr o _sfEvent)) -> (ok : _bool) -> (and ok e)))

(define-sfml sfWindow_waitEvent
  (_fun _sfWindow* (e : (_ptr o _sfEvent)) -> (ok : _bool) -> (and ok e)))

(define-sfml sfWindow_getPosition
  (_fun _sfWindow* -> _sfVector2i))

(define-sfml sfWindow_setPosition
  (_fun _sfWindow* _sfVector2i -> _void))

(define-sfml sfWindow_getSize
  (_fun _sfWindow* -> _sfVector2u))

(define-sfml sfWindow_setSize
  (_fun _sfWindow* _sfVector2u -> _void))

(define-sfml sfWindow_setTitle
  (_fun _sfWindow* _string -> _void))

(define-sfml sfWindow_setIcon
  (_fun _sfWindow* _uint _uint (_ptr i _uint8) -> _void))

(define-sfml sfWindow_setVisible
  (_fun _sfWindow* _bool -> _void))

(define-sfml sfWindow_setVerticalSyncEnabled
  (_fun _sfWindow* _bool -> _void))

(define-sfml sfWindow_setMouseCursorVisible
  (_fun _sfWindow* _bool -> _void))

(define-sfml sfWindow_setMouseCursorGrabbed
  (_fun _sfWindow* _bool -> _void))

(define-sfml sfWindow_setMouseCursor
  (_fun _sfWindow* _sfCursor* -> _void))

(define-sfml sfWindow_setKeyRepeatEnabled
  (_fun _sfWindow* _bool -> _void))

(define-sfml sfWindow_setFramerateLimit
  (_fun _sfWindow* _uint -> _void))

(define-sfml sfWindow_setJoystickThreshold
  (_fun _sfWindow* _float -> _void))

(define-sfml sfWindow_setActive
  (_fun _sfWindow* _bool -> _void))

(define-sfml sfWindow_hasFocus
  (_fun _sfWindow* -> _bool))

(define-sfml sfWindow_display
  (_fun _sfWindow* -> _void))
