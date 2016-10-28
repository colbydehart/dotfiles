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
      backup-directory-alist '(("." . "/tmp")) 
      ;; Do or don't use tabs and final newline
      cool/use-tabs (string= (getenv "USE_TABS") "1")
      cool/final-newline (string= (getenv "USE_FINAL_NEWLINE") "1"))
;; ;; No nothin', no how.
(tool-bar-mode -1)
(menu-bar-mode -1)
(if (display-graphic-p)
    (progn
      (scroll-bar-mode -1)
      (mac-auto-operator-composition-mode t)))
;; No time to type yes
(fset 'yes-or-no-p 'y-or-n-p)
;; Use tabs or dont
(setq-default indent-tabs-mode cool/use-tabs)
(setq-default tab-width 2)
(setq-default evil-shift-width 2)
;; Use newline or don't
(setq-default require-final-newline cool/final-newline)
(add-hook 'prog-mode-hook (lambda () (setq require-final-newline cool/final-newline)))
;; Rest client
(use-package restclient)
;; Web browser
(use-package w3m)
;; Cool Theme
(setq solarized-use-variable-pitch nil
      solarized-scale-org-headlines nil)
(use-package solarized-theme)
(load-theme 'solarized-dark t)
;; (use-package badwolf-theme)
;; (load-theme 'badwolf t)
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
(if (display-graphic-p)
    (if (getenv "BIG_MONITOR")
        (set-default-font "Fira Code 14")
      (set-default-font "Fira Code 16")))

;; GLOBAL KEYBINDINGS
;; ------------------
(global-set-key (kbd "C-c k") 'kill-other-buffers)
(global-set-key (kbd "C-c C-k") 'kill-buffer)
(global-set-key (kbd "C-x 0") 'toggle-maximize-buffer)
;; I HATE THESE KEYBINDING
(global-set-key (kbd "TAB") nil)
(global-set-key (kbd "M-t") nil)

(provide 'init-config)
