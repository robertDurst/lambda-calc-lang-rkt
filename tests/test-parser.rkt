#lang racket

(require rackunit rackunit/text-ui "../src/parser.rkt")
(require "../src/common/terms.rkt")

(define parse-tests
  (test-suite
   "Parse Tests"
   (test-case "parse abstraction"
              (check-equal? (parse-term "λx.e") (abstraction "x" "e")))
   (test-case "parse application"
              (check-equal? (parse-term "e1 e2") (application "e1" "e2")))
   (test-case "parse variable"
              (check-equal? (parse-term "x") (variable "x")))
   (test-case "parses multiple terms"
              (check-equal? (parse "x\ny\nλx.e\ne1 e2")
                            (list (variable "x") (variable "y") (abstraction "x" "e") (application "e1" "e2"))))
   )
  )

(run-tests parse-tests)
