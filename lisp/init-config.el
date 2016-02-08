;; No nothin', no how.
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
;; No splash screen
(setq inhibit-splash-screen t
;; Don't hide with M-h
      mac-pass-command-to-system nil
;; set backup directory
      backup-directory-alist '(("." . "~/.emacs.d/backups"))
      auto-save-file-name-transforms `((".*" . "~/.emacs.d/backups")))

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
;; Fountain mode for writing
(use-package fountain-mode
  :defer t
  :init (add-hook 'fountain-mode-hook 'evil-emacs-state))
(use-package olivetti
  :defer t
  :init (add-hook 'fountain-mode-hook 'turn-on-olivetti-mode))


;; (use-package helm-dash)
  ;; :config
  ;; (define-key evil-normal-state-map (kbd "g h") 'helm-dash-at-point)
  ;; (setq dash-modes '((php-mode-hook . "PHP")))
  ;; (while dash-modes
  ;;   (setq cur-mode (car dash-modes))
  ;;   (setq mode (car cur-mode))
  ;;   (setq docset (cdr cur-mode))
  ;;   (add-hook mode (lambda () (setq-local helm-dash-docsets (list docset))))
  ;;   (setq dash-modes (cdr dash-modes))))

(use-package which-key :config (which-key-mode))
(use-package indent-guide :config (indent-guide-global-mode))
(use-package rainbow-delimiters :config (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))
(use-package telephone-line
  :config
  (telephone-line-mode 1)
  (setq telephone-line-lhs
        '((evil   . (telephone-line-evil-tag-segment))
          (accent . (telephone-line-vc-segment
                     telephone-line-erc-modified-channels-segment
                     telephone-line-process-segment))
          (nil    . (telephone-line-minor-mode-segment
                     telephone-line-buffer-segment))))
  (setq telephone-line-rhs
        '((nil    . (telephone-line-misc-info-segment))
          (accent . (telephone-line-major-mode-segment))
          (evil   . (telephone-line-airline-position-segment))))
  )



(use-package smyx-theme :config (load-theme 'smyx t))
(set-face-attribute 'highlight nil :background "#666666")
(set-default-font "Hack 16")
(global-hl-line-mode 1)
(set-face-background 'hl-line "#004444")

(provide 'init-config)

