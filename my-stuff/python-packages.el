;; set default to  python3
(setq python-shell-interpreter "python3")

;; major mode
(use-package python
  :ensure t)

;; dedicated server
;; prerequisite: npm
(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
			 (require 'lsp-pyright)
			 (lsp))))
