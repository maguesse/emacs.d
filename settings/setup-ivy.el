;; setup-ivy

(use-package counsel
  :bind*
  (("C-c C-r" . ivy-resume)
   ("M-a" . counsel-M-x)
   ("C-M-i" . counsel-imenu)
   ("C-x C-f" . counsel-find-file)
   ("C-c d" . counsel-dired-jump)
   ("C-c u" . counsel-unicode-char)
   ("C-c g" . counsel-git)
   ("C-c j" . counsel-git-grep)
   ("C-c k" . counsel-ag)
   ("C-c l" . counsel-locate))
  :bind (:map help-map
	      ("f" . counsel-describe-function)
	      ("v" . counsel-describe-variable)
	      ("l" . counsel-info-lookup-symbol))
  :config
  (ivy-mode 1)
  (setq counsel-find-file-at-point t)
  (setq ivy-use-virtual-buffers t))

(use-package swiper
  :bind*
  (("C-s" . swiper)
   ("C-r" . swiper)
   ("C-M-s" . swipper-all))
  :bind
  (:map read-expression-map
	("C-r" . counsel-expression-history)))

;; avy - mode between visible text
(use-package avy
  :bind*
  (("C-'" . avy-goto-char)
   ("C-," . avy-goto-char-2)))

(provide 'setup-ivy)
