
(defun sieve (n)
  (let ((avector (vconcat (make-vector 2 nil)
                          (make-vector (- n 1) t)))
        (nums (number-sequence 2 (floor (sqrt n)))))
    (dolist (i nums)
      (if (aref avector i)
          (dolist (j (number-sequence (expt i 2) n i))
            (aset avector j nil))
        nil))
    avector))

(defun prime-factorization (n)
  (let* ((m (floor (sqrt n)))
         (candidates (sieve m))
         candidates
         )))

