(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(custom-set-variables
 '(blink-cursor-mode nil)
 '(bongo-enabled-backends '(vlc mplayer mpv ogg123))
 '(c-default-style
   '((c-mode . "cc-mode")
     (c++-mode . "cc-mode")
     (java-mode . "java")
     (awk-mode . "awk")
     (other . "gnu")))
 '(company-clang-insert-arguments nil)
 '(custom-safe-themes
   '("c7a926ad0e1ca4272c90fce2e1ffa7760494083356f6bb6d72481b879afce1f2" default))
 '(delete-selection-mode nil)
 '(global-company-mode t)
 '(lsp-enable-snippet t)
 '(menu-bar-mode nil)
 '(next-screen-context-lines 8)
 '(org-agenda-files '("~/org/agenda.org"))
 '(package-selected-packages
   '(flyspell-popup ivy-mpdel plan9-theme 2048-game mood-line imenus dired-imenu command-log-mode register-quicknav yasnippet-snippets tree-sitter-langs pulsar riscv-mode ron-mode ac-octave zzz-to-char helm-ispell treemacs look-dired ivy-file-preview modus-themes flycheck-clang-analyzer flycheck-package ac-math adoc-mode auctex bison-mode blimp bnf-mode bongo cask clang-format cmake-ide cmake-mode cmake-project company company-jedi company-math counsel counsel-web csharp-mode dired-rsync dired-sidebar docker dockerfile-mode doxy-graph-mode drag-stuff eat edit-indirect elpy emms format-all geiser geiser-guile helm-wikipedia htmlize ivy key-chord key-combo latex-math-preview latex-pretty-symbols latex-preview-pane lsp-mode lsp-sourcekit lsp-ui lua-mode magit magit-popup markdown-preview-eww markdown-preview-mode matlab-mode multishell netherlands-holidays org-bullets org-journal pandoc pandoc-mode pdf-tools pyenv-mode scheme-complete sed-mode shell-toggle ssh tree-sitter use-package verilog-mode vhdl-ext vhdl-ts-mode virtualenv virtualenvwrapper which-key whole-line-or-region wiki-summary yaml-mode))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tab-bar-mode t)
 '(tab-bar-show nil)
 '(tool-bar-mode nil)
 '(virtualenv-root "~")
 '(warning-suppress-log-types '((comp))))

;;---style---;;;
(load-theme 'modus-vivendi-tinted)

;;---keybinds---;;
(global-set-key (kbd "TAB") #'company-indent-or-complete-common)
(define-key key-translation-map (kbd "C-<return>") (kbd "M-x"))
(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))

;; navigation
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "C-;") 'counsel-switch-buffer)
(global-set-key (kbd "M-;") 'imenus-mode-buffers)
(global-set-key (kbd "C-M-;") 'counsel-switch-buffer-other-window)
(global-set-key (kbd "C-c j") 'counsel-bookmark)
(global-set-key (kbd "H-f") 'recentf-open-files)
(global-set-key (kbd "C-'") 'eshell)

(global-set-key (kbd "M-p") 'drag-stuff-up)
(global-set-key (kbd "M-n") 'drag-stuff-down)
(global-set-key (kbd "C-M-n") 'forward-paragraph)
(global-set-key (kbd "C-M-p") 'backward-paragraph)
(global-set-key (kbd "C-,") 'previous-error)
(global-set-key (kbd "C-.") 'next-error)
(global-set-key (kbd "C-H-SPC") 'mark-end-of-sentence)
(global-set-key (kbd "C-M-;") 'dabbrev-expand)
(global-set-key (kbd "H-;") 'counsel-switch-buffer-other-window)
(global-set-key (kbd "H-h") 'backward-kill-word)
(global-set-key (kbd "H-w") 'my-line-save)
(global-set-key (kbd "H-n") 'scroll-other-window)
(global-set-key (kbd "H-p") 'scroll-other-window-down)
(global-set-key (kbd "H-k") 'kill-whole-line)
(global-set-key (kbd "H-d") 'delete-all-space)
(global-set-key (kbd "H-u") 'rectangle-mark-mode)
(global-set-key (kbd "H-i") 'string-rectangle)
(global-set-key (kbd "M-j") 'duplicate-dwim)
(global-set-key (kbd "C-x H-c") 'save-buffers-kill-emacs)

(global-set-key (kbd "M-SPC") (lambda () (interactive) (insert "_")))
(global-set-key (kbd "M-/") (lambda () (interactive) (insert "\\")))
(global-set-key (kbd "C-=") (lambda () (interactive) (insert "!=")))
(global-set-key (kbd "H-SPC") (lambda () (interactive) (insert "->")))

(global-set-key (kbd "C-H-p") 'flycheck-previous-error)
(global-set-key (kbd "C-H-n") 'flycheck-next-error)
(global-set-key (kbd "C-M-<return>") 'kill-this-buffer)

(global-set-key (kbd "C-c b") 'gud-break)
(global-set-key (kbd "C-c c") 'gud-cont)
(global-set-key (kbd "C-c d") 'lsp-find-definition)
(global-set-key (kbd "C-c e") 'lsp-find-references)
(global-set-key (kbd "C-c f") 'magit-find-file-other-window)
(global-set-key (kbd "C-c g") 'magit)
(global-set-key (kbd "C-c h") 'bookmark-set-no-overwrite)
(global-set-key (kbd "C-c i") 'package-install)
(global-set-key (kbd "C-c k") 'kill-matching-buffers)
(global-set-key (kbd "C-c \\") 'yas-new-snippet)
(global-set-key (kbd "C-c m") 'compile)
(global-set-key (kbd "C-c n") 'gud-next)
(global-set-key (kbd "C-c o") 'clang-format-buffer)
(global-set-key (kbd "C-c p") 'dictionary-search)
(global-set-key (kbd "C-c q") 'org-store-link)
(global-set-key (kbd "C-c r") 'lsp-rename)
(global-set-key (kbd "C-c t") 'ispell)
(global-set-key (kbd "C-c v") 'lsp-ui-doc-glance)
(global-set-key (kbd "C-c w") 'counsel-web-search)
(global-set-key (kbd "C-c x") 'replace-regexp)
(global-set-key (kbd "C-c z") 'replace-string)
(global-set-key (kbd "C-c 0") 'align-regexp)

(defun my-line-save ()
  (interactive)
  (let ((l(substring (thing-at-point 'line)0 -1)))
    (kill-new l)
    (message "saved : %s" l)))

;;---verilog mode---;;
(autoload 'verilog-mode "verilog-mode" "Verilog mode" t )
(add-to-list 'auto-mode-alist '("\\.[ds]?va?h?\\'" . verilog-mode))
(put 'dired-find-alternate-file 'disabled nil)

;; lsp-mode
(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init (setq lsp-keymap-prefix "H-l")
  :config
  (setq lsp-headerline-breadcrumb-enable nil)
  (lsp-enable-which-key-integration t))

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode))

(add-hook 'c++-mode-hook 'lsp)
(add-hook 'c-mode-hook 'lsp)

;; tree sitter
(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

;;---company---;;
(use-package company
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  :bind (:map company-active-map
              ("<tab>" . company-complete-selection))
  (:map lsp-mode-map
        ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.05))

(add-hook 'after-init-hook 'global-company-mode)

(custom-set-faces
'(default ((t (:family "Source Code Pro" :foundry "ADBO" :slant normal :weight normal :height 110 :width normal)))))

;;---flychecker---;;
(with-eval-after-load 'flycheck
  (require 'flycheck-clang-analyzer)
  (flycheck-clang-analyzer-setup))

(use-package swiper
  :ensure t
  :bind ("C-s" . swiper-isearch)
  :bind ("C-c s" . swiper-isearch-thing-at-point))

;;---ivy---;;
(ivy-mode)
(setq enable-recursive-minibuffers t)
(setq ivy-use-virtual-buffers nil)

(use-package yasnippet
  :bind ("C-M-i" . yas-expand)
  :config
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
  (yas-global-mode 1))

(use-package org
  :bind (:map org-mode-map
	      ("M-n" . org-metadown)
	      ("M-p" . org-metaup)
              ("C-,"   . nil)
              ("C-'"   . nil)
              ("C-."   . org-cycle-agenda-files))

  :config
  (setq org-format-latex-options
	'(:foreground default :background default :scale 2 :html-foreground
		      "Black" :html-background "Transparent" :html-scale 1.0
		      :matchers ("begin" "$1" "$" "$$" "\\(" "\\[")))

  (setq org-log-done 'time)
  (setq org-agenda-files '("~/org/tasks"))
  (setq org-ellipsis " ▾"))

(add-hook 'org-mode-hook 'flyspell-mode)

(use-package register-quicknav
  :bind (("H-j"   . register-quicknav-prev-register)
         ("H-k"   . register-quicknav-next-register)
         ("H-["   . register-quicknav-point-to-unused-register)
         ("H-]" . register-quicknav-clear-current-register)))

(use-package org-bullets
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(use-package vhdl-mode
  :bind (("<" . (lambda () (interactive) (insert "<=")))
	 (">" . (lambda () (interactive) (insert "=>")))
	 ("/" . (lambda () (interactive) (insert "/="))))
  :config (vhdl-set-style "IEEE"))

;; misc values
(setq make-backup-files nil)
(setq ivy-height 13)
(setq kill-whole-line t)
(setq sentence-end-double-space nil)
(setq ring-bell-function 'ignore)
(setq column-number-mode t)
(setq inhibit-startup-message t)
(display-time-mode 1)
(electric-pair-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)

(latex-preview-pane-enable)
(save-place-mode 1)
(recentf-mode 1)
(counsel-mode)
(which-key-mode)
(pdf-tools-install)
(package-initialize)
(mood-line-mode)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)

(setq gc-cons-threshold 100000000) ;; 100mb
(setq read-process-output-max 1048576) ;; 1mb

(defvar my-native-comp-reserved-cpus 2
  "Number of CPUs to reserve and not use for `native-compile'.")

(defun my-calculate-native-comp-async-jobs ()
  "Set `native-comp-async-jobs-number' based on the available CPUs."
  (max 1 (- (num-processors) my-native-comp-reserved-cpus)))
