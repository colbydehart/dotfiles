;; Hook
(defun cool/clojure-hook ()
  (setq cider-cljs-lein-repl "(do (use 'figwheel-sidecar.repl-api) (start-figwheel!) (cljs-repl))")
  (setq-local dash-at-point-docset "clj"))

;; Leader bindings
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

;; Packages
(use-package clojure-mode :defer t)
(use-package cider
  :bind (:map cider-repl-mode-map
              ("C-k" . windmove-up)
              ("C-h" . windmove-left)
              ("C-j" . windmove-down)
              ("C-l" . windmove-right)
              ("M-h" . eyebrowse-prev-window-config)
              ("M-l" . eyebrowse-next-window-config)))

(add-hook 'clojure-mode-hook 'cool/clojure-hook) 
(provide 'init-clojure)
