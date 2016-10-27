
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp")
;; Secretssss
(load-file "~/secrets.el")
(require 'cl)
(require 'init-package)
(require 'init-fun)
(require 'init-config)
(require 'init-editor)
(require 'init-nav)
(require 'init-autocomplete)
(require 'init-evil)

(require 'init-lisp)
(require 'init-irc)
(require 'init-org)
(require 'init-web)

(require 'init-elixir)
(require 'init-javascript)
(require 'init-clojure)
(require 'init-rust)

(require 'init-ruby)
(require 'init-python)
(require 'init-typescript)
(require 'init-elm)
(require 'init-fsharp)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("604648621aebec024d47c352b8e3411e63bdb384367c3dd2e8db39df81b475f5" "45712b65018922c9173439d9b1b193cb406f725f14d02c8c33e0d2cdad844613" "be4025b1954e4ac2a6d584ccfa7141334ddd78423399447b96b6fa582f206194" "54ece5659cc7acdcd529dddd78675c2972a5ac69260af4a6aec517dcea16208b" "a1289424bbc0e9f9877aa2c9a03c7dfd2835ea51d8781a0bf9e2415101f70a7e" "ba9be9caf9aa91eb34cf11ad9e8c61e54db68d2d474f99a52ba7e87097fa27f5" "71ecffba18621354a1be303687f33b84788e13f40141580fa81e7840752d31bf" "4f6317bd3d928cb5f3cfd8638034432a6c40a14710cc687aa713c6ea46b55faf" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "c4465c56ee0cac519dd6ab6249c7fd5bb2c7f7f78ba2875d28a50d3c20a59473" "ace9f12e0c00f983068910d9025eefeb5ea7a711e774ee8bb2af5f7376018ad2" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "f0d8af755039aa25cd0792ace9002ba885fd14ac8e8807388ab00ec84c9497d7" "26ce7eea701bfd143ac536e6805224cff5598b75effb60f047878fe9c4833ae4" "91fba9a99f7b64390e1f56319c3dbbaed22de1b9676b3c73d935bf62277b799c" "cb18233197cedab557c70d171b511bed49cc702f428750925280090c31498bd2" "2f4afdef79a7f8a6b54f7e70959e059d7e09cf234d412662e0897cacd46f04b4" "8ffaf449297bd9a08517f4b03a4df9dbf3e347652746cefceb3ee57c8e584b9f" "294834baa9ca874795a3181cce7aaf228b1e3fb3899587ffd3ae7546de328c90" "f2503f0a035c2122984e90eb184185769ee665de5864edc19b339856942d2d2d" "f245c9f24b609b00441a6a336bcc556fe38a6b24bfc0ca4aedd4fe23d858ba31" "101a10b15bbbd0d5a0e56e4773e614962197886780afb2d62523a63a144ad96c" "b04425cc726711a6c91e8ebc20cf5a3927160681941e06bc7900a5a5bfe1a77f" "01ce486c3a7c8b37cf13f8c95ca4bb3c11413228b35676025fdf239e77019ea1" "50e7f9d112e821e42bd2b8410d50de966c35c7434dec12ddea99cb05dd368dd8" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "8288b9b453cdd2398339a9fd0cec94105bc5ca79b86695bd7bf0381b1fbe8147" default)))
 '(notmuch-search-line-faces
   (quote
    (("unread" :foreground "#aeee00")
     ("flagged" :foreground "#0a9dff")
     ("deleted" :foreground "#ff2c4b" :bold t))))
 '(org-agenda-files (quote ("~/org/gtd.org")))
 '(package-selected-packages
   (quote
    (w3m badwolf-theme jbeans-theme golden-ratio yasnippet yaml-mode which-key web-mode vagrant-tramp use-package toml-mode tide spaceline scss-mode rvm ruby-end ruby-electric rspec-mode robe restclient rainbow-delimiters racer pyvenv python-mode puppet-mode projectile-rails org-bullets multi-term markdown-mode js2-mode js-doc indent-guide helm-projectile helm-company helm-ag fsharp-mode flymake-ruby eyebrowse evil-surround evil-magit evil-iedit-state evil-commentary evil-cleverparens emmet-mode elm-mode dockerfile-mode docker dash-at-point company-tern company-anaconda cider bind-map ansible alchemist ace-jump-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
