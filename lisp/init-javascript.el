(use-package js2-mode
  :defer t
  :init
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  (add-hook 'js2-mode-hook (lambda ()
                             (js2-mode-hide-warnings-and-errors)
                             (setq tab-width 2)))
  (add-to-list 'interpreter-mode-alist '("node" . js2–mode)))

(provide 'init-javascript)
