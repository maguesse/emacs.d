;; appareance.el

;; UI - Turn of annoying things :)
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(when (fboundp 'horizontal-scroll-bar-mode) (horizontal-scroll-bar-mode -1))

(setq-default indicate-empty-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

(blink-cursor-mode 0)

;; Always display line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)
(global-linum-mode)

;; Lines should be 80 characters wide, not 72
(setq fill-column 80)

(show-paren-mode t)

;; Highlight current line
(global-hl-line-mode 1)

;; full path in title bar
(setq-default frame-title-format "%b (%f)")

;; Add time in mode line
(setq display-time-24hr-format 1
      display-time-day-and-date 1
      display-time-format "%a, %d %b %Y %H:%M")
(display-time-mode 1)

;; Theme
(add-to-list 'custom-theme-load-path (expand-file-name "themes" user-emacs-directory))

;; TODO : create a my/load-theme to be customized by the user?
;; For example the "ohai-personal-taste/style" we can see in Bodil's ohai-apparence.el
;; https://github.com/bodil/ohai-emacs/blob/master/modules/ohai-appearance.el#L101
(use-package solarized-theme
  :config
  (load-theme 'solarized-dark t))

(provide 'setup-appareance)
