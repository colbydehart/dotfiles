(defun cool/ts-hook ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (add-hook 'before-save-hook 'tide-format-before-save)
  (setq company-tooltip-align-annotations t)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (company-mode +1)
  (evil-define-key 'normal typescript-mode-map
    "gr" 'tide-references
    "gd" 'tide-jump-to-definition))

(setq typescript-indent-level 2)
(use-package tide
  :defer t
  :config
  (setq tide-format-options '(:insertSpaceAfterFunctionKeywordForAnonymousFunctions
                              t
                              :placeOpenBraceOnNewLineForFunctions
                              nil
                              :tabSize 2 :indentSize 2)))
(use-package typescript-mode :defer t :mode "\\.tsx?$")

(add-hook 'typescript-mode-hook 'cool/ts-hook)
(add-hook 'tide-references-mode 'evil-emacs-state)

(provide 'init-typescript)
