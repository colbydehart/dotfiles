(use-package paredit
  :defer t
  :init
  (add-hook 'emacs-lisp-mode-hook       'enable-paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook 'enable-paredit-mode)
  (add-hook 'ielm-mode-hook             'enable-paredit-mode)
  (add-hook 'lisp-mode-hook             'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
  (add-hook 'scheme-mode-hook           'enable-paredit-mode)
  :config
  (add-hook 'paredit-mode-hook 'show-paren-mode))



(provide 'init-lisp)
