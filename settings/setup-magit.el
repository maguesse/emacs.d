;; setup-magit.el

(use-package magit)

;; To display information about the current Git repository, type M-x magit-status. You will be doing that so often that it is best to bind this command globally:
(use-package magit
  :commands magit-status
  :bind ("C-x g" . magit-status))

(provide 'setup-magit)
