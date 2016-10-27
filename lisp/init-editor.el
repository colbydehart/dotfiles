(use-package puppet-mode :defer t)
(use-package toml-mode :defer t
  :config (setq-default tab-width 4))
(use-package yaml-mode :defer t)
(use-package ansible :defer t)
(use-package dockerfile-mode :defer t)
(use-package docker
  :config (docker-global-mode))


;; Line numbers
(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'prog-mode-hook 'column-number-mode)
;; function hinting
(add-hook 'prog-mode-hook 'turn-on-eldoc-mode)
;; show prefix key options in minibuffer
(use-package which-key :config (which-key-mode))
;; Don't lose track of my indentation
(use-package indent-guide :config (add-hook 'prog-mode-hook 'indent-guide-mode))
;; Don't lose track of nested parens
(use-package rainbow-delimiters
  :config
  ;; (set-face-foreground 'rainbow-delimiters-depth-1-face "#85ecd3")
  ;; (set-face-foreground 'rainbow-delimiters-depth-1-face "#85ecd3")
  ;; (set-face-foreground 'rainbow-delimiters-depth-2-face "#8f85ec")
  ;; (set-face-foreground 'rainbow-delimiters-depth-3-face "#e485ec")
  ;; (set-face-foreground 'rainbow-delimiters-depth-4-face "#ee4b4b")
  ;; (set-face-foreground 'rainbow-delimiters-depth-5-face "#e8c85d")
  ;; (set-face-foreground 'rainbow-delimiters-depth-6-face "#94e85d")
  ;; (set-face-foreground 'rainbow-delimiters-depth-7-face "#3bb793")
  ;; (set-face-foreground 'rainbow-delimiters-depth-8-face "#3b69b7")
  ;; (set-face-foreground 'rainbow-delimiters-depth-9-face "#863bb7")
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))
;; Code folding
(add-hook 'prog-mode-hook (lambda () 'ignore-errors (hs-minor-mode)))
;; Auto pair parens
;; (add-hook 'prog-mode-hook 'electric-pair-mode)
(show-paren-mode t)
(use-package smartparens)
(smartparens-global-mode t)
(show-smartparens-global-mode nil)
(setq sp-autoescape-string-quote nil
      sp-highlight-pair-overlay nil
      sp-highlight-wrap-overlay nil
      sp-highlight-wrap-tag-overlay nil
      show-paren-delay 0)
(add-hook 'prog-mode-hook 'turn-on-smartparens-mode)


(provide 'init-editor)
