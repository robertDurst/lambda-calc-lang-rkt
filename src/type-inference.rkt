#lang typed/racket
(require racket/dict)
(require "common/terms.rkt")
(provide type-inference environment fresh-type-variable lookup-from-env infer-variable)

;; Public
(struct type-inference ([counter : Integer]) #:transparent)
(struct environment ([bindings : (Listof (Pairof String String))]) #:transparent)

(: infer-variable (-> type-inference environment variable String))
(define (infer-variable type-inference environment variable)
  (define variable-type (lookup-from-env environment (variable-name variable)))
  (if (empty? variable-type)
      (error "Variable not found")
      variable-type))

;; Private
(: make-type-inference (-> Integer type-inference))
(define (make-type-inference counter) (type-inference counter))

(: increment-type-inference (-> type-inference type-inference))
(define (increment-type-inference type-inference)
  (make-type-inference (+ 1 (type-inference-counter type-inference))))

(: lookup-from-env (-> environment String String))
(define (lookup-from-env env var)
  (define bindings (environment-bindings env))
  (cond
    [(empty? bindings) (error "Variable not found")]
    [(equal? (car (first bindings)) var) (cdr (first bindings))]
    [else (lookup-from-env (environment (rest bindings)) var)]
    )
  )

(: fresh-type-variable (-> type-inference (Pairof String type-inference)))
(define (fresh-type-variable type-inference)
  (cons (format "T~a" (type-inference-counter type-inference)) (increment-type-inference type-inference)))
