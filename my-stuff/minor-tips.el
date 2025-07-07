;; disable the bell sound
(setq bell-volume 0)

;; stashes backups in ~/.config/emacs/backups
(setq backup-directory-alist '(("." . "~/.config/emacs/backups")))
(with-eval-after-load 'tramp
  (setq tramp-backup-directory-alist nil))

;; disable the flash in the modeline when something is wrong
(setq ring-bell-function
      (lambda ()
        (let ((orig-fg (face-foreground 'mode-line)))
          (set-face-foreground 'mode-line "#F2804F")
          (run-with-idle-timer 0.1 nil
                               (lambda (fg) (set-face-foreground 'mode-line fg))
                               orig-fg))))

;; always display *Help* in current window
(add-to-list 'display-buffer-alist
             '("*Help*" display-buffer-same-window))

;; enable camel-case inner-to-word movement
(global-subword-mode 1)

;; cliboard
(setq select-enable-clipboard t)
(setq select-enable-primary t)
(setq save-interprogram-paste-before-kill t)
(setq kill-ring-max 1000)
(setq echo-ketstrokes 0.1)

;; disable menu bar, scrollbar and toolbar
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; don't ask for confirmation for "dangerous" commands
(put 'erase-buffer 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'list-threads 'disabled nil)
(put 'scroll-left 'disabled nil)

;; expect local variables to be known
(setq enable-local-eval t)

;; backtrace when error are detcted
(setq debug-on-error t)

;; display byte-compiler
(setq nyte-compile-debug t)

;; enhanced search matches
(setq serach-default-mode 'char-fold-to-regexp)

;; ignore case when sorting
(setq siert-fold-case t)

;; scrolling
(setq scroll-error-top-bottom t)
(setq focus-follow-mouse t)
(setq require-final-newline t)

;; number of lines of continuity when scrolling by screenfulls
(setq next-screen-context-lines 0)

;; use "y" and "n" instead of "yes" and "no"
(fset 'yes-or-no-p 'y-or-n-p)

;; set default font
(set-face-attribute 'default nil :font "Hack-12")
(set-face-attribute 'variable-pitch nil :font "Hack-12")
(set-face-attribute 'fixed-pitch nil :font "JetBrains Mono Nerd Font-14")
