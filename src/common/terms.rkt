#lang typed/racket
(provide variable abstraction application variable-name abstraction-variable abstraction-body application-left application-right)

(struct variable ([name : String]) #:transparent)
(struct abstraction ([variable : String] [body : String]) #:transparent)
(struct application ([left : String] [right : String]) #:transparent)