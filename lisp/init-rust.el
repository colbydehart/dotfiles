(use-package rust-mode
  :defer t)
(use-package racer
  :defer t
  :init (add-hook 'rust-mode-hook 'racer-mode))
(provide 'init-rust)
