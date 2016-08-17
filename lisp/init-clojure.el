(defun cool/clojure-hook ()
  (setq cider-cljs-lein-repl "(do (use 'figwheel-sidecar.repl-api) (start-figwheel!) (cljs-repl))")
  (setq-local dash-at-point-docset "clj"))

(defun cool/cider-quit ()
  (interactive)
  (setq current-prefix-arg '(10))
  (cider-quit))


(which-key-declare-prefixes-for-mode 'clojure-mode
  ",e" "Eval"
  ",t" "Tests")
(dolist (mode '(clojure-mode clojurescript-mode))
  (leader-for-mode mode
                   "c" 'cider-jack-in
                   "C" 'cider-jack-in-clojurescript
                   "b" 'cider-load-buffer
                   "d" 'cider-doc
                   "eb" 'cider-eval-buffer
                   "er" 'cider-eval-region
                   "l" 'cider-eval-last-sexp
                   "n" 'cider-repl-set-ns
                   "q" 'cool/cider-quit
                   "r" 'cider-refresh
                   "tt" 'cider-test-run-project-tests))

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

(add-hook 'clojure-mode-hook 'cool/clojure-hook) 
(add-hook 'clojure-mode-hook 'cool/clojure-hook) 
(provide 'init-clojure)
