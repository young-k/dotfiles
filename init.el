(package-initialize nil)
(add-to-list 'load-path "~/.emacs.d/packages/org-mode/contrib/lisp")
(add-to-list 'load-path "~/.emacs.d/packages/org-mode/lisp")
(add-to-list 'load-path "~/.emacs.d/packages/lisp")
(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("gnu" . "http://elpa.gnu.org/packages/") t)

(package-initialize t)
(setq package-enable-at-startup nil)

(setq user-full-name "Young Kim"
      user-mail-address "kim.thunderbird@gmail.com")

;; Asks "y-or-n" instead of asking "yes-or-no"
(fset 'yes-or-no-p 'y-or-n-p)

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


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (auto-complete company use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
