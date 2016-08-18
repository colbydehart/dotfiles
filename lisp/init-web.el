(leader-for-mode 'web-mode
  "m" 'web-mode-tag-match
  "z" 'web-mode-fold-or-unfold)

(use-package web-mode
  :mode ("\\.html\\'"
         "\\.tpl\\.php\\'"
         "\\.tpl\\'"
         "\\.erb\\'"
         "\\.eex\\'"
         "\\.mustache\\'"
         "\\.j2\\'"
         "\\.blade\\.php\\'"))
(use-package emmet-mode
  :config
  (add-hook 'web-mode-hook 'emmet-mode)
  (add-hook 'css-mode-hook 'emmet-mode))
;; Markdown mode
(use-package markdown-mode :mode ("\\.markdown\\'" "\\.md\\'"))
(use-package scss-mode :defer t)
(setq-default css-indent-offset 2)

(add-hook 'scss-mode-hook 'linum-mode)
(add-hook 'css-mode-hook 'linum-mode)

(provide 'init-web)
