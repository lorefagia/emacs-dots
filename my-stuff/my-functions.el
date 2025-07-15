(defun toggle-mozc-mode ()
  (interactive)
  (mozc-mode)
  (toggle-cursor-color))

(setq cursor-color "#808080")
(defun toggle-cursor-color ()
  (interactive)
  (if (string= cursor-color "#808080")
      (setq cursor-color "#52D017")
    (setq cursor-color "#808080"))
  (set-cursor-color cursor-color))

(defun my-open-url-or-search-web (&optional text-or-url)
  (interactive (list (if (region-active-p)
			 (buffer-substring (region-beginning) (region-end))
		       (or
			(and (derived-mode-p 'org-mode)
			     (let ((elem (org-element-context)))
			       (and (eq (org-element-type elem) 'link)
				    (buffer-substring-no-properties
				     (org-element-begin elem)
				     (org-element-end elem)))))
			(thing-at-point 'url)
			(thing-at-point 'email)
			(thing-at-point 'filename)
			(thing-at-point 'word)))))
  (catch 'done
    (let (links)
      (with-temp-buffer
	(insert text-or-url)
	(org-mode)
	(goto-char (point-min))
	;; We add all the links to a list first because following them may change the point
	(while (re-search-forward org-any-link-re nil t)
	  (cl-pushnew (match-string-no-properties 0) links))
	(when links
	  (dolist (link links)
	    (org-link-open-from-string link))
	  (throw 'done links))
	;; Try emails
	(while (re-search-forward thing-at-point-email-regexp nil t)
	  (cl-pushnew (match-string-no-properties 0) links))
	(when links
	  (compose-mail (string-join links ", "))
	  (throw 'done links)))
      ;; Open filename if specified, or do a web search
      (cond
       ((ffap-guesser) (find-file-at-point))
       ((functionop my-search-web-handler)
	(funcall my-search-web-handler text-or-url))
       ((stringp my-search-web-handler)
	(browse-url (concat my-search-web-handler (url-hexify-string text-or-url))))))))
