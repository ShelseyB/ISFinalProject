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
  (some #'(lambda (rule)
            (let ((result (pat-match (rule-pattern rule) input)))
              (if (not (eq result fail))
                  (sublis (switch-viewpoint result)
                          (random-elt (rule-responses rule))))))
        (get-state-rules)))

(defun switch-viewpoint (words)
  "Change I to you and vice versa, and so on."
  (sublis '((I . you) (you . I) (me . you) (am . are))
          words))


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

(defparameter *cur-state*
    "start"
)

(defun get-state-rules ()
    (if (string= *cur-state* "start")
        *start-rules*
        '()
    )
)

(defparameter *start-rules*
    '(
        (((?* ?x) hello (?* ?y))      
        (Hello)
        ("No time to lollygag, we don't have all day!"))

        (((?* ?x) look around (?* ?y))      
        ("In the room you see two doors\, one you came in through and the other that presumably leads to the next room.
        You see a desk and a chest. There's an abstract painting on the wall with some colored lines. There is also a coat rack
        without coats... What else do you want to know?"))

        (((?* ?x) look at (?* ?y) desk)      
        (The desk has a book and a small globe on it.))

        (((?* ?x) look at (?* ?y) painting)      
        ("It is a pretty boring painting. Just five vertical lines that are blue, purple, red, purple, and yellow."))

        (((?* ?x) look at (?* ?y) coat rack)      
        ("There is not much to say about the coat rack. It's made of wood."))

        (((?* ?x) look at (?* ?y) chest)      
        ("It's a wooden chest. Has a handle."))

        (((?* ?x) look at (?* ?y))      
        (?y ? Did I say that was in the room? I do not recall...)
        (What are you talking about? I do not see a ?y))

        (((?* ?x) open (?* ?y) chest)      
        ("Hey, there's a key in here! That was easy, huh?" (defparameter *cur-state* "key-1"))
        )

        (((?* ?x) hello (?* ?y))      
        (Hello)
        ("No time to lollygag, we don't have all day!"))

        (((?* ?x))
        (Hm... I am not sure about that.)
        (What do you want?))
    )
)

(defparameter *game-rules*
  '(
    ;;; rule 1
    (((?* ?x) hello (?* ?y))      
    (How do you do.  Please state your problem.))

    ;;; rule 2
    (((?* ?x) computer (?* ?y))
     (Do computers worry you?)
     (What do you think about machines?)
     (Why do you mention computers?)
     (What do you think machines have to do with your problem?))

    ;;; rule 3
    (((?* ?x) name (?* ?y))
     (I am not interested in names))

    ;;; rule 4
    (((?* ?x) sorry (?* ?y))
     (Please don't apologize)
     (Apologies are not necessary)
     (What feelings do you have when you apologize))

    ;;; rule 5
    (((?* ?x) I remember (?* ?y)) 
     (Do you often think of ?y)
     (Does thinking of ?y bring anything else to mind?)
     (What else do you remember)
     (Why do you recall ?y right now?)
     (What in the present situation reminds you of ?y)
     (What is the connection between me and ?y))

    ;;; ========== your rules begin
    ;;; add your rules here
    
    ;;; rule 6
    (((?* ?x) I do not want (?* ?y))
     (Why do you not want ?y ?)
     (What would you do if you had to ?y ?)
     (How would those around you feel if you had to ?y ?))
    (((?* ?x) I (?* ?z) want (?* ?y))
     (Why do you want ?y ?)
     (What would you do if you got ?y ?)
     (How would those around you feel if you got ?y ?))
    
    ;;; rule 7
    (((?* ?x) had a dream about (?* ?y))
     (What do you think that dream means?)
     (Do you often have that dream?))
    
    ;;; rule 8
    (((?* ?x) I feel sad (?* ?y))
     (Why do you feel sad?)
     (What makes you feel that way?))
    
    ;;; rule 9
    (((?* ?x) I feel angry (?* ?y))
     (Why do you feel angry ?)
     (How often do you feel ?y ?)
     (Do you lash out at others when you are angry?))
    
    ;;; rule 10
    (((?* ?x) I feel disappointed (?* ?y))
     (Why do you feel disappointed ?)
     (How can you overcome this disappointment?))
    
    ;;; rule 11
    (((?* ?x) I have a problem with (?* ?y))
     (What will you do about ?y ?))
    (((?* ?x) I have a problem (?* ?y))
     (What kind of problem ?))

    
    ;;; rule 12
    (((?* ?x) I feel (?* ?y))
     (Why do you feel ?y ?)
     (How often do you feel ?y ?)
     (How is for you to feel ?y ?)
     (What else do you feel?))
    (((?* ?x) it makes me (?* ?y))
     (Why does it make you feel ?y ?)
     (How often do you feel ?y ?)
     (How is for you to feel ?y ?)
     (What else do you feel?))
    
    ;;; rule 13
    (((?* ?x) help me with (?* ?y))
     (How can I help you with ?y ?)
     (Who else could help you with ?y ?))
    
    ;;; rule 14
    (((?* ?x) help me (?* ?y))
     (Who could help you ?y ?))
    
    ;;; rule 15
    (((?* ?x) makes me feel (?* ?y))
     (Why does ?x make you feel ?y ?))
    
    ;;; rule 16
    (((?* ?x) I am feeling (?* ?y))
     (Why are you feeling ?y ?)
     (How often do you feel ?y ?))
    
    ;;; rule 17
    (((?* ?x) I am (?* ?y))
     (Why are you ?y ?))
     
    ;;; rule 18
    (((?* ?x) I hate (?* ?y))
     (What has made you feel this way about ?y ?)
     (What can you do to change your feelings towards ?y ?)
     (How has feeling this way affected your relationships?))
     
    ;;; rule 19
    (((?* ?x) trying to (?* ?y))
     (How often do you succeed at ?y ?)
     (Do you feel burden by your attempts to ?y ?))
     
    ;;; rule 20
    (((?* ?x) you're (?* ?y))
     (Why do you think I am ?y ?)
     (Do you wish you were ?y ?)
     (What makes you think I am ?y ?))
    (((?* ?x) you are (?* ?y))
     (Why do you think I am ?y ?)
     (Do you wish you were ?y ?)
     (What makes you think I am ?y ?))
    (((?* ?x) you have (?* ?y))
     (Why do you think I have ?y ?)
     (Do you wish you had ?y ?)
     (What makes you think I have ?y ?))
     
    ;;; rule 21
    (((?* ?x) I like (?* ?y))
     (Why do you like ?y ?)
     (I like that too.)
     (Perhaps you should spend more time focusing on ?y.))
     
    ;;; rule 22
    (((?* ?x) I have to (?* ?y))
     (Why do you have to ?y ?)
     (Does that make you happy?))
    (((?* ?x) I have (?* ?y))
     (What do you do with ?y ?)
     (Does that make you happy?))
     
    ;;; rule 23
    (((?* ?x) I need to (?* ?y))
     (Why do you need to ?y ?)
     (Would doing that make you happier?))
    (((?* ?x) I need (?* ?y))
     (Why do you need ?y ?)
     (Would ?y make you happier?))
     
    ;;; rule 24
     (((?* ?x) my problem is (?* ?y))
     (What will you do about ?y ?))
     (((?* ?x) thank you (?* ?y))
     (You are welcome)
     (Happy to help))
     
    ;;; rule 25
    (((?* ?x))
     (Please continue.)
     (I understand.)
     (Very interesting. Do go on.)
     (Keep the honesty going. You are doing great.)
     (I see.))
     
    ;;; ========== your rules end

   ))