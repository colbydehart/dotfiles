(use-package helm
  :config
  (global-set-key (kbd "M-x") 'helm-M-x)
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action))
  (define-key helm-map (kbd "C-h")  nil)
  (define-key helm-map (kbd "C-h")  'open-file-in-split)
  (define-key helm-map (kbd "C-v")  'open-file-in-vsplit)
  (define-key helm-map (kbd "C-t")  'open-file-in-screen)
(use-package projectile
  :config
  (projectile-global-mode)
  (setq projectile-completion-system 'helm)) 
(use-package helm-projectile 
  :config (helm-projectile-on))
(use-package helm-ag)
(use-package dash-at-point)
(use-package neotree
  :init
  (evil-define-key 'normal neotree-mode-map
    "o" 'neotree-enter
    "-" 'neotree-enter-horizontal-split
    "|" 'neotree-enter-vertical-split))
(use-package ace-jump-mode)
(use-package iedit)
(use-package evil-iedit-state)
(use-package magit)
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
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
(use-package yasnippet
  :config
  (yas-global-mode 1)
  (evil-define-key 'insert 'prog-mode-map (kbd "C-SPC") 'company-yasnippet))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;AUTO COMPLETE;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package company
  :config
  (setq company-idle-delay 0.1)
  (setq company-dabbrev-downcase nil)
  (add-hook 'after-init-hook 'global-company-mode))
(use-package helm-company
  :config
  (define-key company-mode-map (kbd "C-;") 'helm-company)
  (define-key company-active-map (kbd "C-;") 'helm-company))
(use-package company-quickhelp :init (add-hook 'company-mode-hook 'company-quickhelp-mode))
(use-package ggtags)
(provide 'init-nav)
