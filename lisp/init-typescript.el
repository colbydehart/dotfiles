(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (company-mode +1))
(setq company-tooltip-align-annotations t)
(add-hook 'before-save-hook 'tide-format-before-save)
(setq tide-format-options '(:insertSpaceAfterFunctionKeywordForAnonymousFunctions
                            t
                            :placeOpenBraceOnNewLineForFunctions
                            nil
                            :tabSize 2 :indentSize 2))
(use-package tide :defer t)
(use-package typescript-mode
  :mode "\\.tsx?$"
  :init
  (setq typescript-indent-level 2)
  (add-hook #'typescript-mode-hook #'setup-tide-mode))

(provide 'init-typescript)
