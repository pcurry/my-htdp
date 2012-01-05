;; Section 4.3

;; Exercise 4.3.1
;; The left cond expression is legal, the right cond expression 
;; is illegal.  The right expression is illegal because the second 
;; cond clause has no answer expression, only a conditional 
;; expression.

;; The example illegal expression is illegal because the second
;; cond clause contains neither a conditional expression, nor an
;; answer expression.  It is merely a function application of a 
;; a primitive function, *, to two arguments - which is not a valid
;; cond clause.

;; Exercise 4.3.2

;; (cond
;;   [(<= n 1000) .040]
;;   [(<= n 5000) .045]
;;   [(<= n 10000) .055]
;;   [(> n 10000) .060])

;; a) n = 500
;; (cond
;;   [(<= n 1000) .040]
;;   [(<= n 5000) .045]
;;   [(<= n 10000) .055]
;;   [(> n 10000) .060]) =>
;;   
;;   [(<= 500 1000) .040] =>
;;   [true .040] => 0.040
;; The value of the cond is 0.040 when n = 500

;; b) n = 2800
;; (cond
;;   [(<= n 1000) .040]
;;   [(<= n 5000) .045]
;;   [(<= n 10000) .055]
;;   [(> n 10000) .060]) =>
;;   
;;   [(<= 2800 1000) .040] =>
;;   [false .040] => 
;;   [(<= 2800 5000) .045] =>
;;   [true .045] => .045
;; The value of the cond is 0.045 when n = 2800

;; c) n = 15000
;; (cond
;;   [(<= n 1000) .040]
;;   [(<= n 5000) .045]
;;   [(<= n 10000) .055]
;;   [(> n 10000) .060]) =>
;;   
;;   [(<= 15000 1000) .040] =>
;;   [false .040] => 
;;   [(<= 15000 5000) .045] =>
;;   [false .045] => 
;;   [(<= 15000 10000) .055] =>
;;   [false .055] =>
;;   [(> 15000 10000) .060]) =>
;;   [true .060] => .060
;; The value of the cond is 0.060 when n = 15000

;; Exercise 4.3.3

;; (cond
;;   [(<= n 1000) (* .040 1000)]
;;   [(<= n 5000) (+ (* 1000 .040) 
;; 		  (* (- n 1000) .045))]
;;   [else (+ (* 1000 .040) 
;; 	   (* 4000 .045)
;; 	   (* (- n 10000) .055))])

;; a) n = 500
;; (cond
;;   [(<= n 1000) (* .040 1000)]
;;   [(<= n 5000) (+ (* 1000 .040) 
;; 		  (* (- n 1000) .045))]
;;   [else (+ (* 1000 .040) 
;; 	   (* 4000 .045)
;; 	   (* (- n 10000) .055))]) =>

;;   [(<= 500 1000) (* .040 1000)] =>
;;   [true (* .040 1000)] => 40
;; The value of the cond is 40 when n = 500

;; b) n = 2800
;; (cond
;;   [(<= n 1000) (* .040 1000)]
;;   [(<= n 5000) (+ (* 1000 .040) 
;; 		  (* (- n 1000) .045))]
;;   [else (+ (* 1000 .040) 
;; 	   (* 4000 .045)
;; 	   (* (- n 10000) .055))]) =>

;;   [(<= 2800 1000) (* .040 1000)] =>
;;   [false (* .040 1000)] => 
;;   [(<= 2800 5000) (+ (* 1000 .040) 
;; 		  (* (- n 1000) .045))] =>
;;   [true (+ (* 1000 .040) 
;; 		  (* (- n 1000) .045))] =>
;;   (+ 40 (* 1800 0.045)) => (+ 40 81) => 121
;; The value of the cond is 121 when n = 2800

;; c) n = 15000
;; (cond
;;   [(<= n 1000) (* .040 1000)]
;;   [(<= n 5000) (+ (* 1000 .040) 
;; 		  (* (- n 1000) .045))]
;;   [else (+ (* 1000 .040) 
;; 	   (* 4000 .045)
;; 	   (* (- n 10000) .055))]) =>

;;   [(<= 15000 1000) (* .040 1000)] =>
;;   [false (* .040 1000)] => 
;;   [(<= 15000 5000) (+ (* 1000 .040) 
;; 		  (* (- n 1000) .045))] =>
;;   [false (+ (* 1000 .040) 
;; 		  (* (- n 1000) .045))] =>
;;   [else (+ (* 1000 .040) 
;; 	   (* 4000 .045)
;; 	   (* (- n 10000) .055))]) =>
;;   (+ 40 180 (* (- 15000 10000) .055)) =>
;;   (+ 40 180 275) => 495
;; The value of the cond is 495 when n = 15000
