;; Section 4.4

;; Exercise 4.4.1

;; interest : number -> number
;; to calculate the interest yielded in one year, on a given deposit 
;; at the standard tiered interest rates.
(define (interest deposit)
  (cond
    [(<= deposit 1000) (* 0.04 deposit)]
    [(<= deposit 5000) (* 0.045 deposit)]
    [else (* 0.05 deposit)]))
  
"Testing interest - Exercise 4.4.1"
(equal? (interest 500) 20)
(equal? (interest 1000) 40)
(equal? (interest 2000) 90)
(equal? (interest 5000) 225)
(equal? (interest 10000) 500)
(cond 
  [(and (equal? (interest 500) 20)
        (equal? (interest 1000) 40)
        (equal? (interest 2000) 90)
        (equal? (interest 5000) 225)
        (equal? (interest 10000) 500)) "Passed"]
  [else "Failed"])

;; Exercise 4.4.2
;; tax : number -> number
;; to calculate the amount of tax owed on a given income, in the
;; existing progressive tax structure.
(define (tax income)
  (cond
    [(<= income 240) 0]
    [(<= income 480) (* 0.15 (- income 240))]
    [else (+ (* 0.28 (- income 480)) (tax 480))]))
"Testing tax - Exercise 4.4.2"    
(equal? (tax 24) 0)
(equal? (tax 240) 0)
(equal? (tax 340) 15)
(equal? (tax 480) 36)
(equal? (tax 580) 64)
(cond 
  [(and (equal? (tax 24) 0)
        (equal? (tax 240) 0)
        (equal? (tax 340) 15)
        (equal? (tax 480) 36)
        (equal? (tax 580) 64))
   "Passed"]
  [else "Failed"])

;; grosspay : number -> number
;; to calculate the gross pay earned in a given number
;; of hours at the standard pay rate.
(define (grosspay hours)
  (* 12 hours))
"Testing grosspay - Exercise 4.4.2"    
(equal? (grosspay 10) 120)
(equal? (grosspay 40) 480)
(cond 
  [(and (equal? (grosspay 10) 120)
        (equal? (grosspay 40) 480))
   "Passed"]
  [else "Failed"])

;; netpay : number -> number 
;; to calculate the net, or take-home, pay earned in a given 
;; number of hours, after standard taxes have been withheld.
(define (netpay hours)
  (- (grosspay hours) (tax (grosspay hours))))
"Testing netpay - Exercise 4.4.2"    
(equal? (netpay 10) 120)
(equal? (netpay 20) 240)
(equal? (netpay 30) 342)
(equal? (netpay 40) 444)
(equal? (netpay 50) 530.4) 
(cond 
  [(and (equal? (netpay 10) 120)
        (equal? (netpay 20) 240)
        (equal? (netpay 30) 342)
        (equal? (netpay 40) 444)
        (equal? (netpay 50) 530.4))
   "Passed"]
  [else "Failed"])

;; Exercise 4.4.3
;; pay-back for $2000 = 0.0025 * 500 + 0.005 * 1000 + 0.0075 * 500
;;                    = 1.25 + 5 + 0.0075 * 500
;;                    = 6.25 + 3.75 
;;                    = 10
;; pay-back for $2600 = 1.25 + 5 + 0.0075 * 1000 + 0.01 * 100
;;                    = 6.25 + 7.50 + 1
;;                    = 14.75

;; Some constants
(define CHARGE-TIER-1 500)
(define CHARGE-TIER-2 1500)
(define CHARGE-TIER-3 2500)

(define RATE-TIER-1 0.0025)
(define RATE-TIER-2 0.005)
(define RATE-TIER-3 0.0075)
(define RATE-TIER-4 0.01)

;; pay-back : number -> number
;; to calculate the amount of money returned by the credit card
;; company, given an amount charged.
(define (pay-back charge)
  (cond 
    [(<= charge CHARGE-TIER-1) (* RATE-TIER-1 charge)]
    [(<= charge CHARGE-TIER-2) 
     (+ (* RATE-TIER-2 (- charge CHARGE-TIER-1)) 
        (pay-back CHARGE-TIER-1))]
    [(<= charge CHARGE-TIER-3) 
     (+ (* RATE-TIER-3 (- charge CHARGE-TIER-2)) 
        (pay-back CHARGE-TIER-2))]
    [else (+ (* RATE-TIER-4 (- charge CHARGE-TIER-3)) 
             (pay-back CHARGE-TIER-3))]))
"Testing pay-back - Exercise 4.4.3"    
(equal? (pay-back 400) 1)
(equal? (pay-back 500) 1.25)
(equal? (pay-back 1400) 5.75)
(equal? (pay-back 1500) 6.25)
(equal? (pay-back 2000) 10)
(equal? (pay-back 2500) 13.75)
(equal? (pay-back 2600) 14.75)
(cond 
  [(and (equal? (pay-back 400) 1)
        (equal? (pay-back 500) 1.25)
        (equal? (pay-back 1400) 5.75)
        (equal? (pay-back 1500) 6.25)
        (equal? (pay-back 2000) 10)
        (equal? (pay-back 2500) 13.75)
        (equal? (pay-back 2600) 14.75))
  "Passed"]
  [else "Failed"])

;; Exercise 4.4.4

;; how-many : number number number -> number
;; to calculate the number of solutions to a proper quadratic
;; equation of the form ax^2 + bx + c = 0, given coefficients
;; a, b, and c
(define (how-many a b c)
  (cond 
    [(= (* b b) (* 4 a c)) 1]
    [(> (* b b) (* 4 a c)) 2]
    [else 0]))
"Testing how-many - Exercise 4.4.4"
(equal? (how-many 1 0 -1) 2)
(equal? (how-many 1 44 -1) 2)
(equal? (how-many 1 -44 -1) 2)
(equal? (how-many 1 0 0) 1)
(equal? (how-many 1 -4 4) 1)
(equal? (how-many 5 1 700) 0)
(cond 
  [(and (equal? (how-many 1 0 -1) 2)
        (equal? (how-many 1 44 -1) 2)
        (equal? (how-many 1 -44 -1) 2)
        (equal? (how-many 1 0 0) 1)
        (equal? (how-many 1 -4 4) 1)
        (equal? (how-many 5 1 700) 0))
   "Passed"]
  [else "Failed"])
;; If the how-many function did not specify only proper quadratic
;; equations the function would have to correctly handle the 
;; degenerate case where a = 0.  If a = 0 and b != 0, then the 
;; equation is linear, with one solution.  If a = b = 0, then the
;; equation is a constant, with infinitely many solutions in x if
;; c = 0.  If c != 0, the equation is false, with 0 solutions in x.

;; How would this change the function?  We would add the following
;; cond-expressions:
;; [(and (= a 0) (= b 0) (= c 0)) "Infinitely many"] 
;; [(and (= a 0) (= b 0)) 0]
;;
;; These would come before the existing cond-expressions.  We 
;; would also need to modify the cond-expression 
;; [(= (* b b) (* 4 a c)) 1], to include the case where a = 0:
;; [(or (= x 0) (= (* b b) (* 4 a c))) 1]
;;  This would result in the following function:

;; how-many2 : number number number -> number
;; to calculate the number of solutions to a 
;; (potentially degenerate) quadratic equation of the 
;; form ax^2 + bx + c = 0, given coefficients a, b, and c
(define (how-many2 a b c)
  (cond 
    [(and (= a 0) (= b 0) (= c 0)) "Infinitely many"] 
    [(and (= a 0) (= b 0)) 0]
    [(or (= a 0) (= (* b b) (* 4 a c))) 1]
    [(> (* b b) (* 4 a c)) 2]
    [else 0]))
"Testing how-many2 - Exercise 4.4.4"
(equal? (how-many2 0 0 0) "Infinitely many")
(equal? (how-many2 0 0 123) 0)
(equal? (how-many2 0 44 -1) 1)
(equal? (how-many2 1 0 -1) 2)
(equal? (how-many2 1 44 -1) 2)
(equal? (how-many2 1 -44 -1) 2)
(equal? (how-many2 1 0 0) 1)
(equal? (how-many2 1 -4 4) 1)
(equal? (how-many2 5 1 700) 0)
(cond 
  [(and (equal? (how-many2 0 0 0) "Infinitely many")
        (equal? (how-many2 0 0 123) 0)
        (equal? (how-many2 0 44 -1) 1)
        (equal? (how-many2 1 0 -1) 2)
        (equal? (how-many2 1 44 -1) 2)
        (equal? (how-many2 1 -44 -1) 2)
        (equal? (how-many2 1 0 0) 1)
        (equal? (how-many2 1 -4 4) 1)
        (equal? (how-many2 5 1 700) 0))
   "Passed"]
  [else "Failed"])
