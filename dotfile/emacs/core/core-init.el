(provide 'core-init)


(cua-mode 1) ;;; Ctrl+C, Ctrl+V! Прямо как в Windows!
(menu-bar-mode 1)      ;;; А меню - никогда
(scroll-bar-mode -1)    ;;; Скроллбар не нужен
(tool-bar-mode -1)      ;;; Тулбар не нужен

;;File limits
(setq gc-cons-thresold 50000000)
(setq large-file-warning-thresold 100000000)
;;Encoding
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(fset 'yes-or-no-p 'y-or-n-p)
(global-auto-revert-mode t)
(add-hook 'before-save-hook 'whitespace-cleanup)

(global-hl-line-mode +1)
(line-number-mode +1)
(global-display-line-numbers-mode +1)
(column-number-mode t)
(size-indication-mode t)
(setq inhibit-startup-screen t)
(setq frame-title-format
      '((:eval (if (buffer-file-name)
       (abbreviate-file-name (buffer-file-name))
       "%b"))))
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)
(set-frame-font "Hack 12" nil t)

(use-package quickrun
  :bind
  (("C-<f5>" . quickrun)
   ("C-<f6>" . quickrun-shell)
   ("C-c e" . quickrun)
   ("C-c C-e" . quickrun-shell)))

(use-package
  paredit
  :ensure t
  :bind ("<f12>" . paredit-mode)
  ;; :delight " 🍐"
  ;;:commands (paredit-mode)
  :config (add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
  ;; enable in the *scratch* buffer
  (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
  (add-hook 'ielm-mode-hook #'enable-paredit-mode)
  (add-hook 'lisp-mode-hook #'enable-paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode))

(use-package hl-todo
  :ensure t
  :config (setq hl-todo-keyword-faces
		'(("TODO"   . "#FF0000")
		  ("FIXME"  . "#FF0000")
		  ("DEBUG"  . "#A020F0")
		  ("GOTCHA" . "#FF4500")
		  ("STUB"   . "#1E90FF")))
  (global-hl-todo-mode t))

(use-package zoom-window
  :ensure t
  :bind ("C-x C-z" . zoom-window-zoom)
  :config (custom-set-variables
	   '(zoom-window-mode-line-color "DarkGreen")))


(use-package modus-themes
  :ensure
  :init
  ;; Add all your customizations prior to loading the themes
  (setq modus-themes-italic-constructs t
	modus-themes-bold-constructs nil
	modus-themes-region '(bg-only no-extend))

  ;; Load the theme files before enabling a theme
  (modus-themes-load-themes)
  :config
  ;; Load the theme of your choice:
  (modus-themes-load-operandi) ;; OR (modus-themes-load-vivendi)
  :bind ("<f5>" . modus-themes-toggle))


(setq-default abbrev-mode 1)

(use-package yasnippet
  :defer 2
  :config
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :defer)

(use-package ivy-yasnippet
  :bind ("C-c y" . ivy-yasnippet))

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :bind
  (("C-c p f" . helm-projectile-find-file)
   ("C-c p p" . helm-projectile-switch-project)
   ("C-c p s" . projectile-save-project-buffers))
  :config
  (projectile-mode +1)
)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode)
  :config
  (show-paren-mode 1)
  (electric-pair-mode 1))
