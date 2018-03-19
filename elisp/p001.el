;; Multiples of 3 and 5
;; Problem 1

;; If we list all the natural numbers below 10 that are multiples of 3
;; or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

;; Find the sum of all the multiples of 3 or 5 below 1000.

(defun sum-to-n (n)
  (/ (* n (+ n 1)) 2))

(defun sum-multiples-of-m-to-n (m n)
  (* m (sum-to-n (/ n m))))

(defun p001 ()
  (interactive)
  (- (+ (sum-multiples-of-m-to-n 3 999)
        (sum-multiples-of-m-to-n 5 999))
     (sum-multiples-of-m-to-n 15 999)))
