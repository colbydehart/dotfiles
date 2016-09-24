(defun cool/fsharp-hook ()
  (add-to-list 'company-transformers 'company-sort-prefer-same-case-prefix)
  (setq-local dash-at-point-docset "fs"))

(setq inferior-fsharp-program "/usr/local/bin/fsharpi --readline-")
(setq fsharp-compiler "/usr/local/bin/fsharpc")

(which-key-declare-prefixes-for-mode 'fsharp-mode
  ",t" "Tests")
(leader-for-mode 'fsharp-mode 
                 "e" 'fsharp-eval-region)

(use-package fsharp-mode
  :mode (("\\.fs\\'" . fsharp-mode))
  :bind (:map inferior-fsharp-mode-map
         ("M-l" . eyebrowse-next-window-config)
         ("M-h" . eyebrowse-prev-window-config)
         ("C-h" . evil-window-left)
         ("C-j" . evil-window-down)
         ("C-k" . evil-window-up)
         ("C-l" . evil-window-right)))

(add-hook 'fsharp-mode-hook 'cool/fsharp-hook)
(provide 'init-fsharp)