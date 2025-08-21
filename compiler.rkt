#lang typed/racket

(require "string-utils.rkt")


;; e ::= x ∣ λx.e ∣ e1 e2
; (: lexer (-> String (Listof String)))
; (define (lexer input)
;   (cond
;     [string=? input '()]
;     [else (cons (first input) (lexer (rest input)))])
;   )


