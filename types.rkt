#lang racket

#|

CSFML Wrapper for Racket

Copyright (c) 2020 by Jeffrey Massung
All rights reserved.

|#

(require ffi/unsafe)

;; ----------------------------------------------------

(require "enums.rkt")

;; ----------------------------------------------------

(provide (all-defined-out))

;; ----------------------------------------------------
;; Opaque pointers
;; ----------------------------------------------------

(define-cpointer-type _sfCircleShape*)
(define-cpointer-type _sfClock*)
(define-cpointer-type _sfContext*)
(define-cpointer-type _sfContextSettings*)
(define-cpointer-type _sfConvexShape*)
(define-cpointer-type _sfCursor*)
(define-cpointer-type _sfFont*)
(define-cpointer-type _sfFtp*)
(define-cpointer-type _sfFtpDirectoryResponse*)
(define-cpointer-type _sfFtpListingResponse*)
(define-cpointer-type _sfFtpResponse*)
(define-cpointer-type _sfHttp*)
(define-cpointer-type _sfHttpRequest*)
(define-cpointer-type _sfHttpResponse*)
(define-cpointer-type _sfImage*)
(define-cpointer-type _sfInputStream*)
(define-cpointer-type _sfMusic*)
(define-cpointer-type _sfMutex*)
(define-cpointer-type _sfPacket*)
(define-cpointer-type _sfRectangleShape*)
(define-cpointer-type _sfRenderStates*)
(define-cpointer-type _sfRenderTexture*)
(define-cpointer-type _sfRenderWindow*)
(define-cpointer-type _sfShader*)
(define-cpointer-type _sfShape*)
(define-cpointer-type _sfSprite*)
(define-cpointer-type _sfSocketSelector*)
(define-cpointer-type _sfSound*)
(define-cpointer-type _sfSoundBuffer*)
(define-cpointer-type _sfSoundBufferRecorder*)
(define-cpointer-type _sfSoundRecorder*)
(define-cpointer-type _sfSoundStream*)
(define-cpointer-type _sfTcpListener*)
(define-cpointer-type _sfTcpSocket*)
(define-cpointer-type _sfText*)
(define-cpointer-type _sfTexture*)
(define-cpointer-type _sfThread*)
(define-cpointer-type _sfTransformable*)
(define-cpointer-type _sfUdpSocket*)
(define-cpointer-type _sfVertexArray*)
(define-cpointer-type _sfVertexBuffer*)
(define-cpointer-type _sfVideoMode*)
(define-cpointer-type _sfView*)
(define-cpointer-type _sfWindow*)

;; ----------------------------------------------------
;; System/Time.h
;; ----------------------------------------------------

(define-cstruct _sfTime
  ([microseconds _int64]))

;; ----------------------------------------------------
;; System/Vector2.h
;; ----------------------------------------------------

(define-cstruct _sfVector2f
  ([x _float]
   [y _float]))

(define-cstruct _sfVector2i
  ([x _int]
   [y _int]))

(define-cstruct _sfVector2u
  ([x _uint]
   [y _uint]))

;; ----------------------------------------------------
;; System/Vector3.h
;; ----------------------------------------------------

(define-cstruct _sfVector3f
  ([x _float]
   [y _float]
   [z _float]))

;; ----------------------------------------------------
;; Audio/Music.h
;; ----------------------------------------------------

(define-cstruct _sfTimeSpan
  ([offset _sfTime]
   [length _sfTime]))

;; ----------------------------------------------------
;; Graphics/Rect.h
;; ----------------------------------------------------

(define-cstruct _sfFloatRect
  ([left _float]
   [top _float]
   [width _float]
   [height _float]))

(define-cstruct _sfIntRect
  ([left _int]
   [top _int]
   [width _int]
   [height _int]))

;; ----------------------------------------------------
;; Audio/SoundStream.h
;; ----------------------------------------------------

(define-cstruct _sfSoundStreamChunk
  ([samples _pointer]
   [sampleCount _uint]))

(define _sfSoundStreamGetDataCallback
  (_fun _sfSoundStreamChunk _pointer -> _bool))

(define _sfSoundStreamSeekCallback
  (_fun _sfTime _pointer -> _void))

;; ----------------------------------------------------
;; Graphics/BlendMode.h - structs
;; ----------------------------------------------------

(define-cstruct _sfBlendMode
  ([colorSrcFactor _sfBlendFactor]
   [colorDstFactor _sfBlendFactor]
   [colorEquation _sfBlendEquation]
   [alphaSrcFactor _sfBlendFactor]
   [alphaDstFactor _sfBlendFactor]
   [alphaEquation _sfBlendEquation]))

;; ----------------------------------------------------
;; Graphics/Color.h - structs
;; ----------------------------------------------------

(define-cstruct _sfColor
  ([r _byte]
   [g _byte]
   [b _byte]
   [a _byte]))

;; ----------------------------------------------------
;; Graphics/FontInfo.h - structs
;; ----------------------------------------------------

(define-cstruct _sfFontInfo
  ([family _string]))

;; ----------------------------------------------------
;; Graphics/Glsl.h - structs
;; ----------------------------------------------------

(define-cstruct _sfGlslVec2
  ([x _float]
   [y _float]))

(define-cstruct _sfGlslBvec2
  ([x _bool]
   [y _bool]))

(define-cstruct _sfGlslIvec2
  ([x _int]
   [y _int]))

(define-cstruct _sfGlslVec3
  ([x _float]
   [y _float]
   [z _float]))

(define-cstruct _sfGlslBvec3
  ([x _bool]
   [y _bool]
   [z _bool]))

(define-cstruct _sfGlslIvec3
  ([x _int]
   [y _int]
   [z _int]))

(define-cstruct _sfGlslVec4
  ([x _float]
   [y _float]
   [z _float]
   [w _float]))

(define-cstruct _sfGlslBvec4
  ([x _bool]
   [y _bool]
   [z _bool]
   [w _bool]))

(define-cstruct _sfGlslIvec4
  ([x _int]
   [y _int]
   [z _int]
   [w _int]))

(define-cstruct _sfGlslMat3
  ([array (_array _float 9)]))

(define-cstruct _sfGlslMat4
  ([array (_array _float 16)]))

;; ----------------------------------------------------
;; Audio/SoundRecorder.h
;; ----------------------------------------------------

(define _sfSoundRecorderStartCallback
  (_fun _pointer -> _bool))
 
(define _sfSoundRecorderProcessCallback
  (_fun (_ptr i _int16) _uint _pointer -> _bool))

(define _sfSoundRecorderStopCallback
  (_fun _pointer -> _bool))

;; ----------------------------------------------------
;; Graphics/Glyph.h
;; ----------------------------------------------------

(define-cstruct _sfGlyph
  ([advance _float]
   [bounds _sfFloatRect]
   [textureRect _sfIntRect]))

;; ----------------------------------------------------
;; Graphics/Transform.h
;; ----------------------------------------------------

(define-cstruct _sfTransform
  ([matrix (_array _float 9)]))

;; ----------------------------------------------------
;; Graphics/RenderStates.h
;; ----------------------------------------------------

(define-cstruct _sfRenderStates
  ([blendMode _sfBlendMode]
   [transform _sfTransform]
   [texture (_or-null _sfTexture*)]
   [shader (_or-null _sfShader*)]))

;; ----------------------------------------------------
;; Graphics/Vertex.h
;; ----------------------------------------------------

(define-cstruct _sfVertex
  ([position _sfVector2f]
   [color _sfColor]
   [texCoords _sfVector2f]))

;; ----------------------------------------------------
;; Network/IpAddress.h
;; ----------------------------------------------------

(define-cstruct _sfIpAddress
  ([address (_array _uint8 16)]))

;; ----------------------------------------------------
;; Graphics/Shape.h
;; ----------------------------------------------------

(define _sfShapeGetPointCountCallback
  (_fun _pointer -> _uint))

(define _sfShapeGetPointCallback
  (_fun _uint _pointer -> _sfVector2f))

;; ----------------------------------------------------
;; System/InputStream.h
;; ----------------------------------------------------

(define _sfInputStreamReadFunc
  (_fun _pointer _int64 _pointer -> _int64))

(define _sfInputStreamSeekFunc
  (_fun _int64 _pointer -> _int64))

(define _sfInputStreamTellFunc
  (_fun _pointer -> _int64))

(define _sfInputStreamGetSizeFunc
  (_fun _pointer -> _int64))

(define-cstruct _sfInputStream
  ([read _sfInputStreamReadFunc]
   [seek _sfInputStreamSeekFunc]
   [tell _sfInputStreamTellFunc]
   [getSize _sfInputStreamGetSizeFunc]
   [userData _pointer]))

;; ----------------------------------------------------
;; Window/Context.h
;; ----------------------------------------------------

(define-cstruct _sfContextSettings
  ([depthBits _uint]
   [stencilBits _uint]
   [antialiasingLevel _uint]
   [majorVersion _uint]
   [minorVersion _uint]
   [attributeFlags _uint32]
   [sRgbCapable _bool]))

;; ----------------------------------------------------
;; Window/Event.h
;; ----------------------------------------------------

(define-cstruct _sfJoystickButtonEvent
  ([type _sfEventType]
   [joystickId _uint]
   [button _uint]))

(define-cstruct _sfJoystickConnectEvent
  ([type _sfEventType]
   [joystickId _uint]))

(define-cstruct _sfJoystickMoveEvent
  ([type _sfEventType]
   [joystickId _uint]
   [axis _sfJoystickAxis]
   [position _float]))

(define-cstruct _sfKeyEvent
  ([type _sfEventType]
   [code _sfKeyCode]
   [alt _bool]
   [control _bool]
   [shift _bool]
   [system _bool]))

(define-cstruct _sfMouseButtonEvent
  ([type _sfEventType]
   [button _sfMouseButton]
   [x _int]
   [y _int]))

(define-cstruct _sfMouseMoveEvent
  ([type _sfEventType]
   [x _int]
   [y _int]))

(define-cstruct _sfMouseWheelScrollEvent
  ([type _sfEventType]
   [wheel _sfMouseWheel]
   [delta _float]
   [x _int]
   [y _int]))

(define-cstruct _sfSensorEvent
  ([type _sfEventType]
   [sensorType _sfSensorType]
   [x _float]
   [y _float]
   [z _float]))

(define-cstruct _sfSizeEvent
  ([type _sfEventType]
   [width _uint]
   [height _uint]))

(define-cstruct _sfTextEvent
  ([type _sfEventType]
   [unicode _uint32]))

(define-cstruct _sfTouchEvent
  ([type _sfEventType]
   [finger _uint]
   [x _int]
   [y _int]))

(define _sfEvent
  (_union
   _sfEventType
   _sfJoystickButtonEvent
   _sfJoystickConnectEvent
   _sfJoystickMoveEvent
   _sfKeyEvent
   _sfMouseButtonEvent
   _sfMouseMoveEvent
   _sfMouseWheelScrollEvent
   _sfSensorEvent
   _sfSizeEvent
   _sfTextEvent
   _sfTouchEvent))

;; ----------------------------------------------------

(define (sfEvent-type e) (union-ref e 0))
(define (sfEvent-joystickButton e) (union-ref e 1))
(define (sfEvent-jotstickConnect e) (union-ref e 2))
(define (sfEvent-joystickMove e) (union-ref e 3))
(define (sfEvent-key e) (union-ref e 4))
(define (sfEvent-mouseButton e) (union-ref e 5))
(define (sfEvent-mouseMove e) (union-ref e 6))
(define (sfEvent-mouseWheelScroll e) (union-ref e 7))
(define (sfEvent-sensor e) (union-ref e 8))
(define (sfEvent-size e) (union-ref e 9))
(define (sfEvent-text e) (union-ref e 10))
(define (sfEvent-touch e) (union-ref e 11))

;; ----------------------------------------------------
;; Window/Joystick.h
;; ----------------------------------------------------

(define-cstruct _sfJoystickIdentification
  ([name _string]
   [vendorId _uint]
   [productId _uint]))

;; ----------------------------------------------------
;; Window/VideoMode.h
;; ----------------------------------------------------

(define-cstruct _sfVideoMode
  ([width _uint]
   [height _uint]
   [bitsPerPixel _uint]))
