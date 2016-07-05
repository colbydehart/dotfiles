(use-package org
  :mode ("\\.org$" . org-mode)
  :defer t
  :init
  (global-set-key (kbd "C-c c") 'org-capture)
  (add-hook 'org-agenda-finalize-hook 'evil-normal-state)
  (setq org-refile-targets '(("gtd.org" :maxlevel . 2)
                             ("someday.org" :maxlevel . 2)))
  (setq org-src-fontify-natively t)
  (setq org-log-done 1)
  (setq org-use-fast-todo-selection t)
  :config 
  (set-face-attribute 'org-column nil :foreground "#666666"))
;; Evil org stuff, I don't really like evil-org package
(leader-for-mode 'org-mode
    "t"  'org-show-todo-tree
    "l"  'evil-org-open-links
    "j" (lambda () (interactive) (find-file "~/org/journal.org"))
    "o"  'evil-org-recompute-clocks)
(evil-define-key 'normal org-agenda-mode-map
    "e" 'org-agenda-set-effort
    "t" 'org-agenda-todo
    "c" 'org-agenda-columns
    "i" 'org-agenda-clock-in
    "m" 'org-agenda-month-view
    "o" 'org-agenda-clock-out
    "q" 'org-agenda-quit)
(evil-define-key 'normal org-mode-map
    "$" 'org-archive-subtree
    "^" 'org-beginning-of-line
    "gl" 'org-open-at-point
    "O" 'org-insert-heading
    "o" 'org-insert-heading-after-current
    "H" 'org-shiftleft
    "J" 'org-shiftdown
    "K" 'org-shiftup
    "L" 'org-shiftright
    "<" 'org-metaleft
    ">" 'org-metaright
    "t" 'org-todo
    "q" 'org-set-tags-command
    (kbd "<tab>") 'org-cycle
    (kbd "M-h") 'elscreen-previous
    (kbd "M-l") 'evil-tabs-goto-tab)
(evil-define-key 'insert org-mode-map
    (kbd "M-l") 'org-metaright
    (kbd "M-h") 'org-metaleft)
;; Beautiful bullets
(use-package org-bullets
  :defer t
  :init
  (add-hook 'org-mode-hook 'org-bullets-mode)
  (setq org-bullets-bullet-list '("☯" "♫" "♜"  "⚡" "☢")))
;; Templates for org-capture
(setq org-capture-templates
        '(("t" "Todo" entry (file+headline "~/org/gtd.org" "Tasks")
           "* TODO %^{Brief Description} %^g\n    Added: %U %F")
          ("j" "Journal" entry (file+datetree "~/org/journal.org")
           "* %? %^g\nEntered on %U %i")))
;; Custom agenda commands
(setq org-agenda-custom-commands
      '(
        ("p" "Projects"
         ((tags "project")))
        ("h" "Work and Home Lists"
         ((agenda)
          (tags-todo "home")
          (tags-todo "laptop")
          (tags-todo "project")
          (tags-todo "office")
          (tags-todo "read")))
        ("d" "Daily Action List"
         ((agenda "" ((org-agenda-ndays 1)
                      (org-agenda-sorting-strategy
                       (quote ((agenda time-up priority-down tag-up) )))
                      (org-deadline-warning-days 0)))))))
(provide 'init-org)

