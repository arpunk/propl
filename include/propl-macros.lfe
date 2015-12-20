;; Taken from https://github.com/lfex/ltest/blob/master/include/ltest-macros.lfe
(eval-when-compile
  (defun to-unders (atm)
    (re:replace (atom_to_list atm) "-" "_" '(#(return list) global))))

(defmacro defprop arg
  "This macro is for defining PropEr properties."
  (let ((name (to-unders (car arg)))
        (body (cdr arg)))
    `(defun ,(list_to_atom (++ "prop_" name)) ()
       ,@body)))

(defmacro prop-let (x raw-type gen)
  "Sugar for `?LET`."
  `(proper_types:bind ,raw-type (lambda (,x) ,gen) 'false))
