(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (manoj-dark)))
 '(inhibit-startup-screen t)
 '(speedbar-show-unknown-files t)
 '(sr-speedbar-default-width 25)
 '(sr-speedbar-max-width 30)
 '(sr-speedbar-right-side nil)
 '(sr-speedbar-skip-other-window-p t)
 '(sr-speedbar-width-x 3)
 '(sr-speedbar-window 1 t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(show-paren-mode 1)


(define-key key-translation-map [dead-grave] "`")
(define-key key-translation-map [dead-acute] "'")
(define-key key-translation-map [dead-circumflex] "^")
(define-key key-translation-map [dead-diaeresis] "\"")
(define-key key-translation-map [dead-tilde] "~")

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))
 
(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)
;; If you want the default keyboard shortcuts, add this line:
;;(setq jedi:setup-keys t)
;; If you want it to complete on the â€œ.â€ (so that, when you type some object or module name and a â€œ.â€ it gives you all the possible attributes/submodules/methods/etc), add this line:
(setq jedi:complete-on-dot t)

(eval-after-load "python"
  '(define-key python-mode-map "\C-cx" 'jedi-direx:pop-to-buffer))
(add-hook 'jedi-mode-hook 'jedi-direx:setup)

(setq jedi:get-in-function-call-delay 100000000)

(defun jedi-config:setup-keys ()
  (local-set-key (kbd "M-.") 'jedi:goto-definition)
  (local-set-key (kbd "M-,") 'jedi:goto-definition-pop-marker)
  (local-set-key (kbd "M-+") 'jedi:show-doc)
  (local-set-key (kbd "M-#") 'jedi:get-in-function-call))

(add-hook 'python-mode-hook 'jedi-config:setup-keys)

(ps-extend-face '(font-lock-keyword-face "black" nil bold) 'MERGE)
(ps-extend-face '(font-lock-function-name-face "black" nil bold) 'MERGE)
(ps-extend-face '(font-lock-keyword-face "black" nil bold) 'MERGE)
(ps-extend-face '(font-lock-comment-face "dim gray" nil italic) 'MERGE)

(add-hook 'python-mode-hook
  (lambda () (setq python-indent-offset 4)))

(define-key global-map (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-j") #'newline)

;;sr-speedbar configuration
(require 'sr-speedbar)

;(add-hook 'speedbar-mode-hook (lambda () (setq truncate-lines nil)))

(global-set-key (kbd "s-s") 'sr-speedbar-toggle)
