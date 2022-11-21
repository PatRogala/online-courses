;; Installing
;; First line
#lang racket

;; For Homeworks
(provide (all-defined-out))

;; For second file to test
#lang racket
(require "foo.rkt")

;; Racket Definitions, Functions, Conditionals
(define x 3)
(define y (+ x 2))

(define cube1
  (lambda (x)
    (* x (* x x))))

(define cube2
  (lambda (x)
    (* x x x)))

(define (cube3 x)
  (* x x x))

(define (pow1 x y)
  (if (= y 0)
      1
      (* x (pow1 x (- y 1)))))

;; Racket Lists
(defina xs (list 1 2 3 4 5))
(null? xs) ;; Check if list is empty
(car xs) ;; First element
(cdr xs) ;; Rest of list

;;Better style
(cond
  [(null? xs) 0]
  [#t (+ (car xs) (sum (cdr xs)))])

;; Let Binding
(let ([x 1]
      [y 2])
  (+ x y))

(letrec ([x 1]
         [y (+ x 1)])
  (+ x y))
