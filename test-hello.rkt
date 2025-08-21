#lang racket

(require rackunit rackunit/text-ui "hello.rkt")

(define hello-world-tests
  (test-suite
   "Hello World Tests"
   (test-case "hello-world returns correct greeting"
              (check-equal? (hello-world) "Hello, World!"))))

(run-tests hello-world-tests)
