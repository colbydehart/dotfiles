;; per environment config
(setq cool/use-tabs nil
      cool/final-newline t)
;; No nothin', no how.
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
;; No time to type yes
(fset 'yes-or-no-p 'y-or-n-p)
;; Use tabs or dont
(setq-default indent-tabs-mode cool/use-tabs)
(setq-default tab-width 2)
(setq-default evil-shift-width 2)
(setq-default require-final-newline cool/final-newline)
(add-hook 'prog-mode-hook (lambda () (setq require-final-newline cool/final-newline)))
;; No splash screen
(setq inhibit-splash-screen t
      ;; No bell!
      visible-bell 1
      ;; Don't hide with M-h on mac
      mac-pass-command-to-system nil
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
(add-hook 'prog-mode-hook 'column-number-mode)
;; function hinting
(add-hook 'prog-mode-hook 'turn-on-eldoc-mode)
;; Code folding
(add-hook 'prog-mode-hook (lambda () 'ignore-errors (hs-minor-mode)))
;; show prefix key options in minibuffer
(use-package which-key :config (which-key-mode))
;; Don't lose track of my indentation
(use-package highlight-indent-guides
  :config
  (setq highlight-indent-guides-method 'character)
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode))
;; Auto pair parens
(add-hook 'prog-mode-hook 'electric-pair-mode)
;; Don't lose track of nested parens
(use-package rainbow-delimiters :config (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))
;; Rest client for http requests
(use-package restclient
  :init (add-hook 'restclient-mode-hook (lambda () (setq tab-width 2))))
;; Web browser
(use-package w3m :init
  (setq )
	(setq browse-url-browser-function 'w3m-goto-url-new-session)
	(add-hook 'w3m-mode-hook 'w3m-lnum-mode)
	(add-hook 'w3m-mode-hook 'evil-emacs-state))
;; Misc. language modes
(use-package puppet-mode :defer t)
(use-package toml-mode :defer t
  :config (setq-default tab-width 4))
(use-package yaml-mode :defer t)
(use-package ansible :defer t)
(use-package dockerfile-mode :defer t)
(use-package docker
  :config (docker-global-mode))
;; cool theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/lisp/themes/")
(load-theme 'ample t)
;; nice term colors
(ansi-color-for-comint-mode-on)
;; tight mode line
(use-package smart-mode-line
  :config
  (setq sml/no-confirm-load-theme t)
  (sml/setup))
(use-package nyan-mode
  :config (nyan-mode))
;; dope font 
(mac-auto-operator-composition-mode t)
(set-default-font "Fira Code 18")

;; GLOBAL KEYBINDINGS
;; ------------------
(global-set-key (kbd "C-c k") 'kill-other-buffers)
(global-set-key (kbd "C-c C-k") 'kill-buffer)
(global-set-key (kbd "C-x 0") 'toggle-maximize-buffer)
(global-set-key (kbd "TAB") nil)
;; I HATE THIS KEYBINDING
(global-set-key (kbd "M-t") nil)

(provide 'init-config)
