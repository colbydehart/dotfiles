(package-initialize nil)
(setq package-enable-at-startup nil)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("gnu" ."https://elpa.gnu.org/packages/")))

(package-refresh-contents)
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(setq use-package-verbose t)
(setq use-package-always-ensure t)
(eval-when-compile (require 'use-package))
;; Get dash here because we need it everywhere
(use-package dash :config (dash-enable-font-lock))
(use-package dash-functional)

(provide 'init-package)
