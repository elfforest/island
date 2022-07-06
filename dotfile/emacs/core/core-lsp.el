(provide 'core-lsp)

(use-package flycheck
  :ensure t
  :defer t
  :init (global-flycheck-mode t))

(use-package ccls
  :ensure t
  :config
  (setq ccls-executable (expand-file-name "~/.emacs.d/ccls"))
  )

;; (use-package eglot
  ;; :config
  ;; (add-hook 'prog-mode-hook 'eglot-ensure))

(use-package lsp-mode
  :ensure t
  :hook (program-mode . lsp-deferred)
  :config (setq lsp-pyls-plugins-pylint-enabled nil
                lsp-auto-configure t
                lsp-eldoc-render-all t
                lsp-enable-imenu t)
                ;;lsp-pyls-configuration-sources ["flake8"])
  :commands (lsp lsp-deferred))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)
