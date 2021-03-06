;;; iv-theme.el --- Color theme using 4 basic colors

;; Copyright (c) 2015-2016 Felix Geller

;; Author: Felix Geller <fgeller@gmail.com>
;; Keywords: color theme basic minimal
;; URL: http://github.com/fgeller/iv-theme.el
;; Package-Requires: ((emacs "24"))

;; This file is not part of GNU Emacs.

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:

;; The theme assumes no font-lock, i.e. (global-font-lock-mode 0), so there is
;; very little customization for syntax aware faces. The used colors are basic
;; colors that are part of Emacs' default list and should be easy to replicate
;; in a terminal emulator.

;; More information: http://github.com/fgeller/iv-theme.el

;; Theme setup is based on flatui-theme.el available at:
;; https://github.com/john2x/flatui-theme.el

;; Material design colors:

;; Red

;; 50  #FFEBEE
;; 100 #FFCDD2
;; 200 #EF9A9A
;; 300 #E57373
;; 400 #EF5350
;; 500 #F44336
;; 600 #E53935
;; 700 #D32F2F
;; 800 #C62828
;; 900 #B71C1C

;; Green

;; 50  #E8F5E9
;; 100 #C8E6C9
;; 200 #A5D6A7
;; 300 #81C784
;; 400 #66BB6A
;; 500 #4CAF50
;; 600 #43A047
;; 700 #388E3C
;; 800 #2E7D32
;; 900 #1B5E20

(deftheme iv "Minimalistic theme based on 4 colors.")

(defconst iv-colors-alist
  `(("black"  . "black")
    ("white"  . "white")
    ("yellow" . ,(if (window-system) "#FFC107" "yellow"))
    ("red"    . ,(if (window-system) "#F44336" "red"))
    ("green"  . ,(if (window-system) "#66BB6A" "green"))
    ("blue"   . ,(if (window-system) "#66BB6A" "blue")))
  "List of colors.")

(defmacro iv-with-color-variables (&rest body)
  (declare (indent 0))
  `(let (,@(mapcar (lambda (cons) (list (intern (car cons)) (cdr cons)))
                   iv-colors-alist))
     ,@body))

;; `(default ((t (:foreground ,black :background ,white :family "Roboto Mono" :height 115))))

;;; Theme Faces
(iv-with-color-variables
  (custom-theme-set-faces
   'iv
   `(default ((t (:foreground ,black :background ,white :height 80 :family "Roboto Mono"))))
   `(shadow ((t (:foreground ,black :background ,white))))
   `(button ((t (:foreground ,red :underline nil :weight normal))))
   `(comint-highlight-input ((t (:foreground nil :background nil))))
   `(comint-highlight-prompt ((t (:foreground nil :background nil))))
   `(compilation-column-number ((t (:foreground nil :background nil))))
   `(compilation-error ((t (:foreground nil :background nil))))
   `(compilation-info ((t (:foreground nil :background nil))))
   `(compilation-line-number ((t (:foreground nil :background nil))))
   `(compilation-mode-line-exit ((t (:inherit mode-line))))
   `(compilation-mode-line-fail ((t (:inherit mode-line))))
   `(compilation-mode-line-run ((t (:inherit mode-line))))
   `(compilation-warning ((t (:foreground nil :background nil))))
   `(cursor ((t (:foreground nil :background ,green))))
   `(fringe ((t (:foreground ,black :background ,white))))
   `(header-line ((t (:inherit mode-line))))
   `(hi-yellow ((t (:foreground nil :background ,yellow))))
   `(isearch ((t (:foreground ,red :background nil))))
   `(isearch-fail ((t (:foreground ,black :background ,red))))
   `(italic ((t (:foreground nil :background nil :underline nil))))
   `(lazy-highlight ((t (:foreground ,red :background nil))))
   `(link ((t (:foreground nil :background nil :underline nil))))
   `(link-visited ((t (:foreground nil :background nil :underline nil))))
   `(linum  ((t (:foreground ,black :background ,white))))
   `(match ((t (:foreground nil :background ,red))))
   `(minibuffer-prompt ((t (:foreground ,nil :background nil))))
   `(mode-line ((t (:foreground ,white :background ,green :box nil))))
   `(mode-line-buffer-id ((t (:weight normal))))
   `(mode-line-inactive ((t (:inherit mode-line :box nil))))
   `(region ((t (:foreground nil :background ,green))))
   `(secondary-selection ((t (:foreground nil :background ,green))))
   `(trailing-whitespace ((t (:foreground nil :background ,red))))
   `(underline ((t (:foreground nil :background nil :underline nil))))
   `(variable-pitch ((t (:foreground nil :background nil :underline nil :family "Roboto"))))
   `(widget-field ((t (:foreground nil :background ,green :underline nil))))

   `(ace-jump-face-background ((t (:foreground ,white :background nil))))
   `(ace-jump-face-foreground ((t (:foreground ,red :background nil))))

   `(anzu-mode-line ((t (:inherit mode-line))))
   `(anzu-replace-highlight ((t (:foreground ,white :background ,green))))
   `(anzu-replace-to ((t (:foreground ,red :background ,white))))

   `(avy-lead-face-0 ((t (:foreground ,red :background nil))))
   `(avy-lead-face-1 ((t (:foreground ,red :background nil))))
   `(avy-lead-face-2 ((t (:foreground ,red :background nil))))
   `(avy-lead-face ((t (:foreground ,red :background nil))))
   `(avy-background-face ((t (:foreground ,white))))

   `(company-scrollbar-bg                 ((t (:foreground nil   :background ,white))))
   `(company-scrollbar-fg                 ((t (:foreground ,black   :background ,black))))
   `(company-tooltip                      ((t (:foreground ,black   :background ,white))))
   `(company-tooltip-common               ((t (:foreground ,red   :background nil))))
   `(company-tooltip-selection            ((t (:foreground nil   :background ,green))))

   `(custom-face-tag ((t (:foreground nil :background nil))))
   `(custom-visibility ((t (:foreground ,green :background nil))))
   `(custom-link ((t (:foreground ,green :background nil))))

   `(diff-added ((t (:foreground ,green :background nil))))
   `(diff-removed ((t (:foreground ,red :background nil))))
   `(diff-context ((t (:foreground ,black :background nil))))
   `(diff-refine-added ((t :inherit diff-added :foreground nil :weight bold)))
   `(diff-refine-change ((t :inherit diff-changed :foreground nil :weight bold)))
   `(diff-refine-removed ((t :inherit diff-removed :foreground nil :weight bold)))
   `(diff-header ((t (:foreground ,black :background nil))))
   `(diff-file-header ((t (:foreground ,black :background nil))))
   `(diff-hunk-header ((t (:foreground ,black :background nil))))

   `(eldoc-highlight-function-argument ((t (:weight normal :foreground ,red :background nil))))

   `(ensime-breakpoint-face ((t (:weight normal :foreground ,red :background nil))))
   `(ensime-compile-errline ((t (:weight normal :foreground ,red :background nil))))
   `(ensime-compile-warnline ((t (:weight normal :foreground ,yellow :background nil))))
   `(ensime-errline-highlight ((t (:weight normal :foreground ,red :background nil))))
   `(ensime-warnline-highlight ((t (:weight normal :foreground ,yellow :background nil))))
   `(ensime-implicit-highlight ((t (:weight normal :foreground ,blue :background nil))))
   `(ensime-writable-value-face ((t (:weight normal :foreground ,green :background nil))))

   `(erc-action-face ((t (:foreground ,black :background nil))))
   `(erc-bold-face ((t (:foreground ,black :background nil))))
   `(erc-button ((t (:foreground ,black :background nil))))
   `(erc-command-indicator-face ((t (:foreground ,black :background nil))))
   `(erc-current-nick-face ((t (:foreground ,black :background nil))))
   `(erc-dangerous-host-face ((t (:foreground ,black :background nil))))
   `(erc-default-face ((t (:foreground ,black :background nil))))
   `(erc-direct-msg-face ((t (:foreground ,black :background nil))))
   `(erc-error-face ((t (:foreground ,black :background nil))))
   `(erc-fool-face ((t (:foreground ,black :background nil))))
   `(erc-header-line ((t (:foreground ,black :background nil))))
   `(erc-input-face ((t (:foreground ,black :background nil))))
   `(erc-inverse-face ((t (:foreground ,black :background nil))))
   `(erc-keyword-face ((t (:foreground ,black :background nil))))
   `(erc-my-nick-face ((t (:foreground ,black :background nil))))
   `(erc-nick-default-face ((t (:foreground ,black :background nil))))
   `(erc-nick-msg-face ((t (:foreground ,black :background nil))))
   `(erc-notice-face ((t (:foreground ,black :background nil))))
   `(erc-pal-face ((t (:foreground ,black :background nil))))
   `(erc-prompt-face ((t (:foreground ,black :background nil))))
   `(erc-timestamp-face ((t (:foreground ,black :background nil))))
   `(erc-underline-face ((t (:foreground ,black :background nil))))

   `(eshell-prompt ((t (:foreground ,black :background nil :weight normal))))
   `(eshell-ls-directory ((t (:foreground nil :background nil :weight normal))))
   `(eshell-ls-executable ((t (:foreground nil :background nil :weight normal))))

   `(flycheck-error ((t (:foreground ,red :background nil :weight normal))))
   `(flycheck-warning ((t (:foreground ,red :background nil :weight normal))))

   `(font-lock-builtin-face ((t :foreground nil :background nil)))
   `(font-lock-comment-delimiter-face ((t :foreground nil :background nil)))
   `(font-lock-comment-face ((t :foreground nil :background nil)))
   `(font-lock-constant-face ((t :foreground nil :background nil)))
   `(font-lock-doc-face ((t :foreground nil :background nil)))
   `(font-lock-function-name-face ((t :foreground nil :background nil)))
   `(font-lock-keyword-face ((t :foreground nil :background nil)))
   `(font-lock-negation-char-face ((t :foreground nil :background nil)))
   `(font-lock-preprocessor-face ((t :foreground nil :background nil)))
   `(font-lock-regexp-grouping-backslash ((t :foreground nil :background nil)))
   `(font-lock-regexp-grouping-construct ((t :foreground nil :background nil)))
   `(font-lock-string-face ((t :foreground nil :background nil)))
   `(font-lock-type-face ((t :foreground nil :background nil)))
   `(font-lock-variable-name-face ((t :foreground nil :background nil)))
   `(font-lock-warning-face ((t :foreground ,white :background ,red)))

   `(git-gutter:added ((t :foreground ,green :background ,green)))
   `(git-gutter:deleted ((t :foreground ,red :background ,red)))
   `(git-gutter:modified ((t :foreground ,blue :background ,blue)))

   `(helm-M-x-key ((t (:foreground ,black :background nil :underline nil :italic nil))))
   `(helm-action ((t (:foreground ,black :background nil :underline nil))))
   `(helm-buffer-directory ((t (:foreground ,black :background nil :underline nil :italic nil))))
   `(helm-buffer-file ((t (:foreground ,black :background nil :underline nil :italic nil))))
   `(helm-buffer-not-saved ((t (:foreground ,black :background nil :underline nil :italic nil))))
   `(helm-buffer-process ((t (:foreground ,black :background nil :underline nil :italic nil))))
   `(helm-buffer-size ((t (:foreground ,black :background nil :underline nil :italic nil))))
   `(helm-candidate-number ((t (:foreground ,white :background ,white))))
   `(helm-ff-directory ((t (:foreground ,black :background nil :underline nil :italic nil))))
   `(helm-ff-executable ((t (:foreground ,black :background nil :underline nil :italic nil))))
   `(helm-ff-file ((t (:foreground ,black :background nil :underline nil :italic nil))))
   `(helm-ff-invalid-symlink ((t (:foreground ,black :background ,red :underline nil :italic nil))))
   `(helm-ff-prefix ((t (:foreground ,black :background nil :underline nil :italic nil))))
   `(helm-ff-symlink ((t (:foreground ,black :background nil :underline nil :italic nil))))
   `(helm-grep-lineno ((t (:foreground ,black :background ,white :underline nil))))
   `(helm-header ((t (:inherit mode-line))))
   `(helm-history-deleted ((t (:foreground ,black :background ,red :underline nil :italic nil))))
   `(helm-history-remote ((t (:foreground ,black :background ,red :underline nil :italic nil))))
   `(helm-match ((t (:foreground ,black :background ,white :underline nil))))
   `(helm-moccur-buffer ((t (:foreground ,black :background ,white :underline nil))))
   `(helm-prefarg ((t (:foreground ,black :background nil :underline nil :italic nil))))
   `(helm-selection ((t (:foreground ,red :background ,white :underline nil))))
   `(helm-separator ((t (:foreground ,white :background nil :underline nil :italic nil))))
   `(helm-source-header ((t (:inherit default :foreground ,black :background nil :underline nil :weight normal :family ,(face-attribute 'default :family) :height ,(face-attribute 'default :height)))))
   `(helm-visible-mark ((t (:foreground ,black :background ,red :underline nil :italic nil))))

   ;; js2-mode
   `(js2-error                    ((t (:foreground ,red :background nil))))
   `(js2-external-variable        ((t (:foreground nil :background nil))))
   `(js2-function-call            ((t (:foreground nil :background nil))))
   `(js2-function-param           ((t (:foreground nil :background nil))))
   `(js2-instance-member          ((t (:foreground nil :background nil))))
   `(js2-jsdoc-html-tag-delimiter ((t (:foreground nil :background nil))))
   `(js2-jsdoc-html-tag-name      ((t (:foreground nil :background nil))))
   `(js2-jsdoc-tag                ((t (:foreground nil :background nil))))
   `(js2-jsdoc-type               ((t (:foreground nil :background nil))))
   `(js2-jsdoc-value              ((t (:foreground nil :background nil))))
   `(js2-private-function-call    ((t (:foreground nil :background nil))))
   `(js2-private-member           ((t (:foreground nil :background nil))))
   `(js2-warning                  ((t (:foreground ,red :background nil))))

   `(leerzeichen                  ((t (:foreground ,green :background nil))))

   ;; magit
   `(magit-bisect-bad                  ((t (:foreground nil :background nil :weight normal))))
   `(magit-bisect-good                 ((t (:foreground nil :background nil :weight normal))))
   `(magit-bisect-skip                 ((t (:foreground nil :background nil :weight normal))))
   `(magit-blame-date                  ((t (:foreground nil :background nil :weight normal))))
   `(magit-blame-hash                  ((t (:foreground nil :background nil :weight normal))))
   `(magit-blame-heading               ((t (:foreground nil :background nil :weight normal))))
   `(magit-blame-name                  ((t (:foreground nil :background nil :weight normal))))
   `(magit-blame-summary               ((t (:foreground nil :background nil :weight normal))))
   `(magit-branch-current              ((t (:foreground nil :background nil :weight normal))))
   `(magit-branch-local                ((t (:foreground nil :background nil :weight normal))))
   `(magit-branch-remote               ((t (:foreground nil :background nil :weight normal))))
   `(magit-cherry-equivalent           ((t (:foreground nil :background nil :weight normal))))
   `(magit-cherry-unmatched            ((t (:foreground nil :background nil :weight normal))))
   `(magit-diff-added                  ((t (:foreground ,green :background nil :weight normal))))
   `(magit-diff-added-highlight        ((t (:foreground ,green :background nil :weight normal))))
   `(magit-diff-base                   ((t (:foreground nil :background nil :weight normal))))
   `(magit-diff-base-highlight         ((t (:foreground nil :background nil :weight normal))))
   `(magit-diff-conflict-heading       ((t (:foreground nil :background nil :weight normal))))
   `(magit-diff-context                ((t (:foreground nil :background nil :weight normal))))
   `(magit-diff-context-highlight      ((t (:foreground nil :background nil :weight normal :box nil))))
   `(magit-diff-file-heading           ((t (:foreground nil :background nil :weight normal))))
   `(magit-diff-file-heading-highlight ((t (:foreground nil :background nil :weight normal))))
   `(magit-diff-file-heading-selection ((t (:foreground nil :background nil :weight normal))))
   `(magit-diff-hunk-heading           ((t (:foreground nil :background nil :weight normal))))
   `(magit-diff-hunk-heading-highlight ((t (:foreground nil :background nil :weight normal))))
   `(magit-diff-hunk-heading-selection ((t (:foreground nil :background nil :weight normal))))
   `(magit-diff-lines-boundary         ((t (:foreground nil :background nil :weight normal))))
   `(magit-diff-lines-heading          ((t (:foreground nil :background nil :weight normal))))
   `(magit-diff-our                    ((t (:foreground nil :background nil :weight normal))))
   `(magit-diff-our-highlight          ((t (:foreground nil :background nil :weight normal))))
   `(magit-diff-removed                ((t (:foreground ,red :background nil :weight normal))))
   `(magit-diff-removed-highlight      ((t (:foreground ,red :background nil :weight normal))))
   `(magit-diff-their                  ((t (:foreground nil :background nil :weight normal))))
   `(magit-diff-their-highlight        ((t (:foreground nil :background nil :weight normal))))
   `(magit-diff-whitespace-warning     ((t (:foreground nil :background nil :weight normal))))
   `(magit-diffstat-added              ((t (:foreground nil :background nil :weight normal))))
   `(magit-diffstat-removed            ((t (:foreground nil :background nil :weight normal))))
   `(magit-dimmed                      ((t (:foreground nil :background nil :weight normal))))
   `(magit-filename                    ((t (:foreground nil :background nil :weight normal))))
   `(magit-hash                        ((t (:foreground nil :background nil :weight normal))))
   `(magit-head                        ((t (:foreground nil :background nil :weight normal))))
   `(magit-header-line                 ((t (:foreground nil :background nil :weight normal))))
   `(magit-log-author                  ((t (:foreground nil :background nil :weight normal))))
   `(magit-log-date                    ((t (:foreground nil :background nil :weight normal))))
   `(magit-log-graph                   ((t (:foreground nil :background nil :weight normal))))
   `(magit-popup-argument              ((t (:foreground nil :background nil :weight normal))))
   `(magit-popup-disabled-argument     ((t (:foreground nil :background nil :weight normal))))
   `(magit-popup-heading               ((t (:foreground nil :background nil :weight normal))))
   `(magit-popup-key                   ((t (:foreground nil :background nil :weight normal))))
   `(magit-popup-option-value          ((t (:foreground nil :background nil :weight normal))))
   `(magit-process-ng                  ((t (:foreground nil :background ,red :weight normal))))
   `(magit-process-ok                  ((t (:foreground nil :background nil :weight normal))))
   `(magit-reflog-amend                ((t (:foreground nil :background nil :weight normal))))
   `(magit-reflog-checkout             ((t (:foreground nil :background nil :weight normal))))
   `(magit-reflog-cherry-pick          ((t (:foreground nil :background nil :weight normal))))
   `(magit-reflog-commit               ((t (:foreground nil :background nil :weight normal))))
   `(magit-reflog-merge                ((t (:foreground nil :background nil :weight normal))))
   `(magit-reflog-other                ((t (:foreground nil :background nil :weight normal))))
   `(magit-reflog-rebase               ((t (:foreground nil :background nil :weight normal))))
   `(magit-reflog-remote               ((t (:foreground nil :background nil :weight normal))))
   `(magit-reflog-reset                ((t (:foreground nil :background nil :weight normal))))
   `(magit-refname                     ((t (:foreground nil :background nil :weight normal))))
   `(magit-refname-stash               ((t (:foreground nil :background nil :weight normal))))
   `(magit-refname-wip                 ((t (:foreground nil :background nil :weight normal))))
   `(magit-section-heading             ((t (:foreground nil :background nil :weight normal))))
   `(magit-section-heading-selection   ((t (:foreground nil :background nil :weight normal))))
   `(magit-section-highlight           ((t (:foreground nil :background nil :weight normal))))
   `(magit-section-secondary-heading   ((t (:foreground nil :background nil :weight normal))))
   `(magit-sequence-done               ((t (:foreground nil :background nil :weight normal))))
   `(magit-sequence-drop               ((t (:foreground nil :background nil :weight normal))))
   `(magit-sequence-head               ((t (:foreground nil :background nil :weight normal))))
   `(magit-sequence-onto               ((t (:foreground nil :background nil :weight normal))))
   `(magit-sequence-part               ((t (:foreground nil :background nil :weight normal))))
   `(magit-sequence-pick               ((t (:foreground nil :background nil :weight normal))))
   `(magit-sequence-stop               ((t (:foreground nil :background nil :weight normal))))
   `(magit-signature-bad               ((t (:foreground nil :background nil :weight normal))))
   `(magit-signature-good              ((t (:foreground nil :background nil :weight normal))))
   `(magit-signature-untrusted         ((t (:foreground nil :background nil :weight normal))))
   `(magit-tag                         ((t (:foreground nil :background nil :weight normal))))

   `(message-cited-text ((t (:foreground ,black :background nil :weight normal))))
   `(message-header-cc ((t (:foreground ,black :background nil :weight normal))))
   `(message-header-name ((t (:foreground ,black :background nil :weight normal))))
   `(message-header-newsgroups ((t (:foreground ,black :background nil :weight normal))))
   `(message-header-other ((t (:foreground ,black :background nil :weight normal))))
   `(message-header-subject ((t (:foreground ,black :background nil :weight normal))))
   `(message-header-to ((t (:foreground ,black :background nil :weight normal))))
   `(message-header-xheader ((t (:foreground ,black :background nil :weight normal))))
   `(message-mml ((t (:foreground ,black :background nil :weight normal))))
   `(message-separator ((t (:foreground ,black :background nil :weight normal))))

   `(notmuch-crypto-decryption ((t (:foreground ,black :background nil :weight normal))))
   `(notmuch-crypto-part-header ((t (:foreground ,black :background nil :weight normal))))
   `(notmuch-crypto-signature-bad ((t (:foreground ,black :background nil :weight normal))))
   `(notmuch-crypto-signature-good ((t (:foreground ,black :background nil :weight normal))))
   `(notmuch-crypto-signature-good-key ((t (:foreground ,black :background nil :weight normal))))
   `(notmuch-crypto-signature-unknown ((t (:foreground ,black :background nil :weight normal))))
   `(notmuch-hello-logo-background ((t (:foreground ,black :background nil :weight normal))))
   `(notmuch-message-summary-face ((t (:foreground ,black :background nil :weight normal))))
   `(notmuch-search-count ((t (:foreground ,black :background nil :weight normal))))
   `(notmuch-search-date ((t (:foreground ,black :background nil :weight normal))))
   `(notmuch-search-matching-authors ((t (:foreground ,black :background nil :weight normal))))
   `(notmuch-search-non-matching-authors ((t (:foreground ,black :background nil :weight normal))))
   `(notmuch-search-subject ((t (:foreground ,black :background nil :weight normal))))
   `(notmuch-tag-face ((t (:foreground ,black :background nil :weight normal))))
   `(notmuch-tree-match-author-face ((t (:foreground ,black :background nil :weight normal))))
   `(notmuch-tree-match-date-face ((t (:foreground ,black :background nil :weight normal))))
   `(notmuch-tree-match-face ((t (:foreground ,black :background nil :weight normal))))
   `(notmuch-tree-match-subject-face ((t (:foreground ,black :background nil :weight normal))))
   `(notmuch-tree-match-tag-face ((t (:foreground ,black :background nil :weight normal))))
   `(notmuch-tree-match-tree-face ((t (:foreground ,black :background nil :weight normal))))
   `(notmuch-tree-no-match-author-face ((t (:foreground ,black :background nil :weight normal))))
   `(notmuch-tree-no-match-date-face ((t (:foreground ,black :background nil :weight normal))))
   `(notmuch-tree-no-match-face ((t (:foreground ,black :background nil :weight normal))))
   `(notmuch-tree-no-match-subject-face ((t (:foreground ,black :background nil :weight normal))))
   `(notmuch-tree-no-match-tag-face ((t (:foreground ,black :background nil :weight normal))))
   `(notmuch-tree-no-match-tree-face ((t (:foreground ,black :background nil :weight normal))))
   `(notmuch-wash-cited-text ((t (:foreground ,black :background nil :weight normal))))
   `(notmuch-wash-toggle-button ((t (:foreground ,black :background nil :weight normal))))

   `(org-agenda-calendar-event ((t (:foreground ,black :background nil :weight normal))))
   `(org-agenda-calendar-sexp ((t (:foreground ,black :background nil :weight normal))))
   `(org-agenda-clocking ((t (:foreground ,black :background nil :weight normal))))
   `(org-agenda-column-dateline ((t (:foreground ,black :background nil :weight normal))))
   `(org-agenda-current-time ((t (:foreground ,black :background nil :weight normal))))
   `(org-agenda-date ((t (:foreground ,black :background nil :weight normal))))
   `(org-agenda-date-today ((t (:foreground ,black :background nil :weight normal))))
   `(org-agenda-date-weekend ((t (:foreground ,black :background nil :weight normal))))
   `(org-agenda-diary ((t (:foreground ,black :background nil :weight normal))))
   `(org-agenda-dimmed-todo-face ((t (:foreground ,black :background nil :weight normal))))
   `(org-agenda-done ((t (:foreground ,black :background nil :weight normal))))
   `(org-agenda-filter-category ((t (:foreground ,black :background nil :weight normal))))
   `(org-agenda-filter-regexp ((t (:foreground ,black :background nil :weight normal))))
   `(org-agenda-filter-tags ((t (:foreground ,black :background nil :weight normal))))
   `(org-agenda-restriction-lock ((t (:foreground ,black :background nil :weight normal))))
   `(org-agenda-structure ((t (:foreground ,black :background nil :weight normal))))
   `(org-archived ((t (:foreground ,black :background nil :weight normal))))
   `(org-block ((t (:foreground ,black :background nil :weight normal))))
   `(org-block-background ((t (:foreground ,black :background nil :weight normal))))
   `(org-block-begin-line ((t (:foreground ,black :background nil :weight normal))))
   `(org-block-end-line ((t (:foreground ,black :background nil :weight normal))))
   `(org-checkbox ((t (:foreground ,black :background nil :weight normal))))
   `(org-checkbox-statistics-done ((t (:foreground ,black :background nil :weight normal))))
   `(org-checkbox-statistics-todo ((t (:foreground ,black :background nil :weight normal))))
   `(org-clock-overlay ((t (:foreground ,black :background nil :weight normal))))
   `(org-code ((t (:foreground ,black :background nil :weight normal))))
   `(org-column ((t (:foreground ,black :background nil :weight normal))))
   `(org-column-title ((t (:foreground ,black :background nil :weight normal))))
   `(org-date ((t (:foreground ,black :background nil :weight normal))))
   `(org-date-selected ((t (:foreground ,black :background nil :weight normal))))
   `(org-default ((t (:foreground ,black :background nil :weight normal))))
   `(org-document-info ((t (:foreground ,black :background nil :weight normal))))
   `(org-document-info-keyword ((t (:foreground ,black :background nil :weight normal))))
   `(org-document-title ((t (:foreground ,black :background nil :weight normal))))
   `(org-done ((t (:foreground ,black :background nil :weight normal))))
   `(org-drawer ((t (:foreground ,black :background nil :weight normal))))
   `(org-ellipsis ((t (:foreground ,black :background nil :weight normal))))
   `(org-footnote ((t (:foreground ,black :background nil :weight normal))))
   `(org-formula ((t (:foreground ,black :background nil :weight normal))))
   `(org-headline-done ((t (:foreground ,black :background nil :weight normal))))
   `(org-hide ((t (:foreground ,black :background nil :weight normal))))
   `(org-latex-and-related ((t (:foreground ,black :background nil :weight normal))))
   `(org-level-1 ((t (:foreground ,black :background nil :weight normal))))
   `(org-level-2 ((t (:foreground ,black :background nil :weight normal))))
   `(org-level-3 ((t (:foreground ,black :background nil :weight normal))))
   `(org-level-4 ((t (:foreground ,black :background nil :weight normal))))
   `(org-level-5 ((t (:foreground ,black :background nil :weight normal))))
   `(org-level-6 ((t (:foreground ,black :background nil :weight normal))))
   `(org-level-7 ((t (:foreground ,black :background nil :weight normal))))
   `(org-level-8 ((t (:foreground ,black :background nil :weight normal))))
   `(org-link ((t (:foreground ,black :background nil :weight normal))))
   `(org-list-dt ((t (:foreground ,black :background nil :weight normal))))
   `(org-macro ((t (:foreground ,black :background nil :weight normal))))
   `(org-meta-line ((t (:foreground ,black :background nil :weight normal))))
   `(org-mode-line-clock ((t (:inherit modeline))))
   `(org-mode-line-clock-overrun ((t (:inherit modeline))))
   `(org-priority ((t (:foreground ,black :background nil :weight normal))))
   `(org-property-value ((t (:foreground ,black :background nil :weight normal))))
   `(org-quote ((t (:foreground ,black :background nil :weight normal))))
   `(org-scheduled ((t (:foreground ,black :background nil :weight normal))))
   `(org-scheduled-previously ((t (:foreground ,black :background nil :weight normal))))
   `(org-scheduled-today ((t (:foreground ,black :background nil :weight normal))))
   `(org-sexp-date ((t (:foreground ,black :background nil :weight normal))))
   `(org-special-keyword ((t (:foreground ,black :background nil :weight normal))))
   `(org-table ((t (:foreground ,black :background nil :weight normal))))
   `(org-tag ((t (:foreground ,black :background nil :weight normal))))
   `(org-tag-group ((t (:foreground ,black :background nil :weight normal))))
   `(org-target ((t (:foreground ,black :background nil :weight normal))))
   `(org-time-grid ((t (:foreground ,black :background nil :weight normal))))
   `(org-todo ((t (:foreground ,black :background nil :weight normal))))
   `(org-upcoming-deadline ((t (:foreground ,black :background nil :weight normal))))
   `(org-verbatim ((t (:foreground ,black :background nil :weight normal))))
   `(org-verse ((t (:foreground ,black :background nil :weight normal))))
   `(org-warning ((t (:foreground ,black :background nil :weight normal))))

   `(rng-error ((t (:foreground nil :background ,red))))

   `(show-paren-match ((t (:foreground nil :background ,yellow))))
   `(show-paren-mismatch ((t (:foreground nil :background ,red))))

   `(scala-font-lock:var-face ((t (:foreground nil :background nil))))

   `(shr-link ((t (:foreground ,red :background nil :weight normal :underline nil))))
   `(shr-strike-through ((t (:foreground nil :background nil :weight normal :strike-through t))))

   `(wgrep-face ((t (:foreground ,green :background nil))))
   `(wgrep-done-face ((t (:foreground ,black :background nil))))

   `(swiper-line-face ((t (:foreground ,black :background ,green))))
   `(swiper-match-face-1 ((t (:foreground ,red :background nil))))
   `(swiper-match-face-2 ((t (:foreground ,red :background nil))))
   `(swiper-match-face-3 ((t (:foreground ,red :background nil))))
   `(swiper-match-face-4 ((t (:foreground ,red :background nil))))

   `(ivy-confirm-face ((t (:foreground ,black :background ,white))))
   `(ivy-current-match ((t (:foreground ,white :background ,green))))
   `(ivy-match-required-face ((t (:foreground ,red :background nil))))
   `(ivy-minibuffer-match-face-1 ((t (:foreground ,red :background nil))))
   `(ivy-minibuffer-match-face-2 ((t (:foreground ,red :background nil))))
   `(ivy-minibuffer-match-face-3 ((t (:foreground ,red :background nil))))
   `(ivy-minibuffer-match-face-4 ((t (:foreground ,red :background nil))))
   `(ivy-modified-buffer ((t (:foreground ,black :background ,white))))
   `(ivy-remote ((t (:foreground ,black :background ,white))))
   `(ivy-subdir ((t (:foreground ,black :background ,white))))
   `(ivy-virtual ((t (:foreground ,black :background ,white))))
   ))

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'iv)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; End:
;;; iv-theme.el ends here
