(defun cool/cider-quit ()
  "Quit all Cider repls"
  (interactive)
  (setq current-prefix-arg '(10))
  (cider-quit))

(defun open-file-in-split ()
  "Open file from helm selection in a horizontal split"
  (interactive)
  "opens  in a new horizontal split"
  (helm-quit-and-execute-action
   (lambda (file)
     (if (bufferp file)
	 (setq file (buffer-file-name file)))
     (split-window-vertically)
     (windmove-down)
     (find-file file))))

(defun open-file-in-vsplit ()
  (interactive)
  "opens  in a new horizontal split"
  (helm-quit-and-execute-action
   (lambda (file)
     (if (bufferp file)
	 (setq file (buffer-file-name file)))
     (split-window-horizontally)
     (windmove-right)
     (find-file file))))

(defun open-file-in-screen ()
  (interactive)
  "opens in a new tab"
  (helm-quit-and-execute-action
	 (lambda (file)
		 (if (bufferp file)
				 (setq file (buffer-file-name file)))
		 (elscreen-create)
		 (find-file file))))

(defun kill-other-buffers ()
  "Kill all buffers but the current one.
Don't mess with special buffers."
  (interactive)
  (dolist (buffer (buffer-list))
    (unless (or (eql buffer (current-buffer)) (not (buffer-file-name buffer)))
      (kill-buffer buffer))))

(defun toggle-maximize-buffer ()
  "Toggle current buffer as maximized"
  (interactive)
  (if (and (= 1 (length (window-list)))
           (assoc'_ register-alist))
      (jump-to-register '_)
    (progn
      (window-configuration-to-register '_)
      (delete-other-windows))))

(defun turn-on-emacs-state ()
	"turns on evil-emacs-state"
	(evil-emacs-state t))

(defun open-browser-in-tab (term)
	"opens a w3m browser in a new tab"
	(interactive
	 (list (read-string "Enter search term: " nil nil)))
	(elscreen-create)
	(w3m-search-new-session "google" term))

(provide 'init-fun)
