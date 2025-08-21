#lang typed/racket
(require racket/dict)
(require "common/terms.rkt")
(provide type-inference fresh-type-variable lookup-from-env infer-variable)

;; Public
(struct type-inference ([counter : Integer]) #:transparent)

(: fresh-type-variable (-> type-inference (Pairof String type-inference)))
(define (fresh-type-variable type-inference)
  (cons (format "T~a" (type-inference-counter type-inference)) (increment-type-inference type-inference)))

(: infer-variable (-> type-inference (Listof (Pairof String String)) variable String))
(define (infer-variable type-inference environment variable)
  (define variable-type (lookup-from-env environment (variable-name variable)))
  (if (empty? variable-type)
      (error "Variable not found")
      variable-type))

(: lookup-from-env (-> (Listof (Pairof String String)) String String))
(define (lookup-from-env env var)
  (cond
    [(empty? env) (error "Variable not found")]
    [(equal? (car (first env)) var) (cdr (first env))]
    [else (lookup-from-env (rest env) var)]
    )
  )

;; Private
(: make-type-inference (-> Integer type-inference))
(define (make-type-inference counter) (type-inference counter))

(: increment-type-inference (-> type-inference type-inference))
(define (increment-type-inference type-inference)
  (make-type-inference (+ 1 (type-inference-counter type-inference))))
