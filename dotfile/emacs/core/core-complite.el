(provide 'core-complite)



;;(use-package company-quickhelp)
;;(use-package slime-company)
(use-package company
  :ensure t
  :bind
  ( :map company-active-map
         ("<tab>" . company-complete        )
         ("C-d"   . company-show-doc-buffer )
         ("C-n"   . company-select-next     )
         ("C-p"   . company-select-previous ) )
  :init
  (company-quickhelp-mode 1)
  (setq company-quickhelp-delay 0.7
        company-tooltip-align-annotations t)

  (global-company-mode)
  (push 'slime-company slime-contribs)
  (push 'company-robe company-backends))

(use-package company-irony
  :after company
  :hook irony-mode
  :config
  (require 'company)
  (add-to-list 'company-backends 'company-irony)
  )
