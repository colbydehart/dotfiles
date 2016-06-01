(use-package evil
  :ensure t
  :init
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode t)
  (define-key evil-normal-state-map (kbd "RET") 'helm-M-x)
  (define-key evil-normal-state-map (kbd "C-w o") 'toggle-maximize-buffer)
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
  (define-key evil-emacs-state-map (kbd "M-h") 'elscreen-previous)
  (define-key evil-emacs-state-map (kbd "M-l") 'evil-tabs-goto-tab)
  (global-evil-tabs-mode t))

(defun cool/leader-init ()
  (bind-map leader-map
    :keys ("M-u")
    :evil-keys ("SPC")
    :evil-states (normal motion visual))
  (which-key-declare-prefixes
    "SPC p" "Projects"
    "SPC s" "split"
    "SPC h" "Help"
    "SPC m" "Bookmark"
    "SPC o" "Org"
    "SPC y" "Yasnippe"
    "SPC oo" "gtd file"
    "SPC oo" "journal file")
  (bind-map-set-keys leader-map
    "a" 'org-agenda
    "b" 'helm-mini
    "c" 'org-capture
    "f" 'helm-find-files
    "ha" 'helm-apropos
    "hh" 'dash-at-point
    "i" 'evil-iedit-state/iedit-mode
    "k" 'evil-tab-sensitive-quit
    "mk" 'bookmark-delete
    "mc" 'bookmark-set
    "mm" 'helm-bookmarks
    "n" 'elscreen-create
    "oo" (lambda () (interactive) (find-file "~/org/gtd.org"))
    "oj" (lambda () (interactive) (find-file "~/org/journal.org"))
    "oa" 'org-agenda
    ;; Projects
    "pp" 'helm-projectile-switch-project
    "pf" 'helm-projectile-find-file
    "pt" 'projectile-regenerate-tags
    "pg" 'magit-status
    "p;" 'neotree-projectile-action
    "sh" 'split-window-vertically
    "sv" 'split-window-horizontally
    "t" 'open-term-split
    "w" 'save-buffer
    "yf" 'yas-visit-snippet-file
    "yy" 'yas-new-snippet
    ";" 'neotree-toggle
    ":" 'helm-M-x
    "/" 'helm-projectile-ag
    "<SPC>" 'ace-jump-char-mode))


(defun leader-for-mode (mode key def &rest bindings)
  "Sets a series of bindings to be set to the major leader (',') for a particular MODE"
  (setq leadermap (make-symbol (concat (symbol-name mode) "-leader")))
  (eval
   `(bind-map ,leadermap
     :major-modes (,mode)
     :keys ("M-m")
     :evil-keys (",")
     :evil-states (normal motion visual)))
  (while key
    (define-key (symbol-value leadermap) (kbd key) def)
    (setq key (pop bindings) def (pop bindings))))

(use-package bind-map
  :config (cool/leader-init))


(use-package evil-surround
  :config (global-evil-surround-mode 1))

(use-package evil-commentary
  :ensure t
  :config (evil-commentary-mode))

;; Shell stuff
(add-hook 'term-mode-hook
	  (lambda ()
            (yas-minor-mode -1)
	    (evil-mode)
	    (evil-emacs-state 1)
            (linum-mode -1)
	    (define-key term-raw-map (kbd "M-x") 'helm-M-x)
	    (define-key term-raw-map (kbd "C-y") 'term-paste)
	    (define-key term-raw-map (kbd "C-h") 'evil-window-left)
	    (define-key term-raw-map (kbd "C-j") 'evil-window-down)
	    (define-key term-raw-map (kbd "C-k") 'evil-window-up)
	    (define-key term-raw-map (kbd "C-l") 'evil-window-right)))

(provide 'init-evil)
