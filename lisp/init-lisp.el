(which-key-declare-prefixes-for-mode 'emacs-lisp-mode
  "s" "splice")
(leader-for-mode 'emacs-lisp-mode
                 "e" 'eval-buffer
                 "r" 'eval-region)


(defun cool/lisp-hook ()
  (turn-on-smartparens-strict-mode)
  (prettify-symbols-mode))
  
(add-hook 'emacs-lisp-mode-hook       'cool/lisp-hook)
(add-hook 'eval-expression-minibuffer-setup-hook 'cool/lisp-hook)
(add-hook 'ielm-mode-hook             'cool/lisp-hook)
(add-hook 'clojure-mode-hook             'cool/lisp-hook)
(add-hook 'lisp-mode-hook             'cool/lisp-hook)
(add-hook 'lisp-interaction-mode-hook 'cool/lisp-hook)
(add-hook 'scheme-mode-hook           'cool/lisp-hook)

(provide 'init-lisp)
