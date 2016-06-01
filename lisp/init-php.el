(leader-for-mode 'php-mode
		 "d" 'ggtags-find-definition
		 "r" 'ggtags-find-tag-dwim
		 "t" 'ggtags-remake-tags)

(use-package php-mode :mode ("\\.php\\'" . php-mode))
(add-hook
   'php-mode-hook
   (lambda ()
     (ggtags-mode 1)
     (setq flycheck-phpcs-standard "PSR2")
     (setq-local helm-dash-docsets '("PHP"))))

;; quick arrow inserts
(evil-define-key 'insert php-mode-map
  (kbd "C--") (lambda () (interactive)
		(insert "->")))

(provide 'init-php)
