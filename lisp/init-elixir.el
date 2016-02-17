(use-package alchemist
  :defer t
  :init
  (setq alchemist-hooks-test-on-save t)
  (add-hook 'elixir-mode-hook 'alchemist-mode)
  (setq alchemist-project-compile-when-needed t))

(use-package elixir-mode
  :defer t)
(provide 'init-elixir)
