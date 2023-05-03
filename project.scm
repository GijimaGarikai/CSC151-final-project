(import music)
(import canvas)

(define hi-hat
  (lambda (dur) (note 42 dur)))

(define snare (lambda (dur) (note 38 dur)))


(define bass (lambda (dur) (note 35 dur)))

(define state (vector "white" "rectangle"))

(define swap-color
  (lambda ()
    (vector-set! state 0
     (if (equal? (vector-ref state 0) "white")
          "grey"
          "white"))))
(define beat
  (mod percussion
    (par (seq (par (rest qn) (trigger swap-color))
              (rest qn)
              (par (rest qn) (trigger swap-color))
              (rest qn))
         (seq (hi-hat qn) (hi-hat qn) (hi-hat qn) (hi-hat qn))
         (seq (rest qn) (snare qn) (rest qn) (snare qn))
         (seq (bass qn) (rest qn) (bass qn) (rest qn)))))
; The song
(apply seq (make-list 4 beat))

(define canv (make-canvas 210 100))
(set-canvas-onclick canv
  (lambda (x y)
    (vector-set! state 1
      (if (equal? (vector-ref state 1) "square")
          "circle"
          "square"))))
;;; draw-black-key: void?
;;; position: number?
;;; Renders a black rectangle whose upper-left corner is at (position, 0)
(define draw-black-key 
 (lambda (position)
   (draw-rectangle canv position 0 10 50 "solid" "black")))

;;; draw-white-seg: void?
;;; position: number?
;;; Renders a rectangle whose upper-left corner is at (position, 0)
(define draw-white-seg
 (lambda (position)
  (draw-rectangle canv position 0 1 100 "solid" "grey")))

;;;Incomplete
;;; Piano
(animate-with
  (lambda (time)
    (begin
      (draw-rectangle canv 0 0 210 100 "solid" "white")
      (draw-white-seg 14)
      (draw-black-key 10)
      (draw-white-seg 29)
      (draw-black-key 25)
      (draw-white-seg 44)
      (draw-white-seg 59)
      (draw-black-key 54)
      (draw-white-seg 74)
      (draw-black-key 69)
      (draw-white-seg 89)
      (draw-black-key 84)
      (draw-white-seg 104)
      (draw-white-seg 119)
      (draw-black-key 114)
      (draw-white-seg 134)
      (draw-black-key 129)
      (draw-white-seg 149)
      (draw-white-seg 164)
      (draw-black-key 159)
      (draw-white-seg 179)
      (draw-black-key 174)
      (draw-white-seg 194)
      (draw-black-key 189)
      (if (equal? (vector-ref state 1) "square")
          (draw-rectangle canv 0 0 10 100 "solid" (vector-ref state 0))
          (draw-rectangle canv 0 0 14 100 "solid" (vector-ref state 0))))))
; The canvas
canv



