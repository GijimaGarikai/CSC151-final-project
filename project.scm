(import music)
(import canvas)



(define state
 (vector "white" "white" "white" "white" "white" "white" "white" "white" "white" "white" "white" "white" "white" "white" "white"))

;;; (swap-color-white-key-one )
;;; swaps the white color of the the first key to grey which corresponds to index 0

; the other 13 functions like this corresponds to each key on the piano

(define swap-color-white-key-one
  (lambda ()
    (vector-set! state 0
     (if (equal? (vector-ref state 0) "white")
          "grey"
          "white"))))


(define swap-color-white-key-two
  (lambda ()
    (vector-set! state 1
     (if (equal? (vector-ref state 1) "white")
          "grey"
          "white"))))

(define swap-color-white-key-three
  (lambda ()
    (vector-set! state 2
     (if (equal? (vector-ref state 2) "white")
          "grey"
          "white"))))
          
(define swap-color-white-key-four
  (lambda ()
    (vector-set! state 3
     (if (equal? (vector-ref state 3) "white")
          "grey"
          "white"))))

          
(define swap-color-white-key-five
  (lambda ()
    (vector-set! state 4
     (if (equal? (vector-ref state 4) "white")
          "grey"
          "white"))))

          
(define swap-color-white-key-six
  (lambda ()
    (vector-set! state 5
     (if (equal? (vector-ref state 5) "white")
          "grey"
          "white"))))

          
(define swap-color-white-key-seven
  (lambda ()
    (vector-set! state 6
     (if (equal? (vector-ref state 6) "white")
          "grey"
          "white"))))

          
(define swap-color-white-key-eight
  (lambda ()
    (vector-set! state 7
     (if (equal? (vector-ref state 7) "white")
          "grey"
          "white"))))

          
(define swap-color-white-key-nine
  (lambda ()
    (vector-set! state 8
     (if (equal? (vector-ref state 8) "white")
          "grey"
          "white"))))

(define swap-color-white-key-ten
  (lambda ()
    (vector-set! state 9
     (if (equal? (vector-ref state 9) "white")
          "grey"
          "white"))))

(define swap-color-white-key-eleven
  (lambda ()
    (vector-set! state 10
     (if (equal? (vector-ref state 10) "white")
          "grey"
          "white"))))

(define swap-color-white-key-twelve
  (lambda ()
    (vector-set! state 11
     (if (equal? (vector-ref state 11) "white")
          "grey"
          "white"))))

(define swap-color-white-key-thirteen
  (lambda ()
    (vector-set! state 12
     (if (equal? (vector-ref state 12) "white")
          "grey"
          "white"))))


(define swap-color-white-key-fourteen
  (lambda ()
    (vector-set! state 13
     (if (equal? (vector-ref state 13) "white")
          "grey"
          "white"))))


(define canv (make-canvas 210 100))
(define canvas (make-canvas 210 100))

;;; (play-white-key x-coord colour-index)-> void?
;;; x-coord: number?
;;; colour-index: integer?
;;; plays the key at x-coord on the piano corresponding to colour-index
(define play-white-key
 (lambda (x-coord colour-index)
   (draw-rectangle canv x-coord 0 14 100 "solid" (vector-ref state colour-index))))


(define black-keys  
  (vector "black" "black" "black" "black" "black" "black" "black" "black" "black" "black" ))

;;; (swap-color-black-key-one)-> void?
;;;swaps the black color of the the first black key to purple which corresponds to index 0

; the other 9 keys correspond to each index of the black keys
(define swap-color-black-key-one
 (lambda ()
  (vector-set! black-keys 0
   (if (equal? (vector-ref black-keys 0) "black")
       "purple"
       "black"))))

(define swap-color-black-key-two
 (lambda ()
  (vector-set! black-keys 1
   (if (equal? (vector-ref black-keys 1) "black")
       "purple"
       "black"))))

(define swap-color-black-key-three
 (lambda ()
  (vector-set! black-keys 2
   (if (equal? (vector-ref black-keys 2) "black")
       "purple"
       "black"))))

(define swap-color-black-key-four
 (lambda ()
  (vector-set! black-keys 3
   (if (equal? (vector-ref black-keys 3) "black")
       "purple"
       "black"))))

(define swap-color-black-key-five
 (lambda ()
  (vector-set! black-keys 4
   (if (equal? (vector-ref black-keys 4) "black")
       "purple"
       "black"))))

(define swap-color-black-key-six
 (lambda ()
  (vector-set! black-keys 5
   (if (equal? (vector-ref black-keys 5) "black")
       "purple"
       "black"))))

(define swap-color-black-key-seven
 (lambda ()
  (vector-set! black-keys 6
   (if (equal? (vector-ref black-keys 6) "black")
       "purple"
       "black"))))

(define swap-color-black-key-eight
 (lambda ()
  (vector-set! black-keys 7
   (if (equal? (vector-ref black-keys 7) "black")
       "purple"
       "black"))))

(define swap-color-black-key-nine
 (lambda ()
  (vector-set! black-keys 8
   (if (equal? (vector-ref black-keys 8) "black")
       "purple"
       "black"))))

(define swap-color-black-key-ten
 (lambda ()
  (vector-set! black-keys 9
   (if (equal? (vector-ref black-keys 9) "black")
       "purple"
       "black"))))

;;; (play-black-key x-coord colour-index)-> void?
;;; ;;; x-coord: number?
;;; colour-index: integer?
;;; plays the key at x-coord on the piano corresponding to colour-index

(define play-black-key 
 (lambda (x-coord colour-index)
  (draw-rectangle canv x-coord 0 10 50 "solid" (vector-ref black-keys colour-index))))


;;; draw-white-seg: void?
;;; position: number?
;;; Renders a rectangle whose upper-left corner is at (position, 0)
(define draw-white-seg
 (lambda (position)
  (draw-rectangle canv position 0 1 100 "solid" "grey")))


(animate-with 
 (lambda (time)
  (begin 
   (draw-rectangle canv 0 0 210 100 "solid" "white")
   (play-white-key 0 0)
   (draw-white-seg 14)
   (play-white-key 15 1)
   (play-black-key 10 0)
   (play-white-key 30 2)
   (draw-white-seg 29) 
   (play-black-key 25 1)
   (play-white-key 45 3)
   (draw-white-seg 44)
   (play-white-key 60 4)
   (draw-white-seg 59)
  (play-black-key 54 2)
   (play-white-key 75 5)
   (draw-white-seg 74)
  (play-black-key 69 3)
   (play-white-key 90 6)
   (draw-white-seg 89)
   (play-black-key 84 4)
   (play-white-key 105 7)
   (draw-white-seg 104)
  (play-white-key 120 8)
  (draw-white-seg 119)
  (play-black-key 114 5)
  (play-white-key 135 9)
  (draw-white-seg 134)
   (play-black-key 129 6)
  (play-white-key 150 10)
  (draw-white-seg 149)
  (play-white-key 165 11)
  (draw-white-seg 164)
   (play-black-key 159 7)
  (play-white-key 180 12)
  (draw-white-seg 179)
   (play-black-key 174 8)
   (play-white-key 195 13)
   (draw-white-seg 194)
    (play-black-key 189 9))))





(animate-with 
 (lambda (time)
  (begin 
   (draw-rectangle canvas 0 0 210 100 "solid" "white")
    (if ))))

; The canvas
canv


