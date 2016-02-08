(use-package php-mode
  :mode ("\\.php\\'" . php-mode))
(use-package php-extras
  :defer t)
(use-package geben
  :defer t
  :init
  (add-hook 'php-mode-hook (lambda () (which-key-declare-prefixes "SPC m" "Php")))
  (evil-leader/set-key-for-mode 'php-mode
    "mdd" 'geben
    "mdx" 'geben-end
    "mdn" 'geben-step-over
    "mdb" 'geben-set-breakpoint-line
    "mdu" 'geben-unset-breakpoint-line
    "mdc" 'geben-run))

(provide 'init-php)
