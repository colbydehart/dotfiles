(defun cool/lisp-hook ()
  (setq indent-tabs-mode nil)
  (electric-pair-mode nil)
  (turn-on-smartparens-strict-mode)
  (prettify-symbols-mode)
  (turn-on-smartparens-mode)
  (show-paren-mode)
  (evil-cleverparens-mode))

(leader-for-mode 'emacs-lisp-mode
								 "e" 'eval-buffer
								 "r" 'eval-region)

(use-package smartparens
	:config (require 'smartparens-config))

(use-package evil-cleverparens
  :bind (:map evil-cleverparens-mode-map
         ("C-{" . sp-backward-slurp-sexp)
         ("C-}" . sp-backward-barf-sexp)
         ("C-(" . sp-forward-barf-sexp)
         ("C-)" . sp-forward-slurp-sexp))
  :config
  (evil-define-key 'normal evil-cleverparens-mode-map
    (kbd "M-h") 'elscreen-previous
    (kbd "M-l") 'evil-tabs-goto-tab))

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
