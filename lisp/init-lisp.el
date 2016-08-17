(defun cool/lisp-hook ()
	(setq indent-tabs-mode nil)
  (turn-on-smartparens-strict-mode)
  (prettify-symbols-mode)
  (turn-on-smartparens-mode)
  (show-paren-mode)
  (evil-cleverparens-mode))

(leader-for-mode 'emacs-lisp-mode
								 "e" 'eval-buffer
								 "r" 'eval-region)

(use-package smartparens
	:defer t
	:config
  (require 'smartparens-config)
  (evil-define-key 'insert evil-cleverparens-mode-map
    (kbd "C-)") 'sp-forward-slurp-sexp
    (kbd "C-(") 'sp-forward-barf-sexp
    (kbd "C-}") 'sp-backward-barf-sexp
    (kbd "C-{") 'sp-backward-slurp-sexp) 
  (evil-define-key 'normal evil-cleverparens-mode-map
    (kbd "M-h") 'elscreen-previous
    (kbd "M-l") 'evil-tabs-goto-tab)
  (evil-define-key 'visual evil-cleverparens-mode-map
    (kbd "M-h") 'elscreen-previous
    (kbd "M-l") 'evil-tabs-goto-tab)
  (evil-define-key 'operator evil-cleverparens-mode-map
    (kbd "M-h") 'elscreen-previous
    (kbd "M-l") 'evil-tabs-goto-tab))

(use-package evil-cleverparens :defer t)

(dolist
    (hook
     '(emacs-lisp-mode-hook
       eval-expression-minibuffer-setup-hook
       ielm-mode-hook
       clojure-mode-hook
       lisp-mode-hook
       lisp-interaction-mode-hook
       scheme-mode-hook))
  (add-hook hook 'cool/lisp-hook))

(provide 'init-lisp)
