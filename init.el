(message "Emacs startup")

;; reading host-name
(setq host-name
      (substring 
       (shell-command-to-string "hostname") 
       0 -1))

;; set t_checker to 1 if EMACS_BOOTED is defined, nil otherwise
(setq t_checker (boundp' EMACS_BOOTED))

;; cold boot
(if (eq nil t_checker)
    (progn

      ;; init packages
      (package-initialize)

      ;; use ahead-of-time native compilation if available
      (setq package-native-compile t)

      ;; setup archives
      (add-to-list 'package-archives
		   '("melpa-stable" . "https://stable.melpa.org/packages/"))
      (add-to-list 'package-archives
		   '("melpa" . "https://melpa.org/packages/"))

      ;; use-package installation
      (unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))

      ;; enable verbose mode (use-package) 
      (setq use-package-verbose t)      
      )
  )

;; vanilla emacs + use-package successfully bootstrapped
(setq EMACS_BOOTED 1)   

;; personal information
(setq user-full-name "Lorenzo Fagiani"
      user-mail-address "lorenzofagiani23@gmail.com")

;; int helper to load packages
(load-file "~/.emacs.d/init-helper.el")

;; all the packages have been loaded, and the init procedure is complete
(setq EMACS_PACKAGES_LOADED 1)

(setq inhibit-startup-echo-area-message "Emacs started!")

;; AUTO-GENERATED CONTENT
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(custom-enabled-themes '(wombat))
 '(display-line-numbers 'relative)
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:foreground "deep sky blue" :bold t :height 3.0))))
 '(org-level-1 ((t (:inherit outline-1 :height 1.2))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.18))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.16))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.14))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.12)))))
