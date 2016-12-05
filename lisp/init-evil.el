(use-package evil
  :ensure t
  :init
  (setq evil-want-C-u-scroll t
        evil-shift-width 2
        evil-esc-delay 0)
  :bind (:map evil-normal-state-map
              ("RET" . helm-M-x)
              ("C-w o" . toggle-maximize-buffer)
              ("C-o" . previous-buffer)
              ("C-i" . next-buffer)
              ("C-u" . evil-scroll-page-up)
              ("C-h" . evil-window-left)
              ("C-j" . evil-window-down)
              ("C-k" . evil-window-up)
              ("C-l" . evil-window-right)
              :map evil-emacs-state-map
              ("C-h" . evil-window-left)
              ("C-j" . evil-window-down)
              ("C-k" . evil-window-up)
              ("C-l" . evil-window-right)
              :map evil-insert-state-map
              ("C-u" . evil-scroll-page-up)
              ("C-n" . evil-next-line)
              ("C-p" . evil-previous-line)))
(evil-mode 1)
;; Tabs
(use-package eyebrowse
  :init
  (setq eyebrowse-switch-back-and-forth t
        eyebrowse-wrap-around t
        eyebrowse-new-workspace t)
  :config
  (set-face-foreground 'eyebrowse-mode-line-active "#00ffdd")
  :bind
  (:map evil-normal-state-map
        ("M-l" . eyebrowse-next-window-config)
        ("M-h" . eyebrowse-prev-window-config)
        :map evil-emacs-state-map
        ("M-l" . eyebrowse-next-window-config)
        ("M-h" . eyebrowse-prev-window-config)))
(eyebrowse-mode 1)

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
    "SPC y" "Yasnippet"
    "SPC oo" "gtd file"
    "SPC oo" "journal file"
    "SPC z" "Browser")
  (bind-map-set-keys leader-map
    "a" 'org-agenda
    "b" 'helm-mini
    "c" 'org-capture
    "d" 'other-frame
    "f" 'helm-find-files
    "g" 'magit-status
    "ha" 'helm-apropos
    "hf" 'describe-function
    "hh" 'dash-at-point
    "hk" 'describe-key
    "hv" 'describe-variable
    "i" 'helm-imenu
    "k" 'eyebrowse-close-window-config
    "l" 'cool/open-log
    "mk" 'bookmark-delete
    "mc" 'bookmark-set
    "mm" 'helm-bookmarks
    "n" 'eyebrowse-create-window-config
    "oo" (lambda () (interactive) (find-file "~/org/gtd.org"))
    "oj" (lambda () (interactive) (find-file "~/org/journal.org"))
    "oa" 'org-agenda
    ;; Projects
    "pp" 'helm-projectile-switch-project
    "pf" 'helm-projectile-find-file
    "pt" 'projectile-regenerate-tags
    "p;" 'neotree-projectile-action
    "sh" 'split-window-horizontally
    "sj" 'cool/split-down
    "sk" 'split-window-vertically
    "sl" 'cool/split-right
    "t" 'multi-term-next
    "uh" 'cool/dec-width
    "ul" 'cool/inc-width
    "uj" 'cool/dec-height
    "uk" 'cool/inc-height
    "v" 'evil-iedit-state/iedit-mode
    "w" 'save-buffer
    "x" 'dired-jump
    "yc" 'cool/copy-file-name
    "yf" 'yas-visit-snippet-file
    "yy" 'yas-new-snippet
    "zx" 'cool/goto-hacker-news
    "zz" 'w3m-search
    ":" 'helm-M-x
    "/" 'helm-projectile-ag
    "<SPC>" 'avy-goto-char
    "C-<SPC>" 'avy-goto-char-2))


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

(use-package bind-map :config (cool/leader-init))
(use-package evil-surround :config (global-evil-surround-mode 1))
(use-package evil-commentary :config (evil-commentary-mode))

;;;;;;;;;;;;;;;;;;;;;TERM;;;;;;;;;;;;;;;;;;;;;

(use-package multi-term
  :config
  (add-to-list 'term-bind-key-alist '("<tab>" . cool/term-send-tab)))
(eval-after-load 'evil-vars
  '(evil-set-initial-state 'term-mode 'emacs))


(dolist (stats '(term-mode-map term-raw-map))
  (evil-define-key 'emacs state
    "M-x" 'helm-M-x
    "C-y" 'term-paste))
(defun cool/term-hook ()
  "colby's term hook"
  (define-key term-raw-map (kbd "C-M-p") 'multi-term-prev)
  (define-key term-raw-map (kbd "C-M-n") 'multi-term-next)
  (define-key term-raw-map (kbd "M-N") 'multi-term)
  (yas-minor-mode -1)
  (linum-mode -1))
(add-hook 'term-mode-hook 'cool/term-hook)

;;;;;;;;;;;;;;;;;;;;DIRED;;;;;;;;;;;;;;;;;;;;

(add-hook 'dired-mode-hook 'evil-mode)
(defun cool/dired-up-directory ()
  "Take dired up one directory, but behave like dired-find-alternate-file"
  (interactive)
  (let ((old (current-buffer)))
    (dired-up-directory)
    (kill-buffer old)))

(evil-define-key 'normal dired-mode-map
  "h" 'cool/dired-up-directory
  "l" 'dired-find-alternate-file
  "v" 'dired-toggle-marks
  "c" 'dired-create-directory
  "n" 'evil-search-next
  "N" 'evil-search-previous
  "q" 'kill-this-buffer)


(provide 'init-evil)
