#lang racket

(require rackunit rackunit/text-ui "compiler.rkt")

(define parse-tests
  (test-suite
   "Parse Tests"
   ;  (test-case "lexer empty returns empty list"
   ;             (check-equal? (lexer "") '()))
   ;  (test-case "lexer single element returns list with single element"
   ;             (check-equal? (lexer "x") '("x")))
   (test-suite
    "Split Tests"
    (test-case "split empty returns empty list"
               (check-equal? (split "") '()))
    (test-case "split single element returns list with single element"
               (check-equal? (split "x") '("x")))
    (test-case "split multiple elements returns list with multiple elements"
               (check-equal? (split "x λx.e e1e2") '("x" "λx.e" "e1e2")))
    )

   (test-suite
    "Take Until Space Tests"
    (test-case "take until space empty returns empty list"
               (check-equal? (take-until-space "") '("" "")))
    (test-case "take until space single element returns list with single element"
               (check-equal? (take-until-space "x") '("x" "")))
    (test-case "take until space multiple elements returns list with multiple elements"
               (check-equal? (take-until-space "x λx.e e1e2") '("x" "λx.e e1e2")))
    )
   )
  )

(run-tests parse-tests)
