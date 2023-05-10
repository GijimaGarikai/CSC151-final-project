(import canvas)
(import music)
;;; This code basically creates a sort of colour box where each of the small sqaures 
;;; is a different colour and change along with the music.


;;; colours
;;; vector containing all the colours of our colour wheel
(define colours 
    (vector "red" "orange" "yellow" "green" "blue" "indigo" "violet" "teal" "purple"))

;;; num 
;;; vector that holds the index we're looking at in the colours vector
(define num
    (vector 0))
;;; (update-num) -> void?
;;; increments the value of num by 1
(define update-num
    (lambda ()
        (vector-set! num 0 (+ 1 (vector-ref num 0)))))
;;; (cur_num n) -> void?
;;; n : integer?
;;; returns the nth index from the current value of num.
;;; for example if num is current 3 and you input n=7 then you get 1
;;; since currently there are only 9 colours
(define cur_num
    (lambda (n)
        (modulo (+ n (vector-ref num 0)) (vector-length colours))))
;;; canv
;;; canvas to draw our animations on
(define canv 
    (make-canvas 200 200))
;;; (own-draw-rectangle x-coord y-coord width height colour-num) -> canvas?
;;; x-coord : number?
;;; y-coord : number?
;;; width : number?
;;; height : number?
;;; colour-num : integer? index of colour in colours vector
;;; creates a rectangle canvas with the specified details and colour
(define own-draw-rectangle 
    (lambda (x-coord y-coord width height colour-num)
        (draw-rectangle canv x-coord y-coord width height "solid" (vector-ref colours (cur_num colour-num)))))
; test triggers to check changing colours
(seq (trigger update-num) (note 60 qn)
     ;(trigger update-num) (note 60 qn)
     (trigger update-num) (note 60 qn)
     (trigger update-num) (note 60 qn)
     ;(trigger update-num) (note 60 qn)
     (trigger update-num) (note 60 qn)
     ;(trigger update-num) (note 60 qn)
     (trigger update-num) (note 60 qn)
     (trigger update-num) (note 60 qn))

(animate-with
  (lambda (time)
    (begin
      (draw-rectangle canv 0 0 120 120 "solid" "white")
      (own-draw-rectangle 0 0 10 10 8) (own-draw-rectangle 10 0 10 10 7) (own-draw-rectangle 20 0 10 10 6) (own-draw-rectangle 30 0 10 10 5) (own-draw-rectangle 40 0 10 10 4) (own-draw-rectangle 50 0 10 10 3)
      (own-draw-rectangle 0 10 10 10 7) (own-draw-rectangle 10 10 10 10 7) (own-draw-rectangle 20 10 10 10 6) (own-draw-rectangle 30 10 10 10 5) (own-draw-rectangle 40 10 10 10 4) (own-draw-rectangle 50 10 10 10 3)
      (own-draw-rectangle 0 20 10 10 6) (own-draw-rectangle 10 20 10 10 6) (own-draw-rectangle 20 20 10 10 6) (own-draw-rectangle 30 20 10 10 5) (own-draw-rectangle 40 20 10 10 4) (own-draw-rectangle 50 20 10 10 3)
      (own-draw-rectangle 0 30 10 10 5) (own-draw-rectangle 10 30 10 10 5) (own-draw-rectangle 20 30 10 10 5) (own-draw-rectangle 30 30 10 10 5) (own-draw-rectangle 40 30 10 10 4) (own-draw-rectangle 50 30 10 10 3)
      (own-draw-rectangle 0 40 10 10 4) (own-draw-rectangle 10 40 10 10 4) (own-draw-rectangle 20 40 10 10 4) (own-draw-rectangle 30 40 10 10 4) (own-draw-rectangle 40 40 10 10 4) (own-draw-rectangle 50 40 10 10 3)
      (own-draw-rectangle 0 50 10 10 3) (own-draw-rectangle 10 50 10 10 3) (own-draw-rectangle 20 50 10 10 3) (own-draw-rectangle 30 50 10 10 3) (own-draw-rectangle 40 50 10 10 3) (own-draw-rectangle 50 50 10 10 3))
      ))
canv