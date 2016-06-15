(which-key-declare-prefixes-for-mode 'clojure-mode
  ",c" "Cider")
(leader-for-mode 'clojure-mode
                 "b" 'cider-eval-buffer
                 "cc" 'cider-jack-in
                 "ck" 'cider-load-buffer
                 "d" 'cider-doc
                 "l" 'cider-eval-last-sexp
                 "n" 'cider-repl-set-ns)

(use-package clojure-mode :defer t)
(use-package cider
  :defer t
  :config
  (define-key cider-repl-mode-map (kbd "C-k") 'windmove-up)
  (define-key cider-repl-mode-map (kbd "C-h") 'windmove-left)
  (define-key cider-repl-mode-map (kbd "C-j") 'windmove-down)
  (define-key cider-repl-mode-map (kbd "C-l") 'windmove-right)
  (define-key cider-repl-mode-map (kbd "M-h") 'elscreen-previous)
  (define-key cider-repl-mode-map (kbd "M-l") 'evil-tabs-goto-tab))

(provide 'init-clojure)
