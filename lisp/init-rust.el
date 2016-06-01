(use-package rust-mode
  :defer t)
(use-package racer
  :defer t
  :init
  (add-hook
   'rust-mode-hook
   (lambda ()
     (racer-mode 1)
     (setq-local helm-dash-docsets "Rust"))))
(provide 'init-rust)
