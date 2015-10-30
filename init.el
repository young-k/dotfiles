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

;; Add line numbers to emacs
(global-linum-mode t)

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

;; Installing cyberpunk theme
(sacha/package-install 'cyberpunk-theme)
(load-theme 'cyberpunk t)

;; Installing markdown-mode
(sacha/package-install 'markdown-mode)
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
  
;; Installing yasnippets
(sacha/package-install 'yasnippet)
(use-package yasnippet
  :init
  (yas-global-mode t))

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
 '(ansi-color-names-vector ["#000000" "#8b0000" "#00ff00" "#ffa500" "#7b68ee" "#dc8cc3" "#93e0e3" "#dcdccc"])
 '(custom-enabled-themes (quote (cyberpunk)))
 '(custom-safe-themes (quote ("8fed5e4b89cf69107d524c4b91b4a4c35bcf1b3563d5f306608f0c48f580fdf8" default)))
 '(fci-rule-color "#383838")
 '(inhibit-startup-screen t)
 '(package-selected-packages (quote (auto-complete company use-package)))
 '(sml/mode-width (if (eq powerline-default-separator (quote arrow)) (quote right) (quote full)))
 '(sml/pos-id-separator (quote ("" (:propertize " " face powerline-active1) (:eval (propertize " " (quote display) (funcall (intern (format "powerline-%s-%s" powerline-default-separator (car powerline-default-separator-dir))) (quote powerline-active1) (quote powerline-active2)))) (:propertize " " face powerline-active2))))
 '(sml/pos-minor-modes-separator (quote ("" (:propertize " " face powerline-active1) (:eval (propertize " " (quote display) (funcall (intern (format "powerline-%s-%s" powerline-default-separator (cdr powerline-default-separator-dir))) (quote powerline-active1) nil))) (:propertize " " face sml/global))))
 '(sml/pre-id-separator (quote ("" (:propertize " " face sml/global) (:eval (propertize " " (quote display) (funcall (intern (format "powerline-%s-%s" powerline-default-separator (car powerline-default-separator-dir))) nil (quote powerline-active1)))) (:propertize " " face powerline-active1))))
 '(sml/pre-minor-modes-separator (quote ("" (:propertize " " face powerline-active2) (:eval (propertize " " (quote display) (funcall (intern (format "powerline-%s-%s" powerline-default-separator (cdr powerline-default-separator-dir))) (quote powerline-active2) (quote powerline-active1)))) (:propertize " " face powerline-active1))))
 '(sml/pre-modes-separator (propertize " " (quote face) (quote sml/modes))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
