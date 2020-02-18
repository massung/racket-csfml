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
             ('windows "csfml-network-2")
             ('unix "libcsfml-network")
             ('macosx "libcsfml-network"))))

;; ----------------------------------------------------

(require (file "enums.rkt"))
(require (file "types.rkt"))

;; ----------------------------------------------------

(provide (except-out (all-defined-out) define-sfml))

;; ----------------------------------------------------
;; Ftp.h
;; ----------------------------------------------------

(define-sfml sfFtpListingResponse_destroy
  (_fun _sfFtpListingResponse* -> _void)
  #:wrap (deallocator))

(define-sfml sfFtpListingResponse_isOk
  (_fun _sfFtpListingResponse* -> _bool))

(define-sfml sfFtpListingResponse_getStatus
  (_fun _sfFtpListingResponse* -> _sfFtpStatus))

(define-sfml sfFtpListingResponse_getMessage
  (_fun _sfFtpListingResponse* -> _string))

(define-sfml sfFtpListingResponse_getCount
  (_fun _sfFtpListingResponse* -> _int32))

(define-sfml sfFtpListingResponse_getName
  (_fun _sfFtpListingResponse* _int32 -> _string))

(define-sfml sfFtpDirectoryResponse_destroy
  (_fun _sfFtpDirectoryResponse* -> _void)
  #:wrap (deallocator))

(define-sfml sfFtpDirectoryResponse_isOk
  (_fun _sfFtpDirectoryResponse* -> _bool))

(define-sfml sfFtpDirectoryResponse_getStatus
  (_fun _sfFtpDirectoryResponse* -> _sfFtpStatus))

(define-sfml sfFtpDirectoryResponse_getMessage
  (_fun _sfFtpDirectoryResponse* -> _string))

(define-sfml sfFtpDirectoryResponse_getDirectory
  (_fun _sfFtpDirectoryResponse* -> _string))

(define-sfml sfFtpResponse_destroy
  (_fun _sfFtpResponse* -> _void)
  #:wrap (deallocator))

(define-sfml sfFtpResponse_isOk
  (_fun _sfFtpResponse* -> _bool))

(define-sfml sfFtpResponse_getStatus
  (_fun _sfFtpResponse* -> _sfFtpStatus))

(define-sfml sfFtpResponse_getMessage
  (_fun _sfFtpResponse* -> _string))

(define-sfml sfFtp_destroy
  (_fun _sfFtp* -> _void)
  #:wrap (deallocator))

(define-sfml sfFtp_create
  (_fun -> _sfFtp*)
  #:wrap (allocator sfFtp_destroy))

(define-sfml sfFtp_connect
  (_fun _sfFtp* _sfIpAddress _uint16 _sfTime -> _sfFtpResponse*)
  #:wrap (allocator sfFtpResponse_destroy))

(define-sfml sfFtp_loginAnonymous
  (_fun _sfFtp* -> _sfFtpResponse*)
  #:wrap (allocator sfFtpResponse_destroy))

(define-sfml sfFtp_login
  (_fun _sfFtp* _string _string -> _sfFtpResponse*)
  #:wrap (allocator sfFtpResponse_destroy))

(define-sfml sfFtp_disconnect
  (_fun _sfFtp* -> _sfFtpResponse*)
  #:wrap (allocator sfFtpResponse_destroy))

(define-sfml sfFtp_keepAlive
  (_fun _sfFtp* -> _sfFtpResponse*)
  #:wrap (allocator sfFtpResponse_destroy))

(define-sfml sfFtp_getWorkingDirectory
  (_fun _sfFtp* -> _sfFtpDirectoryResponse*)
  #:wrap (allocator sfFtpDirectoryResponse_destroy))

(define-sfml sfFtp_getDirectoryListing
  (_fun _sfFtp* _string -> _sfFtpListingResponse*)
  #:wrap (allocator sfFtpListingResponse_destroy))

(define-sfml sfFtp_changeDirectory
  (_fun _sfFtp* _string -> _sfFtpResponse*)
  #:wrap (allocator sfFtpResponse_destroy))

(define-sfml sfFtp_parentDirectory
  (_fun _sfFtp* -> _sfFtpResponse*)
  #:wrap (allocator sfFtpResponse_destroy))

(define-sfml sfFtp_createDirectory
  (_fun _sfFtp* _string -> _sfFtpResponse*)
  #:wrap (allocator sfFtpResponse_destroy))

(define-sfml sfFtp_deleteDirectory
  (_fun _sfFtp* _string -> _sfFtpResponse*)
  #:wrap (allocator sfFtpResponse_destroy))

(define-sfml sfFtp_renameFile
  (_fun _sfFtp* _string _string -> _sfFtpResponse*)
  #:wrap (allocator sfFtpResponse_destroy))

(define-sfml sfFtp_deleteFile
  (_fun _sfFtp* _string -> _sfFtpResponse*)
  #:wrap (allocator sfFtpResponse_destroy))

(define-sfml sfFtp_download
  (_fun _sfFtp* _string _string _sfFtpTransferMode -> _sfFtpResponse*)
  #:wrap (allocator sfFtpResponse_destroy))

(define-sfml sfFtp_upload
  (_fun _sfFtp* _string _string _sfFtpTransferMode -> _sfFtpResponse*)
  #:wrap (allocator sfFtpResponse_destroy))

(define-sfml sfFtp_sendCommand
  (_fun _sfFtp* _string _string -> _sfFtpResponse*)
  #:wrap (allocator sfFtpResponse_destroy))

;; ----------------------------------------------------
;; Http.h
;; ----------------------------------------------------

(define-sfml sfHttpRequest_destroy
  (_fun _sfHttpRequest* -> _void)
  #:wrap (deallocator))

(define-sfml sfHttpRequest_create
  (_fun -> _sfHttpRequest*)
  #:wrap (allocator sfHttpRequest_destroy))

(define-sfml sfHttpRequest_setField
  (_fun _sfHttpRequest* _string _string -> _void))

(define-sfml sfHttpRequest_setMethod
  (_fun _sfHttpRequest* _sfHttpMethod -> _void))

(define-sfml sfHttpRequest_setUri
  (_fun _sfHttpRequest* _string -> _void))

(define-sfml sfHttpRequest_setHttpVersion
  (_fun _sfHttpRequest* _uint _uint -> _void))

(define-sfml sfHttpRequest_setBody
  (_fun _sfHttpRequest* _string -> _void))

(define-sfml sfHttpResponse_destroy
  (_fun _sfHttpResponse* -> _void)
  #:wrap (deallocator))

(define-sfml sfHttpResponse_getField
  (_fun _sfHttpResponse* _string -> _string))

(define-sfml sfHttpResponse_getStatus
  (_fun _sfHttpResponse* -> _sfHttpStatus))

(define-sfml sfHttpResponse_getMajorVersion
  (_fun _sfHttpResponse* -> _uint))

(define-sfml sfHttpResponse_getMinorVersion
  (_fun _sfHttpResponse* -> _uint))

(define-sfml sfHttpResponse_getBody
  (_fun _sfHttpResponse* -> _string))

(define-sfml sfHttp_destroy
  (_fun _sfHttp* -> _void)
  #:wrap (deallocator))

(define-sfml sfHttp_create
  (_fun -> _sfHttp*)
  #:wrap (allocator sfHttp_destroy))

(define-sfml sfHttp_setHost
  (_fun _sfHttp* _string _uint -> _void))

(define-sfml sfHttp_sendRequest
  (_fun _sfHttp* _sfHttpRequest* -> _sfHttpResponse*)
  #:wrap (allocator sfHttpResponse_destroy))

;; ----------------------------------------------------
;; IpAddress.h
;; ----------------------------------------------------

(define-sfml sfIpAddress_fromString
  (_fun _string -> _sfIpAddress))

(define-sfml sfIpAddress_fromBytes
  (_fun _byte _byte _byte _byte -> _sfIpAddress))

(define-sfml sfIpAddress_fromInteger
  (_fun _uint32 -> _sfIpAddress))

(define-sfml sfIpAddress_toString
  (_fun _sfIpAddress (s : (_ptr o _string)) -> _void -> s))

(define-sfml sfIpAddress_toInteger
  (_fun _sfIpAddress -> _uint32))

(define-sfml sfIpAddress_getLocalAddress
  (_fun -> _sfIpAddress))

(define-sfml sfIpAddress_getPublicAddress
  (_fun _sfTime -> _sfIpAddress))

;; ----------------------------------------------------
;; Packet.h
;; ----------------------------------------------------

(define-sfml sfPacket_destroy
  (_fun _sfPacket* -> _void)
  #:wrap (deallocator))

(define-sfml sfPacket_create
  (_fun -> _sfPacket*)
  #:wrap (allocator sfPacket_destroy))

(define-sfml sfPacket_copy
  (_fun _sfPacket* -> _sfPacket*))

(define-sfml sfPacket_append
  (_fun _sfPacket* _pointer _int -> _void))

(define-sfml sfPacket_clear
  (_fun _sfPacket* -> _void))

(define-sfml sfPacket_getData
  (_fun _sfPacket* -> _pointer))

(define-sfml sfPacket_getDataSize
  (_fun _sfPacket* -> _uint))

(define-sfml sfPacket_endOfPacket
  (_fun _sfPacket* -> _bool))

(define-sfml sfPacket_canRead
  (_fun _sfPacket* -> _bool))

(define-sfml sfPacket_readBool
  (_fun _sfPacket* -> _bool))

(define-sfml sfPacket_readInt8
  (_fun _sfPacket* -> _int8))

(define-sfml sfPacket_readUint8
  (_fun _sfPacket* -> _uint8))

(define-sfml sfPacket_readInt16
  (_fun _sfPacket* -> _int16))

(define-sfml sfPacket_readUint16
  (_fun _sfPacket* -> _uint16))

(define-sfml sfPacket_readInt32
  (_fun _sfPacket* -> _int32))

(define-sfml sfPacket_readUint32
  (_fun _sfPacket* -> _uint32))

(define-sfml sfPacket_readFloat
  (_fun _sfPacket* -> _float))

(define-sfml sfPacket_readDouble
  (_fun _sfPacket* -> _double))

(define-sfml sfPacket_readString
  (_fun _sfPacket* -> _string))

(define-sfml sfPacket_writeBool
  (_fun _sfPacket* _bool -> _void))

(define-sfml sfPacket_writeInt8
  (_fun _sfPacket* _int8 -> _void))

(define-sfml sfPacket_writeUint8
  (_fun _sfPacket* _uint8 -> _void))

(define-sfml sfPacket_writeInt16
  (_fun _sfPacket* _int16 -> _void))

(define-sfml sfPacket_writeUint16
  (_fun _sfPacket* _uint16 -> _void))

(define-sfml sfPacket_writeInt32
  (_fun _sfPacket* _int32 -> _void))

(define-sfml sfPacket_writeUint32
  (_fun _sfPacket* _uint32 -> _void))

(define-sfml sfPacket_writeFloat
  (_fun _sfPacket* _float -> _void))

(define-sfml sfPacket_writeDouble
  (_fun _sfPacket* _double -> _void))

(define-sfml sfPacket_writeString
  (_fun _sfPacket* _string -> _void))

;; ----------------------------------------------------
;; SocketSelector.h
;; ----------------------------------------------------

(define-sfml sfSocketSelector_destroy
  (_fun _sfSocketSelector* -> _void)
  #:wrap (deallocator))

(define-sfml sfSocketSelector_create
  (_fun -> _sfSocketSelector*)
  #:wrap (allocator sfSocketSelector_destroy))

(define-sfml sfSocketSelector_copy
  (_fun _sfSocketSelector* -> _sfSocketSelector*))

(define-sfml sfSocketSelector_addTcpListener
  (_fun _sfSocketSelector* _sfTcpListener* -> _void))

(define-sfml sfSocketSelector_addTcpSocket
  (_fun _sfSocketSelector* _sfTcpSocket* -> _void))

(define-sfml sfSocketSelector_addUdpSocket
  (_fun _sfSocketSelector* _sfUdpSocket* -> _void))

(define-sfml sfSocketSelector_removeTcpListener
  (_fun _sfSocketSelector* _sfTcpListener* -> _void))

(define-sfml sfSocketSelector_removeTcpSocket
  (_fun _sfSocketSelector* _sfTcpSocket* -> _void))

(define-sfml sfSocketSelector_removeUdpSocket
  (_fun _sfSocketSelector* _sfUdpSocket* -> _void))

(define-sfml sfSocketSelector_clear
  (_fun _sfSocketSelector* -> _void))

(define-sfml sfSocketSelector_wait
  (_fun _sfSocketSelector* _sfTime -> _bool))

(define-sfml sfSocketSelector_isTcpListenerReady
  (_fun _sfSocketSelector* _sfTcpListener* -> _bool))

(define-sfml sfSocketSelector_isTcpSocketReady
  (_fun _sfSocketSelector* _sfTcpSocket* -> _bool))

(define-sfml sfSocketSelector_isUdpSocketReady
  (_fun _sfSocketSelector* _sfUdpSocket* -> _bool))

;; ----------------------------------------------------
;; TcpListener.h
;; ----------------------------------------------------

(define-sfml sfTcpListener_destroy
  (_fun _sfTcpListener* -> _void)
  #:wrap (deallocator))

(define-sfml sfTcpListener_create
  (_fun -> _sfTcpListener*)
  #:wrap (allocator sfTcpListener_destroy))

(define-sfml sfTcpListener_setBlocking
  (_fun _sfTcpListener* _bool -> _void))

(define-sfml sfTcpListener_isBlocking
  (_fun _sfTcpListener* -> _bool))

(define-sfml sfTcpListener_getLocalPort
  (_fun _sfTcpListener* -> _uint16))

(define-sfml sfTcpListener_listen
  (_fun _sfTcpListener* _uint16 _sfIpAddress -> _sfSocketStatus))

(define-sfml sfTcpListener_accept
  (_fun _sfTcpListener* (s : (_ptr o _sfTcpSocket*)) -> (status : _sfSocketStatus) -> (values status s)))

;; ----------------------------------------------------
;; TcpSocket.h
;; ----------------------------------------------------

(define-sfml sfTcpSocket_destroy
  (_fun _sfTcpSocket* -> _void)
  #:wrap (deallocator))

(define-sfml sfTcpSocket_create
  (_fun -> _sfTcpSocket*)
  #:wrap (allocator sfTcpSocket_destroy))

(define-sfml sfTcpSocket_setBlocking
  (_fun _sfTcpSocket* _bool -> _void))

(define-sfml sfTcpSocket_isBlocking
  (_fun _sfTcpSocket* -> _bool))

(define-sfml sfTcpSocket_getLocalPort
  (_fun _sfTcpSocket* -> _uint16))

(define-sfml sfTcpSocket_getRemoteAddress
  (_fun _sfTcpSocket* -> _sfIpAddress))

(define-sfml sfTcpSocket_getRemotePort
  (_fun _sfTcpSocket* -> _uint16))

(define-sfml sfTcpSocket_connect
  (_fun _sfTcpSocket* _sfIpAddress _uint16 _sfTime -> _sfSocketStatus))

(define-sfml sfTcpSocket_disconnect
  (_fun _sfTcpSocket* -> _void))

(define-sfml sfTcpSocket_send
  (_fun _sfTcpSocket* _pointer _uint -> _sfSocketStatus))

(define-sfml sfTcpSocket_sendPartial
  (_fun _sfTcpSocket* _pointer _uint (n : (_ptr o _uint)) -> (status : _sfSocketStatus) -> (values status n)))

(define-sfml sfTcpSocket_receive
  (_fun _sfTcpSocket* _pointer _uint (n : (_ptr o _uint)) -> (status : _sfSocketStatus) -> (values status n)))

(define-sfml sfTcpSocket_sendPacket
  (_fun _sfTcpSocket* _sfPacket* -> _sfSocketStatus))

(define-sfml sfTcpSocket_receivePacket
  (_fun _sfTcpSocket* _sfPacket* -> _sfSocketStatus))

;; ----------------------------------------------------
;; UdpSocket.h
;; ----------------------------------------------------

(define-sfml sfUdpSocket_destroy
  (_fun _sfUdpSocket* -> _void)
  #:wrap (deallocator))

(define-sfml sfUdpSocket_create
  (_fun -> _sfUdpSocket*)
  #:wrap (allocator sfUdpSocket_destroy))

(define-sfml sfUdpSocket_setBlocking
  (_fun _sfUdpSocket* _bool -> _void))

(define-sfml sfUdpSocket_isBlocking
  (_fun _sfUdpSocket* -> _bool))

(define-sfml sfUdpSocket_getLocalPort
  (_fun _sfUdpSocket* -> _uint16))

(define-sfml sfUdpSocket_bind
  (_fun _sfUdpSocket* _uint16 _sfIpAddress -> _sfSocketStatus))

(define-sfml sfUdpSocket_unbind
  (_fun _sfUdpSocket* -> _void))

(define-sfml sfUdpSocket_send
  (_fun _sfUdpSocket* _pointer _uint _sfIpAddress _uint16 -> _sfSocketStatus))

(define-sfml sfUdpSocket_receive
  (_fun _sfUdpSocket* _pointer _uint (n : (_ptr o _uint)) (a : (_ptr o _sfIpAddress)) (p : (_ptr o _uint16)) -> (status : _sfSocketStatus) -> (values status n a p)))

(define-sfml sfUdpSocket_sendPacket
  (_fun _sfUdpSocket* _sfPacket* -> _sfSocketStatus))

(define-sfml sfUdpSocket_receivePacket
  (_fun _sfUdpSocket* _sfPacket* -> _sfSocketStatus))
