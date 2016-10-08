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
		 (eyebrowse-create-window-config)
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

(defun cool/term-send-tab ()
  (interactive)
  (term-send-raw-string "\t"))

(defun cool/goto-hacker-news ()
  (interactive)
  (w3m-goto-url "https://news.ycombinator.com/"))

(defun cool/copy-file-name ()
  (interactive)
  (kill-new buffer-file-name)
  (message "Copied buffer file name"))

(defun cool/split-down ()
  (interactive)
  (split-window-vertically)
  (windmove-down))

(defun cool/split-right ()
  (interactive)
  (split-window-horizontally)
  (windmove-right))

(defun cool/presentation-mode ()
  (interactive)
  (set-default-font "mononoki 24")
  (prettify-symbols-mode -1))

(defun cool/dec-height ()
  (interactive)
  (evil-window-decrease-height 5))

(defun cool/inc-height ()
  (interactive)
  (evil-window-increase-height 5))

(defun cool/dec-width ()
  (interactive)
  (evil-window-decrease-width 5))

(defun cool/inc-width ()
  (interactive)
  (evil-window-increase-width 5))

(provide 'init-fun)
