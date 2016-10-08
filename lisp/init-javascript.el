(defun cool/js-hook () 
  (emmet-mode 1)
  (add-to-list (make-local-variable 'company-backends) 'company-tern)
  (web-mode-set-content-type "jsx")
  (yas-activate-extra-mode 'js-mode)
  (push 'javascript-jshint flycheck-disabled-checkers)
  (setq-local electric-pair-pairs (append
                                   electric-pair-pairs
                                   '((?' . ?'))))
  (setq-local electric-pair-text-pairs electric-pair-pairs)
  (setq-local dash-at-point-docset "js")
  (setq-local web-mode-enable-auto-quoting nil)
  (setq emmet-expand-jsx-className? t
        js-switch-indent-offset 2
        js-indent-level 2
        web-mode-markup-indent-offset 2
        web-mode-attr-indent-offset 2
        web-mode-code-indent-offset 2)
  (tern-mode))

(leader-for-mode 'cool/js-mode
                 "hh" 'tern-get-docs
                 "ht" 'tern-get-type
                 "/" 'web-mode-element-close)

(use-package web-mode
  :config
  (define-derived-mode cool/js-mode web-mode "Cool/JS")
  (if cool/use-tabs (web-mode-use-tabs))
  (add-to-list 'auto-mode-alist '("\\.jsx?$" . cool/js-mode))
  (add-to-list 'interpreter-mode-alist '("node" . cool/js-mode))
  (add-hook 'cool/js-mode-hook 'cool/js-hook)
  (flycheck-add-mode 'javascript-eslint 'cool/js-mode)
  (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil)))

(use-package json-mode :defer t
  :config (setq js-indent-level 2))
(use-package tern :defer t)
(use-package company-tern :defer t)

(provide 'init-javascript)
