#lang racket

#|

CSFML Wrapper for Racket

Copyright (c) 2025 by Jeffrey Massung
All rights reserved.

|#

(require ffi/unsafe)

;; ----------------------------------------------------

(provide (all-defined-out))

;; ----------------------------------------------------
;; Audio/SoundStatus.h
;; ----------------------------------------------------

(define _sfSoundStatus
  (_enum '(sfStopped
           sfPaused
           sfPlaying)))

;; ----------------------------------------------------
;; Graphics/BlendMode.h
;; ----------------------------------------------------

(define _sfBlendFactor
  (_enum '(sfBlendFactorZero
           sfBlendFactorOne
           sfBlendFactorSrcColor
           sfBlendFactorOneMinusSrcColor
           sfBlendFactorDstColor
           sfBlendFactorOneMinusDstColor
           sfBlendFactorSrcAlpha
           sfBlendFactorOneMinusSrcAlpha
           sfBlendFactorDstAlpha
           sfBlendFactorOneMinusDstAlpha)))

(define _sfBlendEquation
  (_enum '(sfBlendEquationAdd
           sfBlendEquationSubtract
           sfBlendEquationReverseSubtract)))

;; ----------------------------------------------------
;; Graphics/CoordinateType.h
;; ----------------------------------------------------

(define _sfCoordinateType
  (_enum '(sfCoordinateTypeNormalized
           sfCoordinateTypePixels)))

;; ----------------------------------------------------
;; Graphics/PrimitiveType.h
;; ----------------------------------------------------

(define _sfPrimitiveType
  (_enum '(sfPoints
           sfLines
           sfLineStrip
           sfTriangles
           sfTriangleStrip
           sfTriangleFan
           sfQuads)))

;; ----------------------------------------------------
;; Graphics/StencilMode.h
;; ----------------------------------------------------

(define _sfStencilComparison
  (_enum '(sfStencilComparisonNever
           sfStencilComparisonLess
           sfStencilComparisonLessEqual
           sfStencilComparisonGreater
           sfStencilComparisonGreaterEqual
           sfStencilComparisonEqual
           sfStencilComparisonNotEqual
           sfStencilComparisonAlways )))

(define _sfStencilUpdateOperation
  (_enum '(sfStencilUpdateOperationKeep
           sfStencilUpdateOperationZero
           sfStencilUpdateOperationReplace
           sfStencilUpdateOperationIncrement
           sfStencilUpdateOperationDecrement
           sfStencilUpdateOperationInvert)))

;; ----------------------------------------------------
;; Graphics/Text.h
;; ----------------------------------------------------

(define _sfTextStyle
  (_bitmask '(sfTextRegular = 0
              sfTextBold = 1
              sfTextItalic = 2
              sfTextUnderlined = 4
              sfTextStrikeThrough = 8)))

;; ----------------------------------------------------
;; Graphics/Vertexbuffer.h
;; ----------------------------------------------------

(define _sfVertexBufferUsage
  (_enum '(sfVertexBufferStream
           sfVertexBufferDynamic
           sfVertexBufferStatic)))

;; ----------------------------------------------------
;; Graphics/WindowBase.h
;; ----------------------------------------------------

(define _sfWindowState
  (_enum '(sfWindowed
           sfFullscreen)))

;; ----------------------------------------------------
;; Network/Ftp.h
;; ----------------------------------------------------

(define _sfFtpTransferMode
  (_enum '(sfFtpBinary
           sfFtpAscii
           sfFtpEbcdic)))

(define _sfFtpStatus
  (_enum '(sfFtpRestartMarkerReply = 110
           sfFtpServiceReadySoon = 120
           sfFtpDataConnectionAlreadyOpened = 125
           sfFtpOpeningDataConnection = 150
           sfFtpOk = 200
           sfFtpPointlessCommand = 202
           sfFtpSystemStatus = 211
           sfFtpDirectoryStatus = 212
           sfFtpFileStatus = 213
           sfFtpHelpMessage = 214
           sfFtpSystemType = 215
           sfFtpServiceReady = 220
           sfFtpClosingConnection = 221
           sfFtpDataConnectionOpened = 225
           sfFtpClosingDataConnection = 226
           sfFtpEnteringPassiveMode = 227
           sfFtpLoggedIn = 230
           sfFtpFileActionOk = 250
           sfFtpDirectoryOk = 257
           sfFtpNeedPassword = 331
           sfFtpNeedAccountToLogIn = 332
           sfFtpNeedInformation = 350
           sfFtpServiceUnavailable = 421
           sfFtpDataConnectionUnavailable = 425
           sfFtpTransferAborted = 426
           sfFtpFileActionAborted = 450
           sfFtpLocalError = 451
           sfFtpInsufficientStorageSpace = 452
           sfFtpCommandUnknown = 500
           sfFtpParametersUnknown = 501
           sfFtpCommandNotImplemented = 502
           sfFtpBadCommandSequence = 503
           sfFtpParameterNotImplemented = 504
           sfFtpNotLoggedIn = 530
           sfFtpNeedAccountToStore = 532
           sfFtpFileUnavailable = 550
           sfFtpPageTypeUnknown = 551
           sfFtpNotEnoughMemory = 552
           sfFtpFilenameNotAllowed = 553
           sfFtpInvalidResponse = 1000
           sfFtpConnectionFailed = 1001
           sfFtpConnectionClosed = 1002
           sfFtpInvalidFile = 1003)))

;; ----------------------------------------------------
;; Network/Http.h
;; ----------------------------------------------------

(define _sfHttpMethod
  (_enum '(sfHttpGet
           sfHttpPost
           sfHttpHead
           sfHttpPut
           sfHttpDelete)))

(define _sfHttpStatus
  (_enum '(sfHttpOk = 200
           sfHttpCreated = 201
           sfHttpAccepted = 202
           sfHttpNoContent = 204
           sfHttpResetContent = 205
           sfHttpPartialContent = 206
           sfHttpMultipleChoices = 300
           sfHttpMovedPermanently = 301
           sfHttpMovedTemporarily = 302
           sfHttpNotModified = 304
           sfHttpBadRequest = 400
           sfHttpUnauthorized = 401
           sfHttpForbidden = 403
           sfHttpNotFound = 404
           sfHttpRangeNotSatisfiable = 407
           sfHttpInternalServerError = 500
           sfHttpNotImplemented = 501
           sfHttpBadGateway = 502
           sfHttpServiceNotAvailable = 503
           sfHttpGatewayTimeout = 504
           sfHttpVersionNotSupported = 505
           sfHttpInvalidResponse = 1000
           sfHttpConnectionFailed = 1001)))

;; ----------------------------------------------------
;; Network/SocketStatus.h
;; ----------------------------------------------------

(define _sfSocketStatus
  (_enum '(sfSocketDone
           sfSocketNotReady
           sfSocketPartial
           sfSocketDisconnected
           sfSDocketError)))

;; ----------------------------------------------------
;; Window/Context.h
;; ----------------------------------------------------

(define _sfContextAttribute
  (_enum '(sfContextDefault = 0
           sfContextCore = 1
           sfContextDebug = 2)))

;; ----------------------------------------------------
;; Window/Cursor.h
;; ----------------------------------------------------

(define _sfCursorType
  (_enum '(sfCursorArrow
           sfCursorArrowWait
           sfCursorWait
           sfCursorText
           sfCursorHand
           sfCursorSizeHorizontal
           sfCursorSizeVertical
           sfCursorSizeTopLeftBottomRight
           sfCursorSizeBottomLeftTopRight
           sfCursorSizeAll
           sfCursorCross
           sfCursorHelp
           sfCursorNotAllowed)))

;; ----------------------------------------------------
;; Window/Event.h
;; ----------------------------------------------------

(define _sfEventType
  (_enum '(sfEvtClosed
           sfEvtResized
           sfEvtLostFocus
           sfEvtGainedFocus
           sfEvtTextEntered
           sfEvtKeyPressed
           sfEvtKeyReleased
           sfEvtMouseWheelMoved
           sfEvtMouseWheelScrolled
           sfEvtMouseButtonPressed
           sfEvtMouseButtonReleased
           sfEvtMouseMoved
           sfEvtMouseEntered
           sfEvtMouseLeft
           sfEvtJoystickButtonPressed
           sfEvtJoystickButtonReleased
           sfEvtJoystickMoved
           sfEvtJoystickConnected
           sfEvtJoystickDisconnected
           sfEvtTouchBegan
           sfEvtTouchMoved
           sfEvtTouchEnded
           sfEvtSensorChanged
           sfEvtCount)))

;; ----------------------------------------------------
;; Window/Joystick.h
;; ----------------------------------------------------

(define sfJoystickCount 8)
(define sfJoystickButtonCount 32)
(define sfJoystickAxisCount 8)

(define _sfJoystickAxis
  (_enum '(sfJoystickX
           sfJoystickY
           sfJoystickZ
           sfJoystickR
           sfJoystickU
           sfJoystickV
           sfJoystickPovX
           sfJoystickPovY)))

;; ----------------------------------------------------
;; Window/Keyboard.h
;; ----------------------------------------------------

(define _sfKeyCode
  (_enum '(sfKeyUnknown = -1
           sfKeyA
           sfKeyB
           sfKeyC
           sfKeyD
           sfKeyE
           sfKeyF
           sfKeyG
           sfKeyH
           sfKeyI
           sfKeyJ
           sfKeyK
           sfKeyL
           sfKeyM
           sfKeyN
           sfKeyO
           sfKeyP
           sfKeyQ
           sfKeyR
           sfKeyS
           sfKeyT
           sfKeyU
           sfKeyV
           sfKeyW
           sfKeyX
           sfKeyY
           sfKeyZ
           sfKeyNum0
           sfKeyNum1
           sfKeyNum2
           sfKeyNum3
           sfKeyNum4
           sfKeyNum5
           sfKeyNum6
           sfKeyNum7
           sfKeyNum8
           sfKeyNum9
           sfKeyEscape
           sfKeyLControl
           sfKeyLShift
           sfKeyLAlt
           sfKeyLSystem
           sfKeyRControl
           sfKeyRShift
           sfKeyRAlt
           sfKeyRSystem
           sfKeyMenu
           sfKeyLBracket
           sfKeyRBracket
           sfKeySemicolon
           sfKeyComma
           sfKeyPeriod
           sfKeyQuote
           sfKeySlash
           sfKeyBackslash
           sfKeyTilde
           sfKeyEqual
           sfKeyHyphen
           sfKeySpace
           sfKeyEnter
           sfKeyBackspace
           sfKeyTab
           sfKeyPageUp
           sfKeyPageDown
           sfKeyEnd
           sfKeyHome
           sfKeyInsert
           sfKeyDelete
           sfKeyAdd
           sfKeySubtract
           sfKeyMultiply
           sfKeyDivide
           sfKeyLeft
           sfKeyRight
           sfKeyUp
           sfKeyDown
           sfKeyNumpad0
           sfKeyNumpad1
           sfKeyNumpad2
           sfKeyNumpad3
           sfKeyNumpad4
           sfKeyNumpad5
           sfKeyNumpad6
           sfKeyNumpad7
           sfKeyNumpad8
           sfKeyNumpad9
           sfKeyF1
           sfKeyF2
           sfKeyF3
           sfKeyF4
           sfKeyF5
           sfKeyF6
           sfKeyF7
           sfKeyF8
           sfKeyF9
           sfKeyF10
           sfKeyF11
           sfKeyF12
           sfKeyF13
           sfKeyF14
           sfKeyF15
           sfKeyPause
           sfKeyCount)))

(define _sfScancode
  (_enum '(sfScanUnknown = -1
           sfScanA
           sfScanB
           sfScanC
           sfScanD
           sfScanE
           sfScanF
           sfScanG
           sfScanH
           sfScanI
           sfScanJ
           sfScanK
           sfScanL
           sfScanM
           sfScanN
           sfScanO
           sfScanP
           sfScanQ
           sfScanR
           sfScanS
           sfScanT
           sfScanU
           sfScanV
           sfScanW
           sfScanX
           sfScanY
           sfScanZ
           sfScanNum1
           sfScanNum2
           sfScanNum3
           sfScanNum4
           sfScanNum5
           sfScanNum6
           sfScanNum7
           sfScanNum8
           sfScanNum9
           sfScanNum0
           sfScanEnter
           sfScanEscape
           sfScanBackspace
           sfScanTab
           sfScanSpace
           sfScanHyphen
           sfScanEqual
           sfScanLBracket
           sfScanRBracket
           sfScanBackslash
           sfScanSemicolon
           sfScanApostrophe
           sfScanGrave
           sfScanComma
           sfScanPeriod
           sfScanSlash
           sfScanF1
           sfScanF2
           sfScanF3
           sfScanF4
           sfScanF5
           sfScanF6
           sfScanF7
           sfScanF8
           sfScanF9
           sfScanF10
           sfScanF11
           sfScanF12
           sfScanF13
           sfScanF14
           sfScanF15
           sfScanF16
           sfScanF17
           sfScanF18
           sfScanF19
           sfScanF20
           sfScanF21
           sfScanF22
           sfScanF23
           sfScanF24
           sfScanCapsLock
           sfScanPrintScreen
           sfScanScrollLock
           sfScanPause
           sfScanInsert
           sfScanHome
           sfScanPageUp
           sfScanDelete
           sfScanEnd
           sfScanPageDown
           sfScanRight
           sfScanLeft
           sfScanDown
           sfScanUp
           sfScanNumLock
           sfScanNumpadDivide
           sfScanNumpadMultiply
           sfScanNumpadMinus
           sfScanNumpadPlus
           sfScanNumpadEqual
           sfScanNumpadEnter
           sfScanNumpadDecimal
           sfScanNumpad1
           sfScanNumpad2
           sfScanNumpad3
           sfScanNumpad4
           sfScanNumpad5
           sfScanNumpad6
           sfScanNumpad7
           sfScanNumpad8
           sfScanNumpad9
           sfScanNumpad0
           sfScanNonUsBackslash
           sfScanApplication
           sfScanExecute
           sfScanModeChange
           sfScanHelp
           sfScanMenu
           sfScanSelect
           sfScanRedo
           sfScanUndo
           sfScanCut
           sfScanCopy
           sfScanPaste
           sfScanVolumeMute
           sfScanVolumeUp
           sfScanVolumeDown
           sfScanMediaPlayPause
           sfScanMediaStop
           sfScanMediaNextTrack
           sfScanMediaPreviousTrack
           sfScanLControl
           sfScanLShift
           sfScanLAlt
           sfScanLSystem
           sfScanRControl
           sfScanRShift
           sfScanRAlt
           sfScanRSystem
           sfScanBack
           sfScanForward
           sfScanRefresh
           sfScanStop
           sfScanSearch
           sfScanFavorites
           sfScanHomePage
           sfScanLaunchApplication1
           sfScanLaunchApplication2
           sfScanLaunchMail
           sfScanLaunchMediaSelect)))

;; ----------------------------------------------------
;; Window/Mouse.h
;; ----------------------------------------------------

(define _sfMouseButton
  (_enum '(sfMouseLeft
           sfMouseRight
           sfMouseMiddle
           sfMouseXButton1
           sfMouseXButton2)))

(define _sfMouseWheel
  (_enum '(sfMouseVerticalWheel
           sfMouseHorizontalWheel)))

;; ----------------------------------------------------
;; Window/Sensor.h
;; ----------------------------------------------------

(define _sfSensorType
  (_enum '(sfSensorAccelerometer
           sfSensorGyroscope
           sfSensorMagnetometer
           sfSensorGravity
           sfSensorUserAcceleration
           sfSensorOrientation
           sfSensorCount)))

;; ----------------------------------------------------
;; Window.h
;; ----------------------------------------------------

(define _sfWindowStyle
  (_bitmask '(sfNone = 0
              sfTitlebar = 1
              sfResize = 2
              sfClose = 4
              sfFullscreen = 8
              sfDefaultStyle = 7)))
