(defun cool/ts-hook ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (add-hook 'before-save-hook 'tide-format-before-save)
  (setq company-tooltip-align-annotations t)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (company-mode +1))

(setq typescript-indent-level 2)
(setq tide-format-options '(:insertSpaceAfterFunctionKeywordForAnonymousFunctions
                            t
                            :placeOpenBraceOnNewLineForFunctions
                            nil
                            :tabSize 2 :indentSize 2))
(use-package tide :defer t)
(use-package typescript-mode :mode "\\.tsx?$")

(add-hook 'typescript-mode-hook 'cool/ts-hook)
(provide 'init-typescript)
