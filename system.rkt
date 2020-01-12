#lang racket


#|

SFML Wrapper for Racket

Copyright (c) 2020 by Jeffrey Massung
All rights reserved.

|#

(require ffi/unsafe)
(require ffi/unsafe/define)

;; ----------------------------------------------------

(require "enums.rkt")
(require "types.rkt")

;; ----------------------------------------------------

(define-ffi-definer define-sfml (ffi-lib "csfml-system-2"))

;; ----------------------------------------------------

(provide (except-out (all-defined-out) define-sfml))

;; ----------------------------------------------------
;; Clock.h
;; ----------------------------------------------------

(define-sfml sfClock_create
  (_fun -> _sfClock*))

(define-sfml sfClock_copy
  (_fun _sfClock* -> _sfClock*))

(define-sfml sfClock_destroy
  (_fun _sfClock* -> _void))

(define-sfml sfClock_getElapsedTime
  (_fun _sfClock* -> _sfTime))

(define-sfml sfClock_restart
  (_fun _sfClock* -> _sfTime))

;; ----------------------------------------------------
;; Mutex.h
;; ----------------------------------------------------

(define-sfml sfMutex_create
  (_fun -> _sfMutex*))

(define-sfml sfMutex_destroy
  (_fun _sfMutex* -> _void))

(define-sfml sfMutex_lock
  (_fun _sfMutex* -> _void))

(define-sfml sfMutex_unlock
  (_fun _sfMutex* -> _void))

;; ----------------------------------------------------
;; Sleep.h
;; ----------------------------------------------------

(define-sfml sfSleep
  (_fun _sfTime -> _void))

;; ----------------------------------------------------
;; Thread.h
;; ----------------------------------------------------

(define-sfml sfThread_create
  (_fun (_fun _pointer -> _void) _pointer -> _sfThread*))

(define-sfml sfThread_destroy
  (_fun _sfThread* -> _void))

(define-sfml sfThread_launch
  (_fun _sfThread* -> _void))

(define-sfml sfThread_wait
  (_fun _sfThread* -> _void))

(define-sfml sfThread_terminate
  (_fun _sfThread* -> _void))

;; ----------------------------------------------------
;; Time.h
;; ----------------------------------------------------

(define-sfml sfTime_asSeconds
  (_fun _sfTime -> _float))

(define-sfml sfTime_asMilliseconds
  (_fun _sfTime -> _int32))

(define-sfml sfTime_asMicroseconds
  (_fun _sfTime -> _int64))

(define-sfml sfSeconds
  (_fun _float -> _sfTime))

(define-sfml sfMilliseconds
  (_fun _int32 -> _sfTime))

(define-sfml sfMicroseconds
  (_fun _int64 -> _sfTime))
