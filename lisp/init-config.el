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
      ;; don't freak out 
      max-specpdl-size 32000
      ;; no tabs no way
      indent-tabs-mode nil)
;; Enhance PATH in GUI emacs
(use-package exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
;; No nothin', no how.
(tool-bar-mode -1)
(menu-bar-mode -1)
(if (display-graphic-p)
    (progn
      (scroll-bar-mode -1)
      (mac-auto-operator-composition-mode t)))
;; No time to type yes
(fset 'yes-or-no-p 'y-or-n-p)
;; 2 space width
(setq-default evil-shift-width 2)
;; Rest client
(use-package restclient)
;; Web browser
(use-package w3m)
;; Cool Theme
(setq solarized-use-variable-pitch nil
      solarized-scale-org-headlines nil)
(use-package solarized-theme)
(load-theme 'solarized-dark t)
;; nice term colors
(ansi-color-for-comint-mode-on)
;; tight mode line
(use-package smart-mode-line
  :init (sml/setup))
;; dope font
(if (display-graphic-p)
    (set-default-font "mononoki 22"))
;; scratch stuff
(setq initial-major-mode 'elixir-mode)
(setq initial-scratch-message "defmodule Scratch do
  @moduledoc\"\"\"
  This buffer is for text that is not saved, and for Elixir evaluation.
  To create a file, visit it with C-x C-f and enter text in its buffer.
  \"\"\"
end")

;; GLOBAL KEYBINDINGS
;; ------------------
(global-set-key (kbd "C-c k") 'kill-other-buffers)
(global-set-key (kbd "C-c C-k") 'kill-buffer)
(global-set-key (kbd "C-x 0") 'toggle-maximize-buffer)
;; I HATE THESE KEYBINDING
(global-set-key (kbd "TAB") nil)
(global-set-key (kbd "M-t") nil)


(provide 'init-config)
