(which-key-declare-prefixes-for-mode 'elixir-mode ",p" "Phoenix")
(which-key-declare-prefixes-for-mode 'elixir-mode ",t" "Test")
(which-key-declare-prefixes-for-mode 'elixir-mode ",e" "Eval")
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
(use-package alchemist :defer t
  :init
  (setq alchemist-hooks-test-on-save t
	alchemist-project-compile-when-needed t))

(add-hook
 'elixir-mode-hook
 (lambda ()
   (company-quickhelp-mode nil)
   (alchemist-mode)
   (setq-local dash–at-point-docset "elixir")))

(provide 'init-elixir)
