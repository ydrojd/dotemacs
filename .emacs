(global-set-key (kbd "TAB") #'company-indent-or-complete-common)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-default-style
   '((c-mode . "cc-mode") (c++-mode . "cc-mode") (java-mode . "java")
     (awk-mode . "awk") (other . "gnu")))
 '(company-idle-delay 0.1)
 '(delete-selection-mode nil)
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(ac-math adoc-mode auctex bibliothek bison-mode bnf-mode cask
	     clang-format cmake-ide cmake-mode cmake-project company
	     company-irony company-irony-c-headers company-jedi
	     company-math counsel csharp-mode dired-sidebar
	     doxy-graph-mode edit-indirect elpy emms flycheck-irony
	     geiser geiser-guile irony ivy latex-math-preview
	     latex-pretty-symbols latex-preview-pane lua-mode magit
	     markdown-preview-eww markdown-preview-mode matlab-mode
	     nov org-journal pdf-tools pyenv-mode scheme-complete
	     shell-toggle verilog-mode virtualenv virtualenvwrapper))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(virtualenv-root "~")
 '(warning-suppress-log-types '((comp))))

(setq make-backup-files nil)

(pdf-tools-install)

;;BEEEEEP
(setq ring-bell-function 'ignore)

;;---style---;;;
(load-theme 'tango-dark)

;;---keybinds---;;
(global-set-key (kbd "M-<up>") 'previous-buffer)
(global-set-key (kbd "M-<down>") 'next-buffer)
(global-set-key (kbd "M-<left>") 'previous-multiframe-window)
(global-set-key (kbd "M-<right>") 'next-multiframe-window)
(global-set-key (kbd "C-'") 'eshell)
(global-set-key (kbd "C-,") 'compile)
(global-set-key (kbd "C-.") 'next-error)
(global-set-key (kbd "C-;") 'counsel-switch-buffer)

(global-set-key (kbd "C-<left>") 'reluctant-backward)
(global-set-key (kbd "C-<right>") 'reluctant-forward)
(global-set-key (kbd "M-b") 'reluctant-backward)
(global-set-key (kbd "M-f") 'reluctant-forward)

(global-set-key (kbd "C-M-n") 'forward-paragraph)
(global-set-key (kbd "C-M-p") 'backward-paragraph)

(global-set-key (kbd "M-;") #'dired-wd)

(defun dired-wd ()
  (interactive)
  (dired "./"))

(defun my-c-mode-hook ()
  (c-set-style ' cc-mode)
  (add-hook 'c-mode-hook 'my-c-mode-hook))

(global-set-key (kbd "TAB") #'company-indent-or-complete-common)
(electric-pair-mode 1)

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
 '(company-tooltip-scrollbar-thumb ((t (:background "#39f441834408"))))
 '(company-tooltip-scrollbar-track ((t (:background "#45bb4ed351db"))))
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

;;---ivory---;;
(ivy-mode)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

(require 'color)

(setq org-agenda-files '("~/org"))

(let ((bg (face-attribute 'default :background)))
  (custom-set-faces
   `(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 2)))))
   `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
   `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5)))))
   `(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
   `(company-tooltip-common ((t (:inherit font-lock-constant-face))))))

(put 'scroll-left 'disabled nil)

(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)

;; https://emacs.stackexchange.com/questions/63012/how-to-change-emacs-word-movement-behaviour
(defun reluctant-forward (&optional arg)
  (interactive "^p")
  (if (> arg 0)
      (dotimes (_ arg)
        (when (looking-at-p "[ \t\n]")
          (skip-chars-forward " \t\n"))
        (unless (= (point) (point-max))
          (if (looking-at-p "\\sw")
              (skip-syntax-forward "w")
            (if (re-search-forward "\n\\|\\s-\\|\\sw" nil t)
                (backward-char)
              (goto-char (point-max))))))
    (dotimes (_ (- arg))
      (when (looking-back "[ \t\n]")
        (skip-chars-backward " \t\n"))
      (unless (= (point) (point-min))
        (if (looking-back "\\sw")
            (skip-syntax-backward "w")
          (if (re-search-backward "\n\\|\\s-\\|\\sw" nil t)
              (forward-char)
            (goto-char (point-min))))))))

(defun reluctant-backward (&optional arg)
  (interactive "^p")
  (reluctant-forward (- arg)))

;; org-mode
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

;; latex

(autoload 'latex-math-preview-expression "latex-math-preview" nil t)
(autoload 'latex-math-preview-insert-symbol "latex-math-preview" nil t)
(autoload 'latex-math-preview-save-image-file "latex-math-preview" nil t)
(autoload 'latex-math-preview-beamer-frame "latex-math-preview" nil t)
(latex-preview-pane-enable)
