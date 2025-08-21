#lang typed/racket

(provide split take-until-space)

(: split (-> String (Listof String)))
(define (split input)
  (cond
    [(equal? input "") '()]
    [(equal? input " ") '()]
    [else (let* ([taken-until-space-val (take-until-space input)]
                 [first-term (first taken-until-space-val)]
                 [rest-terms (split (second taken-until-space-val))])
            (cons first-term rest-terms)
            )
          ]
    )
  )

(: take-until-space (-> String (Listof String)))
(define (take-until-space input)
  (cond
    [(equal? input "") '("" "")]
    [(equal? input " ") '("" "")]
    [(equal? (substring input 0 1) " ") (list "" (substring input 1 (string-length input)))]
    [else (let* ([taken-until-space-val (take-until-space (substring input 1 (string-length input)))])
            (list (string-append (substring input 0 1) (first taken-until-space-val)) (second taken-until-space-val))
            )
          ]
    )
  )
