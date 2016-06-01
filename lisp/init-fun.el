(defun open-file-in-split ()
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
  "opens  in a new horizontal split"
  (helm-quit-and-execute-action
   (lambda (file)
     (if (bufferp file)
	 (setq file (buffer-file-name file)))
     (elscreen-create)
     (find-file file))))

(defun open-term-split ()
  (interactive)
  (split-window-vertically)
  (windmove-down)
  (shrink-window (/ (window-height (next-window)) 2))
  (term "/bin/bash"))

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


(provide 'init-fun)
