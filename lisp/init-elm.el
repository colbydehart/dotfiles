(defun cool/elm-hook ()
  (add-to-list 'company-backends 'company-elm)
  (setq elm-indent-offset 2)
  (setq yas-fallback-behavior '(apply elm-indent-cycle))
  (elm-oracle-setup-completion)
  (electric-indent-mode -1))

(leader-for-mode 'elm-mode
                 "a" 'elm-compile-add-annotations
                 "d" 'elm-documentation-lookup
                 "f" 'elm-mode-format-buffer
                 "i" 'elm-compile-clean-imports
                 "r" 'elm-preview-buffer)

(use-package elm-mode :mode "\\.elm$")

(add-hook 'elm-mode-hook 'cool/elm-hook)

(provide 'init-elm)
