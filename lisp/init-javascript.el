;; (leader-for-mode 'js2-mode)
(setq-default js2-bounce-indent-p t
              js2-basic-offset 2)

(use-package tern :defer t)
(use-package company-tern :config (add-to-list 'company-backends 'company-tern))
(use-package js2-mode
  :defer t
  :mode
  ("\\.js\\'" . js2-mode)
  ("\\.jsx\\'" . js2-jsx-mode)
  :init
  (add-to-list 'interpreter-mode-alist '("node" . js2–mode))
  (add-hook 'js2-mode-hook (lambda ()
                             (setq-local dash–at-point-docset "js")
                             (js2-mode-hide-warnings-and-errors)
                             (c-set-offset 'case-label '+)
                             (flycheck-mode 1)
                             (append flycheck-disabled-checkers '(javascript-jshint))
                             (append flycheck-disabled-checkers '(json-jsonlist))
                             (flycheck-add-mode 'javascript-eslint 'js2-mode)
                             (emmet-mode 1)
                             (tern-mode 1))))
(use-package js-doc :defer t)
(use-package json-mode
  :defer t
  :config (setq js-indent-level 2))


(provide 'init-javascript)
