;; Exercises 4.2

;; Exercise 4.2.1

;; 1)
;; is-in-open-3-to-closed-7 : number -> boolean
;; to evaluate whether a given number is in the semi-open
;; interval (3,7].
(define (is-in-open-3-to-closed-7 n)
  (and (< 3 n) (<= n 7)))
;;Tests
"Testing is-in-open-3-to-closed-7"
(equal? (is-in-open-3-to-closed-7 0) false)
(equal? (is-in-open-3-to-closed-7 3) false)
(equal? (is-in-open-3-to-closed-7 5) true)
(equal? (is-in-open-3-to-closed-7 7) true)
(equal? (is-in-open-3-to-closed-7 10) false)

;; 2)
;; is-in-closed-interval-3-to-7 : number -> boolean
;; to determine if a given number is in the closed interval [3,7]
(define (is-in-closed-interval-3-to-7 n)
  (and (<= 3 n) (<= n 7)))
;;Tests
"Testing is-in-closed-interval-3-to-7"
(equal? (is-in-closed-interval-3-to-7 0) false)
(equal? (is-in-closed-interval-3-to-7 3) true)
(equal? (is-in-closed-interval-3-to-7 5) true)
(equal? (is-in-closed-interval-3-to-7 7) true)
(equal? (is-in-closed-interval-3-to-7 10) false)

;; 3)
;; is-in-closed-3-to-open-9 : number -> boolean
;; to evaluate whether a given number is in the semi-open
;; interval [3,9).
(define (is-in-closed-3-to-open-9 n)
  (and (<= 3 n) (< n 9)))
;;Tests
"Testing is-in-closed-3-to-open-9"
(equal? (is-in-closed-3-to-open-9 0) false)
(equal? (is-in-closed-3-to-open-9 3) true)
(equal? (is-in-closed-3-to-open-9 5) true)
(equal? (is-in-closed-3-to-open-9 9) false)
(equal? (is-in-closed-3-to-open-9 10) false)

;; 4)
;; is-in-open-interval-1-to-3 : number -> boolean
;; to determine if a given number is in the open interval (1,3)
(define (is-in-open-interval-1-to-3 n)
  (and (< 1 n) (< n 3)))
;;Tests
"Testing is-in-open-interval-1-to-3"
(equal? (is-in-open-interval-1-to-3 0) false)
(equal? (is-in-open-interval-1-to-3 1) false)
(equal? (is-in-open-interval-1-to-3 2) true)
(equal? (is-in-open-interval-1-to-3 3) false)
(equal? (is-in-open-interval-1-to-3 10) false)

;; is-in-open-interval-9-to-11 : number -> boolean
;; to determine if a given number is in the open interval (9,11)
(define (is-in-open-interval-9-to-11 n)
  (and (< 9 n) (< n 11)))
;;Tests
"Testing is-in-open-interval-9-to-11"
(equal? (is-in-open-interval-9-to-11 0) false)
(equal? (is-in-open-interval-9-to-11 9) false)
(equal? (is-in-open-interval-9-to-11 10) true)
(equal? (is-in-open-interval-9-to-11 11) false)
(equal? (is-in-open-interval-9-to-11 15) false)

;; is-in-union-interval-1 : number -> boolean
;; to determine if a given number is in the union of the 
;; open intervals (1,3) and (9,11)
(define (is-in-union-interval-1 n)
  (or (is-in-open-interval-1-to-3 n) 
      (is-in-open-interval-9-to-11 n)))
;; Tests:
"Testing is-in-union-interval-1"
(equal? (is-in-union-interval-1 0) false)
(equal? (is-in-union-interval-1 1) false)
(equal? (is-in-union-interval-1 2) true)
(equal? (is-in-union-interval-1 3) false)
(equal? (is-in-union-interval-1 7) false)
(equal? (is-in-union-interval-1 9) false)
(equal? (is-in-union-interval-1 10) true)
(equal? (is-in-union-interval-1 11) false)
(equal? (is-in-union-interval-1 15) false)

;; 5)
;; is-outside-closed-interval-1-to-3 : number -> boolean
;; to determine if a given number is not in the closed interval [1,3]
(define (is-outside-closed-interval-1-to-3 n)
  (or (< n 1) (< 3 n)))
;;Tests
"Testing is-outside-closed-interval-1-to-3"
(equal? (is-outside-closed-interval-1-to-3 0) true)
(equal? (is-outside-closed-interval-1-to-3 1) false)
(equal? (is-outside-closed-interval-1-to-3 2) false)
(equal? (is-outside-closed-interval-1-to-3 3) false)
(equal? (is-outside-closed-interval-1-to-3 10) true)

;; Exercise 4.2.2

;; 1. (-3,0)
;; in-interval-1? : number -> boolean
;; to determine if a given number is in the open interval (-3,0).
(define (in-interval-1? x)
  (and (< -3 x) (< x 0)))

;; 2. (-inf,1) union (2,inf)
;; in-interval-2? : number -> boolean
;; to determine if a given number is in the complement of the closed
;; interval [1,2].
(define (in-interval-2? x)
  (or (< x 1) (> x 2)))

;; 3. (-inf,1) union (5,inf)
;; in-interval-3? : number -> boolean
;; to determine if a given number is in the complement of the closed
;; interval [1,5].
(define (in-interval-3? x)
  (not (and (<= 1 x) (<= x 5))))

;; 1. (in-interval-1? -2) => 
;;    (and (< -3 -2) (< -2 0))) =>
;;    (and true (< -2 0))) =>
;;    (and true true) => true

;; 2. (in-interval-2? -2) =>
;;    (or (< -2 1) (> -2 2))) =>
;;    (or true (> -2 2)) => true (if short-circuiting) or
;;    (or true false) => true

;; 3. (in-interval-3? -2) =>
;;    (not (and (<= 1 -2) (<= -2 5)))) =>
;;    (not (and false (<= -2 5)))) => (not false) => true, or
;;    (not (and false true)) => (not false) => true
;;    again, depending on short-circuiting of logic ops

;; Exercise 4.2.3

;; 1. 4n + 2 = 62 => 4n = 60 => n = 15
;; equation-4-2-3-1 : number -> boolean
;; to determine if a given number is a solution to equation 1
;; of exercise 4.2.3;
(define (equation-4-2-3-1 n)
  (= 62 (+ 2 (* 4 n))))
;; Tests
"Testing equation-4-2-3-1"
(equal? (equation-4-2-3-1 15) true)
(equal? (equation-4-2-3-1 4) false)

"Is 10 a solution?"
(equation-4-2-3-1 10)
"Is 12 a solution?"
(equation-4-2-3-1 12)
"Is 14 a solution?"
(equation-4-2-3-1 14)

;; 2. 2n^2 = 102 => n^2 = 51 => n = (sqrt 51)
;; equation-4-2-3-2 : number -> boolean
;; to determine if a given number is a solution to equation 2
;; of exercise 4.2.3
(define (equation-4-2-3-2 n)
  (= 102 (* n n 2)))
;; Tests:
"Testing equation-4-2-3-2"
(equal? (equation-4-2-3-2 3) false)

"Is 10 a solution?"
(equation-4-2-3-2 10)
"Is 12 a solution?"
(equation-4-2-3-2 12)
"Is 14 a solution?"
(equation-4-2-3-2 14)

;; 3. 4n^2 + 6n + 2 = 462    => 
;;    4n^2 + 6n - 460 = 0    =>
;;    (4n + 46)(n - 10) = 0  =>
;;    n = 10 or n = -13/2
;; equation-4-2-3-3 : number -> boolean
;; to determine if a given number is a solution to equation 3
;; of exercise 4.2.3
(define (equation-4-2-3-3 n)
  (= 462 (+ 2 (* 4 n n) (* 6 n))))
;; Tests
"Testing equation-4-2-3-3"
(equal? (equation-4-2-3-3 10) true)
(equal? (equation-4-2-3-3 -23/2) true)
(equal? (equation-4-2-3-3 23/2) false)

"Is 10 a solution?"
(equation-4-2-3-3 10)
"Is 12 a solution?"
(equation-4-2-3-3 12)
"Is 14 a solution?"
(equation-4-2-3-3 14)


;; Exercise 4.2.4
;; to do this, I extract code from my prior assignment.

;; from Exercise 2.2.1 
;; Fahrenheit->Celsius : number -> number
;; convert a temperature in Fahrenheit degress to the 
;; equivalent temperature in Celsius degrees
;;
;; Ex. (Fahrenheit->Celsius -40) should return -40
;; 
(define (Fahrenheit->Celsius temp)
  ;; There are 5 Celsius degress for every 9 Fahrenheit
  ;; degrees, and Fahrenheit starts at 32 instead of 0.
  (/ (* 5 (- temp 32)) 9))
;; Tests:
"Testing Fahrenheit->Celsius from exercise 2.2.1"
(equal? (Fahrenheit->Celsius 32) 0)
(equal? (Fahrenheit->Celsius -40) -40)
(equal? (Fahrenheit->Celsius 212) 100)

;; from Exercise 2.2.2
;; dollar->euro: number -> number
;; convert a number of dollars to a number of euros of 
;; equivalent value to the dollar amount, using the 
;; current (at program writing) exchange rate.
(define (dollar->euro money)
  (* money 0.834))
;; Tests:
"Testing dollar->euro from Exercise 2.2.2"
(equal? (dollar->euro 100) 83.4)

;; from Exercise 2.2.3
;; triangle: (number, number) -> number
;; calculate the area of a triangle, given a side and 
;; the perpendicular height to that side.
;; Ex. triangle with side = height should have half the area
;; of a square with sides the same length as the triangle's side.
;; (triangle 2 1) = 1
(define (triangle side height)
  (* 0.5 (* side height)))
;; Tests:
"Testing trinagle from Exercise 2.2.3"
(equal? (triangle 2 1) 1)
(equal? (triangle 2 2) 2)

;; from Exercise 2.2.4
;; convert3: number number number -> number
;; consume three digits x, y, z, and return a number of the 
;; form zyx
;; Ex. (convert3 1 2 3) = 321, (convert3 6 5 4) = 456
(define (convert3 first second third)
  (+ first (* second 10) (* 100 third)))
;; Tests:
"Testing convert3 from Exercise 2.2.4"
(equal? (convert3 1 2 3) 321)
(equal? (convert3 6 5 4) 456)

