;; XOR decryption
;; Problem 59

;; Each character on a computer is assigned a unique code and the
;; preferred standard is ASCII (American Standard Code for Information
;; Interchange). For example, uppercase A = 65, asterisk (*) = 42, and
;; lowercase k = 107.

;; A modern encryption method is to take a text file, convert the
;; bytes to ASCII, then XOR each byte with a given value, taken from a
;; secret key. The advantage with the XOR function is that using the
;; same encryption key on the cipher text, restores the plain text;
;; for example, 65 XOR 42 = 107, then 107 XOR 42 = 65.

;; For unbreakable encryption, the key is the same length as the plain
;; text message, and the key is made up of random bytes. The user
;; would keep the encrypted message and the encryption key in
;; different locations, and without both "halves", it is impossible to
;; decrypt the message.

;; Unfortunately, this method is impractical for most users, so the
;; modified method is to use a password as a key. If the password is
;; shorter than the message, which is likely, the key is repeated
;; cyclically throughout the message. The balance for this method is
;; using a sufficiently long password key for security, but short
;; enough to be memorable.

;; Your task has been made easy, as the encryption key consists of
;; three lower case characters. Using cipher.txt (right click and
;; 'Save Link/Target As...'), a file containing the encrypted ASCII
;; codes, and the knowledge that the plain text must contain common
;; English words, decrypt the message and find the sum of the ASCII
;; values in the original text.

;; insert-file-contents
;; (expand-file-name "p059_cipher.txt")
;; string-
;; (encode-char ?A 'ascii)
;; (decode-char 'ascii ?A)
;; (current-buffer)
;; (type-of ?A)
;; (- ?A ?A)
;; (- "A" "A")
;; (logxor (encode-char ?A 'ascii) (encode-char ?* 'ascii))
;; (decode-char 'ascii (logxor (encode-char ?A 'ascii) (encode-char ?* 'ascii)))
;; (message ?A)

(let ((file-buffer (with-temp-buffer
                     (insert-file-contents
                      (expand-file-name "p059_cipher.txt"))
                     (buffer-string))))
  (mapcar 'string-to-number (split-string file-buffer ",")))

(setq sample '(79 59 12 2 79 35 8 28 20 2 3 68))

(defun get-every-third-from-n (n lis)
  (let* ((len (length lis))
         (result)
         (thirds (number-sequence n len 3)))
    (dolist (i thirds)
      (add-to-list 'result (nth i lis) t))
    result))
      

(setq sample-string (concat sample))
;; "O;\fO#D"

(defun check-triples ()
  (let ((nums (number-sequence 0 (expt 2 21))))
    nums))

;; todo:
;; group in threes
;; mapcar some three string over it
;; generate all triples
;; enumerate over asciis
;; for each decoder ring, can either look for letter frequency, or
;; more simply, lack of control characters

;; in that case, look for rotations that result in all elements being
;; in

;; (setq sample-triple '("

;; (defun make-triples ()
;;   (let ((nums (number-sequence 0 127))
;;         (triples))
;;     (dolist (i nums)
;;       (dolist (j nums)
;;         (dolist (k nums)
;;           (add-to-list 'triples (list i j k)))))
;;     triples))
      
;; (setq some (make-triples))

