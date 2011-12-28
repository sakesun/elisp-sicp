"Exercise 1.3.  Define a procedure that takes three numbers as
arguments and returns the sum of the squares of the two larger
numbers"

(defun sort2 (a b)
  (if (< a b) (list a b) (list b a)))

(defun two-largers (a b c)
     (let ((pair1 (sort2 a b)))
       (let ((pair2 (sort2 (first pair1) c)))
	 (list (second pair1) (second pair2)))))

(defun sum-of-squares (a b)
  (+ (* a a) (* b b)))

(defun sum-of-squares-of-the-two-largers (a b c)
  (apply #'sum-of-squares (two-largers a b c)))
