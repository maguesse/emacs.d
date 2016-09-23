;; setup-ivy

(use-package counsel
  :defer t)

;; avy - mode between visible text
(use-package avy
  :bind*
  (("C-'" . avy-goto-char)
   ("C-," . avy-goto-char-2)))

(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
	ivy-count-format "(%d/%d) ")
  :bind*
  (("C-s" . swiper)
   ("C-r" . swipper)
   ("C-x C-f" . counsel-find-file)
   ("C-c g" . counsel-git)
   ("C-c j" . counsel-git-grep)
   ("C-c k" . counsel-ag)
   ("C-c l" . counsel-locate)
   ("<f1> f" . counsel-describe-function)
   ("<f1> v" . counsel-describe-variable)
   ("<f1> l" . counsel-load-library)
   ("<f2> i" . counsel-info-lookup-symbol)
   ("<f2> u" . counsel-unicode-char)
   ("C-c C-r". ivy-resume)
   ))

(provide 'setup-ivy)
