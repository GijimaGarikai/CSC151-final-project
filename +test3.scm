(import music)
(import js)
(import canvas)

(define rickroll-verse1
    (list (list 58 (dur 3 16) 1)
        (list 60 en 1)
        (list 61 en 1)
        (list 61 (dur 3 16) 1)
        (list 63 (dur 3 16) 1)
        (list 60 (dur 3 8) 1)
        (list 58 sn 1)
        (list 56 qn 1)
        (list 0 qn 1)
        (list 58 en 1)
        (list 58 (dur 3 16) 1)
        (list 60 en 1)
        (list 61 qn 1)
        (list 58 en 1)
        (list 0 sn 1)
        (list 56 en 1)
        (list 68 qn 1)
        (list 68 en 1)
        (list 63 qn 1)
        (list 0 qn 1)
        (list 58 en 1)
        (list 58 (dur 3 16) 1)
        (list 60 en 1)
        (list 61 en 1)
        (list 58 qn 1)
        (list 61 (dur 3 16) 1)
        (list 63 (dur 3 8) 1)
        (list 60 qn 1)
        (list 58 en 1)
        (list 58 en 1)
        (list 56 qn 1)
        (list 0 qn 1)
        (list 58 en 1)
        (list 58 (dur 3 16) 1)
        (list 60 en 1)
        (list 61 (dur 3 16) 1)
        (list 58 en 1)
        (list 56 en 1)
        (list 0 sn 1)
        (list 63 en 1)
        (list 63 en 1)
        (list 63 en 1)
        (list 65 (dur 3 16) 1)
        (list 63 qn 1)
        (list 0 qn 1)))

(define rickroll-verse2
    (list (list 58 en 1) 
        (list 58 (dur 3 16) 1)
        (list 60 en 1)
        (list 61 (dur 3 16) 1)
        (list 63 (dur 3 16) 1)
        (list 0 sn 1)
        (list 60 en 1)
        (list 58 en 1)
        (list 58 en 1)
        (list 56 qn 1)
        (list 0 qn 1)
        (list 58 en 1)
        (list 58 (dur 3 16) 1)
        (list 60 en 1)
        (list 61 qn 1)
        (list 58 en 1)
        (list 56 en 1)
        (list 0 sn 1)
        (list 68 en 1)
        (list 68 en 1)
        (list 63 qn 1)
        (list 65 en 1)
        (list 63 qn 1)
        (list 61 en 1)
        (list 0 qn 1)
        (list 58 en 1)
        (list 58 (dur 3 16) 1)
        (list 60 en 1)
        (list 61 en 1)
        (list 58 qn 1)
        (list 61 (dur 3 16) 1)
        (list 0 sn 1)
        (list 63 (dur 3 8) 1)
        (list 60 qn 1)
        (list 58 en 1)
        (list 58 en 1)
        (list 56 qn 1)
        (list 0 qn 1)
        (list 58 en 1)
        (list 58 (dur 3 16) 1)
        (list 60 en 1)
        (list 61 (dur 3 16) 1)
        (list 58 en 1)
        (list 56 en 1)
        (list 0 sn 1)
        (list 65 en 1)
        (list 65 en 1)
        (list 63 (dur 3 16) 1)
        (list 65 en 1)
        (list 63 qn 1)
        (list 61 en 1)
        (list 0 qn 1)))

(define I-just-wanna-tell-you (list (list 61 qn 1)(list 0 en 1)(list 63 en 1)(list 65 (dur 3 16) 1)(list 61 en 1)(list 63 en 1)(list 63 en 1)))
;(seq (note 61 qn)(rest en)(note 63 en)(note 65 (dur 3 16))(note 61 en)(note 63 en)(note 63 en))

(define and-if-you-ask-me (list (list 63 en 1)(list 65 (dur 3 16) 1)(list 61 en 1)(list 63 en 1)(list 63 en 1)))
;(seq (note 63 en)(note 65 (dur 3 16))(note 61 en)(note 63 en)(note 63 en))

(define how-I'm-feeling (list (list 63 en 1)(list 65 en 1)(list 63 en 1)(list 56 en 1)(list 56 (dur 3 16) 1)))
;(seq (note 63 en)(note 65 en)(note 63 en)(note 56 en)(note 56 (dur 3 16)))

(define gotta-make-you-understand (list (list 56 (dur 3 16) 1)(list 58 en 1)(list 61 (dur 3 16) 1)(list 58 en 1)(list 0 sn 1)(list 63 (dur 3 16) 1)(list 65 en 1)(list 63 (dur 3 16) 1)))
;(seq (note 56 (dur 3 16))(note 58 en)(note 61 (dur 3 16))(note 58 en)(rest sn)(note 63 (dur 3 16))(note 65 en)(note 63 (dur 3 16)))

(define don't-tell-me-you're-too-blind-to-see (list (list 56 en 1)(list 56 (dur 3 16) 1)(list 58 en 1)(list 61 (dur 3 16) 1)(list 58 en 1)(list 0 sn 1)(list 63 (dur 3 16) 1)(list 65 en 1)(list 63 (dur 3 16) 1)))
;(seq (note 56 en)(note 56 (dur 3 16))(note 58 en)(note 61 (dur 3 16))(note 58 en)(rest sn)(note 63 (dur 3 16))(note 65 en)(note 63 (dur 3 16)))

(define never-gonna (list (list 58 en 1)(list 60 sn 1)(list 61 sn 1)(list 58 en 1)))
;(seq (note 58 en)(note 60 sn)(note 61 sn)(note 58 en))

(define give-you-up (list (list 65 (dur 3 16) 1) (list 65 (dur 3 16) 1) (list 63 qn 1)))
;(seq (note 65 (dur 3 16)) (note 65 (dur 3 16)) (note 63 qn)) 

(define let-you-down (list (list 63 (dur 3 16) 1)(list 63 (dur 3 16) 1)(list 61 (dur 3 16) 1)(list 60 sn 1)(list 58 en 1)))
;(seq (note 63 (dur 3 16))(note 63 (dur 3 16))(note 61 (dur 3 16))(note 60 sn)(note 58 en))

(define run-around-and-desert-you (list (list 61 qn 1)(list 63 en 1)(list 60 (dur 3 16) 1)(list 58 sn 1)(list 0 sn 1)(list 56 en 1)(list 0 en 1)(list 56 en 1)(list 63 qn 1)(list 61 (dur 3 16) 1)))
;(seq (note 61 qn)(note 63 en)(note 60 (dur 3 16))(note 58 sn)(rest sn)(note 56 en)(rest en)(note 56 en)(note 63 qn)(note 61 (dur 3 16)) (rest en))

(define make-you-cry (list (list 65 (dur 3 16) 1)(list 65 (dur 3 16) 1)(list 63 (dur 3 16) 1)))
;(seq (note 65 (dur 3 16))(note 65 (dur 3 16))(note 63 (dur 3 16)))

(define say-goodbye (list (list 68 (dur 3 16) 1)(list 60 en 1)(list 60 en 1)(list 61 (dur 3 16) 1)(list 60 sn 1)(list 58 sn 1)))
;(seq (note 68 (dur 3 16))(note 60 en)(note 60 en)(note 61 (dur 3 16))(note 60 sn)(note 58 sn))

(define tell-a-lie-and-hurt-you (list (list 61 (dur 3 16) 1)(list 63 en 1)(list 60 (dur 3 16) 1) (list 58 sn 1)(list 56 sn 1)(list 0 sn 1)(list 56 en 1)(list 63 qn 1)(list 61 (dur 3 16) 1)))
;(seq (note 61 (dur 3 16))(note 63 en)(note 60 (dur 3 16)) (note 58 sn)(note 56 sn)(rest sn)(note 56 en)(note 63 qn)(note 61 (dur 3 16)))

(define rickroll-prechorus1
    (append I-just-wanna-tell-you how-I'm-feeling (list (list 0 en 1))
    gotta-make-you-understand (list (list 0 en 1))))

(define rickroll-prechorus2
    (append and-if-you-ask-me how-I'm-feeling (list (list 0 en 1))
     don't-tell-me-you're-too-blind-to-see (list (list 0 en 1))))

(define rickroll-chorus
    (append never-gonna give-you-up (list (list 0 en 1))
    never-gonna let-you-down (list (list 0 sn 1))
    never-gonna run-around-and-desert-you (list (list 0 en 1))
    never-gonna make-you-cry (list (list 0 sn 1))
    never-gonna say-goodbye (list (list 0 en 1))
    never-gonna tell-a-lie-and-hurt-you (list (list 0 en 1))))

(define rickroll
    (append rickroll-verse1
        rickroll-prechorus1 
        rickroll-chorus 
        rickroll-verse2
        rickroll-prechorus2
        rickroll-chorus
        rickroll-chorus))


(define HotaruKoi1 
    (list (list 69 qn 1) (list 0 qn 1) (list 69 qn 1) (list 0 qn 1)
        (list 69 en 1) (list 0 en 1) (list 64 en 1) (list 67 en 1) (list 69 qn 1) (list 0 qn 1)
        (list 69 en 1) (list 0 en 1) (list 69 en 1) (list 69 en 1) (list 69 qn 1) (list 71 en 1) (list 71 en 1)
        (list 69 qn 1) (list 67 en 1) (list 67 en 1) (list 69 en 1) (list 0 (dur 3 8) 1)
        (list 69 en 1) (list 0 en 1) (list 69 en 1) (list 69 en 1) (list 69 qn 1) (list 71 en 1) (list 71 en 1)
        (list 69 qn 1) (list 67 en 1) (list 67 en 1) (list 69 en 1) (list 0 (dur 3 8) 1)
        (list 69 qn 1) (list 0 qn 1) (list 69 qn 1) (list 0 qn 1)
        (list 69 en 1) (list 0 en 1) (list 64 en 1) (list 67 en 1) (list 69 qn 1) (list 0 qn 1)
        (list 69 qn 1) (list 0 qn 1) (list 69 qn 1) (list 0 qn 1)
        (list 69 en 1) (list 69 en 1) (list 64 en 1) (list 67 en 1) (list 69 qn 1) (list 0 qn 1)
        ))

(define HotaruKoi2 
    (list (list 0 qn 1) (list 69 qn 1) (list 0 qn 1) (list 69 qn 1)
        (list 0 qn 1) (list 69 en 1) (list 0 en 1) (list 64 en 1) (list 67 en 1) (list 69 qn 1)
        (list 0 qn 1) (list 69 en 1) (list 0 en 1) (list 69 en 1) (list 69 en 1) (list 69 qn 1)
        (list 71 en 1) (list 71 en 1) (list 69 qn 1) (list 67 en 1) (list 67 en 1) (list 69 en 1) (list 0 en 1)
        (list 0 qn 1) (list 69 en 1) (list 0 en 1) (list 69 en 1) (list 69 en 1) (list 69 qn 1)
        (list 71 en 1) (list 71 en 1) (list 69 qn 1) (list 67 en 1) (list 67 en 1) (list 69 en 1) (list 0 en 1)
        (list 0 qn 1) (list 69 qn 1) (list 0 qn 1) (list 69 qn 1)
        (list 0 qn 1) (list 69 en 1) (list 0 en 1) (list 64 en 1) (list 67 en 1) (list 69 qn 1)
        (list 0 qn 1) (list 69 qn 1) (list 0 qn 1) (list 69 qn 1)
        (list 0 qn 1) (list 69 en 1) (list 69 en 1) (list 64 en 1) (list 67 en 1) (list 69 qn 1)
        ))
(define HotaruKoi3 
    (list (list 0 hn 1) (list 69 qn 1) (list 0 qn 1)
        (list 69 qn 1) (list 0 qn 1) (list 69 en 1) (list 0 en 1) (list 64 en 1) (list 67 en 1) (list 69 qn 1) (list 0 qn 1)
        (list 69 en 1) (list 0 en 1) (list 69 en 1) (list 69 en 1) (list 69 qn 1) (list 71 en 1) (list 71 en 1)
        (list 69 qn 1) (list 67 en 1) (list 67 en 1) (list 69 en 1) (list 0 (dur 3 8) 1)
        (list 69 en 1) (list 0 en 1) (list 69 en 1) (list 69 en 1) (list 69 qn 1) (list 71 en 1) (list 71 en 1)
        (list 69 qn 1) (list 67 en 1) (list 67 en 1) (list 69 en 1) (list 0 (dur 3 8) 1)
        (list 69 qn 1) (list 0 qn 1) (list 69 qn 1) (list 0 qn 1)
        (list 69 en 1) (list 0 en 1) (list 64 en 1) (list 67 en 1) (list 69 qn 1) (list 0 qn 1)
        (list 69 qn 1) (list 0 qn 1) (list 69 qn 1) (list 0 qn 1)
        (list 69 en 1) (list 69 en 1) (list 64 en 1) (list 67 en 1) (list 69 qn 1) (list 0 qn 1)
        ))


; these are vectors used for testing
(define piano-vec (make-vector 88 0))
(define piano2-vec (range 88))

(define piano2-black-list (list))
(define piano2-white-list (list))
(define piano2-black (make-vector (length piano2-black-list) 0))
(define piano2-white (make-vector (length piano2-white-list) 0))

(define contains
  (lambda (x lst)
    (match lst 
    [null #f]
    [(cons head tail) (or (equal? head x) (contains x tail))])))

(define play-piano2
    (lambda (key)
        (if (contains key piano2-black-list)
            (if (= 0 (vector-ref piano2-black (index-of key piano2-black-list)))
                (vector-set! piano2-black (index-of key piano2-black-list) 1)
                (vector-set! piano2-black (index-of key piano2-black-list) 0))
            (if (= 0 (vector-ref piano2-white (index-of key piano2-white-list)))
                (vector-set! piano2-white (index-of key piano2-white-list) 1)
                (vector-set! piano2-white (index-of key piano2-white-list) 0)))))


(define vec-set-on
    (lambda (vector-number vec-index)
        (vector-set! piano-vec vec-index 1)))


(define vec-lookup-table
    (lambda (x)
        (match x
            [1 piano-vec]
            [2 piano2-vec])))

(define vec-set-on
    (lambda (inst-vec vec-index)
        (vector-set! (vec-lookup-table inst-vec) 
                        (match inst-vec
                            [1 (- vec-index 21)]
                            [2 (- vec-index 21)])
                        1)))

(define vec-set-off
    (lambda (inst-vec vec-index)
        (vector-set! (vec-lookup-table inst-vec) 
                        (match inst-vec
                            [1 (- vec-index 21)]
                            [2 (- vec-index 21)])
                            0)))

(define instrument-note
    (lambda (midi-val dur-val inst-vec)
        (if (= midi-val 0)
            (rest dur-val)
            (mod (instrument 70) (note midi-val dur-val)))))


(define canv (make-canvas 2000 100))


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

; this is piano specific as of right now. In the future I would like a function to be able to look up a vecotr from a "table" of them where they are keyed convieniently
;;; (music-machine-helper info-list) -> composition?
;;; info-list : list? of the form (list (midi note value) (duration value) (valid indicator of a instrument))
;;; creates a sequence of trigger-on -> note -> trigger off compositions of the note with the valid instrument triggers
(define music-machine-helper
    (lambda (info-list)
        (let* ([midi-val (list-ref info-list 0)]
               [dur-val (list-ref info-list 1)]
               [instrument-vec (list-ref info-list 2)]
               [set-on (lambda () (play-piano midi-val))]
               [set-off (lambda () (play-piano midi-val))])
             (seq (trigger set-on)
                  (instrument-note midi-val dur-val instrument-vec)
                  (trigger set-off)))))

;;; (music-machine-voice note-list) -> composition?
;;; note-list : list? entries are all valid info-lists from (music-machine-helper)
;;; creates a whole voice from the given note list, with all notes plays in sequential order 
; think back to the horizontal beat machine voices
(define music-machine-voice
    (lambda (note-list)
        (apply seq (map music-machine-helper note-list))))

; this might be turned into a recursive function that can be handed a list of note lists for specific voices which then calls the two previous functions
;;; (music-machine-comp voice-list) -> composition?
;;; voice-list : list? list of compositions
;;; plays all the given voice compositions in parallel
(define music-machine-comp
    (lambda (voice-list)
        (apply par voice-list)))


;(map music-machine-helper (list (list 21 qn 2) (list 22 qn 2) (list 23 qn 2) (list 24 qn 2) (list 25 qn 2) (list 26 qn 2) (list 27 qn 2) (list 28 qn 2)))
;(apply seq (map music-machine-helper (list (list 21 qn 2) (list 22 qn 2) (list 23 qn 2) (list 24 qn 2) (list 25 qn 2) (list 26 qn 2) (list 27 qn 2) (list 28 qn 2))))
(music-machine-comp
    (list (music-machine-voice HotaruKoi1)
        (music-machine-voice HotaruKoi2)
        (music-machine-voice HotaruKoi3)))

(music-machine-voice rickroll)

(animate-with 
 (lambda (time)
  (begin 
    (draw-rectangle canv 0 0 2000 100 "solid" "white")
    (map 
        (lambda (x) 
            (begin (if (= (vector-ref piano-white-key-vec x) 1)
                    (draw-rectangle canv  (* 15 x) 0 14 100 "solid" "purple")
                    (draw-rectangle canv  (* 15 x) 0 14 100 "solid" "white"))
                (draw-rectangle canv (* 15 x) 0 1 100 "solid" "grey")))
        piano-white-key-list)
    (map 
        (lambda (x) 
         (if (equal? (vector-ref piano-black-key-vec x) 1)
             (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "purple")
             (draw-rectangle canv  (* 15 x) 0 10 50 "solid" "black")))
        piano-black-key-list))))

        
; The canvas
canv

