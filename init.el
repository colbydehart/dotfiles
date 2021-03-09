;; straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;;;;;;;;;;;;;;;;;;;;;;SETTINGS;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(electric-pair-mode 1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(load-theme 'tango-dark)
(add-to-list 'default-frame-alist
	     '(font . "mononoki-18"))
;;;;;;;;;;;;;;;;;;;;;;PACKAGES;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Evil: vim emulation
(straight-use-package 'evil)
(setq evil-want-keybinding nil)
(evil-mode 1)
(straight-use-package 'evil-collection)
(evil-collection-init)
;;; Evil leader
(straight-use-package 'evil-leader)
(global-evil-leader-mode) 
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "SPC" 'helm-M-x
  "e" 'helm-find-files
  "f" 'helm-find-files
  "h" 'helm-info
  "b" 'switch-to-buffer
  "w" 'save-buffer
  "q" 'kill-buffer)
;;; Autocomplete
(straight-use-package 'company)
(global-company-mode 1)
;;; Fast Search
(straight-use-package 'helm) ; fast search
(straight-use-package 'which-key)

;;;;;;;;;;;;;;;;;;;;;;CLOJURE;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(straight-use-package 'clojure-mode)
(add-to-list 'load-path "~/.emacs.d/miracle") ; Clojure in Unity
(require 'miracle)
(add-hook 'clojure-mode-hook 'clojure-enable-miracle)
(straight-use-package
 '(clojure-complete
   :type git
   :host github
   :repo "sogaiu/clojure-complete"
   :branch "clr-support")) ; this branch for miracle

;; miracle company support
(with-eval-after-load "miracle"
  (defun miracle-eval-string (s callback)
    (miracle-send-eval-string
     s
     (lambda (response)
             (miracle-dbind-response response (id value status)
                                     (when (member "done" status)
                                       (remhash id miracle-requests))
                                     (when value
                                       (funcall callback nil value))))))

  (defun miracle-get-completions (word callback)
    (interactive)
    (miracle-eval-string
     (format "(do (require '[%s]) (%s/completions \"%s\"))"
             "complete.core" "complete.core" word)
     (lambda (err s)
             (progn
              ;; XXX
              (message (format "received str: %s" s))
              (message (format "err: %s"            (when (not err)
                (funcall callback (read-from-whole-string s)))))))

  (defun company-miracle (command &optional arg &rest ignored)
    (interactive (list 'interactive))
    (cl-case command
             (interactive (company-begin-backend 'company-miracle))
             (prefix (and (or ;;(eq major-mode 'clojurec-mode)
                           ;;(eq major-mode 'clojure-mode)
                           (eq major-mode 'miracle-mode))
                          (get-buffer "*miracle-connection*")
                          (substring-no-properties (company-grab-symbol))))
             (candidates (lexical-let ((arg (substring-no-properties arg)))
                                      (cons :async (lambda (callback)
                                                           (miracle-get-completions arg callback))))))))

  ;; XXX: problems w/o the following when invoking company-grab-symbol
  (setq cider-mode nil)

  (add-to-list 'company-backends 'company-miracle)

