(add-to-list 'load-path "/usr/share/emacs24/site-lisp")

(require 'package)
;; Any add to list for package-archives (to add marmalade or melpa) goes here
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; set theme and encoding
;;(color-theme-initialize)
;;(color-theme-charcoal-black)
(setq slime-net-coding-system 'utf-8-unix)
(setq language-environment "utf-8")

;; better file completion
(require 'ido)
(ido-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Python mode customizations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(setq interpreter-mode-alist
      (cons '("python" . python-mode)
	    interpreter-mode-alist)
      python-mode-hook
      '(lambda () (progn
		    (set-variable 'py-indent-offset 4)
		    (set-variable 'py-smart-indentation nil)
		    (set-variable 'indent-tabs-mode nil) 
		    ;;(highlight-beyond-fill-column)
                    ;;(define-key python-mode-map "C-m" 'newline-and-indent)
		    ;;(pabbrev-mode)
		    (abbrev-mode)
	 )
      )
)


;; pymacs
;;(autoload 'pymacs-apply "pymacs")
;;(autoload 'pymacs-call "pymacs")
;;(autoload 'pymacs-eval "pymacs" nil t)
;;(autoload 'pymacs-exec "pymacs" nil t)
;;(autoload 'pymacs-load "pymacs" nil t)
;;(eval-after-load "pymacs"
;;  '(add-to-list 'pymacs-load-path YOUR-PYMACS-DIRECTORY"))
;;(pymacs-load "ropemacs" "rope-")
;;(setq ropemacs-enable-autoimport t)

;; (brm-init)
;(require 'pycomplete)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Put the following in your .emacs so that the
;; abbrev table is set correctly in all modes.
;; (Not just for java)
;;
;; (add-hook 'pre-abbrev-expand-hook 'abbrev-table-change)
;; (defun abbrev-table-change (&optional args)
;;   (setq local-abbrev-table
;; 	(if (eq major-mode 'jde-mode)
;; 	    (if (jde-parse-comment-or-quoted-p)
;; 		text-mode-abbrev-table
;; 	      java-mode-abbrev-table)
;; 	  (if (eq major-mode 'python-mode)
;; 	      (if (inside-comment-p)
;; 		  text-mode-abbrev-table
;; 		python-mode-abbrev-table
;; 		))))
;;   )
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Snippets
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(snippet-with-abbrev-table 'python-mode-abbrev-table
;			   ("hdr" .  "#!/usr/bin/env python\n# -*- coding: utf-8 -*-\n\"\"\"\n\"\"\"\n\n__author__ = \"Ryan McGuire <ryan@enigmacurry.com>\"")
;			   ("main" .  "if __name__ == \"__main__\":\n$>")
;			   ("cls" . "class $${class_name}($${object}):\n$>\"\"\"\n$>$${class documentation}\n$>\"\"\"\n$>$.")
;			   )

(defun sceneweb ()
  (interactive)
  (setq inferior-lisp-program "/home/sasha/nob/gera/install/sbcl-6c4e3aa72428bed3626abedad8c7d6d5e80e6a36/bin/sbcl")
  (setenv "SBCL_HOME" "/home/sasha/nob/gera/install/sbcl-6c4e3aa72428bed3626abedad8c7d6d5e80e6a36/lib/sbcl")
  (require 'slime)
  (require 'slime-autoloads)
  (slime-setup)
  (slime-start :program inferior-lisp-program))
(put 'upcase-region 'disabled nil)


;; slime
;;(add-to-list 'load-path "/home/sasha/.emacs.d/site-lisp/slime")
;;(require 'slime)
;;(require 'slime-autoloads)
;;(setq inferior-lisp-program "/usr/bin/sbcl")
;;(setq slime-contribs '(slime-fancy))
;;(slime-setup)
(load (expand-file-name "~/quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "/usr/bin/sbcl")



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; haskell
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "/usr/share/emacs/site-lisp/haskell-mode")
(add-to-list 'load-path "/home/sasha/.cabal/share/ghc-mod-3.1.1")
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init) (flymake-mode)))

;;(define-key haskell-mode-map (kbd "C-x C-s") 'haskell-mode-save-buffer)
;;(define-key haskell-mode-map (kbd "<C-TAB>") 'ghc-complete)
;;(set-variable 'ghc-completion-key (kbd "C-TAB"))

;; php + debugging
;;(require 'php+-mode)
;;(php+-mode-setup)
;;(setq flymake-phpcs-command "/home/sasha/.emacs.d/elpa/flymake-phpcs-1.0.5/bin/flymake_phpcs")
;;(setq flymake-phpcs-standard "/usr/share/php/PHP/CodeSniffer/Standards/PSR2")
;;(setq flymake-phpcs-show-rule t)
;;(require 'flymake-phpcs)

;;setq load-path (cons "/usr/share/emacs/23.3/site-lisp/geben" load-path))
(require 'geben)
(autoload 'geben "geben" "DBGp protocol frontend, a script debugger" t)


(add-to-list 'exec-path "~/.cabal/bin")

;; ruby debugger
;;(add-to-list 'exec-path "/var/lib/gems/1.9.1/gems/debugger-1.6.2/bin")
;;(add-to-list 'load-path "/var/lib/gems/1.9.1/gems/debugger-1.6.2/emacs")
;;(autoload 'rdebug "rdebug" "ruby-debug interface" t)
;;(require 'rvm)
;;(require 'inf-ruby)
;;(require 'rinari)


;; yaml
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(setq-default indent-tabs-mode nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 '(php-project-list (quote (("tempolex" "/home/tempolex/src/Tempolex/ClientBundle/" "/home/tempolex/src/Tempolex/ClientBundle/TAGS" ("/home/tempolex/src/Tempolex/ClientBundle/Security/" "/home/tempolex/src/Tempolex/ClientBundle/DependencyInjection/" "/home/tempolex/src/Tempolex/ClientBundle/Filter/" "/home/tempolex/src/Tempolex/ClientBundle/Form/" "/home/tempolex/src/Tempolex/ClientBundle/Controller/" "/home/tempolex/src/Tempolex/ClientBundle/Entity/") "" nil (("" . "") "" "" "" "" "" "" "" "") "Tempolex\\ClientBundle" "")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Inconsolata" :foundry "unknown" :slant normal :weight normal :height 120 :width normal)))))

;;(require 'auto-complete)

;;(require 'ac-slime)
 ;;   (add-hook 'slime-mode-hook 'set-up-slime-ac)
  ;;  (add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
   ;; (eval-after-load "auto-complete"
    ;;  '(add-to-list 'ac-modes 'slime-repl-mode))




;; php-stuff
(yas-global-mode)
(require 'php-auto-yasnippets)
(setq php-auto-yasnippet-php-program "~/.emacs.d/elpa/php-auto-yasnippets-20140515.2052/Create-PHP-YASnippet.php")
(define-key php-mode-map (kbd "C-c C-y") 'yas/create-php-snippet)


;; autocomplete
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))


;; octave
(setq inferior-octave-prompt ">> ")
