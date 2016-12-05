(defun cool/ruby-hook ()
  (setq-local dash–at-point-docset "ruby")
  (add-to-list (make-local-variable company-backends) 'company-robe)
  (inf-ruby-minor-mode)
  (rvm-use-default)
  (robe-mode)
  (rspec-mode)
  (ruby-electric-mode)
  (projectile-rails-mode)
  (flymake-ruby-load))

(leader-for-mode 'ruby-mode
		 "gg" 'robe-jump
		 "gc" 'projectile-rails-find-controller
		 "gm" 'projectile-rails-find-model
		 "gt" 'projectile-rails-find-spec
		 "gr" 'projectile-rails-goto-routes
		 "h" 'robe-doc
		 "tt" 'rspec-toggle-spec-and-target
		 "ta" 'rspec-verify-all)

(use-package rvm :defer t)
(use-package rspec-mode :defer t)
(use-package ruby-end :defer t)
(use-package projectile-rails :defer t)
(use-package flymake-ruby :defer t)
(use-package ruby-electric :defer t)
(use-package robe :defer t)

(add-hook 'ruby-mode-hook 'cool/ruby-hook)
(provide 'init-ruby)
