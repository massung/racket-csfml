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
             ('windows "csfml-audio-2")
             ('unix "libcsfml-audio")
             ('macos "libcsfml-audio"))))

;; ----------------------------------------------------

(require (file "enums.rkt"))
(require (file "types.rkt"))

;; ----------------------------------------------------

(provide (except-out (all-defined-out) define-sfml))

;; ----------------------------------------------------
;; Listener.h
;; ----------------------------------------------------

(define-sfml sfListener_setGlobalVolume
  (_fun _float -> _void))

(define-sfml sfListener_getGlobalVolume
  (_fun -> _float))

(define-sfml sfListener_getPosition
  (_fun -> _sfVector3f))

(define-sfml sfListener_setDirection
  (_fun _sfVector3f -> _void))

(define-sfml sfListener_getDirection
  (_fun -> _sfVector3f))

(define-sfml sfListener_setUpVector
  (_fun _sfVector3f -> _void))

(define-sfml sfListener_getUpVector
  (_fun -> _sfVector3f))

;; ----------------------------------------------------
;; Music.h
;; ----------------------------------------------------

(define-sfml sfMusic_createFromFile
  (_fun _string -> _sfMusic*))

(define-sfml sfMusic_createFromMemory
  (_fun _pointer _uint -> _sfMusic*))

(define-sfml sfMusic_createFromStream
  (_fun _sfInputStream* -> _sfMusic*))

(define-sfml sfMusic_destroy
  (_fun _sfMusic* -> _void))

(define-sfml sfMusic_setLoop
  (_fun _sfMusic* _bool -> _void))

(define-sfml sfMusic_getLoop
  (_fun _sfMusic* -> _bool))

(define-sfml sfMusic_getDuration
  (_fun _sfMusic* -> _sfTime))

(define-sfml sfMusic_getLoopPoints
  (_fun _sfMusic* -> _sfTimeSpan))

(define-sfml sfMusic_setLoopPoints
  (_fun _sfMusic* _sfTimeSpan -> _void))

(define-sfml sfMusic_play
  (_fun _sfMusic* -> _void))

(define-sfml sfMusic_pause
  (_fun _sfMusic* -> _void))

(define-sfml sfMusic_stop
  (_fun _sfMusic* -> _void))

(define-sfml sfMusic_getChannelCount
  (_fun _sfMusic* -> _uint))

(define-sfml sfMusic_getSampleRate
  (_fun _sfMusic* -> _uint))

(define-sfml sfMusic_getStatus
  (_fun _sfMusic* -> _sfSoundStatus))

(define-sfml sfMusic_getPlayingOffset
  (_fun _sfMusic* -> _sfTime))

(define-sfml sfMusic_setPitch
  (_fun _sfMusic* _float -> _void))

(define-sfml sfMusic_setVolume
  (_fun _sfMusic* _float -> _void))

(define-sfml sfMusic_setPosition
  (_fun _sfMusic* _sfVector3f -> _void))

(define-sfml sfMusic_setRelativeToListener
  (_fun _sfMusic* _bool -> _void))

(define-sfml sfMusic_setMinDistance
  (_fun _sfMusic* _float -> _void))

(define-sfml sfMusic_setAttenuation
  (_fun _sfMusic* _float -> _void))

(define-sfml sfMusic_setPlayingOffset
  (_fun _sfMusic* _sfTime -> _void))

(define-sfml sfMusic_getPitch
  (_fun _sfMusic* -> _float))

(define-sfml sfMusic_getVolume
  (_fun _sfMusic* -> _float))

(define-sfml sfMusic_getPosition
  (_fun _sfMusic* -> _sfVector3f))

(define-sfml sfMusic_isRelativeToListener
  (_fun _sfMusic* -> _bool))

(define-sfml sfMusic_getMinDistance
  (_fun _sfMusic* -> _float))

(define-sfml sfMusic_getAttenuation
  (_fun _sfMusic* -> _float))

;; ----------------------------------------------------
;; Sound.h
;; ----------------------------------------------------

(define-sfml sfSound_create
  (_fun -> _sfSound*))

(define-sfml sfSound_copy
  (_fun _sfSound* -> _sfSound*))

(define-sfml sfSound_destroy
  (_fun _sfSound* -> _void))

(define-sfml sfSound_play
  (_fun _sfSound* -> _void))

(define-sfml sfSound_pause
  (_fun _sfSound* -> _void))

(define-sfml sfSound_stop
  (_fun _sfSound* -> _void))

(define-sfml sfSound_setBuffer
  (_fun _sfSound* _sfSoundBuffer* -> _void))

(define-sfml sfSound_getBuffer
  (_fun _sfSound* -> _sfSoundBuffer*))

(define-sfml sfSound_setLoop
  (_fun _sfSound* _bool -> _void))

(define-sfml sfSound_getLoop
  (_fun _sfSound* -> _bool))

(define-sfml sfSound_getStatus
  (_fun _sfSound* -> _sfSoundStatus))

(define-sfml sfSound_setPitch
  (_fun _sfSound* _float -> _void))

(define-sfml sfSound_setVolume
  (_fun _sfSound* _float -> _void))

(define-sfml sfSound_setPosition
  (_fun _sfSound* _sfVector3f -> _void))

(define-sfml sfSound_setRelativeToListener
  (_fun _sfSound* _bool -> _void))

(define-sfml sfSound_setMinDistance
  (_fun _sfSound* _float -> _void))

(define-sfml sfSound_setAttenuation
  (_fun _sfSound* _float -> _void))

(define-sfml sfSound_setPlayingOffset
  (_fun _sfSound* _sfTime -> _void))

(define-sfml sfSound_getPitch
  (_fun _sfSound* -> _float))

(define-sfml sfSound_getVolume
  (_fun _sfSound* -> _float))

(define-sfml sfSound_isRelativeToListener
  (_fun _sfSound* -> _bool))

(define-sfml sfSound_getMinDistance
  (_fun _sfSound* -> _float))

(define-sfml sfSound_getAttenuation
  (_fun _sfSound* -> _float))

(define-sfml sfSound_getPlayingOffset
  (_fun _sfSound* -> _sfTime))

;; ----------------------------------------------------
;; SoundBuffer.h
;; ----------------------------------------------------

(define-sfml sfSoundBuffer_createFromFile
  (_fun _string -> _sfSoundBuffer*))

(define-sfml sfSoundBuffer_createFromMemory
  (_fun _pointer _uint -> _sfSoundBuffer*))

(define-sfml sfSoundBuffer_createFromStream
  (_fun _sfInputStream* -> _sfSoundBuffer*))

(define-sfml sfSoundBuffer_createFromSamples
  (_fun (_ptr i _uint16) _uint64 _uint _uint -> _sfSoundBuffer*))

(define-sfml sfSoundBuffer_copy
  (_fun _sfSoundBuffer* -> _sfSoundBuffer*))

(define-sfml sfSoundBuffer_destroy
  (_fun _sfSoundBuffer* -> _void))

(define-sfml sfSoundBuffer_saveToFile
  (_fun _sfSoundBuffer* _string -> _bool))

(define-sfml sfSoundBuffer_getSamples
  (_fun _sfSoundBuffer* -> (_ptr o _uint16)))

(define-sfml sfSoundBuffer_getSampleCount
  (_fun _sfSoundBuffer* -> _uint64))

(define-sfml sfSoundBuffer_getSampleRate
  (_fun _sfSoundBuffer* -> _uint))

(define-sfml sfSoundBuffer_getChannelCount
  (_fun _sfSoundBuffer* -> _uint))

(define-sfml sfSoundBuffer_getDuration
  (_fun _sfSoundBuffer* -> _sfTime))

;; ----------------------------------------------------
;; SoundBufferRecorder.h
;; ----------------------------------------------------

(define-sfml sfSoundBufferRecorder_create
  (_fun -> _sfSoundBufferRecorder*))

(define-sfml sfSoundBufferRecorder_destroy
  (_fun _sfSoundBufferRecorder* -> _void))

(define-sfml sfSoundBufferRecorder_start
  (_fun _sfSoundBufferRecorder* _uint -> _bool))

(define-sfml sfSoundBufferRecorder_stop
  (_fun _sfSoundBufferRecorder* -> _void))

(define-sfml sfSoundBufferRecorder_getSampleRate
  (_fun _sfSoundBufferRecorder* -> _uint))

(define-sfml sfSoundBufferRecorder_getBuffer
  (_fun _sfSoundBufferRecorder* -> _sfSoundBuffer*))

(define-sfml sfSoundBufferRecorder_setDevice
  (_fun _sfSoundBufferRecorder* _string -> _bool))

(define-sfml sfSoundBufferRecorder_getDevice
  (_fun _sfSoundBufferRecorder* -> _string))

;; ----------------------------------------------------
;; SoundRecorder.h
;; ----------------------------------------------------

(define-sfml sfSoundRecorder_create
  (_fun _sfSoundRecorderStartCallback _sfSoundRecorderProcessCallback _sfSoundRecorderStopCallback _pointer -> _sfSoundRecorder*))

(define-sfml sfSoundRecorder_destroy
  (_fun _sfSoundRecorder* -> _void))

(define-sfml sfSoundRecorder_start
  (_fun _sfSoundRecorder* _uint -> _bool))

(define-sfml sfSoundRecorder_stop
  (_fun _sfSoundRecorder* -> _void))

(define-sfml sfSoundRecorder_getSampleRate
  (_fun _sfSoundRecorder* -> _uint))

(define-sfml sfSoundRecorder_isAvailable
  (_fun _sfSoundRecorder* -> _bool))

(define-sfml sfSoundRecorder_setProcessingInterval
  (_fun _sfSoundRecorder* _sfTime -> _void))

(define-sfml sfSoundRecorder_getAvailableDevices
  (_fun _sfSoundRecorder* (n : (_ptr o _uint)) -> (names : _pointer) -> (values names n)))

(define-sfml sfSoundRecorder_getDefaultDevice
  (_fun _sfSoundRecorder* -> _string))

(define-sfml sfSoundRecorder_setDevice
  (_fun _sfSoundRecorder* _string -> _bool))

(define-sfml sfSoundRecorder_getDevice
  (_fun _sfSoundRecorder* -> _string))

(define-sfml sfSoundRecorder_setChannelCount
  (_fun _sfSoundRecorder* _uint -> _void))

(define-sfml sfSoundRecorder_getChannelCount
  (_fun _sfSoundRecorder* -> _uint))

;; ----------------------------------------------------
;; SoundStream.h
;; ----------------------------------------------------

(define-sfml sfSoundStream_create
  (_fun _sfSoundStreamGetDataCallback _sfSoundStreamSeekCallback _uint _uint _pointer -> _sfSoundStream*))

(define-sfml sfSoundStream_destroy
  (_fun _sfSoundStream* -> _void))

(define-sfml sfSoundStream_play
  (_fun _sfSoundStream* -> _void))

(define-sfml sfSoundStream_stop
  (_fun _sfSoundStream* -> _void))

(define-sfml sfSoundStream_getStatus
  (_fun _sfSoundStream* -> _sfSoundStatus))

(define-sfml sfSoundStream_getChannelCount
  (_fun _sfSoundStream* -> _uint))

(define-sfml sfSoundStream_getSampleRate
  (_fun _sfSoundStream* -> _uint))

(define-sfml sfSoundStream_setPitch
  (_fun _sfSoundStream* _float -> _void))

(define-sfml sfSoundStream_setVolume
  (_fun _sfSoundStream* _float -> _void))

(define-sfml sfSoundStream_setPosition
  (_fun _sfSoundStream* _sfVector3f -> _void))

(define-sfml sfSoundStream_setRelativeToListener
  (_fun _sfSoundStream* _bool -> _void))

(define-sfml sfSoundStream_setMinDistance
  (_fun _sfSoundStream* _float -> _void))

(define-sfml sfSoundStream_setAttenuation
  (_fun _sfSoundStream* _float -> _void))

(define-sfml sfSoundStream_setPlayingOffset
  (_fun _sfSoundStream* _sfTime -> _void))

(define-sfml sfSoundStream_setLoop
  (_fun _sfSoundStream* _bool -> _void))

(define-sfml sfSoundStream_getPitch
  (_fun _sfSoundStream* -> _float))

(define-sfml sfSoundStream_getVolume
  (_fun _sfSoundStream* -> _float))

(define-sfml sfSoundStream_isRelativeToListener
  (_fun _sfSoundStream* -> _bool))

(define-sfml sfSoundStream_getMinDistance
  (_fun _sfSoundStream* -> _float))

(define-sfml sfSoundStream_getLoop
  (_fun _sfSoundStream* -> _bool))

(define-sfml sfSoundStream_getPlayingOffset
  (_fun _sfSoundStream* -> _sfTime))
