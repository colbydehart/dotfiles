(leader-for-mode 'enh-ruby-mode
		 "gg" 'robe-jump
		 "gc" 'projectile-rails-find-controller
		 "gm" 'projectile-rails-find-model
		 "gt" 'projectile-rails-find-spec
		 "gr" 'projectile-rails-goto-routes
		 "h" 'robe-doc
		 "tt" 'rspec-toggle-spec-and-target
		 "ta" 'rspec-verify-all)
(use-package rspec-mode :defer t)
(use-package projectile-rails :defer t)
(use-package flymake-ruby :defer t)
(use-package ruby-electric :defer t)
(use-package robe
  :defer t
  :config (push 'company-robe company-backends))
(use-package enh-ruby-mode
  :mode (("\\(Rake\\|Thor\\|Guard\\|Gem\\|Cap\\|Vagrant\\|Berks\\|Pod\\|Puppet\\)file\\'" . enh-ruby-mode)
	 ("\\.\\(rb\\|rabl\\|ru\\|builder\\|rake\\|thor\\|gemspec\\|jbuilder\\)\\'" . enh-ruby-mode)))


(defun cool/ruby-hook ()
   (robe-mode)
   (rspec-mode)
   (ruby-electric-mode)
   (projectile-rails-mode)
   (flymake-ruby-load))

(add-hook 'enh-ruby-mode-hook 'cool/ruby-hook)
(provide 'init-ruby)
