(use-package company)
(global-company-mode)
(setq company-idle-delay .1
      company-echo-delay 0
      company-tooltip-limit 12
      company-dabbrev-downcase nil
      company-selection-wrap-around t)

(use-package helm-company
  :bind (:map company-mode-map
         ("C-;" . helm-company)
         :map company-active-map
         ("C-j" . helm-company)))
(use-package yasnippet
  :bind (:map yas-minor-mode-map 
         ("M-<return>" . yas/expand) 
         :map evil-insert-state-map
         ("C-SPC" . company-yasnippet))
  :init (yas-global-mode 1))

(provide 'init-autocomplete)
