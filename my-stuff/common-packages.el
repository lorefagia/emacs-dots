;; rotations


;; ace-window (window-navigation)
(use-package ace-window
  :ensure t
  :config
  (ace-window-display-mode)
  (setq aw-dispatch-always t)
  (defvar aw-dispatch-alist
    '((?x aw-delete-window "Delete Window")
      (?m aw-swap-window "Swap Windows")
      (?M aw-move-window "Move Window")
      (?c aw-copy-window "Copy Window")
      (?j aw-switch-buffer-in-window "Select Buffer")
      (?n aw-flip-window)
      (?u aw-switch-buffer-other-window "Switch Buffer Other Window")
      (?c aw-split-window-fair "Split Fair Window")
      (?v aw-split-window-vert "Split Vert Window")
      (?b aw-split-window-horz "Split Horz Window")
      (?o delete-other-windows "Delete Other Windows")
      (?? aw-show-dispatch-help))
    "List of actions for `aw-dispatch-default'."))

;; use big letters to mark windows
(custom-set-faces
 '(aw-leading-char-face ((t (:foreground "deep sky blue" :bold t :height 3.0)))))

;; counsel (+ ivy and swiper as dependencies)
(use-package counsel
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-use-selectable-prompt t)
  (setq ivy-count-format "(%d/%d) ")
  (setq counsel-find-file-at-point t))

;; quickly find info on functions and variables
(use-package helpful
  :ensure t
  :after counsel)

;; print the map of free keys
(use-package free-keys
  :ensure t)

;; jump quickly through documentation links
(use-package ace-link
  :ensure t
  :config
  (ace-link-setup-default))

;; highlight text in parenthesis
(use-package expand-region
  :ensure t)

;; remote connections
(use-package tramp
  :ensure t
  :config
  (setq tramp-default-method "ssh")
  (setq tramp-chunksize 10000)
  (add-to-list 'backup-directory-alist
	       (cons tramp-file-name-regexp nil))
  )

;; edit multiple lines simultaneously
(use-package multiple-cursors
  :ensure t
  :bind
  ("C-;" . mc/edit-lines)
  ("C->" . mc/mark-next-like-this)
  ("C-<" . mc/mark-previous-like-this)
  ("C-c C-<" . mc/mark-all-like-this))

;; build a regexp interactively
(use-package visual-regexp
  :ensure t)

;; set the modeline
(use-package powerline
  :ensure t
  :config
  (powerline-default-theme))

;; folding and unfolding regions
(use-package vimish-fold
  :ensure t
  :config
  (vimish-fold-global-mode 1))
