(leader-for-mode 'python-mode
                 "vw" 'pyvenv-workon
                 "vv" 'pyvenv-activate)
(use-package python-mode
  :defer t
  :init
  (add-hook
   'python-mode-hook
   (lambda ()
     (which-key-declare-prefixes "SPC m" "Python")
     (setq-local helm-dash-docsets '("Python" "Django")))))

(use-package anaconda-mode
  :defer t
  :init
  (add-hook 'python-mode-hook 'anaconda-mode))

(use-package company-anaconda
  :defer t
  :init
  (add-to-list 'company-backends 'company-anaconda))

(use-package pyvenv
  :defer t)

(provide 'init-python)
