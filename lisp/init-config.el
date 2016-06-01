;; No nothin', no how.
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
;; No time to type yes
(fset 'yes-or-no-p 'y-or-n-p)
;; No tabs!
(setq-default indent-tabs-mode nil)
;; No splash screen
(setq inhibit-splash-screen t
      ;; No bell!
      visible-bell 1
      ;; Don't hide with M-h on mac
      ;; faster tramp with ssh
      tramp-default-method "ssh"
      ;; set backup and autosave directory
      auto-save-default nil
      make-backup-files nil
      backup-directory-alist '(("." . "/tmp")))
;; Turn on highlight matching brackets when cursor is on one
(add-hook 'prog-mode-hook 'show-paren-mode)
;; Line numbers
(add-hook 'prog-mode-hook 'linum-mode)
;; function hinting
(add-hook 'prog-mode-hook 'turn-on-eldoc-mode)
;; Code folding
(add-hook 'prog-mode-hook (lambda () (ignore-errors (hs-minor-mode))))
;; Auto match pairs
(electric-pair-mode 1)
;; show prefix key options in minibuffer
(use-package which-key :config (which-key-mode))
;; Don't lose track of my indentation
(use-package indent-guide :config (add-hook 'prog-mode-hook 'indent-guide-mode))
;; Don't lose track of nested parens
(use-package rainbow-delimiters :config (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))
;; Rest client for http requests
(use-package restclient
  :init (add-hook 'restclient-mode-hook (lambda () (setq tab-width 2))))
;; Misc. language modes
(use-package puppet-mode :defer t)
(use-package toml-mode :defer t
  :config (setq-default tab-width 4))
(use-package yaml-mode :defer t)
(use-package ansible :defer t)
;; cool theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(use-package color-theme-sanityinc-tomorrow)
(load-theme 'sanityinc-tomorrow-eighties t)
;; nice term colors
(ansi-color-for-comint-mode-on)
;; tight mode line
(use-package smart-mode-line
  :config
  (setq sml/no-confirm-load-theme t)
  (sml/setup))
;; dope font
(set-frame-font "Anonymice Powerline 16")
;; GLOBAL KEYBINDINGS
;; ------------------
(global-set-key (kbd "C-c k") 'kill-other-buffers)
(global-set-key (kbd "C-c C-k") 'kill-buffer)
(global-set-key (kbd "C-x 0") 'toggle-maximize-buffer)
;; I HATE THIS KEYBINDING
(global-set-key (kbd "M-t") nil)

(provide 'init-config)
