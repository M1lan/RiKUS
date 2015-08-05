#!/bin/sh
emacs -Q --eval="
(progn 
  (dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
    (when (fboundp mode) (funcall mode -1))) (setq mode-line-format nil) (setq-default mode-line-format nil)
    
    (setq inhibit-startup-echo-area-message \"milan\")
    (setq frame-title-format \`(,(user-login-name)\"@\",(system-name)))

    (setq split-height-threshold 1200)
    (setq split-width-threshold 2000)
    (setq set-fringe-style 0)
    (setq message-log-max 0)
    
    (ansi-term shell-file-name)
    
    (require 'cl)
    (defadvice save-buffers-kill-emacs (around no-y-or-n activate)
      (flet ((yes-or-no-p (&rest args) t)
	     (y-or-n-p (&rest args) t))
	    ad-do-it))
    )


"
