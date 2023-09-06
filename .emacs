(global-set-key (kbd "TAB") #'company-indent-or-complete-common)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-default-style
   '((c-mode . "cc-mode")
     (c++-mode . "cc-mode")
     (java-mode . "java")
     (awk-mode . "awk")
     (other . "gnu")))
 '(company-idle-delay 0.1)
 '(delete-selection-mode nil)
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(cmake-project cmake-ide git cmake-mode doxy-graph-mode bison-mode company-math latex-preview-pane latex-math-preview auctex adoc-mode csharp-mode company-jedi pyenv-mode virtualenvwrapper virtualenv elpy shell-toggle geiser-guile geiser bnf-mode lua-mode scheme-complete org-journal bibliothek cask pdf-tools nov company-irony-c-headers company-irony company verilog-mode))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(virtualenv-root "~")
 '(warning-suppress-log-types '((comp))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "ADBO" :slant normal :weight normal :height 140 :width normal))))
 '(company-scrollbar-bg ((t (:background "#45bb4ed351db"))))
 '(company-scrollbar-fg ((t (:background "#39f441834408"))))
 '(company-tooltip ((t (:inherit default :background "#32e339873bbd"))))
 '(company-tooltip-common ((t (:inherit font-lock-constant-face))))
 '(company-tooltip-selection ((t (:inherit font-lock-function-name-face)))))

(add-hook 'after-init-hook 'global-company-mode)
(setq make-backup-files nil)

(pdf-tools-install)
;(require 'bibliothek)
;(setq bibliothek-path (list "~/ebook"))

(global-set-key (kbd "M-<up>") 'previous-buffer)
(global-set-key (kbd "M-<down>") 'next-buffer)

;;(global-set-key (kbd "M-<up>") 'drag-stuff-up)
;;(global-set-key (kbd "M-<down>") 'drag-stuff-down)

(global-set-key (kbd "M-<left>") 'previous-multiframe-window)
(global-set-key (kbd "M-<right>") 'next-multiframe-window)

;; (global-set-key (kbd "C-{") 'previous-multiframe-window)
;; (global-set-key (kbd "C-}") 'next-multiframe-window)

(global-set-key (kbd "C-'") 'eshell)

(global-set-key (kbd "C-,") 'compile)
(global-set-key (kbd "C-.") 'next-error)

(load-theme 'tango-dark)

(electric-pair-mode 1)

(defun my-c-mode-hook ()
  (c-set-style ' cc-mode)
  (add-hook 'c-mode-hook 'my-c-mode-hook))

;;verilog mode
(autoload 'verilog-mode "verilog-mode" "Verilog mode" t )
(add-to-list 'auto-mode-alist '("\\.[ds]?va?h?\\'" . verilog-mode))
(put 'dired-find-alternate-file 'disabled nil)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;;company
(eval-after-load 'company
     '(add-to-list
       'company-backends '(company-irony-c-headers company-irony company-clang company-keywords company-math-symbols-latex)))

(require 'color)

(setq org-agenda-files '("~/org"))

(let ((bg (face-attribute 'default :background)))
  (custom-set-faces
   `(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 2)))))
   `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
   `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5)))))
   `(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
   `(company-tooltip-common ((t (:inherit font-lock-constant-face))))))

    (global-set-key (kbd "TAB") #'company-indent-or-complete-common)
(put 'scroll-left 'disabled nil)

;(setq jedi:setup-keys t)
;(setq jedi:complete-on-dot t)
;(add-hook 'python-mode-hook 'jedi:setup)

(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)
