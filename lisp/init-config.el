;; No nothin', no how.
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
;; No splash screen
(setq inhibit-splash-screen t
;; No bell!
      visible-bell 1
;; Don't hide with M-h
      mac-pass-command-to-system nil
;; set backup and autosave directory
      auto-save-default nil
      backup-directory-alist '((".*" . "/tmp")))
;; Turn on highlight matching brackets when cursor is on one
(show-paren-mode 1)
;; Line numbers
(global-linum-mode 1)
;; Auto match pairs
(electric-pair-mode 1)
;; No Tabs!!!
(setq-default indent-tabs-mode nil)
;; ELDOC
(add-hook 'prog-mode-hook 'turn-on-eldoc-mode)
;; Code folding
(add-hook 'prog-mode-hook (lambda () (ignore-errors (hs-minor-mode))))
;; global keybindings
(global-set-key (kbd "C-c k") 'kill-other-buffers)
;; Yaml mode
(use-package puppet-mode :defer t)
(use-package yaml-mode :defer t)
;; Fountain mode for writing
(use-package fountain-mode
  :defer t
  :init
  (add-to-list 'auto-mode-alist '("\\.fountain$" . fountain-mode))
  (add-hook 'fountain-mode-hook (lambda ()
                                  (company-mode -1))))
(use-package olivetti
  :defer t
  :config
  (evil-define-key 'normal fountain-mode-map (kbd "TAB") 'fountain-outline-cycle)
  :init
  (add-hook 'fountain-mode-hook 'turn-on-olivetti-mode)
  (add-hook 'fountain-mode-hook (lambda () (linum-mode -1))))

(use-package which-key :config (which-key-mode))
(use-package indent-guide
  :config
  (add-hook 'prog-mode-hook 'indent-guide-mode))
(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package smyx-theme
  :config
  (load-theme 'smyx t)
  (set-face-attribute 'highlight nil :background "#666666"))
(use-package smart-mode-line
  :config
  (setq sml/no-confirm-load-theme t)
  (sml/setup))
(set-default-font "Anonymous Pro For Powerline 16")
(global-hl-line-mode 1)
(set-face-background 'hl-line "#004444")

(provide 'init-config)

