#lang racket

(require rackunit rackunit/text-ui "../src/type-inference.rkt")
(require "../src/common/terms.rkt")

(define parse-tests
  (test-suite
   "Type Inference Tests"
   (test-case "infer variable when variable is in env"
              (check-equal? (infer-variable (type-inference 0) (environment (list (cons "x" "T0"))) (variable "x")) "T0"))
   (test-case "infer variable when variable is not in env"
              (check-exn (lambda (exn) (regexp-match? #px"Variable not found" (exn-message exn)))
                         (lambda () (infer-variable (type-inference 0) (environment (list (cons "x" "T0"))) (variable "y")))))
   )
  )

(run-tests parse-tests)
