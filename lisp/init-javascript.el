(defun cool/js-hook () 
  (emmet-mode 1)
  (add-to-list (make-local-variable 'company-backends) 'company-tern)
  (push 'javascript-jshint flycheck-disabled-checkers)
  (setq-local dash-at-point-docset "js")
  (setq js-switch-indent-offset 2
        js-indent-level 2)
  (js2-imenu-extras-mode)
  (tern-mode))

(leader-for-mode 'cool/js-mode
                 "hh" 'tern-get-docs
                 "ht" 'tern-get-type
                 "/" 'web-mode-element-close)

(use-package json-mode :defer t
  :config (setq js-indent-level 2))
(use-package tern :defer t)
(use-package js2-mode :defer t)
(use-package company-tern :defer t)

(define-derived-mode cool/js-mode js-jsx-mode "Cool/JS")
(add-to-list 'auto-mode-alist '("\\.jsx?$" . cool/js-mode))
(add-to-list 'interpreter-mode-alist '("node" . cool/js-mode))

(if cool/use-js-standard
    (flycheck-add-mode 'javascript-standard 'cool/js-mode)
  (flycheck-add-mode 'javascript-eslint 'cool/js-mode))

(add-hook 'cool/js-mode-hook 'cool/js-hook)

(provide 'init-javascript)
