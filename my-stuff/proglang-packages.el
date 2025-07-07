;; spelling
(use-package flycheck
  :ensure t
  :config
  (yas-global-mode 1)
  )

;; function templates
(use-package yasnippet
  :ensure t
  )

;; markdown
(use-package markdown-mode
  :mode ("\\.\\(njk\\|md\\)\\')" . markdown-mode))
