(use-package helm
  :bind (( "M-x" . helm-M-x) 
         :map helm-map
         ("<tab>". helm-execute-persistent-action)
         ("C-h" . nil)
         ("C-h" . open-file-in-split)
         ("C-v" . open-file-in-vsplit)
         ("C-t" . open-file-in-screen)))
(use-package projectile
  :init (setq projectile-completion-system 'helm)
  :config (projectile-global-mode))
(use-package helm-projectile :config (helm-projectile-on))
(use-package helm-ag)
(use-package dash-at-point)
(use-package ace-jump-mode)
(use-package iedit)
(use-package evil-iedit-state)
(defun nyan-run ()
  "animate then stop nyan cat"
  (interactive)
  (nyan-start-animation)
  (run-with-timer 5 nil 'nyan-stop-animation))
(use-package magit :config (add-hook 'magit-refresh-buffer-hook 'nyan-run))
(use-package evil-magit :config (add-hook 'magit-mode-hook 'evil-local-mode))
;; Add d to magit ediff
;; http://stackoverflow.com/questions/9656311/conflict-resolution-with-emacs-ediff-how-can-i-take-the-changes-of-both-version
(defun ediff-copy-both-to-C ()
  (interactive)
  (ediff-copy-diff ediff-current-difference nil 'C nil
                   (concat
                    (ediff-get-region-contents ediff-current-difference 'A ediff-control-buffer)
                    (ediff-get-region-contents ediff-current-difference 'B ediff-control-buffer))))
(defun add-d-to-ediff-mode-map () (define-key ediff-mode-map "d" 'ediff-copy-both-to-C))
(add-hook 'ediff-keymap-setup-hook 'add-d-to-ediff-mode-map)

(use-package vagrant-tramp)
(use-package flycheck :config (add-hook 'prog-mode-hook 'flycheck-mode))
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc emacs-lisp))
(use-package yasnippet
  :bind (:map yas-minor-mode-map 
         ("M-<return>" . yas/expand) 
         :map evil-insert-state-map
         ("C-SPC" . company-yasnippet))
  :config (yas-global-mode 1))

;;;;;;;;;;;;;DIRED;;;;;;;;;;;;;;;;

(defun cool/dired-up-directory ()
  "Take dired up one directory, but behave like dired-find-alternate-file"
  (interactive)
  (let ((old (current-buffer)))
    (dired-up-directory)
    (kill-buffer old)))

(evil-define-key 'normal dired-mode-map
  "h" 'cool/dired-up-directory
  "l" 'dired-find-alternate-file
  "v" 'dired-toggle-marks
  "c" 'dired-create-directory
  "n" 'evil-search-next
  "N" 'evil-search-previous
  "q" 'kill-this-buffer)

;;;;;;;;AUTO COMPLETE;;;;;;;;;;;;;

(use-package company
  :config
  (setq company-idle-delay 0.1)
  (setq company-dabbrev-downcase nil)
  (add-hook 'after-init-hook 'global-company-mode))
(use-package helm-company
  :bind (:map company-mode-map
         ("C-;" . helm-company)
         :map company-active-map
         ("C-j" . helm-company)))

(provide 'init-nav)
