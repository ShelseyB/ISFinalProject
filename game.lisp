#|
game.lisp

This file defines all of the game-specific functions.
|#

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
        (progn
            (setf all-rules (union all-rules *first-room-rules*))
            (if (member 'look-at-desk *cur-states*)
                (setf all-rules (union all-rules *desk-rules*))
            )
            (if (member 'open-drawer *cur-states*)
                (setf all-rules (union all-rules *open-drawer-rules*))
            )
            (if (or (member 'first-key *cur-states*) (member 'second-key *cur-states*))
                (setf all-rules (union all-rules *already-key*))
            )
            (if (and (member 'first-key *cur-states*) (member 'second-key *cur-states*))
                (setf all-rules (union all-rules *can-open-door*))
            )
        )
    )
    (if (member 'second-room *cur-states*)
        (progn
            (setf all-rules (union all-rules *first-room-rules*))
        )
    )
    (setf all-rules (union all-rules *base-rules*))
    ;; (print all-rules)
    (return-from get-state-rules all-rules)
)