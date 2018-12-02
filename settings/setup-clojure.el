;; setup-clojure.el

(require 'setup-editing)

;; clojure-mode
(use-package clojure-mode
  :mode (("\\.clj\\'" . clojure-mode)
         ("\\.boot\\'" . clojure-mode)
         ("\\.edn\\'" . clojure-mode)
         ("\\.cljs\\'" . clojurescript-mode)
         ("\\.cljs\\.hl\\'" . clojurescript-mode))
  :init
  (add-hook 'clojure-mode-hook #'eldoc-mode)
  (add-hook 'clojure-mode-hook #'subword-mode)
  (add-hook 'clojure-mode-hook #'clj-refactor-mode))

;; cider
;; (use-package cider
;;   :init (add-hook 'cider-mode-hook #'clj-refactor-mode)
;;   :diminish subword-mode
;;   :config
;;   (setq nrepl-log-messages t                  
;;         cider-repl-display-in-current-window t
;;         cider-repl-use-clojure-font-lock t    
;;         cider-prompt-save-file-on-load 'always-save
;;         cider-font-lock-dynamically '(macro core function var)
;;         nrepl-hide-special-buffers t            
;;         cider-overlays-use-font-lock t)         
;;   (setq cider-cljs-lein-repl "(do (use 'figwheel-sidecar.repl-api) (start-figwheel!) (cljs-repl))")
;;   (cider-repl-toggle-pretty-printing))

(use-package cider)


(use-package clj-refactor
  :defines cljr-add-keybindings-with-prefix
  :diminish clj-refactor-mode
  :config (cljr-add-keybindings-with-prefix "C-c C-j"))

(use-package flycheck-clojure
  :config
  (flycheck-clojure-setup))

(provide 'setup-clojure)
