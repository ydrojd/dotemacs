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
   '(irony flycheck-irony  clang-format emms magit markdown-preview-eww markdown-preview-mode cmake-project cmake-ide cmake-mode doxy-graph-mode bison-mode company-math latex-preview-pane latex-math-preview auctex adoc-mode csharp-mode company-jedi pyenv-mode virtualenvwrapper virtualenv elpy shell-toggle geiser-guile geiser bnf-mode lua-mode scheme-complete org-journal bibliothek cask pdf-tools nov company-irony-c-headers company-irony company verilog-mode))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(virtualenv-root "~")
 '(warning-suppress-log-types '((comp))))

(setq make-backup-files nil)

(pdf-tools-install)

;;---keybinds---;;
(global-set-key (kbd "M-<up>") 'previous-buffer)
(global-set-key (kbd "M-<down>") 'next-buffer)
(global-set-key (kbd "M-<left>") 'previous-multiframe-window)
(global-set-key (kbd "M-<right>") 'next-multiframe-window)
(global-set-key (kbd "C-'") 'eshell)
(global-set-key (kbd "C-,") 'compile)
(global-set-key (kbd "C-.") 'next-error)
(global-set-key (kbd "C-;") 'dired)

(load-theme 'tango-dark)

(electric-pair-mode 1)

(defun my-c-mode-hook ()
  (c-set-style ' cc-mode)
  (add-hook 'c-mode-hook 'my-c-mode-hook))

;;---verilog mode---;;
(autoload 'verilog-mode "verilog-mode" "Verilog mode" t )
(add-to-list 'auto-mode-alist '("\\.[ds]?va?h?\\'" . verilog-mode))
(put 'dired-find-alternate-file 'disabled nil)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;;---company---;;
(eval-after-load 'company
     '(add-to-list
       'company-backends '(company-irony-c-headers company-irony company-clang company-keywords company-math-symbols-latex)))

(add-hook 'after-init-hook 'global-company-mode)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "ADBO" :slant normal :weight normal :height 140 :width normal))))
 '(company-scrollbar-bg ((t (:background "#45bb4ed351db"))) t)
 '(company-scrollbar-fg ((t (:background "#39f441834408"))) t)
 '(company-tooltip ((t (:inherit default :background "#32e339873bbd"))))
 '(company-tooltip-common ((t (:inherit font-lock-constant-face))))
 '(company-tooltip-selection ((t (:inherit font-lock-function-name-face)))))

;;---irony---;;
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;;---flychecker---;;
(with-eval-after-load 'flycheck
   (require 'flycheck-clang-analyzer)
   (flycheck-clang-analyzer-setup))

(add-hook 'irony-mode-hook 'flycheck-mode)

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

(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)
