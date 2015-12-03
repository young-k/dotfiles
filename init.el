(package-initialize nil)					     
(add-to-list 'load-path "~/.emacs.d/packages/org-mode/contrib/lisp") 
(add-to-list 'load-path "~/.emacs.d/packages/org-mode/lisp")	     
(add-to-list 'load-path "~/.emacs.d/packages/lisp")		     
(require 'package)						     
								     
(add-to-list 'package-archives					     
	     '("melpa" . "http://melpa.org/packages/") t)	     

(package-initialize t)
(setq package-enable-at-startup nil)

(setq user-full-name "Young Kim"
      user-mail-address "kim.thunderbird@gmail.com")

;; Multi-line commenting
(setq comment-style 'multi-line)

;; Asks "y-or-n" instead of asking "yes-or-no"
(fset 'yes-or-no-p 'y-or-n-p)

;; Set font
(when (member "DejaVu Sans Mono" (font-family-list))
  (set-face-attribute 'default nil :font "DejaVu Sans Mono"))

;; Taken from Zamansky's Emacs Config
(defun sacha/package-install (package &optional repository)
  "Install PACKAGE if it has not yet been installed.
If REPOSITORY is specified, use that."
  (unless (package-installed-p package)
    (let ((package-archives (if repository
                                (list (assoc repository package-archives))
                              package-archives)))
      (package-install package))))

;; Installing use-package
(sacha/package-install 'use-package)
(require 'use-package)

;; Installing company
(sacha/package-install 'company)
(use-package company
  :init
  (company-mode t))

;; Installing company-jedi
(sacha/package-install 'company-jedi)
(use-package company-jedi
  :init
  (company-jedi t))

;; Installing powerline
(use-package      smart-mode-line-powerline-theme
    :ensure smart-mode-line-powerline-theme)
  (use-package smart-mode-line
    :ensure smart-mode-line
    :init 
    (progn
    (setq sml/no-confirm-load-theme t)
    (sml/setup)
    (sml/apply-theme 'powerline))
    )

(use-package smart-mode-line
  :ensure smart-mode-line
  :init 
  (progn
    (setq sml/no-confirm-load-theme t)
    (sml/setup)
    (sml/apply-theme 'powerline)
    ))



;; Installing markdown-mode
(sacha/package-install 'markdown-mode)
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; Installing auto-complete
(sacha/package-install 'auto-complete)
(use-package auto-complete
:init
(progn
(require 'auto-complete-config)
(ac-config-default)
(setq ac-sources '(
                   ac-source-symbols
                   ac-source-words-in-same-mode-buffers
                   ac-source-functions
                   ac-source-variables
                   ac-source-dictionary
                   ac-source-filename
                   ac-source-yasnippet
                   ))
(setq ac-auto-show-menu 0)
(auto-complete-mode t)
))

;; Installing helm and helm-swoop
(sacha/package-install 'helm)
(sacha/package-install 'helm-swoop)
(require 'helm-swoop)
      (use-package helm
        :init
        (progn 
          (require 'helm-config) 
          (require 'helm-eshell)
          (require 'helm-files)
          (require 'helm-grep)
  (setq helm-candidate-number-limit 10)
          (setq helm-idle-delay 0.0 ; update fast sources immediately (doesn't).
                helm-input-idle-delay 0.01  ; this actually updates things
                                              ; reeeelatively quickly.
                helm-quick-update t
                helm-M-x-requires-pattern nil
                helm-ff-skip-boring-files t)
  (helm-mode))
  :config
      (add-to-list 'helm-completing-read-handlers-alist '(switch-to-buffer . ido)))

(use-package helm-swoop
 :bind (("C-S-s" . helm-swoop)))

(defun helm-backspace ()
  "Forward to `backward-delete-char'.
On error (read-only), quit without selecting."
  (interactive)
  (condition-case nil
      (backward-delete-char 1)
    (error
     (helm-keyboard-quit))))

(define-key helm-map (kbd "DEL") 'helm-backspace)
(global-set-key (kbd "M-x") 'helm-M-x)


;; Installing flycheck
(sacha/package-install 'flycheck)
(sacha/package-install 'flycheck-pyflakes)
(use-package flycheck
:init
(global-flycheck-mode t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(frame-background-mode (quote light))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (yasnippet use-package rich-minority markdown-mode helm-swoop flycheck-pyflakes company auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
