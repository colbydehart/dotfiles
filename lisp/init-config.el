;; per environment config
(setq cool/use-tabs t
      cool/final-newline nil)
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
;; Use newline or don't
(setq-default require-final-newline cool/final-newline)
(add-hook 'prog-mode-hook (lambda () (setq require-final-newline cool/final-newline)))
;; Save desktop session
(desktop-save-mode)
;; No splash screen
(setq inhibit-splash-screen t
      ;; No bell!
      visible-bell 1
      ;; Don't hide with M-h on mac
      mac-pass-command-to-system nil
      ;; faster tramp with ssh
      tramp-default-method "ssh"
			;; cmd is meta
			mac-option-modifier 'nil
			mac-command-modifier 'meta
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
(use-package indent-guide :config (add-hook 'prog-mode-hook 'indent-guide-mode))
;; Auto pair parens
(add-hook 'prog-mode-hook 'electric-pair-mode)
;; Don't lose track of nested parens
(use-package rainbow-delimiters
  :config
  (set-face-foreground 'rainbow-delimiters-depth-1-face "#85ecd3")
  (set-face-foreground 'rainbow-delimiters-depth-1-face "#85ecd3")
  (set-face-foreground 'rainbow-delimiters-depth-2-face "#8f85ec")
  (set-face-foreground 'rainbow-delimiters-depth-3-face "#e485ec")
  (set-face-foreground 'rainbow-delimiters-depth-4-face "#ee4b4b")
  (set-face-foreground 'rainbow-delimiters-depth-5-face "#e8c85d")
  (set-face-foreground 'rainbow-delimiters-depth-6-face "#94e85d")
  (set-face-foreground 'rainbow-delimiters-depth-7-face "#3bb793")
  (set-face-foreground 'rainbow-delimiters-depth-8-face "#3b69b7")
  (set-face-foreground 'rainbow-delimiters-depth-9-face "#863bb7")
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))
;; Rest client for http requests
(use-package restclient
  :init (add-hook 'restclient-mode-hook (lambda () (setq tab-width 2))))
;; Web browser
;; (use-package epc)
;; (require 'webkit)
;; Misc. language modes
(use-package puppet-mode :defer t)
(use-package toml-mode :defer t
  :config (setq-default tab-width 4))
(use-package yaml-mode :defer t)
(use-package ansible :defer t)
(use-package dockerfile-mode :defer t)
(use-package docker
  :config (docker-global-mode))
;; C O O O O O O O O O O O O O L~T H E E E E E E E E M E
(load-theme 'wombat t)
;; nice term colors
(ansi-color-for-comint-mode-on)
;; tight mode line
(use-package spaceline
  :init
  (require 'spaceline-config)
  (spaceline-spacemacs-theme)
  :config
  (setq spaceline-window-numbers-unicode t
        spaceline-workspace-numbers-unicode t))
;; dope font 
(mac-auto-operator-composition-mode t)
(set-default-font "Fira Code 14")

;; GLOBAL KEYBINDINGS
;; ------------------
(global-set-key (kbd "C-c k") 'kill-other-buffers)
(global-set-key (kbd "C-c C-k") 'kill-buffer)
(global-set-key (kbd "C-x 0") 'toggle-maximize-buffer)
;; I HATE THESE KEYBINDING
(global-set-key (kbd "TAB") nil)
(global-set-key (kbd "M-t") nil)

(provide 'init-config)
