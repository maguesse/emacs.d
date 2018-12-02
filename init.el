;;; init.el

;; Copyright © 2016 Mathieu AGUESSE

;; Author: Mathieu AGUESSE
;; URL: 
;; Version: 0.0.1
;; Created: 2016-09-13
;; Based on
;; - Technomancy's better-defaults (https://github.com/technomancy/better-defaults)
;; - Sacha Chua : http://pages.sachachua.com/.emacs.d/Sacha.html
;; - Aaron Bedra : http://aaronbedra.com/emacs.d/
;; - https://github.com/purcell/emacs.d
;; - https://github.com/flyingmachine/emacs-for-clojure
;; - https://github.com/bodil/ohai-emacs
;; - http://www.jethrokuan.com/init.html

;; This file is NOT part of GNU Emacs.

(package-initialize)

;; Temporarily reduce GC
(defconst ma/initial-gc-cons-threshold gc-cons-threshold
  "Initial value of `gc-cons-threshold' at startup.")
(setq gc-cons-threshold (* 128 1024 1024))
(add-hook 'after-init-hook
	  (lambda() (setq gc-cons-threshold ma/initial-gc-cons-threshold)))

(setq inhibit-startup-message t
      inhibit-splash-screen t
      visible-bell t)

(setq ad-redefinition-action 'accept)


(setq hostname system-name)

(setq site-lisp-dir (expand-file-name "site-lisp" user-emacs-directory)
      settings-dir  (expand-file-name "settings" user-emacs-directory)
      lisp-dir (expand-file-name "lisp" user-emacs-directory))

(setq custom-file (expand-file-name "custom-settings.el" user-emacs-directory)
      user-defaults-file (expand-file-name (concat "users/" user-login-name "-defaults.el") user-emacs-directory)
      host-defaults-file (expand-file-name (concat "hosts/" hostname "-defaults.el") user-emacs-directory))

(add-to-list 'load-path settings-dir)
(add-to-list 'load-path site-lisp-dir)
(add-to-list 'load-path lisp-dir)

;; Display the total loading time in the menubuffer
(defun display-startup-echo-area-message ()
  "Display startup echo area message."
  (message "Initialized in %s" (emacs-init-time)))

(when init-file-debug
  (require 'benchmark))

(mapc (lambda (fname)
               (let ((feat (intern (file-name-base fname))))
                 (if init-file-debug
                     (message "Feature '%s' loaded in %.2fs" feat
                              (benchmark-elapse (require feat fname)))
                   (require feat fname))))
        (directory-files settings-dir t "\\.el"))

(when (file-exists-p custom-file) (load custom-file))
(when (file-exists-p user-defaults-file) (load user-defaults-file))
(when (file-exists-p host-defaults-file) (load host-defaults-file))

(require 'setup-packages)
(use-package f)
(use-package s)
(use-package dash)
(require 'setup-misc)
;;(require 'setup-ido)
(require 'setup-ivy)
(require 'setup-appareance)
(require 'setup-editing)
(require 'setup-keybindings)
(require 'setup-magit)
(require 'setup-clojure)
