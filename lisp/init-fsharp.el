(defun cool/fsharp-hook ()
  (add-to-list 'company-transformers 'company-sort-prefer-same-case-prefix)
  (setq-local dash-at-point-docset "fs"))

(setq inferior-fsharp-program "/usr/local/bin/fsharpi --readline-")
(setq fsharp-compiler "/usr/local/bin/fsharpc")

(which-key-declare-prefixes-for-mode 'fsharp-mode
  ",t" "Tests")
(leader-for-mode 'fsharp-mode 
                 "e" 'fsharp-eval-region)

(use-package fsharp-mode :mode (("\\.fs\\'" . fsharp-mode)))

(add-hook 'fsharp-mode-hook 'cool/fsharp-hook)
(provide 'init-fsharp)