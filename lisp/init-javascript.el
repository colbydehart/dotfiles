(defun cool/js-hook () 
  (emmet-mode 1)
  (setq-local emmet-expand-jsx-className? t)
  (add-to-list (make-local-variable 'company-backends) 'company-tern)
  (web-mode-set-content-type "jsx")
  (yas-activate-extra-mode 'js-mode)
  (setq-local web-mode-enable-auto-quoting nil)
  (setq web-mode-attr-indent-offset 2
        web-mode-attr-value-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-markup-indent-offset 2)
  ;; Linting
  (push 'javascript-jshint flycheck-disabled-checkers)
  ;; Documentation
  (setq-local dash-at-point-docset "js")
  ;; Imenu
  (setq imenu-create-index-function #'js2-mode-create-imenu-index)
  (js2-imenu-extras-mode)
  (js2-minor-mode)
  (js2-mode-hide-warnings-and-errors)
  ;; Autocomplete
  (tern-mode))

(leader-for-mode 'cool/js-mode
                 "hh" 'tern-get-docs
                 "ht" 'tern-get-type
                 "/" 'web-mode-element-close)

(use-package web-mode
  :config
  (if cool/use-tabs (web-mode-use-tabs))
  (define-derived-mode cool/js-mode web-mode "Cool/JS")
  (add-to-list 'auto-mode-alist '("\\.jsx?$" . cool/js-mode))
  (add-to-list 'interpreter-mode-alist '("node" . cool/js-mode))
  (add-hook 'cool/js-mode-hook 'cool/js-hook)
  (flycheck-add-mode 'javascript-eslint 'cool/js-mode))
(use-package js2-mode :defer t
  :config
  (setq js-switch-indent-offset 2
        js-indent-level 2
        js2-bounce-indent-p t))
(use-package tern :defer t)
(use-package company-tern :defer t)
(use-package json-mode :defer t
  :config (setq js-indent-level 2))

(provide 'init-javascript)
