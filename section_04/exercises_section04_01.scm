;; Section 4 Exercises

;; Exercises 4.1.1
;; 1) (and (> 4 3) (<= 10 100)) = (and true true) = true
;; 2) (or (> 4 3) (= 10 100)) = (or true false) = true
;; 3) (not (= 2 3)) = (not false) = true

;; Exercises 4.1.2
;; 1) (> x 3)   
;;     a. x = 4, (> 4 3), true
;;     b. x = 2, (> 2 3), false
;;     c. x = 7/2, (> 7/2 3), true
;;
;; 2) (and (> 4 x) (> x 3))
;;     a. x = 4, (and (> 4 4) (> 4 3)) => (and false true) => false
;;     b. x = 2, (and (> 4 2) (> 2 3)) => (and true false) => false
;;     c. x = 7/2, (and (> 4 7/2) (> 7/2 3)) => (and true true) =>
;;        true

