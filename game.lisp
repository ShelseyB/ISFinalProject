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
                    ;; (print input)
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
            (if (member 'look-at-desk *cur-states*)
                (setf all-rules (union all-rules *desk-rules*))
            )
            (if (member 'want-to-read *cur-states*)
                (setf all-rules (union all-rules *want-to-read-rules*))
            )
            (if (member 'open-drawer *cur-states*)
                (setf all-rules (union all-rules *open-drawer-rules*))
            )
            (if (member 'open-chest *cur-states*)
                (setf all-rules (union all-rules *open-chest-rules*))
            )
            (if (member 'enter-combo *cur-states*)
                (setf all-rules (union all-rules *enter-combo-rules*))
            )
            (if (and (member 'first-key *cur-states*) (member 'second-key *cur-states*))
                (setf all-rules (union all-rules *can-open-door*))
            )
            (if (or (member 'first-key *cur-states*) (member 'second-key *cur-states*))
                (progn
                    (setf all-rules (union all-rules *already-key*))
                    (setf all-rules (union all-rules *only-1-key-rules*))
                )
            )
            (setf all-rules (union all-rules *first-room-rules*))
        )
    )
    (if (member 'first-door-open *cur-states*)
        (setf all-rules (union all-rules *can-enter-next-room*))
    )
    (if (member 'second-room *cur-states*)
        (progn
            (setf all-rules (union all-rules *second-room-rules*))
            (if (member 'look-at-sidetable *cur-states*)
                (setf all-rules (union all-rules *sidetable-rules*))
            )
            (if (member 'look-at-bookshelf *cur-states*)
                (progn
                    (if (member 'book1 *cur-states*)
                        (setf all-rules (union all-rules *book1-rules*))
                    )
                    (if (member 'book2 *cur-states*)
                        (setf all-rules (union all-rules *book2-rules*))
                    )
                    (if (member 'book3 *cur-states*)
                        (setf all-rules (union all-rules *book3-rules*))
                    )
                    (setf all-rules (union all-rules *bookshelf-rules*))
                )
            )
            (if (member 'open-trap-door *cur-states*)
                (setf all-rules (union all-rules *trapdoor-rules*))
            )
            (if (member 'closet-unlocked *cur-states*)
                (progn
                    (setf all-rules (union all-rules *closet-unlocked-rules*))
                )
            )
            (if (member 'closet-open *cur-states*)
                (progn
                    (if (member 'have-broom *cur-states*)
                        (setf all-rules (union all-rules *have-broom-rules*))
                    )                
                    (setf all-rules (union all-rules *closet-open-rules*))
                )
            )
            (if (member 'enter-keypad-combo *cur-states*)
                (setf all-rules (union all-rules *enter-keypad-combo-rules*))
            )
        )
    )
    (if (member 'in-tunnel *cur-states*)
        (setf all-rules (union all-rules *tunnel-rules*))
    )
    (setf all-rules (union all-rules *base-rules*))
    ;; (print all-rules)
    (return-from get-state-rules all-rules)
)