;; Exercises for Section 3

;; profit : number -> number
;; to compute the profit of a performence as the difference
;; between revenue and costs at a given ticket price
;; (define (profit ticket-price) ...)

;; revenue : number -> number 
;; to compute the revenue, given a ticket price
;; (define (revenue ticket-price) ...)

;; cost : number -> number
;; to compute the costs, given a ticket price
;; (define (cost ticket-price) ...)

;; attendees : number -> number
;; to compute the number of attendees at a given ticket price
;; (define (attendees ticket-price) ...)

;; Exercise 3.1.1
;; attendees : number -> number
;; to compute the number of attendees at a given ticket price
;; Ex. at a price of $5, 120 people attend, so 
;; (attendees 5) = 120
;; Ex. at $4.90 a ticket, 135 people attend - (attendees 4.9) = 135
;; Ex. (attendees 4) = 120 + 15 * (1 / 0.1) = 270
;; Ex. (attendees 3) = 120 + 15 * (2 / 0.1) = 420
;; Ex. (attendees 5.8) = 120 + (15 * (-0.8 / 0.1)) = 0
(define (attendees ticket-price) 
  (+ 120 
     (* 15
        (/ (- 5 ticket-price) 0.1))))
;; Tests:
(= (attendees 5) 120)
(= (attendees 4.9) 135)
(= (attendees 4) 270)
(= (attendees 3) 420)
(= (attendees 5.8) 0)

;; Exercise 3.1.2
;; cost-per : number -> number
;; to compute the cost of a performence given a number of
;; attendees.
;; Ex. 0 attendees only cost the fixed cost, $180
;; Ex. 100 attendees cost $180 + $0.04 per attendee = $184
(define (cost-per attendees)
  (+ 180 (* 0.04 attendees)))
;; Tests:
(= (cost-per 0) 180)
(= (cost-per 100) 184)

;; cost : number -> number
;; to compute the costs, given a ticket price
;; Ex. ticket price of 5.8 should mean 0 attendees, which will 
;; have the flat cost of 180
;; Ex. ticket-price = 5 -> 120 attendees -> cost 180 + 0.04 * 120
;; = 184.80
(define (cost ticket-price) 
  (cost-per (attendees ticket-price)))
;; Tests:
(= (cost 5.8) 180)
(= (cost 5) 184.8)

;; revenue : number -> number 
;; to compute the revenue, given a ticket price
;; Ex. 120 attendees @ $5 a ticket = $600
;; Ex. 0 attendees @ 5.80 a ticket = $0
(define (revenue ticket-price) 
  (* ticket-price (attendees ticket-price)))
;; Tests:
(= (revenue 5) 600)
(= (revenue 5.8) 0)

;; profit : number -> number
;; to compute the profit of a performence as the difference
;; between revenue and costs at a given ticket price
;; Ex. (profit 5) = 600 - 184.8 = 415.2
;; Ex. (profit 5.8) = 0 - 180 = -180 (ouch, a loss!)
(define (profit ticket-price) 
  (- (revenue ticket-price) (cost ticket-price)))
;; Tests:
(= (profit 5) 415.2)
(= (profit 5.8) -180)

(profit 5)
(profit 4)
(profit 3)

;; $3 a ticket is the most profitable price of tickets in the price
;; range given.  Assuming profit to be a differentiable function,
;; calculus tells us that the optimal ticket price is 
;; 2.92 per ticket.  Demonstration available on request.
(attendees 2.92)
(revenue 2.92)
(cost 2.92)
(profit 2.92)

;; Exercise 3.1.3
;; ugly-profit : number -> number
;; to calculate the profit of a performence given a ticket price,
;; in a less maintainable fashion
(define (ugly-profit price)
  (- (* (+ 120
           (* (/ 15 0.10)
              (- 5.00 price)))
        price)
     (+ 180 
        (* 0.04
           (+ 120
              (* (/ 15 0.10)
                 (- 5.00 price)))))))
;; Tests:
(= (profit 5) (ugly-profit 5))
(= (profit 4) (ugly-profit 4))
(= (profit 3) (ugly-profit 3))

;; quadratic-profit : number -> number
;; to calculate the profit of a performence given a ticket price,
;; using the quadratic equation that the given relationships 
;; reduces to.  Arguably completely incomprehensible.
(define (quadratic-profit x)
  (- (* 876 x) (+ (* 150 (* x x)) 214.8)))
;; Tests:
(= (profit 5) (quadratic-profit 5))
(= (profit 4) (quadratic-profit 4))
(= (profit 3) (quadratic-profit 3))


;; Exercise 3.1.4
;; cost-per2 : number -> number
;; to compute the cost of a performence given a number of
;; attendees.
;; Ex. 0 attendees cost nothing = 0
;; Ex. 100 attendees cost $180 + $0.04 per attendee = $184
(define (cost-per2 attendees)
  (* 1.50 attendees))
;; Tests:
(= (cost-per2 0) 0)
(= (cost-per2 100) 150)

;; cost2 : number -> number
;; to compute the costs, given a ticket price
;; Ex. ticket price of 5.8 should mean 0 attendees, which will 
;; cost nothing.
;; Ex. ticket-price = 5 -> 120 attendees -> cost 180
(define (cost2 ticket-price) 
  (cost-per2 (attendees ticket-price)))
;; Tests:
(= (cost2 5.8) 0)
(= (cost2 5) 180)

;; profit2 : number -> number
;; to compute the profit of a performence as the difference
;; between revenue and costs at a given ticket price
;; Ex. (profit2 5) = 600 - 180 = 420
;; Ex. (profit2 5.8) = 0 
(define (profit2 ticket-price) 
  (- (revenue ticket-price) (cost2 ticket-price)))
;; Tests:
(= (profit2 5) 420)
(= (profit2 5.8) 0)

(profit2 5)
(profit2 4)
(profit2 3)

;; ugly-profit2 : number -> number
;; to calculate the profit of a performence given a ticket price,
;; in a less maintainable fashion
(define (ugly-profit2 price)
  (* (+ 120
        (* (/ 15 0.10)
           (- 5.00 price)))
     (- price 1.5)))
;; Tests:
(= (profit2 5) (ugly-profit2 5))
(= (profit2 4) (ugly-profit2 4))
(= (profit2 3) (ugly-profit2 3))

;; On the whole, his show now costs more to run per attendee.  Thus 
;; it is less profitable across the board, even with the elimination
;; of the fixed costs.



;; Section 3.2

;; given approximation of pi
(define PI 3.14159)

;; Exercise 3.2.1

;; the number of attendees at $5 a ticket
(define DEFAULT-ATTENDEES 120)

;; the par ticket price to calculate from
(define PAR-TICKET-PRICE 5)

;; unit change in price which makes a difference in attendence
(define UNIT-CHANGE-IN-PRICE 0.1)

;; change in attendees per unit change in price
(define RATE-OF-ATTENDEE-CHANGE 15)

;; attendees2 : number -> number
;; to compute the number of attendees at a given ticket price,
;; using variable declaration in the program design.
;; Ex. at a price of $5, 120 people attend, so 
;; (attendees2 5) = 120
;; Ex. at $4.90 a ticket, 135 people attend - (attendees 4.9) = 135
;; Ex. (attendees2 4) = 120 + 15 * (1 / 0.1) = 270
;; Ex. (attendees2 3) = 120 + 15 * (2 / 0.1) = 420
;; Ex. (attendees2 5.8) = 120 + (15 * (-0.8 / 0.1)) = 0
(define (attendees2 ticket-price) 
  (+ DEFAULT-ATTENDEES
     (* RATE-OF-ATTENDEE-CHANGE
        (/ (- PAR-TICKET-PRICE ticket-price) 
           UNIT-CHANGE-IN-PRICE))))
;; Tests:
(= (attendees 5) 120)
(= (attendees 4.9) 135)
(= (attendees 4) 270)
(= (attendees 3) 420)
(= (attendees 5.8) 0)

;; Fixed cost of a performence
(define FIXED-COST 180)

;; Incremental cost per attendee
(define INCREMENTAL-COST 0.04)

;; cost-per3 : number -> number
;; to compute the cost of a performence given a number of
;; attendees.
;; Ex. 0 attendees only cost the fixed cost, $180
;; Ex. 100 attendees cost $180 + $0.04 per attendee = $184
(define (cost-per3 attendees)
  (+ FIXED-COST (* INCREMENTAL-COST attendees)))
;; Tests:
(= (cost-per3 0) 180)
(= (cost-per3 100) 184)

;; cost3 : number -> number
;; to compute the costs, given a ticket price
;; Ex. ticket price of 5.8 should mean 0 attendees, which will 
;; have the flat cost of 180
;; Ex. ticket-price = 5 -> 120 attendees -> cost 180 + 0.04 * 120
;; = 184.80
(define (cost3 ticket-price) 
  (cost-per3 (attendees ticket-price)))
;; Tests:
(= (cost3 5.8) 180)
(= (cost3 5) 184.8)

;; profit3 : number -> number
;; to compute the profit of a performence as the difference
;; between revenue and costs at a given ticket price
;; Ex. (profit3 5) = 600 - 184.8 = 415.2
;; Ex. (profit3 5.8) = 0 - 180 = -180 (ouch, a loss!)
(define (profit3 ticket-price) 
  (- (revenue ticket-price) (cost3 ticket-price)))
;; Tests:
(= (profit3 5) 415.2)
(= (profit3 5.8) -180)

(profit3 5)
(profit3 4)
(profit3 3)



