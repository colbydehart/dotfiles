(defun cool/js-hook ()
  (setq-local dash–at-point-docset "js")
  (js2-mode-hide-warnings-and-errors)
  (flycheck-mode 1)
  (c-set-offset 'case-label '2)
  (append flycheck-disabled-checkers '(javascript-jshint))
  (append flycheck-disabled-checkers '(json-jsonlist))
  (flycheck-add-mode 'javascript-eslint 'js2-mode)
  (emmet-mode 1)
  (tern-mode 1))

(dolist (mode '(js2-mode js2-jsx-mode))
  (leader-for-mode mode
                   "d" 'js-doc-insert-function-doc
                   "h" 'tern-get-docs
                   "t" 'tern-get-type
                   "z" 'js2-mode-toggle-hide-functions))

(use-package tern :defer t)
(use-package company-tern :config (add-to-list 'company-backends 'company-tern))
(use-package js2-mode
  :defer t
  :mode
  ("\\.js\\'" . js2-mode)
  ("\\.jsx\\'" . js2-jsx-mode)
  :init
  (setq-default js2-bounce-indent-p t
                js2-basic-offset 2)
  (add-to-list 'interpreter-mode-alist '("node" . js2–mode)))
(use-package js-doc :defer t)
(use-package json-mode
  :defer t
  :config (setq js-indent-level 2))

(add-hook 'js2-mode-hook 'cool/js-hook)
(provide 'init-javascript)
