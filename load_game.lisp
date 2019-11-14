#|
Shelsey Sullivan
CS 6600
|#

;;; change this parameter as needed.
(defparameter *game-path* 
  "./")

(defparameter *game-files* 
  '("auxfuns.lisp" "rules.lisp" 
    )) 

(defun load-game (path files)
  (mapc #'(lambda (file)
	    (load (concatenate 'string path file)))
	files))