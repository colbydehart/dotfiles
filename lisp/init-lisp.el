(which-key-declare-prefixes-for-mode 'emacs-lisp-mode
  "s" "splice")
(leader-for-mode 'emacs-lisp-mode
                 "sf" 'paredit-splice-sexp-killing-forward
                 "sf" 'paredit-splice-sexp-killing-backward
                 "e" 'eval-buffer
                 "r" 'eval-region)
(use-package paredit
  :defer t
  :init
  (add-hook 'emacs-lisp-mode-hook       'enable-paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook 'enable-paredit-mode)
  (add-hook 'ielm-mode-hook             'enable-paredit-mode)
  (add-hook 'clojure-mode-hook             'enable-paredit-mode)
  (add-hook 'lisp-mode-hook             'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
  (add-hook 'scheme-mode-hook           'enable-paredit-mode)
  :config
  (add-hook 'paredit-mode-hook 'show-paren-mode))

(evil-define-key 'insert paredit-mode-map
  (kbd "C-)") 'paredit-forward-slurp-sexp
  (kbd "C-(") 'paredit-backward-slurp-sexp
  (kbd "C-{") 'paredit-backward-barf-sexp
  (kbd "C-}") 'paredit-forward-barf-sexp)
(evil-define-key 'normal paredit-mode-map
  "C" (lambda () (interactive) (paredit-kill) (evil-insert-state))
  ")" 'paredit-forward-slurp-sexp
  "(" 'paredit-backward-slurp-sexp
  "{" 'paredit-backward-barf-sexp
  "}" 'paredit-forward-barf-sexp)

(use-package slime-company)
(use-package slime
  :defer t
  :init
 (setq inferior-lisp-program "/usr/local/bin/sbcl")
 :config
 (slime-setup '(slime-fancy slime-company)))



(provide 'init-lisp)
