;;; fingers-tests.el --- Tests for fingers.el

;; Copyright (c) 2014 Felix Geller

;; Author: Felix Geller <fgeller@gmail.com>
;; Keywords: fingers modal editing workman
;; URL: http://github.com/fgeller/fingers.el

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

;; Tests for fingers.el

(require 'fingers)

(defun fingers-test-fingers-mark-inside-pair-strings (input position start end)
  (with-temp-buffer
    (insert input)
    (goto-char position)
    (fingers-mark-inside-pair-strings start end)
    (fingers-kill-current-region)
    (buffer-substring (point-min) (point-max))))

(defun fingers-test-fingers-mark-with-pair-strings (input position start end)
  (with-temp-buffer
    (insert input)
    (goto-char position)
    (fingers-mark-with-pair-strings start end)
    (fingers-kill-current-region)
    (buffer-substring (point-min) (point-max))))

(defun fingers-test-fingers-mark-with-pair-strings-and-whitespace (input position start end)
  (with-temp-buffer
    (insert input)
    (goto-char position)
    (fingers-mark-with-pair-strings-and-whitespace start end)
    (fingers-kill-current-region)
    (buffer-substring (point-min) (point-max))))

(defun fingers-test-fingers-mark-word-with-subword (input pos)
  (with-temp-buffer
    (insert input)
    (goto-char pos)
    (subword-mode 1)
    (fingers-mark-word)
    (fingers-kill-current-region)
    (buffer-substring (point-min) (point-max))))

(ert-deftest fingers-test:fingers-mark-word-with-subword ()
  (should (string= "HTTP" (fingers-test-fingers-mark-word-with-subword "HTTPRequest" 5)))
  (should (string= "HTTP" (fingers-test-fingers-mark-word-with-subword "HTTPRequest" 7)))
  (should (string= "HTTP" (fingers-test-fingers-mark-word-with-subword "HTTPRequest" 11)))
  (should (string= "Request" (fingers-test-fingers-mark-word-with-subword "HTTPRequest" 2)))
  (should (string= "Request" (fingers-test-fingers-mark-word-with-subword "HTTPRequest" 0)))
  )

(ert-deftest fingers-test:fingers-mark-inside-pair ()
  (should (string= "  ()" (fingers-test-fingers-mark-inside-pair-strings "  (abc)" 5 "(" ")")))
  (should (string= "  []" (fingers-test-fingers-mark-inside-pair-strings "  [abc]" 5 "[" "]")))
  (should (string= "  ()" (fingers-test-fingers-mark-inside-pair-strings "  ((a) b (c))" 8 "(" ")")))
  (should (string= "  ''" (fingers-test-fingers-mark-inside-pair-strings "  'abc'" 5 "'" "'")))
)

(ert-deftest fingers-test:fingers-mark-with-pair ()
  (should (string= "  " (fingers-test-fingers-mark-with-pair-strings "  (abc)" 5 "(" ")")))
  (should (string= "  " (fingers-test-fingers-mark-with-pair-strings "  [abc]" 5 "[" "]")))
  (should (string= "  " (fingers-test-fingers-mark-with-pair-strings "  ((a) b (c))" 8 "(" ")")))
  (should (string= "  " (fingers-test-fingers-mark-with-pair-strings "  'abc'" 5 "'" "'")))
)

(ert-deftest fingers-test:fingers-mark-with-pair-and-whitespace ()
  (should (string= "" (fingers-test-fingers-mark-with-pair-strings-and-whitespace "  (abc)" 5 "(" ")")))
  (should (string= "" (fingers-test-fingers-mark-with-pair-strings-and-whitespace "  [abc]" 5 "[" "]")))
  (should (string= "" (fingers-test-fingers-mark-with-pair-strings-and-whitespace "  ((a) b (c))" 8 "(" ")")))
  (should (string= "" (fingers-test-fingers-mark-with-pair-strings-and-whitespace "  'abc'" 5 "'" "'")))
  )

(require 'fingers-qwerty)

(ert-deftest fingers-test:workman-to-qwerty ()
  (should (string= "atcwkugd;ynmvjloqesfibrxhzp" (fingers-workman-to-qwerty "abcdefghijklmnopqrstuvwxyz;")))
  (should (string= "aTc" (fingers-workman-to-qwerty "aBc")))
  (should (string= "SPC" (fingers-workman-to-qwerty "SPC")))
  (should (string= "RET" (fingers-workman-to-qwerty "RET")))
  (should (string= "'" (fingers-workman-to-qwerty "'")))
  (should (string= ";" (fingers-workman-to-qwerty "i")))
  (should (string= "p" (fingers-workman-to-qwerty ";")))
  (should (string= ":" (fingers-workman-to-qwerty "I")))
)

(require 'fingers-neo)

(ert-deftest fingers-test:workman-to-neo ()
  (should (string= "uwpvrhoadkbmäntfxliegzcösüqjßy"
		   (fingers-workman-to-neo "abcdefghijklmnopqrstuvwxyz;/['")))
  (should (string= "uWp" (fingers-workman-to-neo "aBc")))
  (should (string= "SPC" (fingers-workman-to-neo "SPC")))
  (should (string= "RET" (fingers-workman-to-neo "RET")))
  (should (string= "y" (fingers-workman-to-neo "'")))
  (should (string= "d" (fingers-workman-to-neo "i")))
  (should (string= "q" (fingers-workman-to-neo ";")))
  (should (string= "D" (fingers-workman-to-neo "I")))
)
