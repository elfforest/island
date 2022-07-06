(provide 'core-lisp)

(use-package slime
  :config
  (require 'slime-autoloads nil :noerror)
  (setq-default common-lisp-style-default "sbcl" )
  (setq-default inferior-lisp-program     "sbcl" )
  (slime-setup '(slime-asdf slime-fancy slime-tramp slime-indentation) )
  :if (executable-find "sbcl") )
