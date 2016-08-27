(defun cool/csharp-hook ()
  (setq-local dash-at-point-docset "cs"))

(which-key-declare-prefixes-for-mode 'csharp-mode
  ",t" "Tests")
(leader-for-mode 'csharp-mode 
                 "c" 'helm-M-x)

(use-package csharp-mode :mode (("\\.cs\\'" . csharp-mode)))
(use-package omnisharp)

(add-hook 'csharp-mode-hook 'cool/csharp-hook)
(provide 'init-csharp)