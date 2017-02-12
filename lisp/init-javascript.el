(defun cool/js-hook () 
  (emmet-mode 1)
  (push 'javascript-jshint flycheck-disabled-checkers)
  (js2-mode-hide-warnings-and-errors)
  (add-to-list 'company-backends 'company-tern)
  (setq-local dash-at-point-docset "js")
  (setq emmet-expand-jsx-className? t
        indent-tabs-mode nil
        js-switch-indent-offset 2
        js-indent-level 2)
  (tern-mode t))

(leader-for-mode 'rjsx-mode
                 "," 'cool/js-mode
                 "h" 'tern-get-docs
                 "t" 'tern-get-type
                 "/" 'web-mode-element-close)

(use-package json-mode :defer t
  :config (setq js-indent-level 2))
(use-package tern :defer t)
(use-package company-tern :defer t)
(use-package rjsx-mode :defer t
  :init (add-to-list 'auto-mode-alist '("\\.js$" . rjsx-mode)))
(add-hook 'rjsx-mode-hook 'cool/js-hook)



(provide 'init-javascript)
