#lang racket

#|

CSFML Wrapper for Racket

Copyright (c) 2025 by Jeffrey Massung
All rights reserved.

|#

(require ffi/unsafe)
(require ffi/unsafe/alloc)
(require ffi/unsafe/define)

;; ----------------------------------------------------

(define-ffi-definer define-sfml
  (ffi-lib (case (system-type 'os)
             ('windows "csfml-system-2.dll")
             ('unix "libcsfml-system.so.2.6.1")
             ('macosx "libcsfml-system.2.6.1.dylib"))))

;; ----------------------------------------------------

(require "enums.rkt")
(require "types.rkt")

;; ----------------------------------------------------

(provide (except-out (all-defined-out) define-sfml))

;; ----------------------------------------------------
;; Clock.h
;; ----------------------------------------------------

(define-sfml sfClock_destroy
  (_fun _sfClock* -> _void)
  #:wrap (deallocator))

(define-sfml sfClock_create
  (_fun -> _sfClock*)
  #:wrap (allocator sfClock_destroy))

(define-sfml sfClock_copy
  (_fun _sfClock* -> _sfClock*)
  #:wrap (allocator sfClock_destroy))

(define-sfml sfClock_getElapsedTime
  (_fun _sfClock* -> _sfTime))

(define-sfml sfClock_restart
  (_fun _sfClock* -> _sfTime))

;; ----------------------------------------------------
;; Sleep.h
;; ----------------------------------------------------

(define-sfml sfSleep
  (_fun _sfTime -> _void))

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
