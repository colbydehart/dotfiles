(defun cool/elm-hook ()
  (push 'company-elm (make-local-variable 'company-elm))
  (elm-oracle-setup-completion)
  (electric-indent-mode -1))

(use-package elm-mode :mode "\\.elm$")

(add-hook 'elm-mode-hook 'cool/elm-hook)

(provide 'init-elm)
