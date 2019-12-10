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
        
        (((?* ?x) Who are you (?* ?y))      
        (Woah dude. I"'"m just your subconcious. Do you need help?)
        (() ()))
        
        (((?* ?x) Where am I (?* ?y))      
        (I already told you. You"'"re in an escape room.)
        (Just look around. You"'"ll see where you are.)
        (() ()))
        
        (((?* ?x) I want to leave (?* ?y) game)      
        (good bye)
        (() ()))

        (((?* ?x) I 'm done (?* ?y))      
        (good bye)
        (() ()))
        
        (((?* ?x) I am done (?* ?y))      
        (good bye)
        (() ()))
        
        (((?* ?x) I quit (?* ?y))      
        (good bye)
        (() ()))
        
        (((?* ?x) good bye (?* ?y))      
        (good bye)
        (() ()))
        
        (((?* ?x) goodbye (?* ?y))      
        (good bye)
        (() ()))
        
        (((?* ?x) I need (?* ?y) hint)      
        (Have you tried looking around? Have you looked at every object in the room?)  
        (Keep looking around"," checking different items.)
        (Look for patterns and things that stick out. If it seems out of place"," maybe it"'"s a clue.)
        (() ()))
        
        (((?* ?x) give (?* ?y) hint)      
        (Have you tried looking around? Have you looked at every object in the room?)  
        (Keep looking around"," checking different items.)
        (Look for patterns and things that stick out. If it seems out of place"," maybe it"'"s a clue.)
        (() ()))
        
        (((?* ?x) I am stuck (?* ?y))      
        (Have you tried looking around? Have you looked at every object in the room?)  
        (Keep looking around"," checking different items.)
        (Look for patterns and things that stick out. If it seems out of place"," maybe it"'"s a clue.)
        (() ()))
        
        (((?* ?x) I 'm stuck (?* ?y))      
        (Have you tried looking around? Have you looked at every object in the room?)  
        (Keep looking around"," checking different items.)
        (Look for patterns and things that stick out. If it seems out of place"," maybe it"'"s a clue.)
        (() ()))

        (((?* ?x) I want to (?* ?y))      
        (Why do you want to ?y ?)  
        (Do you really think that it will help to ?y ?)
        (() ()))

        (((?* ?x) I want (?* ?y))      
        (Why do you want ?y ?)    
        (Do you think that will help?)
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
        
        (((?* ?x) open (?* ?y) door)      
        (The handle won"'"t turn"," it"'"s locked.)
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
        
        (((?* ?x) look at (?* ?y) other door)      
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
        
    (((?* ?x) twist (?* ?y) handle)      
    (The handle twists"," but the door won"'"t budge. It must be locked still.)
    (() ()))
    
    (((?* ?x) insert (?* ?y) keys)      
    (You don"'"t have a key.)
    (() ()))
    
    (((?* ?x) insert (?* ?y) key)      
    (You don"'"t have a key.)
    (() ()))

        (((?* ?x) open (?* ?y) chest)      
        (Hey"," there"'"s a key in here! That was easy"," huh?)
        ((open-chest) ()))

        (((?* ?x) look in (?* ?y) chest)      
        (Hey"," there"'"s a key in here! That was easy"," huh?)
        ((open-chest) ()))

        (((?* ?x) move around (?* ?y) )      
        (Okay"," you move around ?y)
        (() ()))
        
        (((?* ?x) move the (?* ?y) )      
        (The ?y won"'"t budge.)
        (() ()))
        
        (((?* ?x) move (?* ?y) )      
        (The ?y won"'"t budge.)
        (() ()))
        
        (((?* ?x) look for (?* ?y) key)      
        (That"'"s your job"," I"'"m not going to do EVERYTHING for you.)
        (() ()))
        
        (((?* ?x) look for (?* ?y))      
        (That"'"s your job"," I"'"m not going to do EVERYTHING for you.)
        (() ()))
    )
)

(defparameter *only-1-key-rules*
  '(
        (((?* ?x) insert (?* ?y) key)      
        (You insert the key and it unlocks the first lock"," but the door doesn"'"t open.
        You take the key back.)
        (() ()))
  )
)

(defparameter *open-chest-rules*
  '(
        (((?* ?x) take (?* ?y) key)      
        (Cool"," you"'"ve got the key now.)
        ((first-key) (open-chest)))
        
        (((?* ?x) grab (?* ?y) key)      
        (Cool"," you"'"ve got the key now.)
        ((first-key) (open-chest)))
        
        (((?* ?x) pick up (?* ?y) key)      
        (Cool"," you"'"ve got the key now.)
        ((first-key) (open-chest)))

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
    
    (((?* ?x) read (?* ?y) book)      
    (It"'"s a book of poetry. One page 1 is a poem called "\"Green Pastures\"."  Page "2:" "\"Sky Blue\"," page "3:" "\"Blackness Abounding\","
    page "4:" "\"White Clouds Above\"," page "5:" "\"Yellow Daisies\"," page "6:" "\"Orange: Color of My Soul\"," page "7:" "\"Purplish Murplish\","
    page "8:" "\"Sad as the Gray\"," page "9:" "\"Love Potion Red\"." Intersting...)
    ;; (want to read the book)
    (() ()))

    (((?* ?x) look at (?* ?y) book (?* ?z))      
    (It"'"s a book of poetry. Do you want to read it?)
    ((want-to-read) ()))
    
    (((?* ?x) read (?* ?y) poem (?* ?z))      
    (Come on"," man"," we don"'"t have time for that.)
    (Boring! No thanks.)
    (() ()))
    
    (((?* ?x) grab (?* ?y) book (?* ?z))      
    (Um okay. You are holding the book now.)
    (() ()))
    
    (((?* ?x) take (?* ?y) book (?* ?z))      
    (Um okay. You are holding the book now.)
    (() ()))

    (((?* ?x) look at (?* ?y) globe (?* ?z))      
    (...Yep"," that"'"s earth all right.)
    (() ()))
    
    (((?* ?x) spin (?* ?y) globe (?* ?z))      
    (You spin the globe and the colors whirl before your eyes.)
    (() ()))
    
    (((?* ?x) move (?* ?y) globe (?* ?z))      
    (You try to move the globe"," but it"'"s as if it"'"s glued down.)
    (() ()))
    
    (((?* ?x) take (?* ?y) globe (?* ?z))      
    (You try to move the globe"," but it"'"s as if it"'"s glued down.)
    (() ()))
    
    (((?* ?x) grab (?* ?y) globe (?* ?z))      
    (You try to move the globe"," but it"'"s as if it"'"s glued down.)
    (() ()))

    (((?* ?x) open (?* ?y) drawer (?* ?z) 27975)      
    (That did it! There"'"s a key in there.)
    ((open-drawer) ()))
    
    (((?* ?x) open (?* ?y) drawer (?* ?z) 2 (?* ?z1) 7 (?* ?z2) 9 (?* ?z3) 7 (?* ?z4) 5)      
    (That did it! There"'"s a key in there.)
    ((open-drawer) ()))

    
    (((?* ?x) combination (?* ?z) 2 (?* ?z1) 7 (?* ?z2) 9 (?* ?z3) 7 (?* ?z4) 5)      
    (That did it! There"'"s a key in there.)
    ((open-drawer) ()))
    
    (((?* ?x) combination 27975)      
    (That did it! There"'"s a key in there.)
    ((open-drawer) ()))
    
    (((?* ?x) enter (?* ?y) combination )      
    (Okay"," what is the combination?)
    ((enter-combo) ()))
    
    (((?* ?x) put in (?* ?y) combination )      
    (Okay"," what is the combination?)
    ((enter-combo) ()))
    
    (((?* ?x) try (?* ?y) combination)      
    (Okay"," what is the combination?)
    ((enter-combo) ()))
    
    (((?* ?x) set (?* ?y) combination )      
    (Okay"," what is the combination?)
    ((enter-combo) ()))
    
    (((?* ?x) change (?* ?y) combination )      
    (Okay"," what is the combination?)
    ((enter-combo) ()))
    
    (((?* ?x) combination (?* ?y))      
    (Nope"," still locked...)
    (() ()))

    (((?* ?x) open (?* ?y) drawer)      
    (It"'"s locked"," you need a five number combination to open it.)
    (What"'"s the number combination?)
    (() ()))
    
    (((?* ?x) go to (?* ?y) drawer)      
    (Okay"," you"'"re at the drawer.)
    (() ()))

  )
)

(defparameter *want-to-read-rules*
  '(
    (((?* ?x) yes (?* ?y) )      
    (It"'"s a book of poetry. One page 1 is a poem called "\"Green Pastures\"."  Page "2:" "\"Sky Blue\"," page "3:" "\"Blackness Abounding\","
    page "4:" "\"White Clouds Above\"," page "5:" "\"Yellow Daisies\"," page "6:" "\"Orange: Color of My Soul\"," page "7:" "\"Purplish Murplish\","
    page "8:" "\"Sad as the Gray\"," page "9:" "\"Love Potion Red\"." Intersting...)
    ;; (want to read the book)
    (() (want-to-read)))

  )
)

(defparameter *enter-combo-rules*
  '(
    (((?* ?x) 27975 (?* ?y))      
    (That did it! There"'"s a key in there.)
    ((open-drawer) (enter-combo)))
    
    (((?* ?x))      
    (Nope"," still locked...)
    (() ()))
  )
)

(defparameter *open-drawer-rules* 
  '(
    (((?* ?x) take (?* ?y) key)      
    (Okay"," you took the key.)
    ((second-key) (open-drawer)))
    
    (((?* ?x) grab (?* ?y) key)      
    (Okay"," you took the key.)
    ((second-key) (open-drawer)))
    
    (((?* ?x) pick up (?* ?y) key)      
    (Okay"," you took the key.)
    ((second-key) (open-drawer)))
  )
)

(defparameter *already-key*
  '(
    (((?* ?x) take (?* ?y) key)      
    (You already have the key.)
    (() ()))

    (((?* ?x) grab (?* ?y) key)      
    (You already have the key.)
    (() ()))
  )
)

(defparameter *can-enter-next-room*
  '(
    (((?* ?x) open (?* ?y) door)      
    (You open the door and enter the next room.)
    ((second-room) (first-key second-key first-room first-door-open look-at-desk)))
    
    (((?* ?x) twist (?* ?y) handle)      
    (The handle twists and you enter the next room.)
    ((second-room) (first-key second-key first-room first-door-open look-at-desk)))

    (((?* ?x) enter (?* ?y) room)      
    (You are now in the second room)
    ((second-room) (first-key second-key first-room first-door-open look-at-desk)))

    (((?* ?x) go through (?* ?y) door)      
    (You are now in the second room)
    ((second-room) (first-key second-key first-room first-door-open look-at-desk)))
    
    (((?* ?x) go into (?* ?y) room)      
    (You are now in the second room)
    ((second-room) (first-key second-key first-room first-door-open look-at-desk)))
  )
)

(defparameter *can-open-door*
  '(
    (((?* ?x) open (?* ?y) door)      
    (Perfect! You insert each key into a keyhole and they unlock the door.)
    ((first-door-open) (first-key second-key)))

    (((?* ?x) unlock (?* ?y) door)      
    (Perfect! You insert each key into a keyhole and they unlock the door.)
    ((first-door-open) (first-key second-key)))
    
    (((?* ?x) insert (?* ?y) key (?* ?z))      
    (Perfect! You insert each key into a keyhole and they unlock the door.)
    ((first-door-open) (first-key second-key)))
    
    (((?* ?x) put (?* ?y) key (?* ?z) in (?* ?a))      
    (Perfect! You insert each key into a keyhole and they unlock the door.)
    ((first-door-open) (first-key second-key)))
    
    (((?* ?x) try (?* ?y) keys (?* ?z))      
    (Perfect! You insert each key into a keyhole and they unlock the door.)
    ((first-door-open) (first-key second-key)))
    
    (((?* ?x) put (?* ?y) keys (?* ?z) in (?* ?a))      
    (Perfect! You insert each key into a keyhole and they unlock the door.)
    ((first-door-open) (first-key second-key)))
    
    (((?* ?x) insert (?* ?y) keys (?* ?z))      
    (Perfect! You insert each key into a keyhole and they unlock the door.)
    ((first-door-open) (first-key second-key)))

  )
)

;; SECOND ROOM RULES

(defparameter *second-room-rules*
    '(
        (((?* ?x) look around (?* ?y))      
        (Once again"," it"'"s a pretty sparcely decorated room. There"'"s a portrait of a man on the wall","
        a couch against the other wall"," and a bookshelf full of books. Also"," the door you came in through and another door.
        Next to the couch is a sidetable with a lamp that is flickering on and off.)
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
        
        (((?* ?x) move (?* ?y) portrait)      
        (It"'"s stuck to the wall pretty tight.)
        (() ()))
        
        (((?* ?x) move (?* ?y) painting)      
        (It"'"s stuck to the wall pretty tight.)
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
        
        (((?* ?x) search (?* ?y) couch)      
        (You move the cushions around but can"'"t see anything important.)
        (() ()))
        
        (((?* ?x) move (?* ?y) couch cushions)      
        (You move the cushions around but can"'"t see anything important.)
        (() ()))
        
        (((?* ?x) take (?* ?y) couch cushions)      
        (You move the cushions around but can"'"t see anything important.)
        (() ()))
        
        (((?* ?x) move (?* ?y) couch)      
        (Ugh! It won"'"t budge.)
        (() ()))
        
        (((?* ?x) push (?* ?y) couch)      
        (Ugh! It won"'"t budge.)
        (() ()))

        (((?* ?x) look at (?* ?y) bookshelf)      
        (It has the following books on it":" "\"Wuthering Heights\"," "\"Brave New World\"," "\"The Great Gatsby\","
        "\"Crime and Punishment\"," "\"Dracula\"," "\"Adventures of Huckleberry Finn\"," "\"Great Expectations\"," and "\"Razor's Edge\".")
        ((look-at-bookshelf) ()))
        
        (((?* ?x) go to (?* ?y) bookshelf)      
        (It has the following books on it":" "\"Wuthering Heights\"," "\"Brave New World\"," "\"The Great Gatsby\","
        "\"Crime and Punishment\"," "\"Dracula\"," "\"Adventures of Huckleberry Finn\"," "\"Great Expectations\"," and "\"Razor's Edge\".")
        ((look-at-bookshelf) ()))
        
        (((?* ?x) look at (?* ?y) door)      
        (The door has a small numeric keypad next to it.)
        (() ()))
        
        (((?* ?x) go to (?* ?y) door)      
        (The door has a small numeric keypad next to it.)
        (() ()))
        
        (((?* ?x0) 3722 (?* ?x) keypad (?* ?y))      
        (The light turns green and you hear a click!)
        ((closet-unlocked) ()))

        
        (((?* ?x) keypad (?* ?y) 3722)      
        (The light turns green and you hear a click!)
        ((closet-unlocked) ()))
        
        (((?* ?x) try (?* ?y) 3722)      
        (The light turns green and you hear a click!)
        ((closet-unlocked) ()))
        
        (((?* ?x) type (?* ?y) 3722)      
        (The light turns green and you hear a click!)
        ((closet-unlocked) ()))

        (((?* ?y4) 3 (?* ?y1) 7 (?* ?y2) 2 (?* ?y3) 2 (?* ?x) keypad (?* ?y) )      
        (The light turns green and you hear a click!)
        ((closet-unlocked) ()))
        
        (((?* ?x) keypad (?* ?y) 3 (?* ?y1) 7 (?* ?y2) 2 (?* ?y3) 2)      
        (The light turns green and you hear a click!)
        ((closet-unlocked) ()))
        
        (((?* ?x) type (?* ?y) 3 (?* ?y1) 7 (?* ?y2) 2 (?* ?y3) 2)      
        (The light turns green and you hear a click!)
        ((closet-unlocked) ()))
        
        (((?* ?x) try (?* ?y) 3 (?* ?y1) 7 (?* ?y2) 2 (?* ?y3) 2)      
        (The light turns green and you hear a click!)
        ((closet-unlocked) ()))
        
        (((?* ?x0) enter (?* ?x) combination 3722 (?* ?y))      
        (The light turns green and you hear a click!)
        ((closet-unlocked) ()))
        
        (((?* ?x0) enter (?* ?x) 3722 (?* ?y))      
        (The light turns green and you hear a click!)
        ((closet-unlocked) ()))
        
        (((?* ?x0) enter (?* ?x) combination (?* ?y))      
        (Okay"," what numbers?)
        (() (enter-keypad-combo)))

        (((?* ?x0) enter (?* ?x) numbers (?* ?y) 3 (?* ?y1) 7 (?* ?y2) 2 (?* ?y3) 2)      
        (The light turns green and you hear a click!)
        ((closet-unlocked) ()))     
        
        (((?* ?x0) enter (?* ?y) 3 (?* ?y1) 7 (?* ?y2) 2 (?* ?y3) 2)      
        (The light turns green and you hear a click!)
        ((closet-unlocked) ()))     

        (((?* ?x0) enter (?* ?x) numbers (?* ?y))      
        (Okay"," what numbers?)
        (() (enter-keypad-combo)))
        
        (((?* ?x) look at (?* ?y) lamp)      
        (It"'"s flickering on and off. It"'"s kinda like short short short long long
        long long short short short short short long long long short short long long long. 
        It"'"s super annoying.)
        (() ()))

        ;; (((?* ?x) turn off (?* ?y) lamp)      
        ;; (Okay it"'"s off.)
        ;; (() ()))

        (((?* ?x) go to (?* ?y) sidetable)      
        (The sidetable has a newspaper and a lamp on it.)
        ((look-at-sidetable) ()))
        
        (((?* ?x) look at (?* ?y) sidetable)      
        (The sidetable has a newspaper and a lamp on it.)
        ((look-at-sidetable) ()))
    )
)

(defparameter *enter-keypad-combo-rules*
  '(
        (((?* ?y4) 3 (?* ?y1) 7 (?* ?y2) 2 (?* ?y3) 2 (?* ?x) )      
        (The light turns green and you hear a click!)
        ((closet-unlocked) (enter-keypad-combo)))
        
        (((?* ?x0) 3722 (?* ?x))      
        (The light turns green and you hear a click!)
        ((closet-unlocked) (enter-keypad-combo)))
        
        (((?* ?x0) )      
        (No"," still locked...)
        (() (enter-keypad-combo)))

  )
)

(defparameter *closet-unlocked-rules*
  '(
    
        (((?* ?x) open (?* ?y) door)      
        (You turn the doorknob and slowly open the door.)
        ((closet-open) (closet-unlocked)))
        
        (((?* ?x) go through (?* ?y) door)      
        (It"'"s still closed.)
        (() ()))
        
        (((?* ?x) enter (?* ?y) room)      
        (The door is still closed.)
        (() ()))
  )
)

(defparameter *closet-open-rules*
  '(
    
        (((?* ?x) look in (?* ?y) room)      
        (It"'"s... A closet. There"'"s just a broom in here)
        (() ()))
        
        (((?* ?x) look through (?* ?y) doorway)      
        (It"'"s... A closet. There"'"s just a broom in here)
        (() ()))
        
        (((?* ?x) look inside (?* ?y))      
        (It"'"s... A closet. There"'"s just a broom in here)
        (() ()))
        
        (((?* ?x) look into (?* ?y) room)      
        (It"'"s... A closet. There"'"s just a broom in here)
        (() ()))

        (((?* ?x) go into (?* ?y) room)      
        (It"'"s... A closet. There"'"s just a broom in here)
        (() ()))
        
        (((?* ?x) enter (?* ?y) room)      
        (It"'"s... A closet. There"'"s just a broom in here)
        (() ()))
        
        (((?* ?x) enter through (?* ?y) door)      
        (It"'"s... A closet. There"'"s just a broom in here)
        (() ()))
        
        (((?* ?x) leave (?* ?y) closet)      
        (Okay"," you"'"re back in the second room.)
        (() ()))
        
        (((?* ?x) go back (?* ?y))      
        (Okay"," you"'"re back in the second room.)
        (() ()))
        
        (((?* ?x) exit (?* ?y) closet)      
        (Okay"," you"'"re back in the second room.)
        (() ()))
        
        (((?* ?x) go through (?* ?y) door)      
        (It"'"s... A closet. There"'"s just a broom in here)
        (() ()))
        
        (((?* ?x) take (?* ?y) broom (?* ?z))      
        (Yeah"," okay. You have the broom now. Have fun.)
        ((have-broom) ()))
        '
        (((?* ?x) grab (?* ?y) broom)      
        (Yeah"," okay. You have the broom now. Have fun.)
        ((have-broom) ()))
        
        (((?* ?x) pick up (?* ?y) broom)      
        (Yeah"," okay. You have the broom now. Have fun.)
        ((have-broom) ()))
        
        (((?* ?x) move (?* ?y) broom)      
        (Yeah"," okay. You have the broom now. Have fun.)
        ((have-broom) ()))

        (((?* ?x) use (?* ?y) broom (?* ?z))      
        (You aren"'"t holding the broom.)
        (() ()))
        
        (((?* ?x) look at (?* ?y) broom)      
        (It has no distinguishing features. It looks like a normal broom.)
        (() ()))
        
        (((?* ?x) throw (?* ?y) broom)      
        (You aren"'"t holding the broom.)
        (() ()))
        
        (((?* ?x) set (?* ?y) broom (?* ?z))      
        (You aren"'"t holding the broom.)
        (() ()))
  )
)

(defparameter *have-broom-rules*
  '(
        (((?* ?x) use (?* ?y) broom to (?* ?z))      
        (Fine"," you ?z"," which does nothing.)
        (() ()))

        (((?* ?x) use (?* ?y) broom)      
        (To do what?)
        (() ()))
        
        (((?* ?x) look at (?* ?y) broom)      
        (It has no distinguishing features. It looks like a normal broom.)
        (() ()))
        
        (((?* ?x) throw (?* ?y) broom)      
        (You throw the broom. It is no longer in your possession.)
        (() (have-broom)))
        
        (((?* ?x) set (?* ?y) broom)      
        (You set (?* ?y) broom. It is no longer in your possession.)
        (() (have-broom)))
  )
)

#|
Morse Code:
1 - dot dash dash dash dash
2 - dot dot dash dash dash
3 - dot dot dot dash dash
4 - dot dot dot dot dash
5 - dot dot dot dot dot
6 - dash dot dot dot dot
7 - dash dash dot dot dot
8 - dash dash dash dot dot
9 - dash dash dash dash dot
10 - dash dash dash dash dash
|#

(defparameter *sidetable-rules*
  '(
        (((?* ?x) look at (?* ?y) newspaper)      
        (The headline "IS: Man Trapped in Ice." Hmm. Looks like there"'"s also an article on Morse Code.) 
        (() ()))
        
        (((?* ?x) read (?* ?y) newspaper)      
        (The headline "IS: Man Trapped in Ice." Hmm. Looks like there"'"s also an article on Morse Code.) 
        (() ()))
        
        (((?* ?x) read (?* ?y) morse code)      
        (Let"'"s see"," the article says":" "\"Morse Code is still important! Learn the numbers: \
1 * - - - -\
2 * * - - -\
3 * * * - -\
4 * * * * -\
5 * * * * *\
6 - * * * *\
7 - - * * *\
8 - - - * *\
9 - - - - *\
10 - - - - -\
See, not too bad?\"") 
        (() ()))
        
        (((?* ?x) read (?* ?y) article)      
        (Let"'"s see"," the article says":" "\"Morse Code is still important! Learn the numbers: \
1 * - - - -\
2 * * - - -\
3 * * * - -\
4 * * * * -\
5 * * * * *\
6 - * * * *\
7 - - * * *\
8 - - - * *\
9 - - - - *\
10 - - - - -\
See, not too bad?\"") 
        (() ()))
        
        (((?* ?x) look (?* ?y) article)      
        (Let"'"s see"," the article says":" "\"Morse Code is still important! Learn the numbers: \
1 * - - - -\
2 * * - - -\
3 * * * - -\
4 * * * * -\
5 * * * * *\
6 - * * * *\
7 - - * * *\
8 - - - * *\
9 - - - - *\
10 - - - - -\
See, not too bad?\"") 
        (() ()))
  )
)

(defparameter *bookshelf-rules*
  '(
        (((?* ?x) take (?* ?y) Brave New World)      
        (You hear a clicking sound"," but the book won"'"t come out. It just tips backwards. You push it back in.)
        ((book1) ()))
        
        (((?* ?x) read (?* ?y) Brave New World)      
        (You try to take the book"," but it won"'"t come out. You hear a clicking sound. It just tips backwards. You push it back in.)
        ((book1) ()))
        
        (((?* ?x) pick up (?* ?y) Brave New World)      
        (You try to take the book"," but it won"'"t come out. You hear a clicking sound. It just tips backwards. You push it back in.)
        ((book1) ()))
        
        (((?* ?x) pull out (?* ?y) Brave New World)      
        (You try to take the book"," but it won"'"t come out. You hear a clicking sound. It just tips backwards. You push it back in.)
        ((book1) ()))
        
        (((?* ?x) open (?* ?y) Brave New World)      
        (You try to take the book"," but it won"'"t come out. You hear a clicking sound. It just tips backwards. You push it back in.)
        ((book1) ()))
        
        (((?* ?x) take (?* ?y) book)      
        (Which book? There are"," like"," ten of them.)
        (() ()))
        
        (((?* ?x) try (?* ?y) book)      
        (Which book? There are"," like"," ten of them.)
        (() ()))
        
        (((?* ?x) read (?* ?y) book)      
        (Which book? There are"," like"," ten of them.)
        (() ()))
        
        (((?* ?x) open (?* ?y) book)      
        (Which book? There are"," like"," ten of them.)
        (() ()))

        (((?* ?x) take (?* ?y))      
        (The book won"'"t come out. It just tips backwards. You push it back in.)
        (() ()))
        
        (((?* ?x) take (?* ?y))      
        (The book won"'"t come out of the bookshelf. It just tips backwards. You push it back in.)
        (() ()))
        
        (((?* ?x) grab (?* ?y) Brave New World)      
        (You hear a clicking sound"," but the book won"'"t come out. It just tips backwards. You push it back in.)
        ((book1) ()))
        
        (((?* ?x) grab (?* ?y) book)      
        (Which book? There are"," like"," ten of them.)
        (() ()))

        (((?* ?x) grab (?* ?y))      
        (The book won"'"t come out. It just tips backwards. You push it back in.)
        (() ()))
        
        (((?* ?x) pick up (?* ?y))      
        (The book won"'"t come out. It just tips backwards. You push it back in.)
        (() (book3 book2 book1)))
        
        (((?* ?x) pull out (?* ?y))      
        (The book won"'"t come out. It just tips backwards. You push it back in.)
        (() (book3 book2 book1)))
  )
)

(defparameter *book1-rules*
  '(        
        (((?* ?x) take (?* ?y) Razor 's Edge)      
        (You hear a clicking sound"," but the book won"'"t come out. It just tips backwards. You push it back in.)
        ((book2) (book1)))
        
        (((?* ?x) take (?* ?y) Razors Edge)      
        (You hear a clicking sound"," but the book won"'"t come out. It just tips backwards. You push it back in.)
        ((book2) (book1)))

        (((?* ?x) pick up (?* ?y) Razor 's Edge)      
        (You hear a clicking sound"," but the book won"'"t come out. It just tips backwards. You push it back in.)
        ((book2) (book1)))
        
        (((?* ?x) pick up (?* ?y) Razors Edge)      
        (You hear a clicking sound"," but the book won"'"t come out. It just tips backwards. You push it back in.)
        ((book2) (book1)))
        
        (((?* ?x) pull out (?* ?y) Razor 's Edge)      
        (You hear a clicking sound"," but the book won"'"t come out. It just tips backwards. You push it back in.)
        ((book2) (book1)))
        
        (((?* ?x) pull out (?* ?y) Razors Edge)      
        (You hear a clicking sound"," but the book won"'"t come out. It just tips backwards. You push it back in.)
        ((book2) (book1)))

        (((?* ?x) take (?* ?y) book)      
        (Which book? There are"," like"," ten of them.)
        ((book1) ()))

        (((?* ?x) take (?* ?y))      
        (The book won"'"t come out.)
        (() (book1)))
        
        (((?* ?x) grab (?* ?y) Razor 's Edge)      
        (You hear a clicking sound"," but the book won"'"t come out. It just tips backwards. You push it back in.)
        ((book2) (book1)))
        
        (((?* ?x) grab (?* ?y) Razors Edge)      
        (You hear a clicking sound"," but the book won"'"t come out. It just tips backwards. You push it back in.)
        ((book2) (book1)))

        (((?* ?x) grab (?* ?y) book)      
        (Which book? There are"," like"," ten of them.)
        ((book1) ()))

        (((?* ?x) grab (?* ?y))      
        (The book won"'"t come out.)
        (() (book1)))
  )
)

(defparameter *book2-rules*
  '(
        (((?* ?x) take (?* ?y) Adventures of Huckleberry Finn)      
        (You hear a clicking sound"," but the book won"'"t come out. It just tips backwards. You push it back in.)
        ((book3) (book2)))
        
        (((?* ?x) pick up (?* ?y) Adventures of Huckleberry Finn)      
        (You hear a clicking sound"," but the book won"'"t come out. It just tips backwards. You push it back in.)
        ((book3) (book2)))
        
        (((?* ?x) pull out (?* ?y) Adventures of Huckleberry Finn)      
        (You hear a clicking sound"," but the book won"'"t come out. It just tips backwards. You push it back in.)
        ((book3) (book2)))
        
        (((?* ?x) take (?* ?y) book)      
        (Which book? There are"," like"," ten of them.)
        ((book1) ()))

        (((?* ?x) take (?* ?y))      
        (The book won"'"t come out. It just tips backwards. You push it back in.)
        (() (book2)))
        
        (((?* ?x) grab (?* ?y) Adventures of Huckleberry Finn)      
        (You hear a clicking sound"," but the book won"'"t come out. It just tips backwards. You push it back in.)
        ((book3) (book2)))
        
        (((?* ?x) grab (?* ?y) book)      
        (Which book? There are"," like"," ten of them.)
        ((book1) ()))

        (((?* ?x) grab (?* ?y))      
        (The book won"'"t come out. It just tips backwards. You push it back in.)
        (() (book2)))
  )
)

(defparameter *book3-rules*
  '(
        (((?* ?x) take (?* ?y) Dracula)      
        (You hear a clicking sound"," but the book won"'"t come out. The bookshelf
        makes a whirring noise and moves to the side"," revealing a tunnel.)
        ((open-trap-door) (book3)))
        
        (((?* ?x) pick up (?* ?y) Dracula)      
        (You hear a clicking sound"," but the book won"'"t come out. The bookshelf
        makes a whirring noise and moves to the side"," revealing a tunnel.)
        ((open-trap-door) (book3)))
        
        (((?* ?x) pull out (?* ?y) Dracula)      
        (You hear a clicking sound"," but the book won"'"t come out. The bookshelf
        makes a whirring noise and moves to the side"," revealing a tunnel.)
        ((open-trap-door) (book3)))
        
        (((?* ?x) take (?* ?y) book)      
        (Which book? There are"," like"," ten of them.)
        ((book1) ()))

        (((?* ?x) take (?* ?y))      
        (The book won"'"t come out. It just tips backwards. You push it back in.)
        (() (book3)))
        
        (((?* ?x) grab (?* ?y) Dracula)      
        (You hear a clicking sound"," but the book won"'"t come out. The bookshelf
        makes a whirring noise and moves to the side"," revealing a tunnel.)
        ((open-trap-door) (book3)))
        
        (((?* ?x) grab (?* ?y) book)      
        (Which book? There are"," like"," ten of them.)
        ((book1) ()))

        (((?* ?x) grab (?* ?y))      
        (The book won"'"t come out. It just tips backwards. You push it back in.)
        (() (book3)))
  )
)

(defparameter *trapdoor-rules*
  '(
        (((?* ?x) enter (?* ?y) tunnel)      
        (You enter the tunnel.)
        ((in-tunnel) (second-room open-trap-door)))
        
        (((?* ?x) into (?* ?y) tunnel)      
        (You enter the tunnel.)
        ((in-tunnel) (second-room)))

        (((?* ?x) crawl through (?* ?y) tunnel)      
        (You crawl through the tunnel and enter back into the room where you checked in. You did it! You escaped. Feel free to look around. Let me know when you"'"re ready to leave.)
        ((waiting-room) (second-room open-trap-door)))
        
        (((?* ?x) walk through (?* ?y) tunnel)      
        (The ceiling"'"s too low. You"'"re going to have to crawl to get through it.)
        (() ()))
        
        (((?* ?x) go through (?* ?y) tunnel)      
        (You crawl through the tunnel and enter back into the room where you checked in. You did it! You escaped. Feel free to look around. Let me know when you"'"re ready to leave.)
        ((waiting-room) (second-room open-trap-door)))
  )
)

(defparameter *tunnel-rules*
  '(
        (((?* ?x) crawl through (?* ?y) tunnel)      
        (You crawl through the tunnel and enter back into the room where you checked in. You did it! You escaped. Feel free to look around. Let me know when you"'"re ready to leave.)
        ((waiting-room) (in-tunnel open-trap-door)))
        
        (((?* ?x) exit (?* ?y) tunnel)      
        (You crawl through the tunnel and enter back into the room where you checked in. You did it! You escaped. Feel free to look around. Let me know when you"'"re ready to leave.)
        ((waiting-room) (in-tunnel open-trap-door)))
        
        (((?* ?x) leave (?* ?y) tunnel)      
        (You crawl through the tunnel and enter back into the room where you checked in. You did it! You escaped. Feel free to look around. Let me know when you"'"re ready to leave.)
        ((waiting-room) (in-tunnel open-trap-door)))

        (((?* ?x) look around (?* ?y))      
        (It"'"s really dark and you can"'"t see anything.)
        (() ()))
  )
)

'(defparameter *waiting-room-rules*
        (((?* ?x) look around (?* ?y))      
        (There"'"s the same couch and coffee table with magazines you saw when you checked in. The same woman is at the front desk. The glass doors leading to the parking lot are there"," too.)
        (() ()))
        
        (((?* ?x) look (?* ?y) couch)      
        (A much nicer couch than was in the escape room itself. Looks comfy.)
        (() ()))
        
        (((?* ?x) go to (?* ?y) couch)      
        (A much nicer couch than was in the escape room itself. Looks comfy.)
        (() ()))

        (((?* ?x) sit (?* ?y) couch)      
        (Um... I think the receptionist would think it strange if you did that. You already finished the game"," didn"'"t you?)
        (() ()))
        
        (((?* ?x) look (?* ?y) coffee table)      
        (It"'"s covered in boring magazines.)
        (() ()))
        
        (((?* ?x) go to (?* ?y) coffee table)      
        (It"'"s covered in boring magazines.)
        (() ()))
        
        (((?* ?x) look (?* ?y) magazines)      
        (Just some boring car magazines and a few Forbes.)
        (() ()))
        
        (((?* ?x) read (?* ?y) magazines (?* ?z))      
        (Don"'"t you have something better to do with the rest of your day?)
        (() ()))
        
        (((?* ?x) read (?* ?y) magazine (?* ?z))      
        (Don"'"t you have something better to do with the rest of your day?)
        (() ()))
        
        (((?* ?x) look (?* ?y) desk)      
        (You surreptisiously sneak a peek at the front desk. There"'"s a jar of candies and some business cards.)
        (() ()))
        
        (((?* ?x) go to (?* ?y) desk)      
        (You surreptisiously sneak a peek at the front desk. There"'"s a jar of candies and some business cards.)
        (() ()))
        
        (((?* ?x) take (?* ?y) business card)      
        (While the receptionist isn"'"t looking you grab a business card. "\"Escape Games, Inc.\"" with the address of the building you"'"re currently in on it.)
        (() ()))
        
        (((?* ?x) look (?* ?y) business card)      
        (While the receptionist isn"'"t looking you grab a business card. "\"Escape Games, Inc.\"" with the address of the building you"'"re currently in on it.)
        (() ()))
        
        (((?* ?x) take (?* ?y) candy)      
        (While the receptionist isn"'"t looking you grab one of the peppermint candies.)
        ((has-peppermint) ()))
        
        (((?* ?x) eat (?* ?y) candy)      
        (You don"'"t have a candy"," they"'"re still on the desk.)
        (() ()))
        
        (((?* ?x) talk (?* ?y) receptionist)      
        (She"'"s on the phone"," but she smiles at you when you look over at her.)
        (She looks busy.)
        (() ()))
        
        (((?* ?x) say (?* ?y) receptionist)      
        (She"'"s on the phone"," but she smiles at you when you look over at her.)
        (She looks busy.)
        (() ()))
        
        (((?* ?x) play again (?* ?y))      
        (Okay"," if you want to. You go to the receptionist and give her your money. She takes you back to the first room in the escape room.)
        ((first-room) (waiting-room)))
        
        (((?* ?x) leave (?* ?y))      
        (good bye)
        (() ()))
        
        (((?* ?x) go through (?* ?y) doors)      
        (good bye)
        (() ()))
)

'(defparameter *has-peppermint-rules*
        (((?* ?x) eat (?* ?y) candy)      
        (You unwrap and eat the peppermint candy.)
        (() (has-peppermint)))
        
        (((?* ?x) throw away (?* ?y) candy)      
        (Where? You don"'"t see a trash can. Just put it in your pocket.)
        (() ()))
        
        (((?* ?x) put in (?* ?y) pocket)      
        (The peppermint is safely in your pocket.)
        (() ()))

)