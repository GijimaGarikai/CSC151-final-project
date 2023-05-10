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

(define contains 
 (lambda (x lst)
  (match lst
  [null #f]
  [(cons head tail) (or (equal? head x) (contains x tail))])))

(define play-piano
 (lambda (key)
   (if (contains key piano-black-key-list) 
       (if (= 0 (vector-ref piano-black-key-vec (index-of key  piano-black-key-list)))
           (vector-set! piano-black-key-vec (index-of key piano-black-key-list) 1)
           (vector-set! piano-black-key-vec (index-of key piano-black-key-list) 0))
       (if (= 0 (vector-ref piano-white-key-vec (index-of key piano-white-key-list)))
           (vector-set! piano-white-key-vec (index-of key piano-white-key-list) 1)
           (vector-set! piano-white-key-vec (index-of key piano-white-key-list) 0)))))



(animate-with 
 (lambda (time)
  (begin 
   (draw-rectangle canv 0 0 750 100 "solid" "white")
      (begin 
       (map 
        (lambda (x) 
         (if (equal? (vector-ref piano-white-key-vec x) 1)
             (draw-rectangle canv  (* 15 x) 0 14 100 "solid" "grey")
             (draw-rectangle canv  (* 15 x) 0 14 100 "solid" "white"))))
       (lambda (x) 
         (draw-rectangle canv (* 15 x) 0 1 100 "solid" "grey"))
       (map 
        (lambda (x) 
         (if (equal? (vector-ref piano-black-key-vec x) 1)
             (draw-rectangle canv  (* 15 x) 0 14 50 "solid" "purple")
             (draw-rectangle canv  (* 15 x) 0 14 50 "solid" "black"))))))))



; The canvas
canv


