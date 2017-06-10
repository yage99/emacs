(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (add-to-list
   'package-archives
   '("elpy" . "http://jorgenschaefer.github.io/packages/"))
  (package-initialize)
  (elpy-enable)
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)
  )

; (add-to-list 'load-path "~/.emacs.d")    ; This may not be appeared if you have already added.
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(load-theme 'molokai t)
(setq molokai-theme-kit t)
(ac-config-default)

(window-numbering-mode)
(global-linum-mode 1)
(add-hook 'shell-mode-hook (lambda () (linum-mode 0)))
(add-hook 'term-mode-hook (lambda () (linum-mode 0)))

(electric-pair-mode t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode t)
 '(display-time-mode t)
 '(package-selected-packages
   (quote
    (## markdown-mode+ markdown-mode elpy window-numbering tramp-theme matlab-mode ggtags auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(global-set-key (kbd "C-x p") 'markdown-preview)
