(setq gnus-ignored-newsgroups "")
(setq gnus-current-select-method
 '(nnimap "gmail"
	  (nnimap-address "imap.gmail.com")
	  (nnimap-server-port 993)
	  (nnimap-stream ssl)))

(defvar smtp-accounts
  '(
    (ssl "colbydehart@gmail.com" "smtp.gmail.com"
	 587 "colbydehart@gmail.com" gmail-password)
    ))

(require 'smtpmail)
(setq send-mail-function 'smtpmail-send-it
      message-send-mail-function 'smtpmail-send-it
      mail-from-style nil
      user-full-name "Colby DeHart"
      smtpmail-debug-info  t
      smtpmail-debug-verb t)

(defun set-smtp (mech server port user password)
  "Set related smtp variables for supplied params"
  (setq smtpmail-smtp-server server
	smtpmail-smtp-service port
	smtpmail-auth-credentials
	  '((server port user password))
	  smtpmail-auth-supported '(mech)
	  smtpmail-starttls-credentials nil)
  (message "Setting SMTP server to `%s:%s' for user `%s'."
	   server port user))

(defun set-smtp-ssl (server port user password &optional key
			    cert)
  "Set related SMTP and SSL variables for supplied parameters."
  (setq starttls-use-gnutls t
	starttls-gnutls-program "gnutls-cli"
	starttls-extra-arguments nil
	smtpmail-smtp-server server
	smtpmail-smtp-service port
	smtpmail-auth-credentials '((server port user password))
	smtpmail-starttls-credentials '((server port key cert)))
  (message "Setting SMTP server to `%s:%s' for user `%s'. (SSL enabled.)"
	   server port user))

(provide 'init-gnus)
