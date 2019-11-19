(defparameter *welcome-message*
    "The day has finally arrived! You've saved up your money and are finally in \
    the world's greatest escape room! Now to just figure out how to get out... \
    Just let me know what you want to do and I'll help you do it."

)

(defun rule-pattern (rule) (first rule))
(defun rule-responses (rule) (rest rule))

(defun game ()
  "Respond to user input using pattern matching rules."
  (progn
    (print *welcome-message*)
    (loop
        (print 'game>)
        (let* ((input (read-line-no-punct))
            (response (flatten (use-rules input))))
        (print-with-spaces response)
        (if (equal response '(good bye)) (RETURN)))))  
  )

(defun use-rules (input)
  "Find some rule with which to transform the input."
  ;; (print "in use rules")
  (some #'(lambda (rule)
            ;; (print rule)
            (let ((result (pat-match (rule-pattern rule) input)))
              (if (not (eq result fail))
                (progn
                  ;; (print "in progn")
                  ;; (print rule)
                  (add-state (first (first (last rule))))
                  (remove-states (rest (first (last rule))))
                  (sublis (switch-viewpoint result)
                          (random-elt (rule-responses rule)))
                )
              )))
        (get-state-rules)))

(defun switch-viewpoint (words)
  "Change I to you and vice versa, and so on."
  (sublis '((I . you) (you . I) (me . you) (am . are))
          words))

(defun add-state (states-to-add)
  ;; (setf states-to-add (first states-to-add))
  ;; (print states-to-add)
  (if (not (null states-to-add))
    ;; (progn
    ;;   ;; (print "in the if statement")
    ;;   (defparameter *cur-states* (union *cur-states* states-to-add))
    ;;   ;; (print *cur-states*)
    ;; )
    (defparameter *cur-states* (union *cur-states* states-to-add))
    '()
  )
  ;; (print "in add-state")
  ;; (print states-to-add)
  ;; (print *cur-states*)
  ;; (defparameter *cur-states* (union *cur-states* states-to-add))
  ;; (print *cur-states*)
)

(defun remove-states (to-remove)
  (setf to-remove (first to-remove))
  (loop for state in to-remove
      do (defparameter *cur-states* (remove state *cur-states*))
  )
  ;; (print *cur-states*)
)

(defun read-line-no-punct ()
  "Read an input line, ignoring punctuation."
  (read-from-string
    (concatenate 'string "(" (substitute-if #\space #'punctuation-p
                                            (read-line))
                 ")")))

(defun punctuation-p (char) (find char ".,;:`!?#-()\\\""))

(defun print-with-spaces (list)
  (mapc #'(lambda (x) (prin1 x) (princ " ")) list))

(defun print-with-spaces (list)
  (format t "~{~a ~}" list))

(defparameter *cur-states*
    '(first-room)
)

(defun get-state-rules ()
    (setf all-rules '())
    ;; (loop for state in *cur-states*
    ;;   when (eq state 'start)
    ;;       do (setf all-rules (union all-rules *start-rules*))
    ;; )
    (if (member 'first-room *cur-states*)
      (setf all-rules (union all-rules *first-room-rules*))
    )
    (setf all-rules (union all-rules *base-rules*))
    ;; (print all-rules)
    (return-from get-state-rules all-rules)
)

(defparameter *base-rules*
    '(
        (((?* ?x) hello (?* ?y))      
        (Hello)
        (No time to lollygag"," we don"'"t have all day!)
        (() ()))

        (((?* ?x) look at (?* ?y))      
        (?y ? Did I say that was in the room? I do not recall...)
        (What are you talking about? I do not see a ?y)
        (() ()))

        (((?* ?x))
        (Hm... I am not sure about that.)
        (What do you want?)
        (() ()))
    )
)

(defparameter *first-room-rules*
    '(
        (((?* ?x) look around (?* ?y))      
        (In the room you see two doors"," one you came in through and the other that presumably leads to the next room.
        You see a desk and a chest. There"'"s an abstract painting on the wall with some colored lines. There is also a coat rack
        without coats... What else do you want to know?)
        (() ()))

        (((?* ?x) look at (?* ?y) desk)      
        (The desk has a book and a small globe on it.)
        ((look-at-desk) ()))

        (((?* ?x) look at (?* ?y) painting)      
        (It is a pretty boring painting. Just five vertical lines that are blue"," purple"," red"," purple"," and yellow.)
        (() ()))

        (((?* ?x) look at (?* ?y) coat rack)      
        (There is not much to say about the coat rack. It"'"s made of wood.)
        (() ()))

        (((?* ?x) look at (?* ?y) chest)      
        (It"'"s a wooden chest. Has a handle.)
        (() ()))

        (((?* ?x) look at (?* ?y))      
        (?y ? Did I say that was in the room? I do not recall...)
        (What are you talking about? I do not see a ?y)
        (() ()))

        (((?* ?x) open (?* ?y) chest)      
        (Hey"," there"'"s a key in here! That was easy"," huh?)
        ((first-key) ()))

        (((?* ?x) look in (?* ?y) chest)      
        (Hey"," there"'"s a key in here! That was easy"," huh?)
        ((first-key) ()))
    )
)

