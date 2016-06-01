(setq rcirc-default-nick "coolboy"
      rcirc-default-user-name "coolboy"
      rcirc-default-full-name "Cool Boy"
      rcirc-server-alist
      '(("irc.freenode.net"
         :channels ("#emacs" "#python" "#elixir-lang"))
        ("irc.snoonet.org"
         :channels ("#StreetFighter"))))
;; Functions
(defun helm-rcirc-channel-source ()
  (remove-if-not
   (lambda (x) (string-match "@irc" x)) (helm-buffer-list)))
(defun helm-rcirc-channels ()
  (interactive)
  (helm :buffer "*helm: IRC Channels (rcirc)*"
        :sources (helm-build-sync-source "rcirc"
                   :candidates (helm-rcirc-channel-source)
                   :action (lambda (x) (switch-to-buffer x))
                   :fuzzy-match t)))
;; Keybindings
(evil-define-key 'emacs rcirc-mode-map
  (kbd "C-h") 'windmove-left
  (kbd "C-l") 'windmove-right
  (kbd "C-j") 'windmove-down
  (kbd "C-k") 'windmove-up
  (kbd "C-c b") 'helm-rcirc-channels

  (kbd "M-h") 'elscreen-previous
  (kbd "M-l") 'evil-tabs-goto-tab)

(rcirc-track-minor-mode 1)

(add-hook 'rcirc-mode-hook (lambda ()
                             (evil-emacs-state 1)))

;; /reconnect code, lifted from https://www.emacswiki.org/emacs/rcircReconnect
(load-file "~/dotfiles/lisp/rcirc-reconnect.el")
(add-hook 'rcirc-mode-hook 'rcirc-reconnect-mode)

(provide 'init-irc)
