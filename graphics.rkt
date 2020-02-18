#lang racket

#|

CSFML Wrapper for Racket

Copyright (c) 2020 by Jeffrey Massung
All rights reserved.

|#

(require ffi/unsafe)
(require ffi/unsafe/alloc)
(require ffi/unsafe/define)

;; ----------------------------------------------------

(define-ffi-definer define-sfml
  (ffi-lib (case (system-type 'os)
             ('windows "csfml-graphics-2")
             ('unix "libcsfml-graphics")
             ('macosx "libcsfml-graphics"))))

;; ----------------------------------------------------

(require "enums.rkt")
(require "types.rkt")

;; ----------------------------------------------------

(provide (except-out (all-defined-out) define-sfml))

;; ----------------------------------------------------
;; BlendMode.h
;; ----------------------------------------------------

(define sfBlendAlpha
  (make-sfBlendMode 'sfBlendFactorSrcAlpha
                    'sfBlendFactorOneMinusSrcAlpha
                    'sfBlendEquationAdd
                    'sfBlendFactorOne
                    'sfBlendFactorOneMinusSrcAlpha
                    'sfBlendEquationAdd))

(define sfBlendAdd
  (make-sfBlendMode 'sfBlendFactorSrcAlpha
                    'sfBlendFactorOne
                    'sfBlendEquationAdd
                    'sfBlendFactorOne
                    'sfBlendFactorOne
                    'sfBlendEquationAdd))

(define sfBlendMultiply
  (make-sfBlendMode 'sfBlendFactorDstColor
                    'sfBlendFactorZero
                    'sfBlendEquationAdd
                    'sfBlendFactorDstColor
                    'sfBlendFactorZero
                    'sfBlendEquationAdd ))
                    
(define sfBlendNone
  (make-sfBlendMode 'sfBlendFactorOne
                    'sfBlendFactorZero
                    'sfBlendEquationAdd
                    'sfBlendFactorOne
                    'sfBlendFactorZero
                    'sfBlendEquationAdd))

;; ----------------------------------------------------
;; CircleShape.h
;; ----------------------------------------------------

(define-sfml sfCircleShape_destroy
  (_fun _sfCircleShape* -> _void)
  #:wrap (deallocator))

(define-sfml sfCircleShape_create
  (_fun -> _sfCircleShape*)
  #:wrap (allocator sfCircleShape_destroy))

(define-sfml sfCircleShape_setPosition
  (_fun _sfCircleShape* _sfVector2f -> _void))

(define-sfml sfCircleShape_setRotation
  (_fun _sfCircleShape* _float -> _void))

(define-sfml sfCircleShape_setScale
  (_fun _sfCircleShape* _sfVector2f -> _void))

(define-sfml sfCircleShape_setOrigin
  (_fun _sfCircleShape* _sfVector2f -> _void))

(define-sfml sfCircleShape_getPosition
  (_fun _sfCircleShape* -> _sfVector2f))

(define-sfml sfCircleShape_getRotation
  (_fun _sfCircleShape* -> _float))

(define-sfml sfCircleShape_getScale
  (_fun _sfCircleShape* -> _sfVector2f))

(define-sfml sfCircleShape_getOrigin
  (_fun _sfCircleShape* -> _sfVector2f))

(define-sfml sfCircleShape_move
  (_fun _sfCircleShape* _sfVector2f -> _void))

(define-sfml sfCircleShape_rotate
  (_fun _sfCircleShape* _float -> _void))

(define-sfml sfCircleShape_scale
  (_fun _sfCircleShape* _sfVector2f -> _void))

(define-sfml sfCircleShape_getTransform
  (_fun _sfCircleShape* -> _sfTransform))

(define-sfml sfCircleShape_getInverseTransform
  (_fun _sfCircleShape* -> _sfTransform))

(define-sfml sfCircleShape_setTexture
  (_fun _sfCircleShape* _sfTexture* _bool -> _void))

(define-sfml sfCircleShape_setTextureRect
  (_fun _sfCircleShape* _sfIntRect -> _void))

(define-sfml sfCircleShape_setFillColor
  (_fun _sfCircleShape* _sfColor -> _void))

(define-sfml sfCircleShape_setOutlineColor
  (_fun _sfCircleShape* _sfColor -> _void))

(define-sfml sfCircleShape_setOutlineThickness
  (_fun _sfCircleShape* _float -> _void))

(define-sfml sfCircleShape_getTexture
  (_fun _sfCircleShape* -> _sfTexture*))

(define-sfml sfCircleShape_getTextureRect
  (_fun _sfCircleShape* -> _sfIntRect))

(define-sfml sfCircleShape_getFillColor
  (_fun _sfCircleShape* -> _sfColor))

(define-sfml sfCircleShape_getOutlineColor
  (_fun _sfCircleShape* -> _sfColor))

(define-sfml sfCircleShape_getOutlineThickness
  (_fun _sfCircleShape* -> _float))

(define-sfml sfCircleShape_getPointCount
  (_fun _sfCircleShape* -> _uint))

(define-sfml sfCircleShape_getPoint
  (_fun _sfCircleShape* _uint -> _sfVector2f))

(define-sfml sfCircleShape_setRadius
  (_fun _sfCircleShape* _float -> _void))

(define-sfml sfCircleShape_getRadius
  (_fun _sfCircleShape* -> _float))

(define-sfml sfCircleShape_setPointCount
  (_fun _sfCircleShape* _uint -> _void))

(define-sfml sfCircleShape_getLocalBounds
  (_fun _sfCircleShape* -> _sfFloatRect))

(define-sfml sfCircleShape_getGlobalBounds
  (_fun _sfCircleShape* -> _sfFloatRect))

;; ----------------------------------------------------
;; Color.h
;; ----------------------------------------------------

(define-sfml sfColor_fromRGB
  (_fun _byte _byte _byte -> _sfColor))

(define-sfml sfColor_fromRGBA
  (_fun _byte _byte _byte _byte -> _sfColor))

(define-sfml sfColor_fromInteger
  (_fun _uint32 -> _sfColor))

(define-sfml sfColor_toInteger
  (_fun _sfColor -> _uint32))

(define-sfml sfColor_add
  (_fun _sfColor _sfColor -> _sfColor))

(define-sfml sfColor_subtract
  (_fun _sfColor _sfColor -> _sfColor))

(define-sfml sfColor_modulate
  (_fun _sfColor _sfColor -> _sfColor))

;; ----------------------------------------------------

(define sfBlack (sfColor_fromRGB 0 0 0))
(define sfWhite (sfColor_fromRGB #xff #xff #xff))
(define sfRed (sfColor_fromRGB #xff 0 0))
(define sfGreen (sfColor_fromRGB 0 #xff 0))
(define sfBlue (sfColor_fromRGB 0 0 #xff))
(define sfYellow (sfColor_fromRGB #xff #xff 0))
(define sfMagenta (sfColor_fromRGB #xff 0 #xff))
(define sfCyan (sfColor_fromRGB 0 #xff #xff))
(define sfTransparent (sfColor_fromRGBA #xff #xff #xff 0))

;; ----------------------------------------------------
;; ConvexShape.h
;; ----------------------------------------------------

(define-sfml sfConvexShape_destroy
  (_fun _sfConvexShape* -> _void)
  #:wrap (deallocator))

(define-sfml sfConvexShape_create
  (_fun -> _sfConvexShape*)
  #:wrap (allocator sfConvexShape_destroy))

(define-sfml sfConvexShape_copy
  (_fun _sfConvexShape* -> _sfConvexShape*))

(define-sfml sfConvexShape_setPosition
  (_fun _sfConvexShape* _sfVector2f -> _void))

(define-sfml sfConvexShape_setRotation
  (_fun _sfConvexShape* _float -> _void))

(define-sfml sfConvexShape_setScale
  (_fun _sfConvexShape* _sfVector2f -> _void))

(define-sfml sfConvexShape_setOrigin
  (_fun _sfConvexShape* _sfVector2f -> _void))

(define-sfml sfConvexShape_getPosition
  (_fun _sfConvexShape* -> _sfVector2f))

(define-sfml sfConvexShape_getRotation
  (_fun _sfConvexShape* -> _float))

(define-sfml sfConvexShape_getScale
  (_fun _sfConvexShape* -> _sfVector2f))

(define-sfml sfConvexShape_getOrigin
  (_fun _sfConvexShape* -> _sfVector2f))

(define-sfml sfConvexShape_move
  (_fun _sfConvexShape* _sfVector2f -> _void))

(define-sfml sfConvexShape_rotate
  (_fun _sfConvexShape* _float -> _void))

(define-sfml sfConvexShape_scale
  (_fun _sfConvexShape* _sfVector2f -> _void))

(define-sfml sfConvexShape_getTransform
  (_fun _sfConvexShape* -> _sfTransform))

(define-sfml sfConvexShape_getInverseTransform
  (_fun _sfConvexShape* -> _sfTransform))

(define-sfml sfConvexShape_setTexture
  (_fun _sfConvexShape* _sfTexture* _bool -> _void))

(define-sfml sfConvexShape_setTextureRect
  (_fun _sfConvexShape* _sfIntRect -> _void))

(define-sfml sfConvexShape_setFillColor
  (_fun _sfConvexShape* _sfColor -> _void))

(define-sfml sfConvexShape_setOutlineColor
  (_fun _sfConvexShape* _sfColor -> _void))

(define-sfml sfConvexShape_setOutlineThickness
  (_fun _sfConvexShape* _float -> _void))

(define-sfml sfConvexShape_getTexture
  (_fun _sfConvexShape* -> _sfTexture*))

(define-sfml sfConvexShape_getTextureRect
  (_fun _sfConvexShape* -> _sfIntRect))

(define-sfml sfConvexShape_getFillColor
  (_fun _sfConvexShape* -> _sfColor))

(define-sfml sfConvexShape_getOutlineColor
  (_fun _sfConvexShape* -> _sfColor))

(define-sfml sfConvexShape_getOutlineThickness
  (_fun _sfConvexShape* -> _float))

(define-sfml sfConvexShape_getPointCount
  (_fun _sfConvexShape* -> _uint))

(define-sfml sfConvexShape_getPoint
  (_fun _sfConvexShape* _uint -> _sfVector2f))

(define-sfml sfConvexShape_setPointCount
  (_fun _sfConvexShape* _uint -> _void))

(define-sfml sfConvexShape_setPoint
  (_fun _sfConvexShape* _uint _sfVector2f -> _void))

(define-sfml sfConvexShape_getLocalBounds
  (_fun _sfConvexShape* -> _sfFloatRect))

(define-sfml sfConvexShape_getGlobalBounds
  (_fun _sfConvexShape* -> _sfFloatRect))

;; ----------------------------------------------------
;; Font.h
;; ----------------------------------------------------

(define-sfml sfFont_destroy
  (_fun _sfFont* -> _void)
  #:wrap (deallocator))

(define-sfml sfFont_createFromFile
  (_fun _string -> _sfFont*)
  #:wrap (allocator sfFont_destroy))

(define-sfml sfFont_createFromMemory
  (_fun _pointer _uint -> _sfFont*)
  #:wrap (allocator sfFont_destroy))

(define-sfml sfFont_createFromStream
  (_fun _sfInputStream* -> _sfFont*)
  #:wrap (allocator sfFont_destroy))

(define-sfml sfFont_copy
  (_fun _sfFont* -> _sfFont*))

(define-sfml sfFont_getGlyph
  (_fun _sfFont* _uint32 _uint _bool _float -> _sfGlyph))

(define-sfml sfFont_getKerning
  (_fun _sfFont* _uint32 _uint32 _uint -> _float))

(define-sfml sfFont_getLineSpacing
  (_fun _sfFont* _uint -> _float))

(define-sfml sfFont_getUnderlinePosition
  (_fun _sfFont* _uint -> _float))

(define-sfml sfFont_getUnderlineThickness
  (_fun _sfFont* _uint -> _float))

(define-sfml sfFont_getTexture
  (_fun _sfFont* _uint -> _sfTexture*))

(define-sfml sfFont_getInfo
  (_fun _sfFont* -> _sfFontInfo))

;; ----------------------------------------------------
;; Image.h
;; ----------------------------------------------------

(define-sfml sfImage_destroy
  (_fun _sfImage* -> _sfImage*)
  #:wrap (deallocator))

(define-sfml sfImage_create
  (_fun _uint _uint -> _sfImage*)
  #:wrap (allocator sfImage_destroy))

(define-sfml sfImage_createFromColor
  (_fun _uint _uint _sfColor -> _sfImage*)
  #:wrap (allocator sfImage_destroy))

(define-sfml sfImage_createFromPixels
  (_fun _uint _uint (_ptr i _byte) -> _sfImage*)
  #:wrap (allocator sfImage_destroy))

(define-sfml sfImage_createFromFile
  (_fun _string -> _sfImage*)
  #:wrap (allocator sfImage_destroy))

(define-sfml sfImage_createFromMemory
  (_fun _pointer _uint -> _sfImage*)
  #:wrap (allocator sfImage_destroy))

(define-sfml sfImage_createFromStream
  (_fun _sfInputStream* -> _sfImage*)
  #:wrap (allocator sfImage_destroy))

(define-sfml sfImage_copy
  (_fun _sfImage* -> _sfImage*)
  #:wrap (allocator sfImage_destroy))

(define-sfml sfImage_saveToFile
  (_fun _sfImage* _string -> _bool))

(define-sfml sfImage_getSize
  (_fun _sfImage* -> _sfVector2u))

(define-sfml sfImage_createMaskFromColor
  (_fun _sfImage* _sfColor _byte -> _void))

(define-sfml sfImage_copyImage
  (_fun _sfImage* _sfImage* _uint _uint _sfIntRect _bool -> _void))

(define-sfml sfImage_setPixel
  (_fun _sfImage* _uint _uint _sfColor -> _void))

(define-sfml sfImage_getPixel
  (_fun _sfImage* _uint _uint -> _sfColor))

(define-sfml sfImage_getPixelsPtr
  (_fun _sfImage* -> _pointer))

(define-sfml sfImage_flipHorizontally
  (_fun _sfImage* -> _void))

(define-sfml sfImage_flipVertically
  (_fun _sfImage* -> _void))

;; ----------------------------------------------------
;; Rect.h
;; ----------------------------------------------------

(define-sfml sfFloatRect_contains
  (_fun _sfFloatRect-pointer _float _float -> _bool))

(define-sfml sfIntRect_contains
  (_fun _sfIntRect-pointer _int _int -> _bool))

(define-sfml sfFloatRect_intersects
  (_fun _sfFloatRect-pointer _sfFloatRect-pointer (i : (_ptr o _sfFloatRect)) -> (p : _bool) -> (values p i)))

(define-sfml sfIntRect_intersects
  (_fun _sfIntRect-pointer _sfIntRect-pointer (i : (_ptr o _sfIntRect)) -> (p : _bool) -> (values p i)))

;; ----------------------------------------------------
;; RectangleShape.h
;; ----------------------------------------------------

(define-sfml sfRectangleShape_destroy
  (_fun _sfRectangleShape* -> _void)
  #:wrap (deallocator))

(define-sfml sfRectangleShape_create
  (_fun -> _sfRectangleShape*)
  #:wrap (allocator sfRectangleShape_destroy))

(define-sfml sfRectangleShape_copy
  (_fun _sfRectangleShape* -> _sfRectangleShape*)
  #:wrap (allocator sfRectangleShape_destroy))

(define-sfml sfRectangleShape_setPosition
  (_fun _sfRectangleShape* _sfVector2f -> _void))

(define-sfml sfRectangleShape_setRotation
  (_fun _sfRectangleShape* _float -> _void))

(define-sfml sfRectangleShape_setScale
  (_fun _sfRectangleShape* _sfVector2f -> _void))

(define-sfml sfRectangleShape_setOrigin
  (_fun _sfRectangleShape* _sfVector2f -> _void))

(define-sfml sfRectangleShape_getPosition
  (_fun _sfRectangleShape* -> _sfVector2f))

(define-sfml sfRectangleShape_getRotation
  (_fun _sfRectangleShape* -> _float))

(define-sfml sfRectangleShape_getScale
  (_fun _sfRectangleShape* -> _sfVector2f))

(define-sfml sfRectangleShape_getOrigin
  (_fun _sfRectangleShape* -> _sfVector2f))

(define-sfml sfRectangleShape_move
  (_fun _sfRectangleShape* _sfVector2f -> _void))

(define-sfml sfRectangleShape_rotate
  (_fun _sfRectangleShape* _float -> _void))

(define-sfml sfRectangleShape_scale
  (_fun _sfRectangleShape* _sfVector2f -> _void))

(define-sfml sfRectangleShape_getTransform
  (_fun _sfRectangleShape* -> _sfTransform))

(define-sfml sfRectangleShape_getInverseTransform
  (_fun _sfRectangleShape* -> _sfTransform))

(define-sfml sfRectangleShape_setTexture
  (_fun _sfRectangleShape* _sfTexture* _bool -> _void))

(define-sfml sfRectangleShape_setTextureRect
  (_fun _sfRectangleShape* _sfIntRect -> _void))

(define-sfml sfRectangleShape_setFillColor
  (_fun _sfRectangleShape* _sfColor -> _void))

(define-sfml sfRectangleShape_setOutlineColor
  (_fun _sfRectangleShape* _sfColor -> _void))

(define-sfml sfRectangleShape_setOutlineThickness
  (_fun _sfRectangleShape* _float -> _void))

(define-sfml sfRectangleShape_getTexture
  (_fun _sfRectangleShape* -> _sfTexture*))

(define-sfml sfRectangleShape_getTextureRect
  (_fun _sfRectangleShape* -> _sfIntRect))

(define-sfml sfRectangleShape_getFillColor
  (_fun _sfRectangleShape* -> _sfColor))

(define-sfml sfRectangleShape_getOutlineColor
  (_fun _sfRectangleShape* -> _sfColor))

(define-sfml sfRectangleShape_getOutlineThickness
  (_fun _sfRectangleShape* -> _float))

(define-sfml sfRectangleShape_getPointCount
  (_fun _sfRectangleShape* -> _uint))

(define-sfml sfRectangleShape_getPoint
  (_fun _sfRectangleShape* _uint -> _sfVector2f))

(define-sfml sfRectangleShape_setSize
  (_fun _sfRectangleShape* _sfVector2f -> _void))

(define-sfml sfRectangleShape_getSize
  (_fun _sfRectangleShape* -> _sfVector2f))

(define-sfml sfRectangleShape_getLocalBounds
  (_fun _sfRectangleShape* -> _sfFloatRect))

(define-sfml sfRectangleShape_getGlobalBounds
  (_fun _sfRectangleShape* -> _sfFloatRect))

;; ----------------------------------------------------
;; RenderTexture.h
;; ----------------------------------------------------

(define-sfml sfRenderTexture_destroy
  (_fun _sfRenderTexture* -> _void)
  #:wrap (deallocator))

(define-sfml sfRenderTexture_create
  (_fun _uint _uint _bool -> _sfRenderTexture*)
  #:wrap (allocator sfRenderTexture_destroy))

(define-sfml sfRenderTexture_getSize
  (_fun _sfRenderTexture* -> _sfVector2u))

(define-sfml sfRenderTexture_setActive
  (_fun _sfRenderTexture* _bool -> _void))

(define-sfml sfRenderTexture_display
  (_fun _sfRenderTexture* -> _void))

(define-sfml sfRenderTexture_clear
  (_fun _sfRenderTexture* _sfColor -> _void))

(define-sfml sfRenderTexture_setView
  (_fun _sfRenderTexture* _sfView* -> _void))

(define-sfml sfRenderTexture_getView
  (_fun _sfRenderTexture* -> _sfView*))

(define-sfml sfRenderTexture_getDefaultView
  (_fun _sfRenderTexture* -> _sfView*))

(define-sfml sfRenderTexture_getViewport
  (_fun _sfRenderTexture* _sfView* -> _sfIntRect))

(define-sfml sfRenderTexture_mapPixelToCoords
  (_fun _sfRenderTexture* _sfVector2i _sfView* -> _sfVector2f))

(define-sfml sfRenderTexture_mapCoordsToPixel
  (_fun _sfRenderTexture* _sfVector2f _sfView* -> _sfVector2i))

(define-sfml sfRenderTexture_drawSprite
  (_fun _sfRenderTexture* _sfSprite* (_or-null _sfRenderStates*) -> _void))

(define-sfml sfRenderTexture_drawText
  (_fun _sfRenderTexture* _sfText* (_or-null _sfRenderStates*) -> _void))

(define-sfml sfRenderTexture_drawShape
  (_fun _sfRenderTexture* _sfShape* (_or-null _sfRenderStates*) -> _void))

(define-sfml sfRenderTexture_drawCircleShape
  (_fun _sfRenderTexture* _sfCircleShape* (_or-null _sfRenderStates*) -> _void))

(define-sfml sfRenderTexture_drawConvexShape
  (_fun _sfRenderTexture* _sfConvexShape* (_or-null _sfRenderStates*) -> _void))

(define-sfml sfRenderTexture_drawRectangleShape
  (_fun _sfRenderTexture* _sfRectangleShape* (_or-null _sfRenderStates*) -> _void))

(define-sfml sfRenderTexture_drawVertexArray
  (_fun _sfRenderTexture* _sfVertexArray* (_or-null _sfRenderStates*) -> _void))

(define-sfml sfRenderTexture_drawVertexBuffer
  (_fun _sfRenderTexture* _sfVertexBuffer* (_or-null _sfRenderStates*) -> _void))

(define-sfml sfRenderTexture_drawPrimitives
  (_fun _sfRenderTexture* _sfVertex-pointer _uint _sfPrimitiveType (_or-null _sfRenderStates*) -> _void))

(define-sfml sfRenderTexture_pushGLStates
  (_fun _sfRenderTexture* -> _void))

(define-sfml sfRenderTexture_popGLStates
  (_fun _sfRenderTexture* -> _void))

(define-sfml sfRenderTexture_resetGLStates
  (_fun _sfRenderTexture* -> _void))

(define-sfml sfRenderTexture_getTexture
  (_fun _sfRenderTexture* -> _sfTexture*))

(define-sfml sfRenderTexture_setSmooth
  (_fun _sfRenderTexture* _bool -> _void))

(define-sfml sfRenderTexture_isSmooth
  (_fun _sfRenderTexture* -> _bool))

(define-sfml sfRenderTexture_setRepeated
  (_fun _sfRenderTexture* _bool -> _void))

(define-sfml sfRenderTexture_isRepeated
  (_fun _sfRenderTexture* -> _bool))

(define-sfml sfRenderTexture_generateMipmap
  (_fun _sfRenderTexture* -> _bool))

;; ----------------------------------------------------
;; RenderWindow.h
;; ----------------------------------------------------

(define-sfml sfRenderWindow_destroy
  (_fun _sfRenderWindow* -> _void)
  #:wrap (deallocator))

(define-sfml sfRenderWindow_create
  (_fun _sfVideoMode _string _sfWindowStyle (_or-null _sfContextSettings*) -> _sfRenderWindow*)
  #:wrap (allocator sfRenderWindow_destroy))

(define-sfml sfRenderWindow_close
  (_fun _sfRenderWindow* -> _void))

(define-sfml sfRenderWindow_isOpen
  (_fun _sfRenderWindow* -> _bool))

(define-sfml sfRenderWindow_getSettings
  (_fun _sfRenderWindow* -> _sfContextSettings))

(define-sfml sfRenderWindow_pollEvent
  (_fun _sfRenderWindow* (e : (_ptr o _sfEvent)) -> (ok : _bool) -> (and ok e)))

(define-sfml sfRenderWindow_waitEvent
  (_fun _sfRenderWindow* (e : (_ptr o _sfEvent)) -> (ok : _bool) -> (and ok e)))

(define-sfml sfRenderWindow_getPosition
  (_fun _sfRenderWindow* -> _sfVector2i))

(define-sfml sfRenderWindow_setPosition
  (_fun _sfRenderWindow* _sfVector2i -> _void))

(define-sfml sfRenderWindow_getSize
  (_fun _sfRenderWindow* -> _sfVector2u))

(define-sfml sfRenderWindow_setSize
  (_fun _sfRenderWindow* _sfVector2u -> _void))

(define-sfml sfRenderWindow_setTitle
  (_fun _sfRenderWindow* _string -> _void))

(define-sfml sfRenderWindow_setIcon
  (_fun _sfRenderWindow* _uint _uint _pointer -> _void))

(define-sfml sfRenderWindow_setVisible
  (_fun _sfRenderWindow* _bool -> _void))

(define-sfml sfRenderWindow_setVerticalSyncEnabled
  (_fun _sfRenderWindow* _bool -> _void))

(define-sfml sfRenderWindow_setMouseCursorVisible
  (_fun _sfRenderWindow* _bool -> _void))

(define-sfml sfRenderWindow_setMouseCursorGrabbed
  (_fun _sfRenderWindow* _bool -> _void))

(define-sfml sfRenderWindow_setMouseCursor
  (_fun _sfRenderWindow* _sfCursor* -> _void))

(define-sfml sfRenderWindow_setKeyRepeatEnabled
  (_fun _sfRenderWindow* _bool -> _void))

(define-sfml sfRenderWindow_setFramerateLimit
  (_fun _sfRenderWindow* _uint -> _void))

(define-sfml sfRenderWindow_setJoystickThreshold
  (_fun _sfRenderWindow* _float -> _void))

(define-sfml sfRenderWindow_setActive
  (_fun _sfRenderWindow* _bool -> _void))

(define-sfml sfRenderWindow_requestFocus
  (_fun _sfRenderWindow* -> _void))

(define-sfml sfRenderWindow_hasFocus
  (_fun _sfRenderWindow* -> _bool))

(define-sfml sfRenderWindow_display
  (_fun _sfRenderWindow* -> _void))

(define-sfml sfRenderWindow_clear
  (_fun _sfRenderWindow* _sfColor -> _void))

(define-sfml sfRenderWindow_setView
  (_fun _sfRenderWindow* _sfView* -> _void))

(define-sfml sfRenderWindow_getView
  (_fun _sfRenderWindow* -> _sfView*))

(define-sfml sfRenderWindow_getDefaultView
  (_fun _sfRenderWindow* -> _sfView*))

(define-sfml sfRenderWindow_getViewport
  (_fun _sfRenderWindow* -> _sfIntRect))

(define-sfml sfRenderWindow_mapPixelToCoords
  (_fun _sfRenderWindow* _sfVector2i (_or-null _sfView*) -> _sfVector2f))

(define-sfml sfRenderWindow_mapCoordsToPixel
  (_fun _sfRenderWindow* _sfVector2f (_or-null _sfView*) -> _sfVector2i))

(define-sfml sfRenderWindow_drawSprite
  (_fun _sfRenderWindow* _sfSprite* (_or-null _sfRenderStates*) -> _void))

(define-sfml sfRenderWindow_drawText
  (_fun _sfRenderWindow* _sfText* (_or-null _sfRenderStates*) -> _void))

(define-sfml sfRenderWindow_drawShape
  (_fun _sfRenderWindow* _sfShape* (_or-null _sfRenderStates*) -> _void))

(define-sfml sfRenderWindow_drawCircleShape
  (_fun _sfRenderWindow* _sfCircleShape* (_or-null _sfRenderStates*) -> _void))

(define-sfml sfRenderWindow_drawConvexShape
  (_fun _sfRenderWindow* _sfConvexShape* (_or-null _sfRenderStates*) -> _void))

(define-sfml sfRenderWindow_drawRectangleShape
  (_fun _sfRenderWindow* _sfRectangleShape* (_or-null _sfRenderStates*) -> _void))

(define-sfml sfRenderWindow_drawVertexArray
  (_fun _sfRenderWindow* _sfVertexArray* (_or-null _sfRenderStates*) -> _void))

(define-sfml sfRenderWindow_drawVertexBuffer
  (_fun _sfRenderWindow* _sfVertexBuffer* (_or-null _sfRenderStates*) -> _void))

(define-sfml sfRenderWindow_drawPrimitives
  (_fun _sfRenderWindow* _sfVertex-pointer _uint _sfPrimitiveType (_or-null _sfRenderStates*) -> _void))

(define-sfml sfRenderWindow_pushGLStates
  (_fun _sfRenderWindow* -> _void))

(define-sfml sfRenderWindow_popGLStates
  (_fun _sfRenderWindow* -> _void))

(define-sfml sfRenderWindow_resetGLStates
  (_fun _sfRenderWindow* -> _void))

(define-sfml sfRenderWindow_capture
  (_fun _sfRenderWindow* -> _sfImage*)
  #:wrap (allocator sfImage_destroy))

(define-sfml sfMouse_getPositionRenderWindow
  (_fun _sfRenderWindow* -> _sfVector2i))

(define-sfml sfMouse_setPositionRenderWindow
  (_fun _sfVector2i _sfRenderWindow* -> _void))

(define-sfml sfTouch_getPositionRenderWindow
  (_fun _uint _sfRenderWindow* -> _sfVector2i))

;; ----------------------------------------------------
;; Shader.h
;; ----------------------------------------------------

(define-sfml sfShader_destroy
  (_fun _sfShader* -> _void)
  #:wrap (deallocator))

(define-sfml sfShader_createFromFile
  (_fun _string _string _string -> (_or-null _sfShader*))
  #:wrap (allocator sfShader_destroy))

(define-sfml sfShader_createFromMemory
  (_fun _string _string _string -> (_or-null _sfShader*))
  #:wrap (allocator sfShader_destroy))

(define-sfml sfShader_createFromStream
  (_fun (_or-null _sfInputStream*) (_or-null _sfInputStream*) (_or-null _sfInputStream*) -> (_or-null _sfShader*))
  #:wrap (allocator sfShader_destroy))

(define-sfml sfShader_setFloatUniform
  (_fun _sfShader* _string _float -> _void))

(define-sfml sfShader_setVec2Uniform
  (_fun _sfShader* _string _sfGlslVec2 -> _void))

(define-sfml sfShader_setVec3Uniform
  (_fun _sfShader* _string _sfGlslVec3 -> _void))

(define-sfml sfShader_setVec4Uniform
  (_fun _sfShader* _string _sfGlslVec4 -> _void))

(define-sfml sfShader_setColorUniform
  (_fun _sfShader* _string _sfColor -> _void))

(define-sfml sfShader_setIntUniform
  (_fun _sfShader* _string _int -> _void))

(define-sfml sfShader_setIvec2Uniform
  (_fun _sfShader* _string _sfGlslIvec2 -> _void))

(define-sfml sfShader_setIvec3Uniform
  (_fun _sfShader* _string _sfGlslIvec3 -> _void))

(define-sfml sfShader_setIvec4Uniform
  (_fun _sfShader* _string _sfGlslIvec4 -> _void))

(define-sfml sfShader_setIntColorUniform
  (_fun _sfShader* _string _sfColor -> _void))

(define-sfml sfShader_setBoolUniform
  (_fun _sfShader* _string _bool -> _void))

(define-sfml sfShader_setBvec2Uniform
  (_fun _sfShader* _string _sfGlslBvec2 -> _void))

(define-sfml sfShader_setBvec3Uniform
  (_fun _sfShader* _string _sfGlslBvec3 -> _void))

(define-sfml sfShader_setBvec4Uniform
  (_fun _sfShader* _string _sfGlslBvec4 -> _void))

(define-sfml sfShader_setMat3Uniform
  (_fun _sfShader* _string _sfGlslMat3-pointer -> _void))

(define-sfml sfShader_setMat4Uniform
  (_fun _sfShader* _string _sfGlslMat4-pointer -> _void))

(define-sfml sfShader_setTextureUniform
  (_fun _sfShader* _string _sfTexture* -> _void))

(define-sfml sfShader_setCurrentTextureUniform
  (_fun _sfShader* _string -> _void))

(define-sfml sfShader_setFloatUniformArray
  (_fun _sfShader* _string _pointer _uint -> _void))

(define-sfml sfShader_setVec2UniformArray
  (_fun _sfShader* _string _sfGlslVec2-pointer _uint -> _void))

(define-sfml sfShader_setVec3UniformArray
  (_fun _sfShader* _string _sfGlslVec3-pointer _uint -> _void))

(define-sfml sfShader_setVec4UniformArray
  (_fun _sfShader* _string _sfGlslVec4-pointer _uint -> _void))

(define-sfml sfShader_setMat3UniformArray
  (_fun _sfShader* _string _sfGlslMat3-pointer _uint -> _void))

(define-sfml sfShader_setMat4UniformArray
  (_fun _sfShader* _string _sfGlslMat4-pointer _uint -> _void))

(define-sfml sfShader_getNativeHandle
  (_fun _sfShader* -> _uint))

(define-sfml sfShader_bind
  (_fun _sfShader* -> _void))

(define-sfml sfShader_isAvailable
  (_fun -> _bool))

(define-sfml sfShader_isGeometryAvailable
  (_fun -> _bool))

;; ----------------------------------------------------
;; Shape.h
;; ----------------------------------------------------

(define-sfml sfShape_destroy
  (_fun _sfShape* -> _void)
  #:wrap (deallocator))

(define-sfml sfShape_create
  (_fun _sfShapeGetPointCountCallback _sfShapeGetPointCallback _pointer -> _sfShape*)
  #:wrap (allocator sfShape_destroy))

(define-sfml sfShape_setPosition
  (_fun _sfShape* _sfVector2f -> _void))

(define-sfml sfShape_setRotation
  (_fun _sfShape* _float -> _void))

(define-sfml sfShape_setScale
  (_fun _sfShape* _sfVector2f -> _void))

(define-sfml sfShape_setOrigin
  (_fun _sfShape* _sfVector2f -> _void))

(define-sfml sfShape_getPosition
  (_fun _sfShape* -> _sfVector2f))

(define-sfml sfShape_getRotation
  (_fun _sfShape* -> _float))

(define-sfml sfShape_getScale
  (_fun _sfShape* -> _sfVector2f))

(define-sfml sfShape_getOrigin
  (_fun _sfShape* -> _sfVector2f))

(define-sfml sfShape_move
  (_fun _sfShape* _sfVector2f -> _void))

(define-sfml sfShape_rotate
  (_fun _sfShape* _float -> _void))

(define-sfml sfShape_scale
  (_fun _sfShape* _sfVector2f -> _void))

(define-sfml sfShape_getTransform
  (_fun _sfShape* -> _sfTransform))

(define-sfml sfShape_getInverseTransform
  (_fun _sfShape* -> _sfTransform))

(define-sfml sfShape_setTexture
  (_fun _sfShape* _sfTexture* _bool -> _void))

(define-sfml sfShape_setTextureRect
  (_fun _sfShape* _sfIntRect -> _void))

(define-sfml sfShape_setFillColor
  (_fun _sfShape* _sfColor -> _void))

(define-sfml sfShape_setOutlineColor
  (_fun _sfShape* _sfColor -> _void))

(define-sfml sfShape_setOutlineThickness
  (_fun _sfShape* _float -> _void))

(define-sfml sfShape_getTexture
  (_fun _sfShape* -> _sfTexture*))

(define-sfml sfShape_getTextureRect
  (_fun _sfShape* -> _sfIntRect))

(define-sfml sfShape_getFillColor
  (_fun _sfShape* -> _sfColor))

(define-sfml sfShape_getOutlineColor
  (_fun _sfShape* -> _sfColor))

(define-sfml sfShape_getOutlineThickness
  (_fun _sfShape* -> _float))

(define-sfml sfShape_getPointCount
  (_fun _sfShape* -> _uint))

(define-sfml sfShape_getPoint
  (_fun _sfShape* _uint -> _sfVector2f))

(define-sfml sfShape_getLocalBounds
  (_fun _sfShape* -> _sfFloatRect))

(define-sfml sfShape_getGlobalBounds
  (_fun _sfShape* -> _sfFloatRect))

(define-sfml sfShape_update
  (_fun _sfShape* -> _void))
  
;; ----------------------------------------------------
;; Sprite.h
;; ----------------------------------------------------

(define-sfml sfSprite_destroy
  (_fun _sfSprite* -> _void)
  #:wrap (deallocator))

(define-sfml sfSprite_create
  (_fun -> _sfSprite*)
  #:wrap (allocator sfSprite_destroy))

(define-sfml sfSprite_copy
  (_fun _sfSprite* -> _sfSprite*)
  #:wrap (allocator sfSprite_destroy))

(define-sfml sfSprite_setPosition
  (_fun _sfSprite* _sfVector2f -> _void))

(define-sfml sfSprite_setRotation
  (_fun _sfSprite* _float -> _void))

(define-sfml sfSprite_setScale
  (_fun _sfSprite* _sfVector2f -> _void))

(define-sfml sfSprite_setOrigin
  (_fun _sfSprite* _sfVector2f -> _void))

(define-sfml sfSprite_getPosition
  (_fun _sfSprite* -> _sfVector2f))

(define-sfml sfSprite_getRotation
  (_fun _sfSprite* -> _float))

(define-sfml sfSprite_getScale
  (_fun _sfSprite* -> _sfVector2f))

(define-sfml sfSprite_getOrigin
  (_fun _sfSprite* -> _sfVector2f))

(define-sfml sfSprite_move
  (_fun _sfSprite* _sfVector2f -> _void))

(define-sfml sfSprite_rotate
  (_fun _sfSprite* _float -> _void))

(define-sfml sfSprite_scale
  (_fun _sfSprite* _sfVector2f -> _void))

(define-sfml sfSprite_getTransform
  (_fun _sfSprite* -> _sfTransform))

(define-sfml sfSprite_getInverseTransform
  (_fun _sfSprite* -> _sfTransform))

(define-sfml sfSprite_setTexture
  (_fun _sfSprite* _sfTexture* _bool -> _void))

(define-sfml sfSprite_setTextureRect
  (_fun _sfSprite* _sfIntRect -> _void))

(define-sfml sfSprite_setColor
  (_fun _sfSprite* _sfColor -> _void))

(define-sfml sfSprite_getTexture
  (_fun _sfSprite* -> _sfTexture*))

(define-sfml sfSprite_getTextureRect
  (_fun _sfSprite* -> _sfIntRect))

(define-sfml sfSprite_getColor
  (_fun _sfSprite* -> _sfColor))

(define-sfml sfSprite_getLocalBounds
  (_fun _sfSprite* -> _sfFloatRect))

(define-sfml sfSprite_getGlobalBounds
  (_fun _sfSprite* -> _sfFloatRect))

;; ----------------------------------------------------
;; Text.h
;; ----------------------------------------------------

(define-sfml sfText_destroy
  (_fun _sfText* -> _void)
  #:wrap (deallocator))

(define-sfml sfText_create
  (_fun -> _sfText*)
  #:wrap (allocator sfText_destroy))

(define-sfml sfText_copy
  (_fun _sfText* -> _sfText*)
  #:wrap (allocator sfText_destroy))

(define-sfml sfText_setPosition
  (_fun _sfText* _sfVector2f -> _void))

(define-sfml sfText_setRotation
  (_fun _sfText* _float -> _void))

(define-sfml sfText_setScale
  (_fun _sfText* _sfVector2f -> _void))

(define-sfml sfText_getPosition
  (_fun _sfText* -> _sfVector2f))

(define-sfml sfText_getRotation
  (_fun _sfText* -> _float))

(define-sfml sfText_getScale
  (_fun _sfText* -> _sfVector2f))

(define-sfml sfText_getOrigin
  (_fun _sfText* -> _sfVector2f))

(define-sfml sfText_move
  (_fun _sfText* _sfVector2f -> _void))

(define-sfml sfText_rotate
  (_fun _sfText* _float -> _void))

(define-sfml sfText_scale
  (_fun _sfText* _float -> _void))

(define-sfml sfText_getTransform
  (_fun _sfText* -> _sfTransform))

(define-sfml sfText_getInverseTransform
  (_fun _sfText* -> _sfTransform))

(define-sfml sfText_setString
  (_fun _sfText* _string -> _void))

(define-sfml sfText_setFont
  (_fun _sfText* _sfFont* -> _void))

(define-sfml sfText_setCharacterSize
  (_fun _sfText* _uint -> _void))

(define-sfml sfText_setLineSpacing
  (_fun _sfText* _float -> _void))

(define-sfml sfText_setLetterSpacing
  (_fun _sfText* _float -> _void))

(define-sfml sfText_setStyle
  (_fun _sfText* _uint32 -> _void))

(define-sfml sfText_setColor
  (_fun _sfText* _sfColor -> _void))

(define-sfml sfText_setFillColor
  (_fun _sfText* _sfColor -> _void))

(define-sfml sfText_setOutlineColor
  (_fun _sfText* _sfColor -> _void))

(define-sfml sfText_setOutlineThickness
  (_fun _sfText* _float -> _void))

(define-sfml sfText_getString
  (_fun _sfText* -> _string))

(define-sfml sfText_getFont
  (_fun _sfText* -> _sfFont*))

(define-sfml sfText_getCharacterSize
  (_fun _sfText* -> _uint))

(define-sfml sfText_getLetterSpacing
  (_fun _sfText* -> _float))

(define-sfml sfText_getLineSpacing
  (_fun _sfText* -> _float))

(define-sfml sfText_getStyle
  (_fun _sfText* -> _uint32))

(define-sfml sfText_getColor
  (_fun _sfText* -> _sfColor))

(define-sfml sfText_getFillColor
  (_fun _sfText* -> _sfColor))

(define-sfml sfText_getOutlineColor
  (_fun _sfText* -> _sfColor))

(define-sfml sfText_getOutlineThickness
  (_fun _sfText* -> _sfColor))

(define-sfml sfText_findCharacterPos
  (_fun _sfText* _uint -> _sfVector2f))

(define-sfml sfText_getLocalBounds
  (_fun _sfText* -> _sfFloatRect))

(define-sfml sfText_getGlobalBounds
  (_fun _sfText* -> _sfFloatRect))

;; ----------------------------------------------------
;; Texture.h
;; ----------------------------------------------------

(define-sfml sfTexture_destroy
  (_fun _sfTexture* -> _void)
  #:wrap (deallocator))

(define-sfml sfTexture_create
  (_fun _uint _uint -> _sfTexture*)
  #:wrap (allocator sfTexture_destroy))

(define-sfml sfTexture_createFromFile
  (_fun _string (_or-null _sfIntRect-pointer)  -> _sfTexture*)
  #:wrap (allocator sfTexture_destroy))

(define-sfml sfTexture_createFromMemory
  (_fun _pointer _uint (_or-null _sfIntRect-pointer) -> _sfTexture*)
  #:wrap (allocator sfTexture_destroy))

(define-sfml sfTexture_createFromStream
  (_fun _sfInputStream* (_or-null _sfIntRect-pointer) -> _sfTexture*)
  #:wrap (allocator sfTexture_destroy))

(define-sfml sfTexture_createFromImage
  (_fun _sfImage* (_or-null _sfIntRect-pointer) -> _sfTexture*)
  #:wrap (allocator sfTexture_destroy))

(define-sfml sfTexture_copy
  (_fun _sfTexture* -> _sfTexture*)
  #:wrap (allocator sfTexture_destroy))

(define-sfml sfTexture_getSize
  (_fun _sfTexture* -> _sfVector2u))

(define-sfml sfTexture_copyToImage
  (_fun _sfTexture* -> _sfImage*))

(define-sfml sfTexture_updateFromPixels
  (_fun _sfTexture* _pointer _uint _uint _uint _uint -> _void))

(define-sfml sfTexture_updateFromImage
  (_fun _sfTexture* _sfImage* _uint _uint -> _void))

(define-sfml sfTexture_updateFromWindow
  (_fun _sfTexture* _sfWindow* _uint _uint -> _void))

(define-sfml sfTexture_updateFromRenderWindow
  (_fun _sfTexture* _sfRenderWindow* _uint _uint -> _void))

(define-sfml sfTexture_setSmooth
  (_fun _sfTexture* _bool -> _void))

(define-sfml sfTexture_isSmooth
  (_fun _sfTexture* -> _bool))

(define-sfml sfTexture_setSrgb
  (_fun _sfTexture* _bool -> _void))

(define-sfml sfTexture_isSrgb
  (_fun _sfTexture* -> _bool))

(define-sfml sfTexture_setRepeated
  (_fun _sfTexture* _bool -> _void))

(define-sfml sfTexture_isRepeated
  (_fun _sfTexture* -> _bool))

(define-sfml sfTexture_generateMipmap
  (_fun _sfTexture* -> _bool))

(define-sfml sfTexture_swap
  (_fun _sfTexture* _sfTexture* -> _void))

(define-sfml sfTexture_getNativeHandle
  (_fun _sfTexture* -> _uint))

(define-sfml sfTexture_bind
  (_fun _sfTexture* -> _void))

(define-sfml sfTexture_getMaximumSize
  (_fun _sfTexture* -> _uint))

;; ----------------------------------------------------
;; Transform.h
;; ----------------------------------------------------

(define-sfml sfTransform_fromMatrix
  (_fun _float _float _float _float _float _float _float _float _float -> _sfTransform))

(define-sfml sfTransform_getMatrix
  (_fun _sfTransform-pointer (m : (_ptr o _float)) -> _void -> m))

(define-sfml sfTransform_getInverse
  (_fun _sfTransform-pointer -> _sfTransform))

(define-sfml sfTransform_transformPoint
  (_fun _sfTransform-pointer _sfVector2f -> _sfVector2f))

(define-sfml sfTransform_transformRect
  (_fun _sfTransform-pointer _sfFloatRect -> _sfFloatRect))

(define-sfml sfTransform_combine
  (_fun _sfTransform-pointer _sfTransform-pointer -> _void))

(define-sfml sfTransform_translate
  (_fun _sfTransform-pointer _float _float -> _void))

(define-sfml sfTransform_rotate
  (_fun _sfTransform-pointer _float -> _void))

(define-sfml sfTransform_rotateWithCenter
  (_fun _sfTransform-pointer _float _float _float -> _void))

(define-sfml sfTransform_scale
  (_fun _sfTransform-pointer _float _float -> _void))

(define-sfml sfTransform_scaleWithCenter
  (_fun _sfTransform-pointer _float _float _float _float -> _void))

(define-sfml sfTransform_equal
  (_fun _sfTransform-pointer _sfTransform-pointer -> _bool))

(define sfTransform_Identity
  (sfTransform_fromMatrix 1.0 0.0 0.0 0.0 1.0 0.0 0.0 0.0 1.0))

;; ----------------------------------------------------
;; Transformable.h
;; ----------------------------------------------------

(define-sfml sfTransformable_destroy
  (_fun _sfTransformable* -> _void)
  #:wrap (deallocator))

(define-sfml sfTransformable_create
  (_fun -> _sfTransformable*)
  #:wrap (allocator sfTransformable_destroy))

(define-sfml sfTransformable_copy
  (_fun _sfTransformable* -> _sfTransformable*)
  #:wrap (allocator sfTransformable_destroy))

(define-sfml sfTransformable_setPosition
  (_fun _sfTransformable* _sfVector2f -> _void))

(define-sfml sfTransformable_setRotation
  (_fun _sfTransformable* _float -> _void))

(define-sfml sfTransformable_setScale
  (_fun _sfTransformable* _sfVector2f -> _void))

(define-sfml sfTransformable_setOrigin
  (_fun _sfTransformable* _sfVector2f -> _void))

(define-sfml sfTransformable_getPosition
  (_fun _sfTransformable* -> _sfVector2f))

(define-sfml sfTransformable_getRotation
  (_fun _sfTransformable* -> _float))

(define-sfml sfTransformable_getScale
  (_fun _sfTransformable* -> _sfVector2f))

(define-sfml sfTransformable_getOrigin
  (_fun _sfTransformable* -> _sfVector2f))

(define-sfml sfTransformable_move
  (_fun _sfTransformable* _sfVector2f -> _void))

(define-sfml sfTransformable_rotate
  (_fun _sfTransformable* _float -> _void))

(define-sfml sfTransformable_scale
  (_fun _sfTransformable* _sfVector2f -> _void))

(define-sfml sfTransformable_getTransform
  (_fun _sfTransformable* -> _sfTransform))

(define-sfml sfTransformable_getInverseTransform
  (_fun _sfTransformable* -> _sfTransform))

;; ----------------------------------------------------
;; VertexArray.h
;; ----------------------------------------------------

(define-sfml sfVertexArray_destroy
  (_fun _sfVertexArray* -> _void)
  #:wrap (deallocator))

(define-sfml sfVertexArray_create
  (_fun -> _sfVertexArray*)
  #:wrap (allocator sfVertexArray_destroy))

(define-sfml sfVertexArray_copy
  (_fun _sfVertexArray* -> _sfVertexArray*)
  #:wrap (allocator sfVertexArray_destroy))

(define-sfml sfVertexArray_getVertexCount
  (_fun _sfVertexArray* -> _uint))

(define-sfml sfVertexArray_getVertex
  (_fun _sfVertexArray* _uint -> _sfVertex-pointer))

(define-sfml sfVertexArray_clear
  (_fun _sfVertexArray* -> _void))

(define-sfml sfVertexArray_resize
  (_fun _sfVertexArray* _uint -> _void))

(define-sfml sfVertexArray_append
  (_fun _sfVertexArray* _sfVertex -> _void))

(define-sfml sfVertexArray_setPrimitiveType
  (_fun _sfVertexArray* _sfPrimitiveType -> _void))

(define-sfml sfVertexArray_getBounds
  (_fun _sfVertexArray* -> _sfFloatRect))

;; ----------------------------------------------------
;; VertexBuffer.h
;; ----------------------------------------------------

(define-sfml sfVertexBuffer_destroy
  (_fun _sfVertexBuffer* -> _void)
  #:wrap (deallocator))

(define-sfml sfVertexBuffer_create
  (_fun _uint _sfPrimitiveType _sfVertexBufferUsage -> _sfVertexBuffer*)
  #:wrap (allocator sfVertexBuffer_destroy))

(define-sfml sfVertexBuffer_copy
  (_fun _sfVertexBuffer* -> _sfVertexBuffer*)
  #:wrap (allocator sfVertexBuffer_destroy))

(define-sfml sfVertexBuffer_getVertexCount
  (_fun _sfVertexBuffer* -> _uint))

(define-sfml sfVertexBuffer_update
  (_fun _sfVertexBuffer* _sfVertex-pointer _uint _uint -> _bool))

(define-sfml sfVertexBuffer_updateFromVertexBuffer
  (_fun _sfVertexBuffer* _sfVertexBuffer* -> _bool))

(define-sfml sfVertexBuffer_swap
  (_fun _sfVertexBuffer* _sfVertexBuffer* -> _bool))

(define-sfml sfVertexBuffer_getNativeHandle
  (_fun _sfVertexBuffer* -> _uint))

(define-sfml sfVertexBuffer_setPrimitiveType
  (_fun _sfVertexBuffer* _sfPrimitiveType -> _void))

(define-sfml sfVertexBuffer_getPrimitiveType
  (_fun _sfVertexBuffer* -> _sfPrimitiveType))

(define-sfml sfVertexBuffer_setUsage
  (_fun _sfVertexBuffer* _sfVertexBufferUsage -> _void))

(define-sfml sfVertexBuffer_getUsage
  (_fun _sfVertexBuffer* -> _sfVertexBufferUsage))

(define-sfml sfVertexBuffer_bind
  (_fun _sfVertexBuffer* -> _void))

(define-sfml sfVertexBuffer_isAvailable
  (_fun _sfVertexBuffer* -> _bool))

;; ----------------------------------------------------
;; View.h
;; ----------------------------------------------------

(define-sfml sfView_destroy
  (_fun _sfView* -> _void)
  #:wrap (deallocator))

(define-sfml sfView_create
  (_fun -> _sfView*)
  #:wrap (allocator sfView_destroy))

(define-sfml sfView_createFromRect
  (_fun _sfFloatRect -> _sfView*)
  #:wrap (allocator sfView_destroy))

(define-sfml sfView_copy
  (_fun _sfView* -> _sfView*)
  #:wrap (allocator sfView_destroy))

(define-sfml sfView_setCenter
  (_fun _sfView* _sfVector2f -> _void))

(define-sfml sfView_setSize
  (_fun _sfView* _sfVector2f -> _void))

(define-sfml sfView_setRotation
  (_fun _sfView* _float -> _void))

(define-sfml sfView_setViewport
  (_fun _sfView* _sfFloatRect -> _void))

(define-sfml sfView_reset
  (_fun _sfView* _sfFloatRect -> _void))

(define-sfml sfView_getCenter
  (_fun _sfView* -> _sfVector2f))

(define-sfml sfView_getRotation
  (_fun _sfView* -> _float))

(define-sfml sfView_getViewport
  (_fun _sfView* -> _sfFloatRect))

(define-sfml sfView_move
  (_fun _sfView* _sfVector2f -> _void))

(define-sfml sfView_rotate
  (_fun _sfView* _float -> _void))

(define-sfml sfView_zoom
  (_fun _sfView* _float -> _void))

