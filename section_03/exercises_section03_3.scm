;; Section 3.3

;; given approximation of pi
(define PI 3.14159)

;; Exercise 3.3.1
;; Set of constants from the conversion table in the book.
(define CM-PER-INCH 2.54)
(define INCHES-PER-FOOT 12)
(define FEET-PER-YARD 3)
(define YARDS-PER-ROD 5.5)
(define RODS-PER-FURLONG 40)
(define FURLONGS-PER-MILE 8)

;; inches->cm : number -> number
;; to calculate the number of cm equivalent to the length expressed
;; by the given number of inches
;; Ex. 1 inch = 2.54 cm
(define (inches->cm inches)
  (* inches CM-PER-INCH))
;; Test:
(= (inches->cm 1) 2.54)

;; feet->inches : number -> number
;; to calculate the number of inches equivalent to the 
;; length expressed by the given number of feet
;; Ex. 1 foot = 12 inches
(define (feet->inches feet)
  (* feet INCHES-PER-FOOT))
;; Test:
(= (feet->inches 1) 12)

;; yards->feet : number -> number
;; to calculate the number of feet equivalent to the length expressed
;; by the given number of yards
;; Ex. 1 yard = 3 feet
(define (yards->feet yards)
  (* yards FEET-PER-YARD))
;; Test:
(= (yards->feet 1) 3)

;; rods->yards : number -> number
;; to calculate the number of yards equivalent to the length 
;; expressed by the given number of rods
;; Ex. 1 rod = 5.5 yards
(define (rods->yards rods)
  (* rods YARDS-PER-ROD))
;; Test:
(= (rods->yards 1) 5.5)

;; furlongs->rods : number -> number
;; to calculate the number of rods equivalent to the length expressed
;; by the given number of furlongs
;; Ex. 1 furlong = 40 yards
(define (furlongs->rods furlongs)
  (* furlongs RODS-PER-FURLONG))
;; Test:
(= (furlongs->rods 1) 40)

;; miles->furlongs : number -> number
;; to calculate the number of furlongs equivalent to the length 
;; expressed by the given number of miles
;; Ex. 1 mile = 8 furlongs
(define (miles->furlongs miles)
  (* miles FURLONGS-PER-MILE))
;; Test:
(= (miles->furlongs 1) 8)

;; feet->cm : number -> number
;; to calculate the number of cm equivalent to the 
;; length expressed by the given number of feet
;; Ex. 1 foot = 12 inches = 12 * 2.54 cm = 30.48 cm
(define (feet->cm feet)
  (inches->cm (feet->inches feet)))
;; Test:
(= (feet->cm 1) 30.48)

;; yards->cm : number -> number
;; to calculate the number of feet equivalent to the length expressed
;; by the given number of yards
;; Ex. 1 yard = 3 feet = 3 * 30.48 cm = 91.44 cm
(define (yards->cm yards)
  (feet->cm (yards->feet yards)))
;; Test:
(= (yards->cm 1) 91.44)

;; rods->feet : number -> number
;; to calculate the number of feet equivalent to the length 
;; expressed by the given number of rods
;; Ex. 1 rod = 5.5 yards = 5.5 * 3 feet = 16.5 feet
(define (rods->feet rods)
  (yards->feet (rods->yards rods)))
;; Test:
(= (rods->feet 1) 16.5)

;; rods->inches : number -> number
;; to calculate the number of inches equivalent to the length 
;; expressed by the given number of rods
;; Ex. 1 rod = 5.5 yards = 5.5 * 3 feet = 5.5 * 3 * 12 inches 
;; = 198 inches
(define (rods->inches rods)
  (feet->inches (rods->feet rods)))
;; Test:
(= (rods->inches 1) 198)

;; miles->feet : number -> number
;; to calculate the number of inches in a given number of miles
;; Ex. 1 mile = 8 furlongs = 40 * 8 rods = 320 rods = 320 * 5.5 yards
;;     = 1760 yards = 1760 * 3 feet = 5280 feet = 5280 * 12 inches 
;;     = 52800 + 10560 inches = 63360 inches
(define (miles->inches miles)
  (rods->inches (furlongs->rods (miles->furlongs miles))))
;; Test: 
(= (miles->inches 1) 63360)

;; Exercise 3.3.2
;; area-of-disc : number -> number
;; to calculate the area of a disc given the disc's radius
;; Ex. radius = 1, area = PI * radius^2 = PI
(define (area-of-disc radius)
  ( * PI radius radius))
;; Test: 
(= (area-of-disc 1) PI)

;; volume-of-cylinder : number number -> number
;; to calculate the volume of a cylinder, given the radius of 
;; the cylinder's base, and the height of the cylinder.
;; The volume of a cylinder is the area of the base times 
;; the height of the cylinder
;; Ex. The area of cylinder of unit radius & height is 
;;     (1 * (PI * 1^2)) = PI
(define (volume-of-cylinder base-radius height)
  (* height (area-of-disc base-radius)))
;; Test: 
(= (volume-of-cylinder 1 1) PI)

;; Exercise 3.3.3
;; circumfrence : number -> number
;; to calculate the circumfrence of a circle of given radius
;; Ex. the circumfrence of a unit diameter circle is
;; (* 2 PI radius) = (* 2 PI 1/2) = PI
(define (circumfrence radius)
  (* 2 radius PI))
;; Test: 
(= (circumfrence 1/2) PI)

;; area-of-cylinder : number number -> number
;; to calculate the surface area of a cylinder, given the radius of
;; the cylinder's base, and the height of the cylinder.
;; The surface area of a cylinder is the height of the cylinder times
;; the circumfrence of the the base, plus twice the area of the base.
;; Ex. A cylinder of unit height and radius would have a surface area
;;     of (2 * PI * 1) + 2 * PI = 4 PI
(define (area-cylinder base-radius height)
  (+ (* height (circumfrence base-radius))
     (* 2 (area-of-disc base-radius))))
;; Test: 
(= (area-cylinder 1 1) (* 4 PI))

;; Exercise 3.3.4
;; area-pipe : number number number -> number
;; to calculate the surface area of a pipe of given inner diameter, 
;; wall thickness, and length.
;; The surface area of a pipe is the surface area of the outside plus
;; the surface area of the inside, plus the surface area of the 
;; edge of the pipe.  This is the surface area of two coaxial 
;; cylinders of equal length and differing base radius, with the 
;; endcaps of the inner cylinder removed from the area of both the
;; inner and the outer cylinders.  The outer cylinder has a base
;; radius of half the inner diameter plus the thickness of the 
;; walls of the pipe.
;; Ex. a pipe of length 10, with an inner radius of 1 and a 
;;     wall thickness of 1 would have a surface area of 
;;     (40 PI + 2(PI 2^2)) + (20 PI + 2(PI 1^2)) - 4 (PI 1^2) =
;;     48 PI + 22 PI - 4 PI = 66 PI
(define (area-pipe inner-radius wall-thickness length)
  (+ (- (area-cylinder (+ inner-radius wall-thickness) 
                           length)
         (* 2 (area-of-disc inner-radius)))
     (- (area-cylinder inner-radius length)
        (* 2 (area-of-disc inner-radius)))))
;; Test:
(= (area-pipe 1 1 10) (* 66 PI))

;; area-pipe-single : number number number -> number
;; to calculate the surface area of a pipe of given inner diameter,
;; wall thickness, and length without relying on any helper functions
;; Ex. a pipe of length 10, with an inner diameter of 2 and a 
;;     wall thickness of 1 would have a surface area of 
;;     (40 PI + 2(PI 2^2)) + (20 PI + 2(PI 1^2)) - 4 (PI 1^2) =
;;     48 PI + 22 PI - 4 PI = 66 PI
(define (area-pipe-single inner-diameter wall-thickness length)
  (* 2 PI (+ wall-thickness length) 
     (+ (* 2 inner-diameter) wall-thickness)))
;; Tests:
(= (area-pipe-single 1 1 10) (* 66 PI))
(= (area-pipe-single 12 3 140) (area-pipe 12 3 140))

;; Exercise 3.3.5
;; displacement : number number number -> number
;; to calculate the displacement of an object, given an initial 
;; velocity, a constant acceleration, and a length of time over which
;; to calculate the effects of both velocity and acceleration.
;; Ex. s = v*t + (a*t^2)/2 
;; Ex. v = 1, a = 1, t = 10 -> s = 10 + 10^2/2 = 10 + 50 = 60
;; Ex. v = 1, a = 0, t = 10 -> s = 10
;; Ex. v = 0, a = 1, t = 10 -> s = 50
;; (Because I remember my HS-level mechanics)
(define (displacement initial-velocity acceleration time)
  (+ (* initial-velocity time) (* 0.5 acceleration time time)))
;; Tests:
(= (displacement 1 1 10) 60)
(= (displacement 1 0 10) 10)
(= (displacement 0 1 10) 50)

;; velocity : number number number -> number
;; to calculate the velocity of an object under constant 
;; acceleration after a given time, with given initial velocity
;; Ex. v = vi + a*t
;; Ex. vi = 1, a = 1, t = 10 -> v = 11
;; Ex. vi = 1, a = 0, t = 10 -> v = 1
;; Ex. vi = 0, a = 1, t = 10 -> v = 10
;; (Because I remember my HS-level mechanics)
(define (velocity initial-velocity acceleration time)
  (+ initial-velocity (* acceleration time)))
;; Tests:
(= (velocity 1 1 10) 11)
(= (velocity 1 0 10) 1)
(= (velocity 0 1 10) 10)

;; speed : number number -> number
;; to calculate the speed of an object starting from rest under a 
;; constant accelleration for a length of time.
;; Ex. speed = a*t
;; Ex. a = 1, t = 10 -> speed = 10
;; Ex. a = 0, t = 10 -> speed = 0
;; Ex. a = 1, t = 0 -> speed = 0
(define (speed acceleration time)
  (* acceleration time))
;; Tests:
(= (speed 1 10) 10)
(= (speed 0 10) 0)
(= (speed 1 0) 0)

;; Defining an acceleration constant because the problem is written
;; stupid.  It's in meters per second-squared because I <3 the SI.
;; About 2.5 g's gross, say, so about 1.5 g's net, so 14.72
(define CONSTANT-ACCEL 14.72)

;; height : number -> number
;; to calculate the height of a constantly accellerating rocket that 
;; accelerates only in the vertical direction after a given time.
;; Ex. time = 0 -> height = 0 
;; Ex. time = 1 -> height = CONSTANT-ACCEL/2
;; Height is in meters because the SI rules.  \m/
(define (height time)
  (* 1/2 (speed CONSTANT-ACCEL time) time))
;; Tests:
(= (height 0) 0)
(= (height 1) (/ CONSTANT-ACCEL 2))

(= (height 10) (displacement 0 CONSTANT-ACCEL 10))

;; Exercise 3.3.6
;; the scaling factor between Fahrenheit degrees and Celsius degrees
(define F-TO-C-DEGREE-RATIO 9/5)

;; Fahrenheit->Celsius : number -> number
;; convert a temperature in Fahrenheit degress to the 
;; equivalent temperature in Celsius degrees
;; Ex. (Fahrenheit->Celsius -40) should return -40
(define (Fahrenheit->Celsius temp)
  ;; There are 5 Celsius degress for every 9 Fahrenheit
  ;; degrees, and Fahrenheit starts at 32 instead of 0.
  (/ (- temp 32) F-TO-C-DEGREE-RATIO))
;; Tests:
(= (Fahrenheit->Celsius -40) -40)

;; Celsius->Fahrenheit : number -> number
;; to convert a Celsius temperature to the equivalent temperature 
;; in the Fahrenheit system.
;; Ex. (Celsius->Fahrenheit -40) should return -40
(define (Celsius->Fahrenheit temp)
  (+ 32 (* temp F-TO-C-DEGREE-RATIO)))
;; Tests:
(= (Celsius->Fahrenheit -40) -40)

;; I : number  ->  number
;; to convert a Fahrenheit temperature to Celsius and back 
(define (I f)
  (Celsius->Fahrenheit (Fahrenheit->Celsius f)))