(defun cool/elixir-hook ()
  (setq alchemist-project-compile-when-needed t)
  (turn-on-smartparens-mode)
  (alchemist-mode)
  (setq-local dash–at-point-docset "ex"))

(defun cool/elixir-do-end-close-action (id action context)
  (when (eq action 'insert)
    (newline-and-indent)
    (forward-line -1)
    (indent-according-to-mode)))

(sp-with-modes '(elixir-mode)
  (sp-local-pair "fn" "end"
                 :when '(("SPC" "RET"))
                 :post-handlers '(:add cool/elixir-do-end-close-action)
                 :actions '(insert))
  (sp-local-pair "do" "end"
                 :when '(("RET"))
                 :post-handlers '(:add cool/elixir-do-end-close-action)
                 :actions '(insert)))

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
(use-package smartparens :defer t)
(use-package alchemist :defer t)

(add-hook 'elixir-mode-hook 'cool/elixir-hook)
(provide 'init-elixir)
