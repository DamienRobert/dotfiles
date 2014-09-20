(define ajax-ime-hiragana-key '("<Shift>F6"))
(define ajax-ime-hiragana-key? (make-key-predicate '("<Shift>F6")))
(define ajax-ime-katakana-key '("<Shift>F7"))
(define ajax-ime-katakana-key? (make-key-predicate '("<Shift>F7")))
(define ajax-ime-halfkana-key '("<Shift>F8"))
(define ajax-ime-halfkana-key? (make-key-predicate '("<Shift>F8")))
(define ajax-ime-halfwidth-alnum-key '("<Shift>F10"))
(define ajax-ime-halfwidth-alnum-key? (make-key-predicate '("<Shift>F10")))
(define ajax-ime-fullwidth-alnum-key '("<Shift>F9"))
(define ajax-ime-fullwidth-alnum-key? (make-key-predicate '("<Shift>F9")))
(define ajax-ime-kana-toggle-key '())
(define ajax-ime-kana-toggle-key? (make-key-predicate '()))
(define ajax-ime-alkana-toggle-key '())
(define ajax-ime-alkana-toggle-key? (make-key-predicate '()))
(define ajax-ime-next-prediction-key '("tab" "down" "<IgnoreCase><Control>n" "<IgnoreCase><Control>i"))
(define ajax-ime-next-prediction-key? (make-key-predicate '("tab" "down" "<IgnoreCase><Control>n" "<IgnoreCase><Control>i")))
(define ajax-ime-prev-prediction-key '(generic-prev-candidate-key))
(define ajax-ime-prev-prediction-key? (make-key-predicate '(generic-prev-candidate-key?)))
