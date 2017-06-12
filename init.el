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
(desktop-save-mode t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(custom-safe-themes
   (quote
    ("f1cfc1ed9b8487f10d9abfca654d6cfc7f9a21995ffd33146e22deb60de65acb" "f2ed1ab3c39c831632bfd456c1b0ed39dfdeec2e80e80412de4493e13b3b34d7" "d2162b9bba3fdd019e81a58c8afbeb758e996e42a07584a41726e255d2fc668d" "608a02a799ed7d82a4f2ad6df3b0739b69a7c1db52e90be1f341f60fcd3dc773" default)))
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
(scroll-bar-mode -1)

;; save and restore layout
;; (defvar pre-ediff-window-configuration nil
;;   "window configuration to use")
;; (defvar new-ediff-frame-to-use nil
;;   "new frame for ediff to use")
;; (defun save-my-window-configuration ()
;;   (interactive)
;;   (setq pre-ediff-window-configuration (current-window-configuration))
;;   (select-frame-set-input-focus (setq new-ediff-frame-to-use (new-frame))))
;; (add-hook 'kill-emacs-hook 'save-my-window-configuration)
;; (defun restore-my-window-configuration ()
;;   (interactive)
;;   (when (framep new-ediff-frame-to-use)
;;     (delete-frame new-ediff-frame-to-use)
;;     (setq new-ediff-frame-to-use nil))
;;   (when (window-configuration-p pre-ediff-window-configuration)
;;     (set-window-configuration pre-ediff-window-configuration)))
;; (add-hook 'emacs-startup-hook 'restore-my-window-configuration)
;; show some buffers
(defun show-some-buffers (buffer-list)
  (split-window-horizontally)
  (split-window-horizontally)
  (balance-windows)
  (enlarge-window-horizontally 10)
  (other-window 1)
  (enlarge-window-horizontally 10)
  (other-window 1)
  (shrink-window-horizontally 10)
  (split-window-vertically)
  (ansi-term "/usr/local/bin/htop")
  (split-window-vertically)
  (other-window 1)
  (switch-to-buffer (get-buffer "*Messages*"))
;  (other-window 1)
  (shell "git-cmd")
  (switch-to-buffer (get-buffer "git-cmd"))
  ;; at the end we have one extra window we need to delete
;  (delete-window)
  )

;; show some erc buffers
(defun show-erc-buffers ()
  (interactive)
  (show-some-buffers '("#emacs" "#clojure")))

;; Makes *scratch* empty.
(setq initial-scratch-message "")

;; Removes *scratch* from buffer after the mode has been set.
(defun remove-scratch-buffer ()
  (if (get-buffer "*scratch*")
      (kill-buffer "*scratch*")))
(add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)

;; Removes *Completions* from buffer after you've opened a file.
(add-hook 'minibuffer-exit-hook
      '(lambda ()
         (let ((buffer "*Completions*"))
           (and (get-buffer buffer)
                (kill-buffer buffer)))))

;; Don't show *Buffer list* when opening multiple files at the same time.
(setq inhibit-startup-buffer-menu t)

;; Show only one active window when opening multiple files at the same time.
;(add-hook 'window-setup-hook 'delete-other-windows)
(add-hook 'window-setup-hook 'show-erc-buffers)
