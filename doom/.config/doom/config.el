;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font
      (font-spec :family "MonoLisa Nerd Font" :size 14 :weight 'regular))
(setq doom-variable-pitch-font
      (font-spec :family "Libertinus Serif" :size 14 :weight 'regular))

;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Julia
(setq lsp-julia-package-dir nil)
(setq lsp-julia-flags '("--startup-file=no"
                        "--history-file=no"
                        "--sysimage=/home/sandy/dotfiles/jl-sys/lsp.so"))
(setq lsp-julia-default-environment "~/.julia/environments/v1.11/")

;; Latex
(setq TeX-engine 'luatex)
(setq TeX-output-dir "out/")
(setq +latex-viewers '(pdf-tools))

;; Org
(after! mixed-pitch
  (setq mixed-pitch-set-height t)
  (setq variable-pitch-serif-font doom-serif-font)
  (set-face-attribute 'variable-pitch nil :height 1.3))
(after! org
  (setq org-hide-emphasis-markers t)
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (add-hook 'org-mode-hook 'mixed-pitch-mode)
  (add-hook 'org-mode-hook 'visual-line-mode)
  (+org-babel-load-jupyter-h 'jupyter-julia)
  (org-babel-jupyter-override-src-block "julia")
  (setq org-preview-latex-process-alist
        '((lualatex :programs
           ("latex" "convert")
           :description "pdf > png" :message "you need to install the programs: latex and imagemagick." :image-input-type "pdf" :image-output-type "png" :image-size-adjust
           (1.0 . 1.0)
           :latex-compiler
           ("lualatex --interaction=nonstopmode --output-directory=%o %f")
           :image-converter
           ("convert -density %D -trim -antialias %f -quality 100 %O"))))
  (setq org-format-latex-header
        "\\documentclass[empty]{draught}
        \\pagestyle{empty} % do not remove
        % The settings below are copied from fullpage.sty
        \\setlength{\\textwidth}{\\paperwidth}
        \\addtolength{\\textwidth}{-3cm}
        \\setlength{\\oddsidemargin}{1.5cm}
        \\addtolength{\\oddsidemargin}{-2.54cm}
        \\setlength{\\evensidemargin}{\\oddsidemargin}
        \\setlength{\\textheight}{\\paperheight}
        \\addtolength{\\textheight}{-\\headheight}
        \\addtolength{\\textheight}{-\\headsep}
        \\addtolength{\\textheight}{-\\footskip}
        \\addtolength{\\textheight}{-3cm}
        \\setlength{\\topmargin}{1.5cm}
        \\addtolength{\\topmargin}{-2.54cm}")
  (setq org-preview-latex-default-process 'lualatex)
  (setq org-preview-latex-process 'lualatex))
(after! ox-latex
  (add-to-list 'org-latex-classes
               '("draught"
                 "\\documentclass{draught}
                [NO-DEFAULT-PACKAGES]
                [NO-PACKAGES]
                [NO-EXTRA]"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  (setq org-latex-default-class "draught")
  (setq org-latex-hyperref-template "")
  (setq org-latex-compiler "lualatex")
  (setq org-latex-toc-command "")
  )
(after! jupyter
  (setq jupyter-use-zmq nil)
  (defun my-jupyter-api-http-request--ignore-login-error-a
      (func url endpoint method &rest data)
    (cond
     ((member endpoint '("login"))
      (ignore-error (jupyter-api-http-error)
        (apply func url endpoint method data)))
     (:else
      (apply func url endpoint method data))))
  (advice-add
   #'jupyter-api-http-request
   :around #'my-jupyter-api-http-request--ignore-login-error-a))
