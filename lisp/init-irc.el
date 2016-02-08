(setq rcirc-default-user-name "CoolBoy"
      rcirc-default-nick "CoolBoy"
      rcirc-default-full-name "Cool Boy")

(setq rcirc-authinfo '(("freenode" nickserv "CoolBoy" "rab88bit")))
(setq rcirc-auto-authenticate-flag t)

;; (define-key rcirc-mode-map (kbd "M-h") 'elscreen-previous)
;; (define-key rcirc-mode-map (kbd "M-l") 'evil-tabs-goto-tab)

(provide 'init-irc)
