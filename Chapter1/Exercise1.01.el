"Exercise 1.1 Below is a sequence of expressions. What is the
result printed by the interpreter in response to eash expression?
Assume that the sequence is to be evaluated in the order in which
it is presented."

(defconst ANSWERS
  '(( 10                                10 )
    ( (+ 5 3 4)                         12 )
    ( (- 9 1)                            8 )
    ( (/ 6 2)                            3 )
    ( (+ (* 2 4) (- 4 6))                6 )
    ( (defvar a 3)                       a )
    ( (defvar b (+ a 1))                 b )
    ( (+ a b (* a b))                   19 )
    ( (= a b)                          nil )
    ( (if (and (> b a) (< b (* a b)))
	  b
	a)                               4 )
    ( (cond ((= a 4)  6)
	    ((= b 4)  (+ 6 7 a))
	    (t        25))              16 )
    ( (+ 2 (if (> b a) b a))             6 )
    ( (* (cond ((> a b)  a)
	       ((< a b)  b)
	       (t       -1))
	 (+ a 1))                       16 )))

(defun valid-ANSWER-p (answer)
  (equal
   (eval (first answer))
   (first (rest answer))))

(defun invalid-ANSWERS-iter (invalids answers)
  (if (null answers) invalids
    (let ((ans (first answers)))
      (if (valid-ANSWER-p ans)
	  (invalid-ANSWERS-iter invalids (rest answers))
	(invalid-ANSWERS-iter (cons ans invalids) (rest answers))))))

(defun invalid-ANSWERS ()
  (invalid-ANSWERS-iter () ANSWERS))

(if (invalid-ANSWERS)
    (message "FAIL !")
  (message "All Correct !"))



