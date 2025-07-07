;; unset C-z
(global-unset-key (kbd "C-z"))

;; helpful
(global-set-key (kbd "C-c C-d") #'helpful-at-point)

;; toggle mozc mode
(global-set-key (kbd "<f7>") 'dd/toggle-mozc-mode)
