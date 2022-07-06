(provide 'core-org)

(use-package all-the-icons)


;; Standard location of personal dictionary
(setq ispell-personal-dictionary "~/.flydict")

;; Mostly taken from
;; http://blog.binchen.org/posts/what-s-the-best-spell-check-set-up-in-emacs.html
(when (executable-find "aspell")
  (setq ispell-program-name (executable-find "aspell"))
  (setq ispell-extra-args
	(list "--sug-mode=fast" ;; ultra|fast|normal|bad-spellers
	      "--lang=en_US"
	      "--ignore=4")))

;; hunspell
(when (executable-find "hunspell")
  (setq ispell-program-name (executable-find "hunspell"))
  (setq ispell-extra-args '("-d ru_RU")))


(add-to-list 'ispell-skip-region-alist '("[^\000-\377]+"))
(add-to-list 'ispell-skip-region-alist '(":\\(PROPERTIES\\|LOGBOOK\\):" . ":END:"))
(add-to-list 'ispell-skip-region-alist '("#\\+BEGIN_SRC" . "#\\+END_SRC"))
(add-to-list 'ispell-skip-region-alist '("#\\+BEGIN_EXAMPLE" . "#\\+END_EXAMPLE"))

(defun my/enable-flyspell-prog-mode ()
  (interactive)
  (flyspell-prog-mode))
;; hello привет как
(use-package flyspell
  :defer t
  :diminish ""
  :init (add-hook 'prog-mode-hook #'my/enable-flyspell-prog-mode)
  ;;:config
  ;;(use-package helm-flyspell
  ;;  :init
  ;;  (define-key flyspell-mode-map (kbd "M-S") #'helm-flyspell-correct))
  )

;; (add-hook 'after-save-hook 'flyspell-buffer)
(add-hook 'prog-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook 'flyspell-mode)


(use-package org
  :ensure t
  :init
  (use-package org-bullets
    :ensure t
    :init
    (add-hook 'org-mode-hook #'org-bullets-mode)
    (setq inhibit-compacting-font-caches t
	  org-bullets-bullet-list '("II" "III" "IV" "V" "VI" "VII" "VIII" "IX" "X"))

    )

  (setq-default prettify-symbols-alist '(("#+BEGIN_SRC" . "†")
				       ("#+END_SRC" . "†")
				       ("#+begin_src" . "†")
				       ("#+end_src" . "†")
				       (">=" . "≥")
				       ("=>" . "⇨")))
  (setq prettify-symbols-unprettify-at-point 'right-edge)
  (add-hook 'org-mode-hook 'prettify-symbols-mode)

  (font-lock-add-keywords 'org-mode
			'(("^ *\\([-]\\) "
			   (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
  (font-lock-add-keywords 'org-mode
			  '(("^ *\\([+]\\) "
			     (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "◦"))))))

  (when (member "Symbola" (font-family-list))
  (set-fontset-font "fontset-default" nil
		    (font-spec :size 20 :name "Symbola")))

  (when (member "Symbola" (font-family-list))
    (set-fontset-font t 'unicode "Symbola" nil 'prepend))

  (prefer-coding-system       'utf-8)
  (set-default-coding-systems 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  (setq default-buffer-file-coding-system 'utf-8)

  (setq org-startup-indented t
      org-src-tab-acts-natively t)

  (add-hook 'org-mode-hook
	  (lambda ()
	    (variable-pitch-mode 1)
	    visual-line-mode))
  (setq org-hide-emphasis-markers t
	org-fontify-done-headline t
	org-hide-leading-stars t
	org-pretty-entities t
	org-odd-levels-only t)

  (setq org-list-demote-modify-bullet
      (quote (("+" . "-")
	      ("-" . "+")
	      ("*" . "-")
	      ("1." . "-")
	      ("1)" . "-")
	      ("A)" . "-")
	      ("B)" . "-")
	      ("a)" . "-")
	      ("b)" . "-")
	      ("A." . "-")
	      ("B." . "-")
	      ("a." . "-")
	      ("b." . "-"))))

   (custom-theme-set-faces
 'user
 '(variable-pitch ((t (:family "Source Sans Pro" :height 120 :weight light))))
 '(fixed-pitch ((t ( :family "Consolas" :slant normal :weight normal :height 0.9 :width normal)))))

(custom-theme-set-faces
 'user
 '(org-block                 ((t (:inherit fixed-pitch))))
 '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
 '(org-property-value        ((t (:inherit fixed-pitch))) t)
 '(org-special-keyword       ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-tag                   ((t (:inherit (shadow fixed-pitch) :weight bold))))
 '(org-verbatim              ((t (:inherit (shadow fixed-pitch))))))

(use-package org-pretty-tags
  :demand t
  :config
   (setq org-pretty-tags-surrogate-strings
	 (quote
	  (("TOPIC" . "☆")
	   ("PROJEKT" . "💡")
	   ("SERVICE" . "✍")
	   ("Blog" . "✍")
	   ("music" . "♬")
	   ("security" . "🔥"))))
   (org-pretty-tags-global-mode))

(use-package org-fancy-priorities
  :diminish
  :demand t
  :defines org-fancy-priorities-list
  :hook (org-mode . org-fancy-priorities-mode)
  :config
  (unless (char-displayable-p ?❗)
    (setq org-fancy-priorities-list '("HIGH" "MID" "LOW" "OPTIONAL"))))

;;(require 'org-num)
;;(add-hook 'org-mode 'org-num-mode)
  :config
 )
