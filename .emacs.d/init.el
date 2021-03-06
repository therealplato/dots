;;; -*- coding:utf-8 -*-

(setq global-startup (current-time)
      time-measured-blocks 0.0)

(defmacro time (msg &rest body)
 `(let ((start-time (current-time)) elapsed)
    ,@body
    (setq elapsed (time-subtract (current-time) start-time))
    (setq time-measured-blocks (+ time-measured-blocks (float-time elapsed)))
    (message "%sms to %s" (format-time-string "%3N" elapsed) ,msg)))
(put 'time 'lisp-indent-function 1)

(setq
 init-gc-cons-threshold gc-cons-threshold
 init-file-name-handler-alist file-name-handler-alist
 gc-cons-threshold 100000000
 file-name-handler-alist nil)

(defalias 'after 'with-eval-after-load)
(defalias 'file-name 'expand-file-name)
(defalias 'yes-or-no-p 'y-or-n-p)

(setq mac-p (eq system-type 'darwin))
(setq linux-p (eq system-type 'gnu/linux))
(when mac-p (setq system-name (car (split-string system-name "\\."))))

(setenv "EDITOR" "emacs")
(setenv "PAGER" "cat")

(defun add-to-load-path (d)
  (dolist (f (directory-files d nil "[^\\.]$"))
    (add-to-list 'load-path (file-name f d))))

(setq custom-site-lisp (file-name "~/.emacs.d/site-lisp"))
(add-to-list 'load-path custom-site-lisp)
(add-to-load-path custom-site-lisp)
(add-to-load-path (file-name "elpa" custom-site-lisp))

(mapcar (lambda (file)
	        (when (file-directory-p file) (add-to-list 'custom-theme-load-path file)))
	      (directory-files (file-name (file-name "themes" custom-site-lisp)) t))

(time "require basic features"
  (require 'package)
  (require 'cl)
  (require 'uniquify)
  (require 'subword))

(time "initialize packages"
  (setq package-user-dir (file-name (file-name "elpa" custom-site-lisp)))
  (setq package-archives '(("melpa" . "http://melpa.org/packages/") ("gnu" . "http://elpa.gnu.org/packages/")))
  (package-initialize 'no-activate))

(defun install (package &optional req)
  (unless (or (package-installed-p package)
              (require package nil 'no-error))
    (package-refresh-contents)
    (package-install package))
  (load (format "%s-autoloads.el" package) 'no-error 'no-message)
  (when req (require package)))

(when (memq window-system '(mac ns))
  (install 'exec-path-from-shell)
  (let ((exec-path-from-shell-variables '("PATH" "MANPATH" "GPG_AGENT_INFO" "SSH_AUTH_SOCK" "LANG")))
    (exec-path-from-shell-initialize)))

(time "setq and setq-default basics"
  (setq
   auto-save-default nil
   make-backup-files nil
   echo-keystrokes 0.01
   scroll-step 1
   scroll-conservatively 10000
   enable-local-variables :all
   epg-gpg-program "gpg2"
   uniquify-buffer-name-style 'post-forward-angle-brackets
   uniquify-after-kill-buffer-p t
   uniquify-ignore-buffers-re "^\\*"
   dired-dwim-target t
   dired-listing-switches "-laGh")

  (setq-default
   fill-column 80
   custom-file (file-name "~/.emacs.d/custom.el")
   require-final-newline t))

(time "start basic minor modes"
  (column-number-mode 1)
  (electric-indent-mode 1)
  (electric-pair-mode 1))

(defun load-custom (n)
  (time (format "load %s" n)
    (load n nil 'no-message)))

(load-custom "~/.emacs.d/ivy.el")
(load-custom "~/.emacs.d/fingers.el")
(load-custom "~/.emacs.d/appearance.el")
(load-custom "~/.emacs.d/yasnippet.el")
(load-custom "~/.emacs.d/org.el")
(load-custom "~/.emacs.d/vc.el")
(load-custom "~/.emacs.d/search.el")
(load-custom "~/.emacs.d/auto-complete.el")
(load-custom "~/.emacs.d/emacs-lisp.el")
(load-custom "~/.emacs.d/scala.el")
(load-custom "~/.emacs.d/go.el")
(load-custom "~/.emacs.d/compilation.el")
(load-custom "~/.emacs.d/javascript.el")
(load-custom "~/.emacs.d/scratch.el")
(load-custom "~/.emacs.d/flycheck.el")

(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)
(setq auto-revert-interval 0.1)
(auto-revert-set-timer)

(setq
 gc-cons-threshold init-gc-cons-threshold
 file-name-handler-alist init-file-name-handler-alist)

(message "%sms to start up. (%.00fms measured)" (format-time-string "%3N" (time-subtract (current-time) global-startup)) (* time-measured-blocks 1000.0))
