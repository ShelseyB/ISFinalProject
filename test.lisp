;; (defun test-loop () 
;;     (loop for x in '((1) (2) (3) (4) (5))
;;         if (< (first x) 4)
;;             collect x
;;     )
;; )

;; (((?* ?X) HELLO (?* ?Y)) ((HELLO) (NO TIME TO LOLLYGAG "," WE DON "'" T HAVE ALL DAY!)) 'NIL)

;; (defparameter )

(defparameter mlst '(test start etc))

(defun remove-elements (to-remove)
    (loop for state in to-remove
        do (defparameter mlst (remove state mlst))
    )
)

(remove-elements '(test start))
