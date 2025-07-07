;; major mode
(use-package org
  :ensure t
  :config
  ;; hide (emphasis) formatters
  (setq org-hide-emphasis-markers t)
  ;; customize indentation
  (setq org-startup-indented t)  
  ;; customize headline height
  (custom-set-faces
   '(org-level-1 ((t (:inherit outline-1 :height 1.20))))
   '(org-level-2 ((t (:inherit outline-2 :height 1.18))))
   '(org-level-3 ((t (:inherit outline-3 :height 1.16))))
   '(org-level-4 ((t (:inherit outline-4 :height 1.14))))
   '(org-level-5 ((t (:inherit outline-5 :height 1.12)))))
  ;; suppress html validation link
  (setq org-html-validation-link nil)
  ;; larger latex formulas in preview mode
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.5))
  ;; do not use actual image width
  (setq org-image-actual-width nil)
  ;; preserve indentation
  (setq org-src-preserve-indentation t)
  ;; enable elisp and python evaluation with babel
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (python . t))))

;; org-roam
(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/Documents/Github/notes/orgroam")
  :bind (("C-c n l" . org-roam-buffer-toggle)
	 ("C-c n f" . org-roam-node-find)
	 ("C-c n i" . org-roam-node-insert)
	 :map org-mode-map
	 ("C-M-i" . cmopletion-at-point))
  :config
  (org-roam-setup)
  (setq org-startup-with-latex-preview t)
  (setq org-startup-with-inline-images t))

;; bullets
(use-package org-bullets
  :ensure t
  :after org
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; pitch-mode
(use-package org-variable-pitch
  :ensure t
  :after org
  :config
  (add-hook 'org-mode-hook 'org-variable-pitch-minor-mode)
  )

;; minimalist presentation environment
(use-package org-present
  :ensure t
  :after org
  )

;; visual table alignment
(use-package valign
  :ensure t
  :after (org org-present)
  :config
  (add-hook 'org-mode-hook #'valign-mode)
  (add-hook 'org-present-mode-hook #'valign-mode)  
  )

(use-package visual-fill-column
  :ensure t
  :after org-present
  )
