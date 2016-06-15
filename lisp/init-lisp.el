(which-key-declare-prefixes-for-mode 'emacs-lisp-mode
  "s" "splice")
(leader-for-mode 'emacs-lisp-mode
                 "e" 'eval-buffer
                 "r" 'eval-region)

(use-package evil-cleverparens :defer t)
(use-package smartparens :defer t)

(defun cool/lisp-hook ()
  (electric-pair-mode nil)
  (show-paren-mode)
  (turn-on-smartparens-strict-mode)
  (require 'smartparens-config)
  (require 'evil-cleverparens)
  (evil-cleverparens-mode)
  (dolist (state '(normal operator visual))
    (evil-define-key state evil-cleverparens-mode-map
      (kbd "M-h") 'elscreen-previous
      (kbd "M-l") 'evil-tabs-goto-tab))
  (prettify-symbols-mode))
  
(add-hook 'emacs-lisp-mode-hook       'cool/lisp-hook)
(add-hook 'eval-expression-minibuffer-setup-hook 'cool/lisp-hook)
(add-hook 'ielm-mode-hook             'cool/lisp-hook)
(add-hook 'clojure-mode-hook             'cool/lisp-hook)
(add-hook 'lisp-mode-hook             'cool/lisp-hook)
(add-hook 'lisp-interaction-mode-hook 'cool/lisp-hook)
(add-hook 'scheme-mode-hook           'cool/lisp-hook)

(provide 'init-lisp)
