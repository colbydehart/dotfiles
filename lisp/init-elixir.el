(defun cool/elixir-hook ()
  (setq alchemist-hooks-test-on-save t
        alchemist-project-compile-when-needed t)
  (alchemist-mode)
  (setq-local dash–at-point-docset "ex")
  (set
   (make-variable-buffer-local 'ruby-end-expand-keywords-before-re)
   "\\(?:^\\|\\s-+\\)\\(?:do\\)")
  (set
   (make-variable-buffer-local 'ruby-end-check-statement-modifiers)
   nil)
  (ruby-end-mode +1))

(which-key-declare-prefixes-for-mode 'elixir-mode
  ",p" "Phoenix"
  ",t" "Test"
  ",e" "Eval")
(leader-for-mode 'elixir-mode
                 "c" 'alchemist-mix-compile
                 "x" 'alchemist-mix
                 "tn" 'alchemist-project-toggle-file-and-tests
                 "ta" 'alchemist-project-find-test
                 "tt" 'alchemist-mix-test
                 "eb" 'alchemist-eval-buffer
                 "er" 'alchemist-eval-region
                 "h" 'alchemist-help-search-at-point
                 "pc" 'alchemist-phoenix-find-controllers
                 "ph" 'alchemist-phoenix-find-channels
                 "pm" 'alchemist-phoenix-find-models
                 "pr" 'alchemist-phoenix-router
                 "ps" 'alchemist-phoenix-find-static
                 "pt" 'alchemist-phoenix-find-templates
                 "pv" 'alchemist-phoenix-find-views
                 "pw" 'alchemist-phoenix-find-web)

(use-package elixir-mode :defer t)
(use-package ruby-end :defer t)
(use-package alchemist :defer t)

(add-hook 'elixir-mode-hook 'cool/elixir-hook)
(provide 'init-elixir)
