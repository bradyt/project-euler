;; Multiples of 3 and 5
;; Problem 1

;; If we list all the natural numbers below 10 that are multiples of 3
;; or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

;; Find the sum of all the multiples of 3 or 5 below 1000.

(defun problem-001 ()
  (interactive)
  (let ((nums (number-sequence 1 999))
        (s 0))
    (dolist (x nums)
      (if (or (eq 0 (% x 3))
              (eq 0 (% x 5)))
          (setq s (+ s x))))
    (message (format "%s" s))))

(defun sum-to-n (n)
  (/ (* n (+ n 1)) 2))

(defun sum-multiples-of-m-to-n (m n)
  (* m (sum-to-n (/ n m))))

