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

(provide 'setup-appareance)
