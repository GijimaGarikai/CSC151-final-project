(import music)
(import js)
(import canvas)

; these are vectors used for testing
(define piano-vec (make-vector 88 0))

(define piano2-vec (make-vector 88 0))

;;; (vec-lookup-table x) -> vec?
;;; x : integer?
;;; returns the associated instument vec that the given index is associated with
(define vec-lookup-table
    (lambda (x)
        (match x
            [0 piano-vec]
            [13 piano2-vec])))

;;; (vec-set-on inst-vec vec-index) -> void?
;;; inst-vec : integer?
;;; vec-index ; integer?
;;; sets the inst-vec's associated vec-index to "on" (1) 
(define vec-set-on
    (lambda (inst-vec vec-index)
        (vector-set! (vec-lookup-table inst-vec) 
                        (match inst-vec
                            [0 (- vec-index 21)]
                            [13 (- vec-index 21)])
                        1)))

;;; (vec-set-off inst-vec vec-index) -> void?
;;; inst-vec : integer?
;;; vec-index ; integer?
;;; sets the inst-vec's associated vec-index to "off" (0) 
(define vec-set-off
    (lambda (inst-vec vec-index)
        (vector-set! (vec-lookup-table inst-vec) 
                        (match inst-vec
                            [0 (- vec-index 21)]
                            [13 (- vec-index 21)])
                            0)))

;;; (instrument-note midi-val dur-val inst-vec) -> comp?
;;; midi-val : integer? valid midi number
;;; dur-val : dur?
;;; inst-vec : integer?
;;; returns the note played on the specificied instrument with the specific note value and duration
(define instrument-note
    (lambda (midi-val dur-val inst-vec)
        (if (= midi-val 0)
            (rest dur-val)
            (mod (instrument inst-vec) (note midi-val dur-val)))))

; this is piano specific as of right now. In the future I would like a function to be able to look up a vecotr from a "table" of them where they are keyed convieniently
;;; (music-machine-helper info-list) -> composition?
;;; info-list : list? of the form (list (midi note value) (duration value) (valid indicator of a instrument))
;;; creates a sequence of trigger-on -> note -> trigger off compositions of the note with the valid instrument triggers
(define music-machine-note
    (lambda (info-list)
        (let* ([midi-val (list-ref info-list 0)]
               [dur-val (list-ref info-list 1)]
               [instrument-vec (list-ref info-list 2)]
               [dyn (list-ref info-list 3)]
               [set-on (lambda () (vec-set-on instrument-vec midi-val))]
               [set-off (lambda () (vec-set-off instrument-vec midi-val))]
               [note-comp (seq (trigger set-on)
                               (instrument-note midi-val dur-val instrument-vec)
                               (trigger set-off))])
               (cond
                    [(equal? dyn "pp") (mod (dynamics 5) note-comp)]
                    [(equal? dyn "p") (mod (dynamics 15) note-comp)]
                    [(equal? dyn "mp") (mod (dynamics 30) note-comp)]
                    [(equal? dyn "mf") (mod (dynamics 50) note-comp)]
                    [(equal? dyn "f") (mod (dynamics 80) note-comp)]
                    [(equal? dyn "ff") (mod (dynamics 110) note-comp)]))))

;;; (music-machine-voice note-list) -> composition?
;;; note-list : list? entries are all valid info-lists from (music-machine-helper)
;;; creates a whole voice from the given note list, with all notes plays in sequential order 
; think back to the horizontal beat machine voices
(define music-machine-voice
    (lambda (note-list)
        (apply seq (map music-machine-note note-list))))

; this might be turned into a recursive function that can be handed a list of note lists for specific voices which then calls the two previous functions
;;; (music-machine-comp voice-list) -> composition?
;;; voice-list : list? list of compositions
;;; plays all the given voice compositions in parallel
(define music-machine-comp
    (lambda (voice-list given-tempo)
            (mod (tempo qn given-tempo) (apply par (map music-machine-voice voice-list)))))


; (map music-machine-note (list (list 21 qn 1) (list 22 qn 1) (list 23 qn 1) (list 24 qn 1) (list 25 qn 1) (list 26 qn 1) (list 27 qn 1) (list 28 qn 1)))
; (music-machine-comp (list (list (list 81 qn 13) (list 82 qn 13) (list 83 qn 13) (list 84 qn 13) (list 85 qn 13) (list 86 qn 13) (list 87 qn 13) (list 88 qn 13))))

piano-vec

(define song_1 (list (list (list 69 hn 0 "mp") (list 70 qn 0 "mp") (list 62 qn 0 "mp") (list 67 qn 0 "mp") (list 70 qn 0 "mp") (list 72 qn 0 "mp") (list 65 qn 0 "mp") (list 69 qn 0 "mp") (list 70 hn 0 "mp") (list 67 qn 0 "mp") (list 70 qn 0 "mp") (list 74 qn 0 "mp") (list 75 qn 0 "mp") (list 67 qn 0 "mp") (list 74 qn 0 "mp") (list 72 qn 0 "mp") 
                           (list 70 qn 0 "mp") (list 62 qn 0 "mp") (list 67 qn 0 "mp") (list 70 qn 0 "mp") (list 72 qn 0 "mp") (list 65 qn 0 "mp") (list 69 qn 0 "mp") (list 70 hn 0 "mp") (list 67 qn 0 "mp") (list 70 qn 0 "mp") (list 74 qn 0 "mp") (list 75 qn 0 "mp") (list 67 qn 0 "mp") (list 74 qn 0 "mp") (list 72 qn 0 "mp")
                           (list 70 qn 0 "mp") (list 62 qn 0 "mp") (list 67 qn 0 "mp") (list 70 qn 0 "mp") (list 72 qn 0 "mp") (list 65 qn 0 "mp") (list 69 qn 0 "mp") (list 70 hn 0 "mp") (list 67 qn 0 "mp") (list 70 qn 0 "mp") (list 74 qn 0 "mp") (list 75 qn 0 "mp") (list 67 qn 0 "mp") (list 74 qn 0 "mp") (list 72 qn 0 "mp")
                           (list 70 qn 0 "mp") (list 62 qn 0 "mp") (list 67 qn 0 "mp") (list 70 qn 0 "mp") (list 69 qn 0 "mp") (list 60 qn 0 "mp") (list 65 qn 0 "mp") (list 67 hn 0 "mp") (list 60 qn 0 "mp") (list 65 qn 0 "mp") (list 67 hn 0 "mp") (list 65 qn 0 "mp") (list 67 qn 0 "mp") (list 69 qn 0 "mp")

                           (list 70 qn 0 "mf") (list 62 qn 0 "mf") (list 67 qn 0 "mf") (list 70 qn 0 "mf") (list 72 qn 0 "mf") (list 65 qn 0 "mf") (list 69 qn 0 "mf") (list 70 hn 0 "mf") (list 67 qn 0 "mf") (list 70 qn 0 "mf") (list 74 qn 0 "mf") (list 75 qn 0 "mf") (list 67 qn 0 "mf") (list 74 qn 0 "mf") (list 72 qn 0 "mf")
                           (list 70 qn 0 "mf") (list 62 qn 0 "mf") (list 67 qn 0 "mf") (list 70 qn 0 "mf") (list 72 qn 0 "mf") (list 65 qn 0 "mf") (list 69 qn 0 "mf") (list 70 hn 0 "mf") (list 67 qn 0 "mf") (list 70 qn 0 "mf") (list 74 qn 0 "mf") (list 75 qn 0 "mf") (list 67 qn 0 "mf") (list 74 qn 0 "mf") (list 72 qn 0 "mf")
                           (list 70 qn 0 "mf") (list 62 qn 0 "mf") (list 67 qn 0 "mf") (list 70 qn 0 "mf") (list 72 qn 0 "mf") (list 65 qn 0 "mf") (list 69 qn 0 "mf") (list 70 hn 0 "mf") (list 67 qn 0 "mf") (list 70 qn 0 "mf") (list 74 qn 0 "mf") (list 75 qn 0 "mf") (list 67 qn 0 "mf") (list 74 qn 0 "mf") (list 72 qn 0 "mf")
                           (list 70 qn 0 "mf") (list 62 qn 0 "mf") (list 67 qn 0 "mf") (list 70 qn 0 "mf") (list 69 qn 0 "mf") (list 60 qn 0 "mf") (list 65 qn 0 "mf") (list 67 hn 0 "mf") (list 60 qn 0 "mf") (list 65 qn 0 "mf") (list 67 hn 0 "mf") (list 65 qn 0 "mf") (list 67 qn 0 "mf") (list 69 qn 0 "mf")

                           (list 70 qn 0 "f") (list 62 qn 0 "f") (list 67 qn 0 "f") (list 70 qn 0 "f") (list 72 qn 0 "f") (list 65 qn 0 "f") (list 69 qn 0 "f") (list 70 hn 0 "f") (list 67 qn 0 "f") (list 70 qn 0 "f") (list 74 qn 0 "f") (list 75 qn 0 "f") (list 67 qn 0 "f") (list 74 qn 0 "f") (list 72 qn 0 "f")
                           (list 70 qn 0 "f") (list 62 qn 0 "f") (list 67 qn 0 "f") (list 70 qn 0 "f") (list 72 qn 0 "f") (list 65 qn 0 "f") (list 69 qn 0 "f") (list 70 hn 0 "f") (list 67 qn 0 "f") (list 70 qn 0 "f") (list 74 qn 0 "f") (list 75 qn 0 "f") (list 67 qn 0 "f") (list 74 qn 0 "f") (list 72 qn 0 "f")
                           (list 70 qn 0 "f") (list 62 qn 0 "f") (list 67 qn 0 "f") (list 70 qn 0 "f") (list 72 qn 0 "f") (list 65 qn 0 "f") (list 69 qn 0 "f") (list 70 hn 0 "f") (list 67 qn 0 "f") (list 70 qn 0 "f") (list 74 qn 0 "f") (list 75 qn 0 "f") (list 67 qn 0 "f") (list 74 qn 0 "f") (list 72 qn 0 "f")
                           (list 70 qn 0 "f") (list 62 qn 0 "f") (list 67 qn 0 "f") (list 70 qn 0 "f") (list 69 qn 0 "f") (list 60 qn 0 "f") (list 65 qn 0 "f") (list 67 hn 0 "f") (list 60 qn 0 "f") (list 65 qn 0 "f") (list 67 hn 0 "f") (list 65 qn 0 "f") (list 67 qn 0 "f") (list 69 (dur 6 4) 0 "f")

                           (list 62 qn 0 "mp") (list 62 qn 0 "mp") (list 63 qn 0 "mp") (list 63 qn 0 "mp") (list 62 qn 0 "mp") (list 62 qn 0 "mp") (list 63 qn 0 "mp") (list 63 qn 0 "mp") (list 62 qn 0 "mp") (list 62 (dur 7 4) 0 "mp")
                           (list 62 qn 0 "mp") (list 62 qn 0 "mp") (list 63 qn 0 "mp") (list 63 qn 0 "mp") (list 62 hn 0 "mp") (list 62 qn 0 "mp") (list 63 qn 0 "mp") (list 63 qn 0 "mp") (list 62 qn 0 "mp") (list 67 qn 0 "mp") (list 66 (dur 5 4) 0 "mp")
                           (list 62 qn 0 "mp") (list 62 qn 0 "mp") (list 63 qn 0 "mp") (list 63 qn 0 "mp") (list 62 hn 0 "mp") (list 62 qn 0 "mp") (list 63 qn 0 "mp") (list 63 qn 0 "mp") (list 62 qn 0 "mp") (list 67 (dur 7 4) 0 "mp")
                           (list 62 qn 0 "mp") (list 65 qn 0 "mp") (list 67 qn 0 "mp") (list 62 qn 0 "mp") (list 62 hn 0 "mp") (list 62 qn 0 "mp") (list 62 qn 0 "mp") (list 62 qn 0 "mp") (list 58 qn 0 "mp") (list 58 qn 0 "mp") (list 58 (dur 6 4) 0 "mp")

                           (list 62 qn 0 "mp") (list 62 qn 0 "mp") (list 63 qn 0 "mp") (list 63 qn 0 "mp") (list 62 qn 0 "mp") (list 62 qn 0 "mp") (list 63 qn 0 "mp") (list 63 qn 0 "mp") (list 62 qn 0 "mp") (list 62 (dur 7 4) 0 "mp")
                           (list 62 qn 0 "mp") (list 62 qn 0 "mp") (list 63 qn 0 "mp") (list 63 qn 0 "mp") (list 62 hn 0 "mp") (list 62 qn 0 "mp") (list 63 qn 0 "mp") (list 63 qn 0 "mp") (list 62 qn 0 "mp") (list 67 qn 0 "mp") (list 66 (dur 5 4) 0 "mp")
                           (list 62 qn 0 "mp") (list 62 qn 0 "mp") (list 63 qn 0 "mp") (list 63 qn 0 "mp") (list 62 qn 0 "mp") (list 62 qn 0 "mp") (list 63 qn 0 "mp") (list 63 qn 0 "mp") (list 62 qn 0 "mp") (list 67 (dur 7 4) 0 "mp")
                           (list 62 qn 0 "mp") (list 65 qn 0 "mp") (list 67 qn 0 "mp") (list 62 qn 0 "mp") (list 62 hn 0 "mp") (list 62 qn 0 "mp") (list 62 qn 0 "mp") (list 62 qn 0 "mp") (list 58 qn 0 "mp") (list 58 qn 0 "mp") (list 58 (dur 3 4) 0 "mp") (list 69 hn 0 "mf")

                           (list 70 qn 0 "f") (list 62 qn 0 "f") (list 67 qn 0 "f") (list 70 qn 0 "f") (list 72 qn 0 "f") (list 65 qn 0 "f") (list 69 qn 0 "f") (list 70 hn 0 "f") (list 67 qn 0 "f") (list 70 qn 0 "f") (list 74 qn 0 "f") (list 75 qn 0 "f") (list 67 qn 0 "f") (list 74 qn 0 "f") (list 72 qn 0 "f") 
                           (list 70 qn 0 "f") (list 62 qn 0 "f") (list 67 qn 0 "f") (list 70 qn 0 "f") (list 72 qn 0 "f") (list 65 qn 0 "f") (list 69 qn 0 "f") (list 70 hn 0 "f") (list 67 qn 0 "f") (list 70 qn 0 "f") (list 74 qn 0 "f") (list 75 qn 0 "f") (list 67 qn 0 "f") (list 74 qn 0 "f") (list 72 qn 0 "f")
                           (list 70 qn 0 "f") (list 62 qn 0 "f") (list 67 qn 0 "f") (list 70 qn 0 "f") (list 72 qn 0 "f") (list 65 qn 0 "f") (list 69 qn 0 "f") (list 70 hn 0 "f") (list 67 qn 0 "f") (list 70 qn 0 "f") (list 74 qn 0 "f") (list 75 qn 0 "f") (list 67 qn 0 "f") (list 74 qn 0 "f") (list 72 qn 0 "f")
                           (list 70 qn 0 "f") (list 62 qn 0 "f") (list 67 qn 0 "f") (list 70 qn 0 "f") (list 69 qn 0 "f") (list 60 qn 0 "f") (list 65 qn 0 "f") (list 67 hn 0 "f") (list 60 qn 0 "f") (list 65 qn 0 "f") (list 67 hn 0 "f") (list 65 qn 0 "f") (list 67 qn 0 "f") (list 69 qn 0 "f")

                           (list 70 qn 0 "ff") (list 62 qn 0 "ff") (list 67 qn 0 "ff") (list 70 qn 0 "ff") (list 72 qn 0 "ff") (list 65 qn 0 "ff") (list 69 qn 0 "ff") (list 70 hn 0 "ff") (list 67 qn 0 "ff") (list 70 qn 0 "ff") (list 74 qn 0 "ff") (list 75 qn 0 "ff") (list 67 qn 0 "ff") (list 74 qn 0 "ff") (list 72 qn 0 "ff") 
                           (list 70 qn 0 "ff") (list 62 qn 0 "ff") (list 67 qn 0 "ff") (list 70 qn 0 "ff") (list 72 qn 0 "ff") (list 65 qn 0 "ff") (list 69 qn 0 "ff") (list 70 hn 0 "ff") (list 67 qn 0 "ff") (list 70 qn 0 "ff") (list 74 qn 0 "ff") (list 75 qn 0 "ff") (list 67 qn 0 "ff") (list 74 qn 0 "ff") (list 72 qn 0 "ff")
                           (list 70 qn 0 "ff") (list 62 qn 0 "ff") (list 67 qn 0 "ff") (list 70 qn 0 "ff") (list 72 qn 0 "ff") (list 65 qn 0 "ff") (list 69 qn 0 "ff") (list 70 hn 0 "ff") (list 67 qn 0 "ff") (list 70 qn 0 "ff") (list 74 qn 0 "ff") (list 75 qn 0 "ff") (list 67 qn 0 "ff") (list 74 qn 0 "ff") (list 72 qn 0 "ff")
                           (list 70 qn 0 "ff") (list 62 qn 0 "ff") (list 67 qn 0 "ff") (list 70 qn 0 "ff") (list 69 qn 0 "ff") (list 60 qn 0 "ff") (list 65 qn 0 "ff") (list 67 hn 0 "ff") (list 60 qn 0 "ff") (list 65 qn 0 "ff") (list 67 (dur 5 4) 0 "ff")

                           (list 0 qn 0 "ff") (list 62 qn 0 "mf") (list 62 qn 0 "mf") (list 63 qn 0 "mf") (list 63 qn 0 "mf") (list 62 qn 0 "mf") (list 62 qn 0 "mf") (list 63 qn 0 "mf") (list 63 qn 0 "mf") (list 62 qn 0 "mf") (list 62 (dur 7 4) 0 "mf")
                           (list 62 qn 0 "mf") (list 62 qn 0 "mf") (list 63 qn 0 "mf") (list 63 qn 0 "mf") (list 62 hn 0 "mf") (list 62 qn 0 "mf") (list 63 qn 0 "mf") (list 63 qn 0 "mf") (list 62 qn 0 "mf") (list 67 qn 0 "mf") (list 66 (dur 5 4) 0 "mf")
                           (list 62 qn 0 "mf") (list 62 qn 0 "mf") (list 63 qn 0 "mf") (list 63 qn 0 "mf") (list 62 qn 0 "mf") (list 62 qn 0 "mf") (list 63 qn 0 "mf") (list 63 qn 0 "mf") (list 62 qn 0 "mf") (list 67 (dur 7 4) 0 "mf")
                           (list 62 qn 0 "mf") (list 65 qn 0 "mf") (list 67 qn 0 "mf") (list 62 qn 0 "mf") (list 62 hn 0 "mf") (list 62 qn 0 "mf") (list 62 qn 0 "mf") (list 62 qn 0 "mf") (list 58 qn 0 "mf") (list 58 qn 0 "mf") (list 58 (dur 5 4) 0 "mf")

                           (list 0 qn 0 "ff") (list 62 qn 0 "f") (list 62 qn 0 "f") (list 63 qn 0 "f") (list 63 qn 0 "f") (list 62 qn 0 "f") (list 62 qn 0 "f") (list 63 qn 0 "f") (list 63 qn 0 "f") (list 62 qn 0 "f") (list 62 (dur 7 4) 0 "f")
                           (list 62 qn 0 "f") (list 62 qn 0 "f") (list 63 qn 0 "f") (list 63 qn 0 "f") (list 62 hn 0 "f") (list 62 qn 0 "f") (list 63 qn 0 "f") (list 63 qn 0 "f") (list 62 qn 0 "f") (list 67 qn 0 "f") (list 66 (dur 5 4) 0 "f")
                           (list 62 qn 0 "f") (list 62 qn 0 "f") (list 63 qn 0 "f") (list 63 qn 0 "f") (list 62 qn 0 "f") (list 62 qn 0 "f") (list 63 qn 0 "f") (list 63 qn 0 "f") (list 62 qn 0 "f") (list 67 (dur 7 4) 0 "f")
                           (list 62 qn 0 "f") (list 65 qn 0 "f") (list 67 qn 0 "f") (list 62 qn 0 "f") (list 62 hn 0 "f") (list 62 qn 0 "f") (list 62 qn 0 "f") (list 62 qn 0 "f") (list 58 qn 0 "f") (list 58 qn 0 "f") (list 58 (dur 3 4) 0 "f") (list 69 hn 0 "f")

                           (list 70 hn 0 "ff") (list 67 qn 0 "ff") (list 70 qn 0 "ff") (list 72 qn 0 "ff") (list 65 qn 0 "ff") (list 69 qn 0 "ff") (list 70 hn 0 "ff") (list 67 qn 0 "ff") (list 70 qn 0 "ff") (list 74 qn 0 "ff") (list 75 qn 0 "ff") (list 67 qn 0 "ff") (list 74 qn 0 "ff") (list 72 qn 0 "ff")
                           (list 70 qn 0 "ff") (list 62 qn 0 "ff") (list 67 qn 0 "ff") (list 70 qn 0 "ff") (list 72 qn 0 "ff") (list 65 qn 0 "ff") (list 69 qn 0 "ff") (list 70 hn 0 "ff") (list 67 qn 0 "ff") (list 70 qn 0 "ff") (list 74 qn 0 "ff") (list 75 qn 0 "ff") (list 67 qn 0 "ff") (list 74 qn 0 "ff") (list 72 qn 0 "ff")
                           (list 70 qn 0 "ff") (list 62 qn 0 "ff") (list 67 qn 0 "ff") (list 70 qn 0 "ff") (list 72 qn 0 "ff") (list 65 qn 0 "ff") (list 69 qn 0 "ff") (list 70 hn 0 "ff") (list 67 qn 0 "ff") (list 70 qn 0 "ff") (list 74 qn 0 "ff") (list 75 qn 0 "ff") (list 67 qn 0 "ff") (list 74 qn 0 "ff") (list 72 qn 0 "ff")
                           (list 70 qn 0 "ff") (list 62 qn 0 "ff") (list 67 qn 0 "ff") (list 70 qn 0 "ff") (list 69 qn 0 "ff") (list 60 qn 0 "ff") (list 65 qn 0 "ff") (list 67 hn 0 "ff") (list 60 qn 0 "ff") (list 65 qn 0 "ff") (list 67 hn 0 "ff")

                           (list 77 qn 0 "mp") (list 79 qn 0 "mp") (list 81 qn 0 "mp") (list 82 qn 0 "mp") (list 74 qn 0 "mp") (list 79 qn 0 "mp") (list 82 qn 0 "mp") (list 84 qn 0 "mp") (list 77 qn 0 "mp") (list 81 qn 0 "mp") (list 82 hn 0 "mp") (list 79 qn 0 "mp") (list 82 qn 0 "mp") (list 86 qn 0 "mp") (list 87 qn 0 "mp") (list 79 qn 0 "mp") (list 86 qn 0 "mp") (list 84 qn 0 "mp")
                           (list 82 qn 0 "mp") (list 74 qn 0 "mp") (list 79 qn 0 "mp") (list 82 qn 0 "mp") (list 84 qn 0 "mp") (list 77 qn 0 "mp") (list 81 qn 0 "mp") (list 82 hn 0 "mp") (list 79 qn 0 "mp") (list 82 qn 0 "mp") (list 86 qn 0 "mp") (list 87 qn 0 "mp") (list 79 qn 0 "mp") (list 86 qn 0 "mp") (list 84 qn 0 "mp")
                           (list 82 qn 0 "mp") (list 74 qn 0 "mp") (list 79 qn 0 "mp") (list 82 qn 0 "mp") (list 84 qn 0 "mp") (list 77 qn 0 "mp") (list 81 qn 0 "mp") (list 82 hn 0 "mp") (list 79 qn 0 "mp") (list 82 qn 0 "mp") (list 86 qn 0 "mp") (list 87 qn 0 "mp") (list 79 qn 0 "mp") (list 86 qn 0 "mp") (list 84 qn 0 "mp")
                           (list 82 qn 0 "mp") (list 74 qn 0 "mp") (list 79 qn 0 "mp") (list 82 qn 0 "mp") (list 84 qn 0 "mp") (list 72 qn 0 "mp") (list 77 qn 0 "mp") (list 79 hn 0 "mp") (list 72 qn 0 "mp") (list 77 qn 0 "mp") (list 79 hn 0 "mp") (list 77 qn 0 "mp") (list 79 qn 0 "mp") (list 81 qn 0 "mp")

                           (list 77 qn 0 "p") (list 79 qn 0 "p") (list 81 qn 0 "p") (list 82 qn 0 "p") (list 74 qn 0 "p") (list 79 qn 0 "p") (list 82 qn 0 "p") (list 84 qn 0 "p") (list 77 qn 0 "p") (list 81 qn 0 "p") (list 82 hn 0 "p") (list 79 qn 0 "p") (list 82 qn 0 "p") (list 86 qn 0 "p") (list 87 qn 0 "p") (list 79 qn 0 "p") (list 86 qn 0 "p") (list 84 qn 0 "p")
                           (list 82 qn 0 "p") (list 74 qn 0 "p") (list 79 qn 0 "p") (list 82 qn 0 "p") (list 84 qn 0 "p") (list 77 qn 0 "p") (list 81 qn 0 "p") (list 82 hn 0 "p") (list 79 qn 0 "p") (list 82 qn 0 "p") (list 86 qn 0 "p") (list 87 qn 0 "p") (list 79 qn 0 "p") (list 86 qn 0 "p") (list 84 qn 0 "p")
                           (list 82 qn 0 "p") (list 74 qn 0 "p") (list 79 qn 0 "p") (list 82 qn 0 "p") (list 84 qn 0 "p") (list 77 qn 0 "p") (list 81 qn 0 "p") (list 82 hn 0 "p") (list 79 qn 0 "p") (list 82 qn 0 "p") (list 86 qn 0 "p") (list 87 qn 0 "p") (list 79 qn 0 "p") (list 86 qn 0 "p") (list 84 qn 0 "p")
                           (list 82 qn 0 "p") (list 74 qn 0 "p") (list 79 qn 0 "p") (list 82 qn 0 "p") (list 84 qn 0 "p") (list 72 qn 0 "p") (list 77 qn 0 "p") (list 79 hn 0 "p") (list 72 qn 0 "p") (list 77 qn 0 "p") (list 79 (dur 7 4) 0 "p"))
                           
                     (list (list 0 hn 0 "ff") (list 55 wn 0 "mp") (list 53 (dur 3 4) 0 "mp") (list 51 (dur 5 4) 0 "mp") (list 48 wn 0 "mp") 
                           (list 55 wn 0 "mp") (list 53 (dur 3 4) 0 "mp") (list 51 (dur 5 4) 0 "mp") (list 48 wn 0 "mp")
                           (list 55 wn 0 "mp") (list 53 (dur 3 4) 0 "mp") (list 51 (dur 5 4) 0 "mp") (list 48 wn 0 "mp") 
                           (list 55 wn 0 "mp") (list 53 (dur 3 4) 0 "mp") (list 51 (dur 4 4) 0 "mp") (list 48 (dur 5 4) 0 "mp")

                           (list 55 wn 0 "mf") (list 53 (dur 3 4) 0 "mf") (list 51 (dur 5 4) 0 "mf") (list 48 wn 0 "mf") 
                           (list 55 wn 0 "mf") (list 53 (dur 3 4) 0 "mf") (list 51 (dur 5 4) 0 "mf") (list 48 wn 0 "mf")
                           (list 55 wn 0 "mf") (list 53 (dur 3 4) 0 "mf") (list 51 (dur 5 4) 0 "mf") (list 48 wn 0 "mf") 
                           (list 55 wn 0 "mf") (list 53 (dur 3 4) 0 "mf") (list 51 (dur 4 4) 0 "mf") (list 48 (dur 5 4) 0 "mf") 

                           (list 55 hn 0 "f") (list 55 hn 0 "f") (list 53 hn 0 "f") (list 53 hn 0 "f") (list 51 hn 0 "f") (list 51 hn 0 "f") (list 48 hn 0 "f") (list 48 hn 0 "f")
                           (list 55 hn 0 "f") (list 55 hn 0 "f") (list 53 hn 0 "f") (list 53 hn 0 "f") (list 51 hn 0 "f") (list 51 hn 0 "f") (list 48 hn 0 "f") (list 48 hn 0 "f")
                           (list 55 hn 0 "f") (list 55 hn 0 "f") (list 53 hn 0 "f") (list 53 hn 0 "f") (list 51 hn 0 "f") (list 51 hn 0 "f") (list 48 hn 0 "f") (list 48 hn 0 "f")
                           (list 55 hn 0 "f") (list 55 hn 0 "f") (list 53 hn 0 "f") (list 53 hn 0 "f") (list 55 wn 0 "f") (list 55 wn 0 "f") 

                           (list 55 hn 0 "mp") (list 0 hn 0 "ff") (list 0 wn 0 "ff") (list 0 wn 0 "ff") (list 0 hn 0 "ff") (list 56 hn 0 "ff")
                           (list 55 hn 0 "mp") (list 0 hn 0 "ff") (list 0 wn 0 "ff") (list 0 wn 0 "ff") (list 0 hn 0 "ff") (list 56 hn 0 "ff")
                           (list 55 hn 0 "mp") (list 0 hn 0 "ff") (list 0 wn 0 "ff") (list 0 wn 0 "ff") (list 0 hn 0 "ff") (list 56 hn 0 "ff")
                           (list 55 hn 0 "mp") (list 0 hn 0 "ff") (list 0 wn 0 "ff") (list 0 wn 0 "ff") (list 0 wn 0 "ff")

                           (list 55 (dur 8 4) 0 "mf") (list 55 (dur 6 4) 0 "mf") (list 56 hn 0 "mp")
                           (list 55 (dur 8 4) 0 "mf") (list 55 (dur 6 4) 0 "mf") (list 56 hn 0 "mp")
                           (list 55 (dur 8 4) 0 "mf") (list 55 (dur 6 4) 0 "mf") (list 56 hn 0 "mp")
                           (list 55 (dur 8 4) 0 "mf") (list 55 (dur 8 4) 0 "mf")

                           (list 55 wn 0 "f") (list 53 (dur 3 4) 0 "f")  (list 53 (dur 5 4) 0 "f") (list 48 wn 0 "f")
                           (list 55 wn 0 "f") (list 53 (dur 3 4) 0 "f")  (list 53 (dur 5 4) 0 "f") (list 48 wn 0 "f")
                           (list 55 wn 0 "f") (list 53 (dur 3 4) 0 "f")  (list 53 (dur 5 4) 0 "f") (list 48 wn 0 "f")
                           (list 55 wn 0 "f") (list 53 (dur 3 4) 0 "f")  (list 53 (dur 4 4) 0 "f") (list 48 (dur 5 4) 0 "f")

                           (list 55 hn 0 "f") (list 55 hn 0 "f") (list 53 hn 0 "f") (list 53 hn 0 "f") (list 51 hn 0 "f") (list 51 hn 0 "f") (list 48 hn 0 "f") (list 48 hn 0 "f")
                           (list 55 hn 0 "f") (list 55 hn 0 "f") (list 53 hn 0 "f") (list 53 hn 0 "f") (list 51 hn 0 "f") (list 51 hn 0 "f") (list 48 hn 0 "f") (list 48 hn 0 "f")
                           (list 55 hn 0 "f") (list 55 hn 0 "f") (list 53 hn 0 "f") (list 53 hn 0 "f") (list 51 hn 0 "f") (list 51 hn 0 "f") (list 48 hn 0 "f") (list 48 hn 0 "f")
                           (list 55 hn 0 "f") (list 55 hn 0 "f") (list 53 hn 0 "f") (list 53 hn 0 "f") (list 55 wn 0 "f") (list 55 wn 0 "f") (list 55 wn 0 "f") 

                           (list 55 wn 0 "mf") (list 55 wn 0 "mf") (list 55 wn 0 "mf") (list 55 hn 0 "mf") (list 56 hn 0 "mp")
                           (list 55 wn 0 "f") (list 55 wn 0 "mf") (list 55 wn 0 "mf") (list 55 hn 0 "mf") (list 56 hn 0 "mp")
                           (list 55 wn 0 "f") (list 55 wn 0 "mf") (list 55 wn 0 "mf") (list 55 hn 0 "mf") (list 56 hn 0 "mp")
                           (list 55 wn 0 "f") (list 55 wn 0 "mf") (list 55 wn 0 "mf") (list 55 wn 0 "mf") 

                           (list 55 hn 0 "f") (list 55 hn 0 "f") (list 55 hn 0 "f") (list 55 hn 0 "f") (list 55 hn 0 "f") (list 55 hn 0 "f") (list 55 hn 0 "f") (list 56 hn 0 "ff")
                           (list 55 hn 0 "f") (list 55 hn 0 "f") (list 55 hn 0 "f") (list 55 hn 0 "f") (list 55 hn 0 "f") (list 55 hn 0 "f") (list 55 hn 0 "f") (list 56 hn 0 "ff")
                           (list 55 hn 0 "f") (list 55 hn 0 "f") (list 55 hn 0 "f") (list 55 hn 0 "f") (list 55 hn 0 "f") (list 55 hn 0 "f") (list 55 hn 0 "f") (list 56 hn 0 "ff")
                           (list 55 hn 0 "f") (list 55 hn 0 "f") (list 55 hn 0 "f") (list 55 hn 0 "f") (list 55 hn 0 "f") (list 55 hn 0 "f") (list 55 wn 0 "f")

                           (list 55 hn 0 "ff") (list 55 hn 0 "ff") (list 53 hn 0 "ff") (list 53 hn 0 "ff") (list 51 hn 0 "ff") (list 51 hn 0 "ff") (list 48 hn 0 "ff") (list 48 hn 0 "ff")
                           (list 55 hn 0 "ff") (list 55 hn 0 "ff") (list 53 hn 0 "ff") (list 53 hn 0 "ff") (list 51 hn 0 "ff") (list 51 hn 0 "ff") (list 48 hn 0 "ff") (list 48 hn 0 "ff")
                           (list 55 hn 0 "ff") (list 55 hn 0 "ff") (list 53 hn 0 "ff") (list 53 hn 0 "ff") (list 51 hn 0 "ff") (list 51 hn 0 "ff") (list 48 hn 0 "ff") (list 48 hn 0 "ff")
                           (list 55 hn 0 "ff") (list 55 hn 0 "ff") (list 53 hn 0 "ff") (list 53 hn 0 "ff") (list 51 hn 0 "ff") (list 51 hn 0 "ff") (list 51 wn 0 "ff")

                           (list 55 wn 0 "mf") (list 53 (dur 3 4) 0 "mf") (list 51 (dur 5 4) 0 "mf") (list 48 wn 0 "mf")
                           (list 55 wn 0 "mf") (list 53 (dur 3 4) 0 "mf") (list 51 (dur 5 4) 0 "mf") (list 48 wn 0 "mf")
                           (list 55 wn 0 "mf") (list 53 (dur 3 4) 0 "mf") (list 51 (dur 5 4) 0 "mf") (list 48 wn 0 "mf")
                           (list 55 wn 0 "mf") (list 53 (dur 3 4) 0 "mf") (list 51 (dur 4 4) 0 "mf") (list 51 (dur 5 4) 0 "mf")
                           
                           (list 67 wn 0 "p") (list 65 (dur 3 4) 0 "p") (list 63 (dur 5 4) 0 "p") (list 60 wn 0 "p")
                           (list 67 wn 0 "p") (list 65 (dur 3 4) 0 "p") (list 63 (dur 5 4) 0 "p") (list 60 wn 0 "p")
                           (list 67 wn 0 "p") (list 65 (dur 3 4) 0 "p") (list 63 (dur 5 4) 0 "p") (list 60 wn 0 "p")
                           (list 67 wn 0 "p") (list 65 (dur 3 4) 0 "p") (list 67 (dur 4 4) 0 "p") (list 67 (dur 5 4) 0 "p"))

                     (list (list 0 hn 0 "ff") (list 0 wn 0 "ff") (list 0 wn 0 "ff") (list 0 wn 0 "ff") (list 0 wn 0 "ff") 
                           (list 0 wn 0 "ff") (list 0 wn 0 "ff") (list 0 wn 0 "ff") (list 0 wn 0 "ff")
                           (list 0 wn 0 "ff") (list 0 wn 0 "ff") (list 0 wn 0 "ff") (list 0 wn 0 "ff")
                           (list 0 wn 0 "ff") (list 0 wn 0 "ff") (list 0 wn 0 "ff") (list 0 wn 0 "ff")

                           (list 43 wn 0 "mf") (list 41 (dur 3 4) 0 "mf") (list 39 (dur 5 4) 0 "mf") (list 36 wn 0 "mf")
                           (list 43 wn 0 "mf") (list 41 (dur 3 4) 0 "mf") (list 39 (dur 5 4) 0 "mf") (list 36 wn 0 "mf")
                           (list 43 wn 0 "mf") (list 41 (dur 3 4) 0 "mf") (list 39 (dur 5 4) 0 "mf") (list 36 wn 0 "mf")
                           (list 43 wn 0 "mf") (list 41 (dur 3 4) 0 "mf") (list 39 (dur 4 4) 0 "mf") (list 36 (dur 5 4) 0 "mf")

                           (list 43 hn 0 "f") (list 43 hn 0 "f") (list 41 hn 0 "f") (list 41 hn 0 "f") (list 39 hn 0 "f") (list 39 hn 0 "f") (list 36 hn 0 "f") (list 36 hn 0 "f")
                           (list 43 hn 0 "f") (list 43 hn 0 "f") (list 41 hn 0 "f") (list 41 hn 0 "f") (list 39 hn 0 "f") (list 39 hn 0 "f") (list 36 hn 0 "f") (list 36 hn 0 "f")
                           (list 43 hn 0 "f") (list 43 hn 0 "f") (list 41 hn 0 "f") (list 41 hn 0 "f") (list 39 hn 0 "f") (list 39 hn 0 "f") (list 36 hn 0 "f") (list 36 hn 0 "f")
                           (list 43 hn 0 "f") (list 43 hn 0 "f") (list 41 hn 0 "f") (list 41 hn 0 "f") (list 43 wn 0 "f") (list 43 wn 0 "f")

                           (list 43 hn 0 "mp") (list 0 hn 0 "ff") (list 0 wn 0 "ff") (list 0 wn 0 "ff") (list 0 hn 0 "ff") (list 44 hn 0 "ff")
                           (list 43 hn 0 "mp") (list 0 hn 0 "ff") (list 0 wn 0 "ff") (list 0 wn 0 "ff") (list 0 hn 0 "ff") (list 44 hn 0 "ff")
                           (list 43 hn 0 "mp") (list 0 hn 0 "ff") (list 0 wn 0 "ff") (list 0 wn 0 "ff") (list 0 hn 0 "ff") (list 44 hn 0 "ff")
                           (list 43 hn 0 "mp") (list 0 hn 0 "ff") (list 0 wn 0 "ff") (list 0 wn 0 "ff") (list 0 wn 0 "ff")

                           (list 43 (dur 8 4) 0 "mf") (list 43 (dur 6 4) 0 "mf") (list 44 hn 0 "mp")
                           (list 43 (dur 8 4) 0 "mf") (list 43 (dur 6 4) 0 "mf") (list 44 hn 0 "mp")
                           (list 43 (dur 8 4) 0 "mf") (list 43 (dur 6 4) 0 "mf") (list 44 hn 0 "mp")
                           (list 43 (dur 8 4) 0 "mf") (list 43 (dur 8 4) 0 "mf")

                           (list 43 wn 0 "f") (list 41 (dur 3 4) 0 "f") (list 39 (dur 5 4) 0 "f") (list 36 wn 0 "f")
                           (list 43 wn 0 "f") (list 41 (dur 3 4) 0 "f") (list 39 (dur 5 4) 0 "f") (list 36 wn 0 "f")
                           (list 43 wn 0 "f") (list 41 (dur 3 4) 0 "f") (list 39 (dur 5 4) 0 "f") (list 36 wn 0 "f")
                           (list 43 wn 0 "f") (list 41 (dur 3 4) 0 "f") (list 39 (dur 4 4) 0 "f") (list 36 (dur 5 4) 0 "f")

                           (list 43 hn 0 "ff") (list 43 hn 0 "ff") (list 41 hn 0 "ff") (list 41 hn 0 "ff") (list 39 hn 0 "ff") (list 39 hn 0 "ff") (list 36 hn 0 "ff") (list 36 hn 0 "ff")
                           (list 43 hn 0 "ff") (list 43 hn 0 "ff") (list 41 hn 0 "ff") (list 41 hn 0 "ff") (list 39 hn 0 "ff") (list 39 hn 0 "ff") (list 36 hn 0 "ff") (list 36 hn 0 "ff")
                           (list 43 hn 0 "ff") (list 43 hn 0 "ff") (list 41 hn 0 "ff") (list 41 hn 0 "ff") (list 39 hn 0 "ff") (list 39 hn 0 "ff") (list 36 hn 0 "ff") (list 36 hn 0 "ff")
                           (list 43 hn 0 "ff") (list 43 hn 0 "ff") (list 41 hn 0 "ff") (list 41 hn 0 "ff") (list 43 wn 0 "ff") (list 43 wn 0 "ff")

                           (list 43 wn 0 "mf") (list 43 wn 0 "mf") (list 43 wn 0 "mf") (list 43 hn 0 "mf") (list 44 hn 0 "mp")
                           (list 43 wn 0 "f") (list 43 wn 0 "mf") (list 43 wn 0 "mf") (list 43 wn 0 "mf")

                           (list 43 hn 0 "f") (list 43 hn 0 "f") (list 43 hn 0 "f") (list 43 hn 0 "f") (list 43 hn 0 "f") (list 43 hn 0 "f") (list 43 hn 0 "f") (list 44 hn 0 "ff")
                           (list 43 hn 0 "f") (list 43 hn 0 "f") (list 43 hn 0 "f") (list 43 hn 0 "f") (list 43 hn 0 "f") (list 43 hn 0 "f") (list 43 hn 0 "f") (list 44 hn 0 "ff")
                           (list 43 hn 0 "f") (list 43 hn 0 "f") (list 43 hn 0 "f") (list 43 hn 0 "f") (list 43 hn 0 "f") (list 43 hn 0 "f") (list 43 hn 0 "f") (list 44 hn 0 "ff")
                           (list 43 hn 0 "f") (list 43 hn 0 "f") (list 43 hn 0 "f") (list 43 hn 0 "f") (list 43 hn 0 "f") (list 43 hn 0 "f") (list 43 wn 0 "f")

                           (list 43 hn 0 "ff") (list 43 hn 0 "ff") (list 41 hn 0 "ff") (list 41 hn 0 "ff") (list 39 hn 0 "ff") (list 39 hn 0 "ff") (list 36 hn 0 "ff") (list 36 hn 0 "ff")
                           (list 43 hn 0 "ff") (list 43 hn 0 "ff") (list 41 hn 0 "ff") (list 41 hn 0 "ff") (list 39 hn 0 "ff") (list 39 hn 0 "ff") (list 36 hn 0 "ff") (list 36 hn 0 "ff")
                           (list 43 hn 0 "ff") (list 43 hn 0 "ff") (list 41 hn 0 "ff") (list 41 hn 0 "ff") (list 39 hn 0 "ff") (list 39 hn 0 "ff") (list 36 hn 0 "ff") (list 36 hn 0 "ff")
                           (list 43 hn 0 "ff") (list 43 hn 0 "ff") (list 41 hn 0 "ff") (list 41 hn 0 "ff") (list 39 hn 0 "ff") (list 39 hn 0 "ff") (list 39 wn 0 "ff")

                           (list 43 wn 0 "mf") (list 41 (dur 3 4) 0 "mf") (list 39 (dur 5 4) 0 "mf") (list 36 wn 0 "mf")
                           (list 43 wn 0 "mf") (list 41 (dur 3 4) 0 "mf") (list 39 (dur 5 4) 0 "mf") (list 36 wn 0 "mf")
                           (list 43 wn 0 "mf") (list 41 (dur 3 4) 0 "mf") (list 39 (dur 5 4) 0 "mf") (list 36 wn 0 "mf")
                           (list 43 wn 0 "mf") (list 41 (dur 3 4) 0 "mf") (list 39 (dur 4 4) 0 "mf") (list 36 (dur 5 4) 0 "mf")
                           
                           (list 0 wn 0 "ff") (list 0 wn 0 "ff") (list 0 wn 0 "ff") (list 0 wn 0 "ff")
                           (list 0 wn 0 "ff") (list 0 wn 0 "ff") (list 0 wn 0 "ff") (list 0 wn 0 "ff")
                           (list 0 wn 0 "ff") (list 0 wn 0 "ff") (list 0 wn 0 "ff") (list 0 wn 0 "ff")
                           (list 0 wn 0 "ff") (list 0 wn 0 "ff") (list 0 wn 0 "ff") (list 0 wn 0 "ff")
                           )))

(define rickroll-verse1
    (list (list 58 (dur 3 16) 0 "mf")
        (list 60 en 0 "mf")
        (list 61 en 0 "mf")
        (list 61 (dur 3 16) 0 "mf")
        (list 63 (dur 3 16) 0 "mf")
        (list 60 (dur 3 8) 0 "mf")
        (list 58 sn 0 "mf")
        (list 56 qn 0 "mf")
        (list 0 qn 0 "mf")
        (list 58 en 0 "mf")
        (list 58 (dur 3 16) 0 "mf")
        (list 60 en 0 "mf")
        (list 61 qn 0 "mf")
        (list 58 en 0 "mf")
        (list 0 sn 0 "mf")
        (list 56 en 0 "mf")
        (list 68 qn 0 "mf")
        (list 68 en 0 "mf")
        (list 63 qn 0 "mf")
        (list 0 qn 0 "mf")
        (list 58 en 0 "mf")
        (list 58 (dur 3 16) 0 "mf")
        (list 60 en 0 "mf")
        (list 61 en 0 "mf")
        (list 58 qn 0 "mf")
        (list 61 (dur 3 16) 0 "mf")
        (list 63 (dur 3 8) 0 "mf")
        (list 60 qn 0 "mf")
        (list 58 en 0 "mf")
        (list 58 en 0 "mf")
        (list 56 qn 0 "mf")
        (list 0 qn 0 "mf")
        (list 58 en 0 "mf")
        (list 58 (dur 3 16) 0 "mf")
        (list 60 en 0 "mf")
        (list 61 (dur 3 16) 0 "mf")
        (list 58 en 0 "mf")
        (list 56 en 0 "mf")
        (list 0 sn 0 "mf")
        (list 63 en 0 "mf")
        (list 63 en 0 "mf")
        (list 63 en 0 "mf")
        (list 65 (dur 3 16) 0 "mf")
        (list 63 qn 0 "mf")
        (list 0 qn 0 "mf")))

(define rickroll-verse2
    (list (list 58 en 0 "mf") 
        (list 58 (dur 3 16) 0 "mf")
        (list 60 en 0 "mf")
        (list 61 (dur 3 16) 0 "mf")
        (list 63 (dur 3 16) 0 "mf")
        (list 0 sn 0 "mf")
        (list 60 en 0 "mf")
        (list 58 en 0 "mf")
        (list 58 en 0 "mf")
        (list 56 qn 0 "mf")
        (list 0 qn 0 "mf")
        (list 58 en 0 "mf")
        (list 58 (dur 3 16) 0 "mf")
        (list 60 en 0 "mf")
        (list 61 qn 0 "mf")
        (list 58 en 0 "mf")
        (list 56 en 0 "mf")
        (list 0 sn 0 "mf")
        (list 68 en 0 "mf")
        (list 68 en 0 "mf")
        (list 63 qn 0 "mf")
        (list 65 en 0 "mf")
        (list 63 qn 0 "mf")
        (list 61 en 0 "mf")
        (list 0 qn 0 "mf")
        (list 58 en 0 "mf")
        (list 58 (dur 3 16) 0 "mf")
        (list 60 en 0 "mf")
        (list 61 en 0 "mf")
        (list 58 qn 0 "mf")
        (list 61 (dur 3 16) 0 "mf")
        (list 0 sn 0 "mf")
        (list 63 (dur 3 8) 0 "mf")
        (list 60 qn 0 "mf")
        (list 58 en 0 "mf")
        (list 58 en 0 "mf")
        (list 56 qn 0 "mf")
        (list 0 qn 0 "mf")
        (list 58 en 0 "mf")
        (list 58 (dur 3 16) 0 "mf")
        (list 60 en 0 "mf")
        (list 61 (dur 3 16) 0 "mf")
        (list 58 en 0 "mf")
        (list 56 en 0 "mf")
        (list 0 sn 0 "mf")
        (list 65 en 0 "mf")
        (list 65 en 0 "mf")
        (list 63 (dur 3 16) 0 "mf")
        (list 65 en 0 "mf")
        (list 63 qn 0 "mf")
        (list 61 en 0 "mf")
        (list 0 qn 0 "mf")))

(define I-just-wanna-tell-you (list (list 61 qn 0 "mf") (list 0 en 0 "mf") (list 63 en 0 "mf") (list 65 (dur 3 16) 0 "mf") (list 61 en 0 "mf") (list 63 en 0 "mf") (list 63 en 0 "mf")))
;(seq (note 61 qn)(rest en)(note 63 en)(note 65 (dur 3 16))(note 61 en)(note 63 en)(note 63 en))

(define and-if-you-ask-me (list (list 63 en 0 "mf") (list 65 (dur 3 16) 0 "mf") (list 61 en 0 "mf") (list 63 en 0 "mf") (list 63 en 0 "mf")))
;(seq (note 63 en)(note 65 (dur 3 16))(note 61 en)(note 63 en)(note 63 en))

(define how-I'm-feeling (list (list 63 en 0 "mf") (list 65 en 0 "mf") (list 63 en 0 "mf") (list 56 en 0 "mf") (list 56 (dur 3 16) 0 "mf")))
;(seq (note 63 en)(note 65 en)(note 63 en)(note 56 en)(note 56 (dur 3 16)))

(define gotta-make-you-understand (list (list 56 (dur 3 16) 0 "mf") (list 58 en 0 "mf") (list 61 (dur 3 16) 0 "mf") (list 58 en 0 "mf") (list 0 sn 0 "mf") (list 63 (dur 3 16) 0 "mf") (list 65 en 0 "mf") (list 63 (dur 3 16) 0 "mf")))
;(seq (note 56 (dur 3 16))(note 58 en)(note 61 (dur 3 16))(note 58 en)(rest sn)(note 63 (dur 3 16))(note 65 en)(note 63 (dur 3 16)))

(define don't-tell-me-you're-too-blind-to-see (list (list 56 en 0 "mf") (list 56 (dur 3 16) 0 "mf") (list 58 en 0 "mf") (list 61 (dur 3 16) 0 "mf") (list 58 en 0 "mf") (list 0 sn 0 "mf") (list 63 (dur 3 16) 0 "mf") (list 65 en 0 "mf") (list 63 (dur 3 16) 0 "mf")))
;(seq (note 56 en)(note 56 (dur 3 16))(note 58 en)(note 61 (dur 3 16))(note 58 en)(rest sn)(note 63 (dur 3 16))(note 65 en)(note 63 (dur 3 16)))

(define never-gonna (list (list 58 en 0 "mf") (list 60 sn 0 "mf") (list 61 sn 0 "mf") (list 58 en 0 "mf")))
;(seq (note 58 en)(note 60 sn)(note 61 sn)(note 58 en))

(define give-you-up (list (list 65 (dur 3 16) 0 "mf") (list 65 (dur 3 16) 0 "mf") (list 63 qn 0 "mf")))
;(seq (note 65 (dur 3 16)) (note 65 (dur 3 16)) (note 63 qn)) 

(define let-you-down (list (list 63 (dur 3 16) 0 "mf") (list 63 (dur 3 16) 0 "mf") (list 61 (dur 3 16) 0 "mf") (list 60 sn 0 "mf") (list 58 en 0 "mf")))
;(seq (note 63 (dur 3 16))(note 63 (dur 3 16))(note 61 (dur 3 16))(note 60 sn)(note 58 en))

(define run-around-and-desert-you (list (list 61 qn 0 "mf") (list 63 en 0 "mf") (list 60 (dur 3 16) 0 "mf") (list 58 sn 0 "mf") (list 0 sn 0 "mf") (list 56 en 0 "mf") (list 0 en 0 "mf") (list 56 en 0 "mf") (list 63 qn 0 "mf") (list 61 (dur 3 16) 0 "mf")))
;(seq (note 61 qn)(note 63 en)(note 60 (dur 3 16))(note 58 sn)(rest sn)(note 56 en)(rest en)(note 56 en)(note 63 qn)(note 61 (dur 3 16)) (rest en))

(define make-you-cry (list (list 65 (dur 3 16) 0 "mf") (list 65 (dur 3 16) 0 "mf") (list 63 (dur 3 16) 0 "mf")))
;(seq (note 65 (dur 3 16))(note 65 (dur 3 16))(note 63 (dur 3 16)))

(define say-goodbye (list (list 68 (dur 3 16) 0 "mf") (list 60 en 0 "mf") (list 60 en 0 "mf") (list 61 (dur 3 16) 0 "mf") (list 60 sn 0 "mf") (list 58 sn 0 "mf")))
;(seq (note 68 (dur 3 16))(note 60 en)(note 60 en)(note 61 (dur 3 16))(note 60 sn)(note 58 sn))

(define tell-a-lie-and-hurt-you (list (list 61 (dur 3 16) 0 "mf") (list 63 en 0 "mf") (list 60 (dur 3 16) 0 "mf") (list 58 sn 0 "mf") (list 56 sn 0 "mf") (list 0 sn 0 "mf") (list 56 en 0 "mf") (list 63 qn 0 "mf") (list 61 (dur 3 16) 0 "mf")))
;(seq (note 61 (dur 3 16))(note 63 en)(note 60 (dur 3 16)) (note 58 sn)(note 56 sn)(rest sn)(note 56 en)(note 63 qn)(note 61 (dur 3 16)))

(define rickroll-prechorus1
    (append I-just-wanna-tell-you how-I'm-feeling (list (list 0 en 0 "mf"))
    gotta-make-you-understand (list (list 0 en 0 "mf"))))

(define rickroll-prechorus2
    (append and-if-you-ask-me how-I'm-feeling (list (list 0 en 0 "mf"))
     don't-tell-me-you're-too-blind-to-see (list (list 0 en 0 "mf"))))

(define rickroll-chorus
    (append never-gonna give-you-up (list (list 0 en 0 "mf"))
    never-gonna let-you-down (list (list 0 sn 0 "mf"))
    never-gonna run-around-and-desert-you (list (list 0 en 0 "mf"))
    never-gonna make-you-cry (list (list 0 sn 0 "mf"))
    never-gonna say-goodbye (list (list 0 en 0 "mf"))
    never-gonna tell-a-lie-and-hurt-you (list (list 0 en 0 "mf"))))

(define rickroll
    (append 
        rickroll-verse1
        rickroll-prechorus1 
        rickroll-chorus 
        rickroll-verse2
        rickroll-prechorus2
        rickroll-chorus
        rickroll-chorus
        ))


(define HotaruKoi1 
    (list 
           (list 69 qn 0 "mf") (list 0 qn 0 "mf") (list 69 qn 0 "mf") (list 0 qn 0 "mf")
           (list 69 en 0 "mf") (list 0 en 0 "mf") (list 64 en 0 "mf") (list 67 en 0 "mf") (list 69 qn 0 "mf") (list 0 qn 0 "mf")
          (list 69 en 0 "mf") (list 0 en 0 "mf") (list 69 en 0 "mf") (list 69 en 0 "mf") (list 69 qn 0 "mf") (list 71 en 0 "mf") (list 71 en 0 "mf")
          (list 69 qn 0 "mf") (list 67 en 0 "mf") (list 67 en 0 "mf") (list 69 en 0 "mf") (list 0 (dur 3 8) 0 "mf")
          (list 69 en 0 "mf") (list 0 en 0 "mf") (list 69 en 0 "mf") (list 69 en 0 "mf") (list 69 qn 0 "mf") (list 71 en 0 "mf") (list 71 en 0 "mf")
           (list 69 qn 0 "mf") (list 67 en 0 "mf") (list 67 en 0 "mf") (list 69 en 0 "mf") (list 0 (dur 3 8) 0 "mf")
          (list 69 qn 0 "mf") (list 0 qn 0 "mf") (list 69 qn 0 "mf") (list 0 qn 0 "mf")
          (list 69 en 0 "mf") (list 0 en 0 "mf") (list 64 en 0 "mf") (list 67 en 0 "mf") (list 69 qn 0 "mf") (list 0 qn 0 "mf")
          (list 69 qn 0 "mf") (list 0 qn 0 "mf") (list 69 qn 0 "mf") (list 0 qn 0 "mf")
          (list 69 en 0 "mf") (list 69 en 0 "mf") (list 64 en 0 "mf") (list 67 en 0 "mf") (list 69 qn 0 "mf") (list 0 qn 0 "mf")))

(define HotaruKoi2 
    (list (list 0 qn 0 "mf") (list 69 qn 0 "mf") (list 0 qn 0 "mf") (list 69 qn 0 "mf")
        (list 0 qn 0 "mf") (list 69 en 0 "mf") (list 0 en 0 "mf") (list 64 en 0 "mf") (list 67 en 0 "mf") (list 69 qn 0 "mf")
        (list 0 qn 0 "mf") (list 69 en 0 "mf") (list 0 en 0 "mf") (list 69 en 0 "mf") (list 69 en 0 "mf") (list 69 qn 0 "mf")
        (list 71 en 0 "mf") (list 71 en 0 "mf") (list 69 qn 0 "mf") (list 67 en 0 "mf") (list 67 en 0 "mf") (list 69 en 0 "mf") (list 0 en 0 "mf")
        (list 0 qn 0 "mf") (list 69 en 0 "mf") (list 0 en 0 "mf") (list 69 en 0 "mf") (list 69 en 0 "mf") (list 69 qn 0 "mf")
        (list 71 en 0 "mf") (list 71 en 0 "mf") (list 69 qn 0 "mf") (list 67 en 0 "mf") (list 67 en 0 "mf") (list 69 en 0 "mf") (list 0 en 0 "mf")
        (list 0 qn 0 "mf") (list 69 qn 0 "mf") (list 0 qn 0 "mf") (list 69 qn 0 "mf")
        (list 0 qn 0 "mf") (list 69 en 0 "mf") (list 0 en 0 "mf") (list 64 en 0 "mf") (list 67 en 0 "mf") (list 69 qn 0 "mf")
        (list 0 qn 0 "mf") (list 69 qn 0 "mf") (list 0 qn 0 "mf") (list 69 qn 0 "mf")
        (list 0 qn 0 "mf") (list 69 en 0 "mf") (list 69 en 0 "mf") (list 64 en 0 "mf") (list 67 en 0 "mf") (list 69 qn 0 "mf")))

(define HotaruKoi3 
    (list (list 0 hn 0 "mf") (list 69 qn 0 "mf") (list 0 qn 0 "mf")
        (list 69 qn 0 "mf") (list 0 qn 0 "mf") (list 69 en 0 "mf") (list 0 en 0 "mf") (list 64 en 0 "mf") (list 67 en 0 "mf") (list 69 qn 0 "mf") (list 0 qn 0 "mf")
        (list 69 en 0 "mf") (list 0 en 0 "mf") (list 69 en 0 "mf") (list 69 en 0 "mf") (list 69 qn 0 "mf") (list 71 en 0 "mf") (list 71 en 0 "mf")
        (list 69 qn 0 "mf") (list 67 en 0 "mf") (list 67 en 0 "mf") (list 69 en 0 "mf") (list 0 (dur 3 8) 0 "mf")
        (list 69 en 0 "mf") (list 0 en 0 "mf") (list 69 en 0 "mf") (list 69 en 0 "mf") (list 69 qn 0 "mf") (list 71 en 0 "mf") (list 71 en 0 "mf")
        (list 69 qn 0 "mf") (list 67 en 0 "mf") (list 67 en 0 "mf") (list 69 en 0 "mf") (list 0 (dur 3 8) 0 "mf")
        (list 69 qn 0 "mf") (list 0 qn 0 "mf") (list 69 qn 0 "mf") (list 0 qn 0 "mf")
        (list 69 en 0 "mf") (list 0 en 0 "mf") (list 64 en 0 "mf") (list 67 en 0 "mf") (list 69 qn 0 "mf") (list 0 qn 0 "mf")
        (list 69 qn 0 "mf") (list 0 qn 0 "mf") (list 69 qn 0 "mf") (list 0 qn 0 "mf")
        (list 69 en 0 "mf") (list 69 en 0 "mf") (list 64 en 0 "mf") (list 67 en 0 "mf") (list 69 qn 0 "mf") (list 0 qn 0 "mf")))

(define never-gonna-give-you-up (music-machine-comp (list rickroll) 120))
never-gonna-give-you-up

(define hotarukoi (music-machine-comp (list 
HotaruKoi1 
HotaruKoi2 
HotaruKoi3
) 120))

hotarukoi

(music-machine-comp song_1 (* 127 2))

(define canv (make-canvas 880 100))
(animate-with
  (lambda (time)
    (begin
      (draw-rectangle canv 0 0 880 100 "solid" "white")
      (map
        (lambda (x)
            (if (equal? (vector-ref piano-vec x) 1)
                (draw-rectangle canv (* 10 x) 0 10 100 "solid" "purple")
                (draw-rectangle canv (* 10 x) 0 10 100 "solid" "white")))
        (range 88)))))

canv