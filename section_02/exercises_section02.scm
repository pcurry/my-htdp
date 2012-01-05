;; Ex. 2.1.1
;; (* x x) is the easiest way to get squaring
;; exists (sin x) and (max x y ...) as well as (min x y ...)

;; Ex. 2.1.2
;; (sqrt 4) -> 2
;; (sqrt 2) -> #i1.4142135623730951
;; (sqrt -1) -> 0+1i
;; exactly what you would expect in terms of exact, inexact, and 
;; complex numbers
;; exists (tan x) but not (arctan x)

(define (area-of-disk r) 
  (* 3.14 (* r r)))

(define (area-of-ring outer inner) 
  (- (area-of-disk outer)
     (area-of-disk inner)))

;; Exercise 2.2.1 
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
(Fahrenheit->Celsius 32)
;; Expected value
0

(Fahrenheit->Celsius -40)
;; Expected value
-40

(Fahrenheit->Celsius 212)
;; Expected value
100


;; Exercise 2.2.2
;; dollar->euro: number -> number
;; convert a number of dollars to a number of euros of 
;; equivalent value to the dollar amount, using the 
;; current (at program writing) exchange rate.
(define (dollar->euro money)
  (* money 0.834))

;; Tests:
(dollar->euro 100)
;; Expected value
83.4

;; Exercise 2.2.3
;; triangle: (number, number) -> number
;; calculate the area of a triangle, given a side and 
;; the perpendicular height to that side.
;; Ex. triangle with side = height should have half the area
;; of a square with sides the same length as the triangle's side.
;; (triangle 2 1) = 1
(define (triangle side height)
  (* 0.5 (* side height)))

;; Tests:
(triangle 2 1)
;; Expected value
1

(triangle 2 2)
2

;; Exercise 2.2.4
;; convert3: number number number -> number
;; consume three digits x, y, z, and return a number of the 
;; form zyx
;; Ex. (convert3 1 2 3) = 321, (convert3 6 5 4) = 456
(define (convert3 first second third)
  (+ first (* second 10) (* 100 third)))

;; Exercise 2.2.5
(define (f n) 
  (+ (/ n 3) 2))
;; n = 2, (f n) = 8/3 = 2 2/3
(f 2)
;; n = 5, (f n) = 11/3 = 3 2/3
(f 5)
;; n = 9, (f n) = 5
(f 9)

;; f1: number -> number
;; calculate the value of the function
;; n^2 + 10 for given values of n
;; Ex. n = 0, (f1 n) = 10
;; Ex. n = 10, (f1 n) = 110
(define (f1 n)
  (+ (* n n) 10))

;; n = 2, (f1 n) = 14
(f1 2)
;; n = 9, (f1 n) = 91
(f1 9)

;; f2: number -> number
;; calculate the value of the function
;; (1/2 * n^2) + 20 for given values of n
;; Ex. n = 0, (f2 n) = 20
;; Ex. n = 20, (f2 n) = 220
(define (f2 n)
  (+ (/ (* n n) 2) 20))

;; n = 2, (f2 n) = 22
(f2 2)
;; n = 9, (f1 n) = (81/2) + 20 = 121/2 = 60 1/2
(f2 9)

;; f3: number -> number
;; calculate the value of the function
;; (2 - (1/n)) for given values of n
;; Ex. n = 0 is an error
;; Ex. n = 0.5, (f3 n) = 0
;; Ex. n = 1, (f3 n) = 1
(define (f3 n)
  (- 2 (/ 1 n)))

;; n = 2, (f3 n) = 3/2
(f3 2)
;; n = 9, (f3 n) = 17/9
(f3 9)


;; Section 2.3

;; uniform wages at $12 an hour
(define (wage hours)
  (* 12 hours))

;; Exercise 2.3.1
;; tax: number -> number
;; calculate the amount of tax on a given amount 
;; of income.
;; Ex. income = 100, (tax income) = 15
;; tax rate is a constant 15%
(define (tax income)
  (* 0.15 income))

;; Tests
(tax 100) 
;; Expected value
15  

;; netpay: number -> number
;; calculate the take-home earnings for a given number of 
;; hours of work.
;; hourly rate is assumed a uniform $12 an hour
;; Ex. hours = 5 (netpay hours) = 51
(define (netpay hours)
  (- (wage hours) (tax (wage hours))))

;; Tests
(netpay 5)
;; Expected value
51

;; Exercise 2.3.2
;; sum-coins: number number number number -> number
;; calculate the total value of a number of pennies, nickels,
;; dimes, and quarters, consuming 4 numbers and returning sum 
;; in dollars.
;; Ex. (sum-coins 1 1 1 1) = 0.41
;; Ex. (sum-coins 100 20 10 4) = 4
(define (sum-coins pennies nickels dimes quarters)
  (+ (/ pennies 100) (/ nickels 20) (/ dimes 10) (/ quarters 4)))

;; Tests:
(sum-coins 1 1 1 1) 
;; Expected value
0.41
(sum-coins 100 20 10 4)
;; Expected value
4

;; Exercise 2.3.3
;; ticket-income: number -> number
;; calculate the raw income from ticket sales, given a number of
;; attendees.
;; Ex. (ticket-income 1) = 5
(define (ticket-income attendees)
  (* 5 attendees))

;; Test
(ticket-income 100)
;; Expected value
500

;; performance-cost: number -> number
;; calculate the cost of putting on a performance, given a number of 
;; attendees of that performance
;; Ex. (performance-cost 0) = 20
;; Ex. (performance-cost 100) = 70
(define (performance-cost attendees)
  (+ 20 (* 0.5 attendees)))

;; Tests
(performance-cost 0) 
;; Expected value
20

(performance-cost 100) 
;; Expected value
70

;; total-profit: number -> number
;; calculate the total profit of putting on a performance for
;; a given number of attendees, using negative numbers to 
;; indicate a loss.
;; Ex. (total-profit 0) = -20
;; Ex. (total-profit 5) = 2.5
(define (total-profit attendees)
  (- (ticket-income attendees) (performance-cost attendees)))

;; Tests:
(total-profit 0)
;; Expected value
-20

(total-profit 5) 
;; Expected value
2.5

;; Section 2.4

;; Exercise 2.4.2
(define (f x)
  (+ x 10))

(define (g x)
  (+ x 10))

(define (h x)
  (+ x 10))
