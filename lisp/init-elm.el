(defun cool/elm-hook ()
  (elm-oracle-setup-completion)
  (electric-indent-mode -1))

(use-package elm-mode
  :mode "\\.elm$"
  :init
  (add-to-list 'company-backends 'company-elm))

(add-hook 'elm-mode-hook 'cool/elm-hook)
(provide 'init-elm)
