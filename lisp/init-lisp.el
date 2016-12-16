(defun cool/lisp-hook ()
  (setq indent-tabs-mode nil)
  (turn-on-smartparens-strict-mode)
  (prettify-symbols-mode)
  (evil-cleverparens-mode)
  (show-paren-mode))

(leader-for-mode 'emacs-lisp-mode
                 "e" 'eval-buffer
                 "r" 'eval-region)

(add-hook 'prog-mode-hook 'turn-on-smartparens-mode)
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
    (kbd "M-h") 'eyebrowse-prev-window-config
    (kbd "M-l") 'eyebrowse-next-window-config))

(dolist
    (hook
     '(emacs-lisp-mode-hook
       eval-expression-minibuffer-setup-hook
       ielm-mode-hook
       cider-mode-hook
       lisp-mode-hook
       lisp-interaction-mode-hook
       scheme-mode-hook))
  (add-hook hook 'cool/lisp-hook))

(provide 'init-lisp)
