(defun cool/irc-hook (args)
  "hook for irc"
  (evil-emacs-state t))

(setq rcirc-default-nick "coolboy"
      rcirc-default-user-name "coolboy"
      rcirc-default-full-name "Cool Boy"
      rcirc-server-alist
      '(("irc.mozilla.org"
         :channels ("#rust" "#rust-beginners"))
        ("irc.freenode.net"
         :channels ("#ruby" "##javascript" "#clojure" "#elixir-lang" "#clojure-beginners"))))
;; Functions
(defun rcirc-channels ()
  (remove-if-not
   (lambda (x) (string-match "@irc" x)) (helm-buffer-list)))

(defun format-channel (channel)
  (string-match "[^#@]+" channel)
  (match-string 0 channel))

(defun helm-rcirc-channels ()
  (mapcar (lambda (x) (cons (format-channel x) x)) (rcirc-channels)))
(helm-rcirc-channels)

(defvar helm-source-rcirc
  '((name . "rcirc")
    (fuzzy-match)
    (candidates . helm-rcirc-channels)
    (action .  (lambda (buf) (switch-to-buffer buf)))))

(defun helm-rcirc ()
  (interactive)
  (helm :buffer "*helm: IRC Channels (rcirc)*"
        :sources '(helm-source-rcirc)))

;; Keybindings
(evil-define-key 'emacs rcirc-mode-map
  (kbd "C-h") 'windmove-left
  (kbd "C-l") 'windmove-right
  (kbd "C-j") 'windmove-down
  (kbd "C-k") 'windmove-up
  (kbd "C-c b") 'helm-rcirc
  (kbd "M-h") 'eyebrowse-prev-window-config
  (kbd "M-l") 'eyebrowse-next-window-config)

(rcirc-track-minor-mode 1)
(setq rcirc-omit-responses '("JOIN" "PART" "QUIT" "NICK" "AWAY"))
(add-hook 'rcirc-mode-hook 'rcirc-omit-mode)
(add-hook 'rcirc-mode-hook (lambda () (evil-emacs-state 1)))

;; /reconnect code, lifted from https://www.emacswiki.org/emacs/rcircReconnect
(load-file "~/dotfiles/lisp/rcirc-reconnect.el")
(add-hook 'rcirc-mode-hook 'rcirc-reconnect-mode)

(provide 'init-irc)
