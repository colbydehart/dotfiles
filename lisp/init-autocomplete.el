(use-package company)
(global-company-mode)
(setq company-idle-delay .1
      company-echo-delay 0
      company-tooltip-limit 12
      company-dabbrev-downcase nil
      company-selection-wrap-around t
      company-minimum-prefix-length 2)

(use-package helm-company
  :bind (:map company-mode-map
         ("C-;" . helm-company)
         ("C-e" . company-complete)
         :map company-active-map
         ("C-j" . helm-company)))
(use-package yasnippet
  :bind (:map yas-minor-mode-map 
         ("M-<return>" . yas-expand) 
         :map evil-insert-state-map
         ("C-SPC" . company-yasnippet))
  :init (add-hook 'prog-mode-hook 'yas-minor-mode))

(provide 'init-autocomplete)
