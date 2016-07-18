(which-key-declare-prefixes-for-mode 'emacs-lisp-mode
  "s" "splice")
(leader-for-mode 'emacs-lisp-mode
                 "e" 'eval-buffer
                 "r" 'eval-region)

(use-package smartparens
	:defer t
	:config
  (evil-define-key 'insert evil-cleverparens-mode-map
    (kbd "C-)") 'sp-forward-slurp-sexp
    (kbd "C-(") 'sp-forward-barf-sexp
    (kbd "C-}") 'sp-backward-barf-sexp
    (kbd "C-{") 'sp-backward-slurp-sexp)
  (dolist (state '(normal operator visual))
    (evil-define-key state evil-cleverparens-mode-map
      (kbd "M-h") 'elscreen-previous
      (kbd "M-l") 'evil-tabs-goto-tab)))

(use-package evil-cleverparens :defer t)

(defun cool/lisp-hook ()
  (turn-on-smartparens-strict-mode)
  (prettify-symbols-mode)
  (require 'smartparens-config)
  (turn-on-smartparens-mode)
  (show-paren-mode)
  (evil-cleverparens-mode))
  
(add-hook 'emacs-lisp-mode-hook       'cool/lisp-hook)
(add-hook 'eval-expression-minibuffer-setup-hook 'cool/lisp-hook)
(add-hook 'ielm-mode-hook             'cool/lisp-hook)
(add-hook 'clojure-mode-hook             'cool/lisp-hook)
(add-hook 'lisp-mode-hook             'cool/lisp-hook)
(add-hook 'lisp-interaction-mode-hook 'cool/lisp-hook)
(add-hook 'scheme-mode-hook           'cool/lisp-hook)

(provide 'init-lisp)
