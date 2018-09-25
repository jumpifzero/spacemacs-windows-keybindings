;;; See https://github.com/syl20bnr/spacemacs/blob/master/doc/LAYERS.org#anatomy-of-a-layer

;;; This file contains general key bindings. It is the last file loaded. The
;;; word general here means independent of any package. Since the end user can
;;; exclude an arbitrary set of packages, you cannot be sure that, just because
;;; your layer includes a package, that package will necessarily be loaded. For
;;; this reason, code in these files must be generally safe, regardless of which
;;; packages are installed.

;; Use describe-personal-keybindings to list these out.
;;(require 'bind-key)

;; Make C-x, -c, -v behave properly if there is a selection. C-x KEY still works!
;; C-z is undo. C-RET starts rectangle selection mode.
(cua-mode t)

;; ******************* Function keys ********************
;; Move help to F1. Must happen before we rebind C-h.
;(global-set-key [f1] (lookup-key global-map (kbd "C-h")))
(bind-key* "<f2>"    #'er/expand-region)      ;; From MS Excel muscle memory.
(bind-key* "C-<f4>"  #'kill-this-buffer)

;; ******************* Marking the buffer **************
(bind-key* "C-S-a"   #'mark-whole-buffer)

;; Dragging lines. TODO: Needs to drag regions as well.
(bind-key* "M-<up>" #'drag-stuff-up)
(bind-key* "M-<down>" #'drag-stuff-down)

;; This moves isearch-forward from C-s to C-f. We also need to adjust the keys within the isearch-mode-map.
(bind-key "C-f"      #'isearch-forward)
(bind-key "C-f"      #'isearch-repeat-forward isearch-mode-map)

(bind-key* "C-o"     #'spacemacs/helm-find-files)
(bind-key* "C-n"     #'spacemacs/new-empty-buffer)

(unbind-key "C-s"    isearch-mode-map)
(bind-key* "C-s"     #'save-buffer)
(bind-key* "C-p"     #'helm-projectile-find-file)

;; Increasing / decreasing font size with C+Scroll
;; Don't understand why it doesn't work by default..
;;(bind-key* "C-<mouse-4>" #'spacemacs/zoom-frm-in)
;;(bind-key* "C-<mouse-5>" #'spacemacs/zoom-frm-out)
