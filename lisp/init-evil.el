(use-package evil
  :ensure t
  :init
  (setq evil-want-C-u-scroll t)
  (add-hook 'term-mode-hook 'evil-emacs-state)
  :config
  (evil-mode t)
  (define-key evil-normal-state-map (kbd "C-o") 'previous-buffer)
  (define-key evil-normal-state-map (kbd "C-i") 'next-buffer)
  (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
  (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right))

(use-package evil-tabs
  :ensure t
  :config
  (define-key evil-normal-state-map (kbd "M-h") 'elscreen-previous)
  (define-key evil-normal-state-map (kbd "M-l") 'evil-tabs-goto-tab)
  (global-evil-tabs-mode t))

;; Shell stuff
(add-hook 'term-mode-hook
	  (lambda ()
	    (evil-mode)
	    (evil-emacs-state 1)
	    (define-key term-raw-map (kbd "C-h") 'evil-window-left)
	    (define-key term-raw-map (kbd "C-j") 'evil-window-down)
	    (define-key term-raw-map (kbd "C-k") 'evil-window-up)
	    (define-key term-raw-map (kbd "C-l") 'evil-window-right)
	    (define-key term-raw-map (kbd "M-h") 'elscreen-previous)
	    (define-key term-raw-map (kbd "M-l") 'evil-tabs-goto-tab)))
(use-package evil-leader
  :ensure t
  :config
  (defun open-gtd () (interactive) (find-file "~/org/gtd.org"))
  (which-key-declare-prefixes "SPC p" "Projects")
  (which-key-declare-prefixes "SPC s" "split")
  (which-key-declare-prefixes "SPC l" "Lisp")
  (which-key-declare-prefixes "SPC le" "Evaluate")
  (evil-leader/set-key
    "b" 'helm-mini
    "f" 'helm-find-files
    "h" 'helm-apropos
    "i" 'evil-iedit-state/iedit-mode
    "g" 'magit-status
    "k" 'evil-tab-sensitive-quit
    ;; Lisp
    "leb" 'eval-buffer
    "lee" 'eval-last-sexp
    "n" 'evil-tabs-tabedit
    "o" 'open-gtd
    ;; Projects
    "pp" 'helm-projectile-switch-project
    "pf" 'helm-projectile-find-file
    "pt" 'projectile-regenerate-tags
    "sv" 'split-window-vertically
    "sh" 'split-window-horizontally
    "w" 'save-buffer
    ";" 'neotree-toggle
    ":" 'helm-M-x
    "/" 'helm-projectile-ag
    "<SPC>" 'ace-jump-char-mode)
  (evil-leader/set-leader "<SPC>")
  (global-evil-leader-mode))
(use-package evil-surround
  :config (global-evil-surround-mode 1))

(use-package evil-commentary
  :ensure t
  :config (evil-commentary-mode))

(provide 'init-evil)
