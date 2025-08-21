#lang typed/racket
(require "common/terms.rkt")
(provide parse parse-term)

;; Public
(: parse (-> String (Listof Any)))
(define (parse input)
  (define term-strings (string-split input "\n"))
  (map parse-term term-strings)
  )

;; e ::= x ∣ λx.e ∣ e1 e2
(: parse-term (-> String Any))
(define (parse-term input)
  (define first-char (substring input 0 1))
  (cond
    [(equal? first-char "λ") (parse-abstraction input)]
    [(equal? (string-replace input " " "") input) (parse-variable input)]
    [else (parse-application input)]
    )
  )

;; Private
(: parse-variable (-> String variable))
(define (parse-variable input)
  (variable input))

(: parse-abstraction (-> String abstraction))
(define (parse-abstraction input)
  (define non-lambda-input (substring input 1 (string-length input)))
  (define split-on-dot (string-split non-lambda-input "."))
  (abstraction (first split-on-dot) (second split-on-dot)))

(: parse-application (-> String application))
(define (parse-application input)
  (define split-input (string-split input " "))
  (application (first split-input) (second split-input)))
