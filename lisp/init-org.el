(use-package org
  :mode ("\\.org$" . org-mode)
  :defer t
  :init
  (setq org-src-fontify-natively t))
(use-package evil-org
  :init
  (add-hook 'org-mode-hook (lambda ()
			     (evil-org-mode)
			     (which-key-declare-prefixes "SPC m" "Org")))
  :config
  (evil-define-key 'normal org-mode-map (kbd "<SPC> t") nil)
  (evil-define-key 'normal evil-org-mode-map (kbd "M-l") 'evil-tabs-goto-tab)
  (evil-define-key 'normal evil-org-mode-map (kbd "M-h") 'elscreen-previous)
  (evil-leader/set-key-for-mode 'org-mode
    "mt"  'org-show-todo-tree
    "ma"  'org-agenda
    "mc"  'org-archive-subtree
    "ml"  'evil-org-open-links
    "mo"  'evil-org-recompute-clocks))

(use-package org-bullets
  :defer t
  :init (add-hook 'org-mode-hook 'org-bullets-mode))
(use-package org-pomodoro
  :defer t
  :init (setq org-pomodoro-audio-player "/usr/bin/afplay"))

(provide 'init-org)
