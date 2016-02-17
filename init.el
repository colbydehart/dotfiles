(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'init-package)
(require 'init-fun)
(require 'init-evil)
(require 'init-config)
(require 'init-nav)
(require 'init-irc)
(require 'init-org)
(require 'init-web)
(require 'init-php)
(require 'init-elixir)
(require 'init-clojure)
(require 'init-csharp)
(require 'init-python)
(require 'init-rust)
(require 'init-javascript)
(require 'init-lisp)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#282828" "#FAB1AB" "#D1FA71" "#FFA600" "#7b68ee" "#dc8cc3" "#96D9F1" "#F7F7F7"])
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "8288b9b453cdd2398339a9fd0cec94105bc5ca79b86695bd7bf0381b1fbe8147" default)))
 '(fci-rule-color "#151515")
 '(org-agenda-files (quote ("~/org/gtd.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-column ((t (:background "gray16" :foreground "#666666")))))
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
