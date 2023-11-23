(global-set-key (kbd "TAB") #'company-indent-or-complete-common)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bongo-enabled-backends '(vlc mplayer mpv ogg123))
 '(c-default-style
   '((c-mode . "cc-mode") (c++-mode . "cc-mode") (java-mode . "java")
     (awk-mode . "awk") (other . "gnu")))
 '(delete-selection-mode nil)
 '(elcord-display-buffer-details nil)
 '(menu-bar-mode nil)
 '(next-screen-context-lines 8)
 '(org-agenda-files '("/home/djordy/org/agenda.org"))
 '(package-selected-packages
   '(ac-math adoc-mode auctex bibliothek bison-mode blimp bnf-mode bongo
	     cask clang-format cmake-ide cmake-mode cmake-project
	     company company-jedi company-math counsel counsel-spotify
	     counsel-web csharp-mode dired-rsync dired-sidebar
	     doxy-graph-mode drag-stuff eat edit-indirect elcord elpy
	     emms format-all geiser geiser-guile ivy ivy-youtube
	     key-chord key-combo latex-math-preview
	     latex-pretty-symbols latex-preview-pane lsp-mode
	     lsp-sourcekit lsp-ui lua-mode magit markdown-preview-eww
	     markdown-preview-mode matlab-mode nov org-bullets
	     org-journal org-noter org-noter-pdftools pdf-tools
	     pyenv-mode scheme-complete sed-mode shell-toggle
	     tree-sitter use-package verilog-mode vhdl-ext
	     vhdl-ts-mode virtualenv virtualenvwrapper which-key
	     whole-line-or-region wiki-summary yeetube))
 '(show-paren-mode t)
 '(tab-bar-mode t)
 '(tool-bar-mode nil)
 '(virtualenv-root "~")
 '(warning-suppress-log-types '((comp))))

(setq make-backup-files nil)
(pdf-tools-install)

;;---style---;;;
(load-theme 'modus-vivendi-tinted)

;;---keybinds---;;
(global-set-key (kbd "M-<up>") 'previous-buffer)
(global-set-key (kbd "M-<down>") 'next-buffer)
(global-set-key (kbd "M-<left>") 'previous-multiframe-window)
(global-set-key (kbd "M-<right>") 'next-multiframe-window)
(global-set-key (kbd "C-<left>") 'reluctant-backward)
(global-set-key (kbd "C-<right>") 'reluctant-forward)

(global-set-key (kbd "M-p") 'drag-stuff-up)
(global-set-key (kbd "M-n") 'drag-stuff-down)
(global-set-key (kbd "M-b") 'reluctant-backward)
(global-set-key (kbd "M-f") 'reluctant-forward)
(global-set-key (kbd "C-M-n") 'forward-paragraph)
(global-set-key (kbd "C-M-p") 'backward-paragraph)
(global-set-key (kbd "M-[") 'previous-buffer)
(global-set-key (kbd "M-]") 'next-buffer)

(global-set-key (kbd "C-'") 'eshell)
(global-set-key (kbd "C-,") 'compile)
(global-set-key (kbd "C-.") 'next-error)
(global-set-key (kbd "C-;") 'counsel-switch-buffer)
(global-set-key (kbd "M-;") 'tab-switch)

(define-key key-translation-map (kbd "M-RET") (kbd "C-x o"))
(define-key key-translation-map (kbd "C-z") (kbd "C-="))
(define-key key-translation-map (kbd "C-q") (kbd "C-c \\"))
(define-key key-translation-map (kbd "C-\\") (kbd "C-x t"))

(global-set-key (kbd "C-=") 'point-to-register)
(global-set-key (kbd "C-c \\") 'jump-to-register)
(global-set-key (kbd "M-SPC") (lambda () (interactive) (insert "_")))
(global-set-key (kbd "C-M-<return>") 'kill-this-buffer)

(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c b") 'gud-break)
(global-set-key (kbd "C-c c") 'gud-cont)
(global-set-key (kbd "C-c d") 'lsp-find-definition)
(global-set-key (kbd "C-c e") 'ispell)
(global-set-key (kbd "C-c f") 'magit-find-file-other-window)
(global-set-key (kbd "C-c g") 'magit)
(global-set-key (kbd "C-c i") 'package-install)
(global-set-key (kbd "C-c h") 'bookmark-set-no-overwrite)
(global-set-key (kbd "C-c j") 'counsel-bookmark)
(global-set-key (kbd "C-c k") 'kill-matching-buffers)
;; C-c l for lsp mode
(global-set-key (kbd "C-c m") 'calculator)
(global-set-key (kbd "C-c n") 'gud-next)
(global-set-key (kbd "C-c o") 'clang-format-buffer)
(global-set-key (kbd "C-c p") 'dictionary-search)
(global-set-key (kbd "C-c q") 'org-store-link)
(global-set-key (kbd "C-c r") 'lsp-find-references)
(global-set-key (kbd "C-c s") 'lsp-rename)

(global-set-key (kbd "C-c t") 'eat)

(global-set-key (kbd "C-c u") 'org-capture)
(global-set-key (kbd "C-c v") 'lsp-ui-doc-glance)
(global-set-key (kbd "C-c w") 'counsel-web-search)
(global-set-key (kbd "C-c x") 'replace-regexp)
(global-set-key (kbd "C-c y") 'yeetube-search)
(global-set-key (kbd "C-c z") 'replace-string)


;; misc values
(setq kill-whole-line t)
(setq sentence-end-double-space nil)
(setq ring-bell-function 'ignore)
(setq yeetube-results-limit 100)

(display-time-mode 1)

;; functions
(defun dired-wd ()
  (interactive)
  (dired "./"))

(defun my-c-mode-hook ()
  (c-set-style ' cc-mode)
  (add-hook 'c-mode-hook 'my-c-mode-hook))

(electric-pair-mode 1)

;;---verilog mode---;;
(autoload 'verilog-mode "verilog-mode" "Verilog mode" t )
(add-to-list 'auto-mode-alist '("\\.[ds]?va?h?\\'" . verilog-mode))
(put 'dired-find-alternate-file 'disabled nil)

;; lsp-mode
(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init (setq lsp-keymap-prefix "C-c l")
  :config
  (setq lsp-headerline-breadcrumb-enable nil)
  (lsp-enable-which-key-integration t))

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode))

(add-hook 'c++-mode-hook 'lsp)
(add-hook 'c-mode-hook 'lsp)

(setq gc-cons-threshold 100000000) ;; 100mb
(setq read-process-output-max 1048576) ;; 1mb

;;---nov---;
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

;;---company---;;
(global-set-key (kbd "TAB") #'company-indent-or-complete-common)

(use-package company
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  :bind (:map company-active-map
         ("<tab>" . company-complete-selection))
        (:map lsp-mode-map
         ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.01))

;; (eval-after-load 'company
   ;;  '(add-to-list
     ;;  'company-backends '(company-keywords company-math-symbols-latex)))

(add-hook 'after-init-hook 'global-company-mode)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "ADBO" :slant normal :weight normal :height 120 :width normal))))
 '(company-scrollbar-bg ((t (:background "#45bb4ed351db"))) t)
 '(company-scrollbar-fg ((t (:background "#39f441834408"))) t)
 '(company-tooltip ((t (:inherit default :background "#32e339873bbd"))))
 '(company-tooltip-common ((t (:inherit font-lock-constant-face))))
 '(company-tooltip-scrollbar-thumb ((t (:background "#39f441834408"))))
 '(company-tooltip-scrollbar-track ((t (:background "#45bb4ed351db"))))
 '(company-tooltip-selection ((t (:inherit font-lock-function-name-face)))))

;; which-key

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

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

(use-package org
  :hook (org-mode . 'turn-on-auto-fill)
  :config
  (setq org-log-done 'time)
  (setq org-agenda-files '("~/org"))
  (setq org-ellipsis " ▾"))

(use-package org-bullets
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(use-package org-noter
  :config
  (require 'org-noter-pdftools))

  ;; Your org-noter config ........
(use-package org-noter-pdftools
  :after org-noter
  :config
  ;; Add a function to ensure precise note is inserted
  (defun org-noter-pdftools-insert-precise-note (&optional toggle-no-questions)
    (interactive "P")
    (org-noter--with-valid-session
     (let ((org-noter-insert-note-no-questions (if toggle-no-questions
                                                   (not org-noter-insert-note-no-questions)
                                                 org-noter-insert-note-no-questions))
           (org-pdftools-use-isearch-link t)
           (org-pdftools-use-freepointer-annot t))
       (org-noter-insert-note (org-noter--get-precise-info)))))

  ;; fix https://github.com/weirdNox/org-noter/pull/93/commits/f8349ae7575e599f375de1be6be2d0d5de4e6cbf
  (defun org-noter-set-start-location (&optional arg)
    "When opening a session with this document, go to the current location.
With a prefix ARG, remove start location."
    (interactive "P")
    (org-noter--with-valid-session
     (let ((inhibit-read-only t)
           (ast (org-noter--parse-root))
           (location (org-noter--doc-approx-location (when (called-interactively-p 'any) 'interactive))))
       (with-current-buffer (org-noter--session-notes-buffer session)
         (org-with-wide-buffer
          (goto-char (org-element-property :begin ast))
          (if arg
              (org-entry-delete nil org-noter-property-note-location)
            (org-entry-put nil org-noter-property-note-location
                           (org-noter--pretty-print-location location))))))))
  (with-eval-after-load 'pdf-annot
    (add-hook 'pdf-annot-activate-handler-functions #'org-noter-pdftools-jump-to-note)))

(use-package org-pdftools
  :hook (org-mode . org-pdftools-setup-link))

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

;;vhdl
(defun vhdl-hook ()
  (local-set-key (kbd "<") (lambda () (interactive) (insert "<=")))
  (local-set-key (kbd ">") (lambda () (interactive) (insert "=>")))
  (local-set-key (kbd "/") (lambda () (interactive) (insert "/=")))

  (local-set-key (kbd "C-z p") (lambda () (interactive)
				 (insert "process")
				 (newline) (insert "begin")
				 (newline)
				 (save-excursion (newline) (insert "end process;"))
				 ))

  (local-set-key (kbd "C-z a") (lambda () (interactive)
				 (insert "architecture behavior of ")
				 (save-excursion (insert "is"))
				 ))
  (vhdl-set-style "IEEE"))

(add-hook 'vhdl-mode-hook 'vhdl-hook)

;; latex
(autoload 'latex-math-preview-expression "latex-math-preview" nil t)
(autoload 'latex-math-preview-insert-symbol "latex-math-preview" nil t)
(autoload 'latex-math-preview-save-image-file "latex-math-preview" nil t)
(autoload 'latex-math-preview-beamer-frame "latex-math-preview" nil t)
(latex-preview-pane-enable)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(counsel-mode)
(setq ivy-use-virtual-buffers nil)
(require 'elcord)
(elcord-mode)

(package-initialize)

