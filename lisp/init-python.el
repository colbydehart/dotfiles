(defun cool/python-hook ()
  (anaconda-mode)
  (add-to-list 'company-backends 'company-anaconda)
  (setq-local helm-dash-docset "py"))

(leader-for-mode 'python-mode
                 "vw" 'pyvenv-workon
                 "vv" 'pyvenv-activate)

(use-package python-mode :defer t)
(use-package anaconda-mode :defer t)
(use-package company-anaconda :defer t)
(use-package pyvenv :defer t)

(add-hook 'python-mode-hook 'cool/python-hook)
(provide 'init-python)
