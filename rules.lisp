

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

