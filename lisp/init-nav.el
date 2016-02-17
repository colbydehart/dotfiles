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
(use-package neotree
  :init
  (evil-define-key 'normal neotree-mode-map
    "o" 'neotree-enter
    "-" 'neotree-enter-horizontal-split
    "|" 'neotree-enter-vertical-split))
(use-package ace-jump-mode)
(use-package iedit)
(use-package evil-iedit-state)
(use-package company
  :init
  (setq company-idle-delay 0)
  :config
  (define-key company-active-map (kbd "\C-n") 'company-select-next)
  (define-key company-active-map (kbd "\C-p") 'company-select-previous)
  (define-key company-active-map (kbd "\C-d") 'company-show-doc-buffer)
  (define-key company-active-map (kbd "<tab>") 'company-complete)
  (global-company-mode))
(use-package helm-company)
(use-package magit)
(use-package evil-magit)
(use-package ggtags
  :init
  (define-key evil-normal-state-map (kbd "g d") 'ggtags-find-tag-dwim))
(use-package vagrant-tramp)

(provide 'init-nav)
