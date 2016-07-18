(defun cool/rust-hook ()
  (racer-mode 1)
  (setq-local helm-dash-docsets "rust"))

(use-package rust-mode :defer t)
(use-package racer :defer t)

(add-hook 'rust-mode-hook 'cool/rust-hook)
(provide 'init-rust)
