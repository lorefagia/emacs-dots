(use-package pdf-tools
  :ensure t
  :config
  (setq pdf-view-resize-factor 1.1)
  (setq-default pdf-view-display-size 'fit-page))

;; record emacs gifs
;; prerequisites: install scrot, convert, and gifsicle
(use-package gif-screencast
  :ensure t)
