(import music)
(import canvas)


(define canv (make-canvas 750 100))


(define piano-white-key-list 
 (list 1 3 5 6 8 10 12 13 15 17 18 20 22 24 25 27 29 30 32 34 36 37 39 41 43 44 46 48 49 51 53 55 56 58 60 61 63 65 67 68 70 72 73 75 77 79 80 82 84 85 87 89 91))

(define piano-black-key-list 
 (list 2 4 7 9 11 14 16 19 21 23 26 28 31 33 35 38 40 43 45 47 50 52 55 57 59 62 64 67 69 71 74 76 79 81 83 ) )

(define piano-white-key-vec 
 (make-vector 51 0))

(define piano-black-key-vec
  (make-vector 35 0))

;;; (contains x lst)-> boolean?
;;; lst: list?
;;; x: number?
;;; Returns true iff x is in lst
(define contains 
 (lambda (x lst)
  (match lst
  [null #f]
  [(cons head tail) (or (equal? head x) (contains x tail))])))

;;; (play-piano key)-> void?
;;; key; number?
;;; Thus function sets the value at the index of the given key to 1 (in the piano vector) if it is found in 
;;; piano-black-key-list. If not it is set to 0
; (define play-piano
;  (lambda (key)
;    (if (contains key piano-black-key-list) 
;        (if (= 0 (vector-ref piano-black-key-vec (index-of key  piano-black-key-list)))
;            (vector-set! piano-black-key-vec (index-of key piano-black-key-list) 1)
;            (vector-set! piano-black-key-vec (index-of key piano-black-key-list) 0))
;        (if (= 0 (vector-ref piano-white-key-vec (index-of key piano-white-key-list)))
;            (vector-set! piano-white-key-vec (index-of key piano-white-key-list) 1)
;            (vector-set! piano-white-key-vec (index-of key piano-white-key-list) 0)))))


; ;; This function is currently not doing what it is supposed to do. only the lines are showing but everything else is not
; ;; 
; (animate-with 
;  (lambda (time)
;   (begin 
;     (draw-rectangle canv 0 0 2000 100 "solid" "white")
;     (map 
;         (lambda (x) 
;             (begin (if (= (vector-ref piano-white-key-vec x) 1)
;                     (draw-rectangle canv  (* 15 x) 0 14 100 "solid" "purple")
;                     (draw-rectangle canv  (* 15 x) 0 14 100 "solid" "white"))
;                 (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey")))
;         piano-white-key-list)
;     (map 
;         (lambda (x) 
;          (if (equal? (vector-ref piano-black-key-vec x) 1)
;              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "purple")
;              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "black")))
;         piano-black-key-list))))



;;; Draws the white or black key when it is "pressed"

(define piano-vec 
 (make-vector 88 0))

(animate-with 
 (lambda (time)
  (begin 
   (draw-rectangle canv 0 0 750 100 "solid" "black")
   (map
    (lambda (x)
     (match x
      [1 (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
      [2 (if (= (vector-ref piano-vec x) 1)
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "purple")
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "black"))]
      [3 (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
      [4 (if (= (vector-ref piano-vec x) 1)
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "purple")
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "black"))]
      [5 (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
      [6 (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
      [7 (if (= (vector-ref piano-vec x) 1)
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "purple")
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "black"))]
      [8 (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
      [9 (if (= (vector-ref piano-vec x) 1)
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "purple")
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "black"))]
      [10 (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
      [11 (if (= (vector-ref piano-vec x) 1)
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "purple")
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "black"))]
      [12 (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
      [13 (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
      [14 (if (= (vector-ref piano-vec x) 1)
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "purple")
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "black"))]
      [15 (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
      [16 (if (= (vector-ref piano-vec x) 1)
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "purple")
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "black"))]
      [17 (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
      [18 (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
      [19 (if (= (vector-ref piano-vec x) 1)
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "purple")
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "black"))]
      [20 (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
      [21 (if (= (vector-ref piano-vec x) 1)
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "purple")
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "black"))]
      [22 (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
      [23 (if (= (vector-ref piano-vec x) 1)
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "purple")
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "black"))]
      [24 (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
      [25 (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
      [26 (if (= (vector-ref piano-vec x) 1)
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "purple")
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "black"))]
      [27 (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
     [28 (if (= (vector-ref piano-vec x) 1)
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "purple")
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "black"))]
     [29 (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
     [30 (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
     [31 (if (= (vector-ref piano-vec x) 1)
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "purple")
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "black"))]
     [32 (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
     [33 (if (= (vector-ref piano-vec x) 1)
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "purple")
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "black"))]
     [34 (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
     [35 (if (= (vector-ref piano-vec x) 1)
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "purple")
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "black"))]
     [36 (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
     
     [37 (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
     [38 (if (= (vector-ref piano-vec x) 1)
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "purple")
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "black"))]
     [39 (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
     [40 (if (= (vector-ref piano-vec x) 1)
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "purple")
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "black"))]
     [41 (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
     [42 (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
     [43 (if (= (vector-ref piano-vec x) 1)
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "purple")
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "black"))]
     [44 (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
     [45 (if (= (vector-ref piano-vec x) 1)
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "purple")
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "black"))]
     [46 (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
     [47 (if (= (vector-ref piano-vec x) 1)
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "purple")
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "black"))]
     [48 (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
     [49 (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
     [50 (if (= (vector-ref piano-vec x) 1)
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "purple")
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "black"))]
     [51 (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
     [52 (if (= (vector-ref piano-vec x) 1)
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "purple")
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "black"))]
     [53 (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
     [54 (if (= (vector-ref piano-vec x) 1)
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "purple")
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "black"))]
     [55 (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
     [56 (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
     [57 (if (= (vector-ref piano-vec x) 1)
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "purple")
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "black"))]
     [58 (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
     [59 (if (= (vector-ref piano-vec x) 1)
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "purple")
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "black"))]
     [60  (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
     [61  (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
     [62 (if (= (vector-ref piano-vec x) 1)
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "purple")
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "black"))]
     [63  (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
     [64 (if (= (vector-ref piano-vec x) 1)
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "purple")
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "black"))]
     [65  (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
     [66 (if (= (vector-ref piano-vec x) 1)
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "purple")
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "black"))]
     [67  (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
     [68  (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
     [69 (if (= (vector-ref piano-vec x) 1)
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "purple")
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "black"))]
     [70  (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
     [71 (if (= (vector-ref piano-vec x) 1)
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "purple")
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "black"))]
     [72  (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
     [73  (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
     [74 (if (= (vector-ref piano-vec x) 1)
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "purple")
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "black"))]
     [75  (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
     [76 (if (= (vector-ref piano-vec x) 1)
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "purple")
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "black"))]
     [77  (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
     [78 (if (= (vector-ref piano-vec x) 1)
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "purple")
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "black"))]
     [79  (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
     [80  (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
     [81 (if (= (vector-ref piano-vec x) 1)
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "purple")
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "black"))]
     [82  (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
     [83 (if (= (vector-ref piano-vec x) 1)
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "purple")
              (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "black"))]
     [84  (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
     [85  (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
     [87  (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]
     [89  (begin (if (= (vector-ref piano-vec x) 1)
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv (* 15 x) 0 14 100 "solid" "white"))
         (draw-rectangle canv (* 14 x) 0 1 100 "solid" "grey"))]))
     (range 88)))))


; The canvas
canv


