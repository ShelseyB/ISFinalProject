#|
rules.lisp

This file defines all of the sets of rules for the game.
|#

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

;;; RULES FOR ROOM 1

(defparameter *first-room-rules*
    '(
        (((?* ?x) look around (?* ?y))      
        (In the room you see two doors"," one you came in through and the other that presumably leads to the next room.
        You see a desk and a chest. There"'"s an abstract painting on the wall with some colored lines. There is also a coat rack
        without coats... What else do you want to know?)
        (() ()))

        (((?* ?x) look at (?* ?y) desk)      
        (The desk has a book and a small globe on it. There"'"s a locked drawer with a five-number combination.)
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
        
        (((?* ?x) look at (?* ?y) door)      
        (The door has two keyholes and a handle.)
        (() ()))
        
        (((?* ?x) go to (?* ?y) desk)      
        (The desk has a book and a small globe on it. There"'"s a locked drawer with a five-number combination.)
        ((look-at-desk) ()))

        (((?* ?x) go to (?* ?y) painting)      
        (It is a pretty boring painting. Just five vertical lines that are blue"," purple"," red"," purple"," and yellow.)
        (() ()))

        (((?* ?x) go to (?* ?y) coat rack)      
        (There is not much to say about the coat rack. It"'"s made of wood.)
        (() ()))

        (((?* ?x) go to (?* ?y) chest)      
        (It"'"s a wooden chest. Has a handle.)
        (() ()))
        
        (((?* ?x) go to (?* ?y) other door)      
        (They locked it when you came in"," but they said if you knock three times they will let you out.)
        (You came in this way. You"'"re no quitter"," keep searching!)
        (() ()))
        
        (((?* ?x) go to (?* ?y) door)      
        (The door has two keyholes and a handle.)
        (() ()))

        (((?* ?x) look at (?* ?y))      
        (?y ? Did I say that was in the room? I do not recall...)
        (What are you talking about? I do not see a ?y)
        (() ()))
        
        (((?* ?x) go to (?* ?y))      
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

(defparameter *desk-rules* 
  '(
    (((?* ?x) open (?* ?y) book)      
    (It"'"s a book of poetry. One page 1 is a poem called "\"Green Pastures\"."  Page "2:" "\"Sky Blue\"," page "3:" "\"Blackness Abounding\","
    page "4:" "\"White Clouds Above\"," page "5:" "\"Yellow Daisies\"," page "6:" "\"Orange: Color of My Soul\"," page "7:" "\"Purplish Murplish\","
    page "8:" "\"Sad as the Gray\"," page "9:" "\"Love Potion Red\"." Intersting...)
    ;; (want to read the book)
    (() ()))

    (((?* ?x) open (?* ?y) drawer (?* ?z) 27975)      
    (That did it! There"'"s a key in there.)
    ((open-drawer) ()))
    
    (((?* ?x) open (?* ?y) drawer (?* ?z) 2 (?* ?z1) 7 (?* ?z2) 9 (?* ?z3) 7 (?* ?z4) 5)      
    (That did it! There"'"s a key in there.)
    ((open-drawer) ()))

    
    (((?* ?x) combination is (?* ?z) 2 (?* ?z1) 7 (?* ?z2) 9 (?* ?z3) 7 (?* ?z4) 5)      
    (That did it! There"'"s a key in there.)
    ((open-drawer) ()))
    
    (((?* ?x) combination is 27975)      
    (That did it! There"'"s a key in there.)
    ((open-drawer) ()))

    (((?* ?x) open (?* ?y) drawer)      
    (It"'"s locked"," you need a five number combination to open it.)
    (What"'"s the number combination?)
    (() ()))

  )
)

(defparameter *open-drawer-rules* 
  '(
    (((?* ?x) take (?* ?y) key)      
    (Okay"," you took the key.)
    ((second-key) (open-drawer)))
  )
)

(defparameter *already-key*
  '(
    (((?* ?x) take (?* ?y) key)      
    (You already have the key.)
    (() ()))

  )
)

(defparameter *can-open-door*
  '(
    (((?* ?x) open (?* ?y) door)      
    (Perfect! You insert each key into a keyhole and they unlock the door.)
    ((second-room) (first-room first-key second-key)))

    (((?* ?x) unlock (?* ?y) door)      
    (Perfect! You insert each key into a keyhole and they unlock the door.)
    ((second-room) (first-room first-key second-key)))
  )
)

;; SECOND ROOM RULES

(defparameter *second-room-rules*
    '(
        (((?* ?x) look around (?* ?y))      
        (Once again"," it"'"s a pretty sparcely decorated room. There"'"s a portrait of a man on the wall","
        a couch against the wall"," and a bookshelf full of books. Also"," the door you came in through and another door.)
        (() ()))

        (((?* ?x) look at (?* ?y) portrait)      
        (It"'"s a random man with a plaque saying "\"BRAD\"" underneath. Odd"," no last name)
        (() ()))

        (((?* ?x) look at (?* ?y) painting)      
        (It"'"s a random man with a plaque saying "\"BRAD\"" underneath. Odd"," no last name)
        (() ()))
        
        (((?* ?x) go to (?* ?y) portrait)      
        (It"'"s a random man with a plaque saying "\"BRAD\"" underneath. Odd"," no last name)
        (() ()))

        (((?* ?x) go to (?* ?y) painting)      
        (It"'"s a random man with a plaque saying "\"BRAD\"" underneath. Odd"," no last name)
        (() ()))

        (((?* ?x) look at (?* ?y) couch)      
        (Just a plain old couch.)
        (Kind of grungy. Not sure what else to say about it...)
        (() ()))
        
        (((?* ?x) go to (?* ?y) couch)      
        (Just a plain old couch.)
        (Kind of grungy. Not sure what else to say about it...)
        (() ()))
        
        (((?* ?x) sit (?* ?y) couch)      
        (First off"," gross. Second"," we don"'"t have time for that.)
        (Yeah okay"," you"'"ve been working hard and need a break.)
        (() ()))

        (((?* ?x) look at (?* ?y) bookshelf)      
        (It has the following books on it":" "\"Wuthering Heights\"," "\"Brave New World\"," "\"The Great Gatsby\","
        "\"Crime and Punishment\"," "\"Dracula\"," "\"Adventures of Huckleberry Finn\"," "\"Great Expectations\"," and "\"Razor's Edge\".")
        (() ()))
        
        ;; (((?* ?x) look at (?* ?y) door)      
        ;; (The door has two keyholes and a handle.)
        ;; (() ()))
        
        ;; (((?* ?x) go to (?* ?y) desk)      
        ;; (The desk has a book and a small globe on it. There"'"s a locked drawer with a five-number combination.)
        ;; ((look-at-desk) ()))

        ;; (((?* ?x) go to (?* ?y) painting)      
        ;; (It is a pretty boring painting. Just five vertical lines that are blue"," purple"," red"," purple"," and yellow.)
        ;; (() ()))

        ;; (((?* ?x) go to (?* ?y) coat rack)      
        ;; (There is not much to say about the coat rack. It"'"s made of wood.)
        ;; (() ()))

        ;; (((?* ?x) go to (?* ?y) chest)      
        ;; (It"'"s a wooden chest. Has a handle.)
        ;; (() ()))
        
        ;; (((?* ?x) go to (?* ?y) other door)      
        ;; (They locked it when you came in"," but they said if you knock three times they will let you out.)
        ;; (You came in this way. You"'"re no quitter, keep searching!)
        ;; (() ()))
        
        ;; (((?* ?x) go to (?* ?y) door)      
        ;; (The door has two keyholes and a handle.)
        ;; (() ()))

        ;; (((?* ?x) look at (?* ?y))      
        ;; (?y ? Did I say that was in the room? I do not recall...)
        ;; (What are you talking about? I do not see a ?y)
        ;; (() ()))
        
        ;; (((?* ?x) go to (?* ?y))      
        ;; (?y ? Did I say that was in the room? I do not recall...)
        ;; (What are you talking about? I do not see a ?y)
        ;; (() ()))

        ;; (((?* ?x) open (?* ?y) chest)      
        ;; (Hey"," there"'"s a key in here! That was easy"," huh?)
        ;; ((first-key) ()))

        ;; (((?* ?x) look in (?* ?y) chest)      
        ;; (Hey"," there"'"s a key in here! That was easy"," huh?)
        ;; ((first-key) ()))
    )
)