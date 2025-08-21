#lang racket

(require rackunit rackunit/text-ui "../src/type-inference.rkt")
(require "../src/common/terms.rkt")

(define parse-tests
  (test-suite
   "Type Inference Tests"
   (test-case "fresh type variable"
              (check-equal? (fresh-type-variable (type-inference 0)) (cons "T0" (type-inference 1))))
   (test-case "lookup from env when variable is in env"
              (check-equal? (lookup-from-env (list (cons "x" "T0")) "x") "T0"))
   (test-case "lookup from env when variable is not in env"
              (check-exn (lambda (exn) (regexp-match? #px"Variable not found" (exn-message exn)))
                         (lambda () (lookup-from-env (list (cons "x" "T0")) "y"))))

   (test-case "infer variable when variable is in env"
              (check-equal? (infer-variable (type-inference 0) (list (cons "x" "T0")) (variable "x")) "T0"))
   (test-case "infer variable when variable is not in env"
              (check-exn (lambda (exn) (regexp-match? #px"Variable not found" (exn-message exn)))
                         (lambda () (infer-variable (type-inference 0) (list (cons "x" "T0")) (variable "y"))))
              )
   )
  )

(run-tests parse-tests)
