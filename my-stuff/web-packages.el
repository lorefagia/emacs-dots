;; major mode
(use-package web-mode
  :ensure t
  :mode (("\\.js\\'" . web-mode)
	 ("\\.jsx\\'" . web-mode)
	 ("\\.ts\\'" . web-mode)
	 ("\\.tsx\\'" . web-mdoe)
	 ("\\.html\\'" . web-mode)
	 ("\\.htm\\'" . web-mode))
  :commands web-mode
  :config
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-enable-current-element-highlight t))

(defcustom my-search-web-handler "https://search.brave.com/html/?q="
  "How to search. Could be a srting that accepts the search query at the end (URL-encoded)
or a function that accepts the text (unencoded):"
  :type '(choice (string :tag "Prefix URL to search engine.")
		 (function :tag "Handler function.")))

;; quick searches with consult-omni
(setopt my-search-web-handler #'consult-omni)
