(use-package elm-mode
  :mode "\\.elm$"
  :init
  (add-hook 'elm-mode-hook (lambda ()
                            (elm-oracle-setup-completion)
                            (electric-indent-mode -1)))
  (add-to-list 'company-backends 'company-elm))

(provide 'init-elm)
