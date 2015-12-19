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

(defun list-of (type)
  "Sugar for `proper_types:list/1` since `list` is reserved in LFE."
  `(proper_types:list ,type))