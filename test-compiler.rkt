#lang racket

(require rackunit rackunit/text-ui "compiler.rkt")

(define parse-tests
  (test-suite
   "Parse Tests"
   ;  (test-case "lexer empty returns empty list"
   ;             (check-equal? (lexer "") '()))
   ;  (test-case "lexer single element returns list with single element"
   ;             (check-equal? (lexer "x") '("x")))

   )
  )

(run-tests parse-tests)
