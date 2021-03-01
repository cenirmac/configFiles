;============================================================================
; RSemacs.emacs
; by: Richard Shiao
; June 1, 2000
;
; Modified: 12:10am 2001-01-20 for www.geocities.com/IntroToEECS/
;============================================================================
; Purpose:  This .emacs file was created from examining many examples.
;           It is mainly for personal use but includes features that I
;           think are useful to other people as well.  People new to .emacs
;           files may find this file a useful example.
;           Some features included are personalizing color settings,
;           a delete key that deletes forward, indenting regions with
;           control-c-i, useful function keys, switching between buffers
;           with control-tab, and PC-styled keybindings and selction for text
;           selection, cutting, copying, and pasting.
;
; Extra:    I have chosen colors that fit with the Cal spirit.
;
;
; Features: I.   Starting Emacs
;                - Enable Debugging on error (currently commented out)
;                - Version check (currently supports Xemacs 20.4 on Linux)
;                - Welcome message
;                - Setting home directory
;                - Silent the bell (currently commented out)
;                - Exiting Emacs requires confirmation
;           II.  Display and Colors
;                - Enable Font Lock Mode
;                - Show matching parentheses on cursor-over too
;                - Window size, location, title, modeline
;                - Clock (currently commented out)
;                - Colors for specific faces
;           III. Program Behavior
;                - Text mode
;                - Set kill ring
;                - Set auto save character interval
;                - Transient-Mark mode
;                - Auto-Fill mode
;                - Set word wrapping width
;                - Toggle Horizontal scroll bars (currently commented out)
;                - Scroll down 1 line at a time rather than a huge section
;                - Don't add more lines when scrolling past end of buffer  
;                - Resize mini-buffer automatically
;                - Substitute yes/no responses to y/n
;                - Specify tab width
;                - Substitute tabs with spaces
;                - Search is not case-sensitive
;                - End files with a newline character
;           IV.  Key Bindings
;                - Use PC-style key bindings and selection... YES!!!
;                - Shift-Tab completes abbreviated words
;                - Delete key deletes forward
;                - C-Backspace deletes word
;                - C-PageUp/PageDown scrolls other buffer
;                - PageUp/PageDown remembers cursor position
;                - Cut with C-c x or C-c C-x
;                - Copy with C-c c or C-c C-c
;                - Paste with C-c v or C-c C-v
;                - Select all with C-c a or C-c C-a
;                - Compare Windows with C-c w
;                - GoTo line with C-c g
;                - Indent regions with C-c i
;                - Center line with C-c C-e
;                - Comment out region with C-c o
;                - Function keys
;                           f1  - Help
;                     Shift f1  - Man
;                           f2  - Save Buffer
;                *    Shift f2  - Save All Buffers
;                           f3  - Open
;                     Shift f3  - Open .emacs
;                           f4  - Close Buffer
;                *    Shift f4  - Save All and Quit
;                           f5  - Compile
;                           f6  - Next Error
;                     Shift f6  - First Error
;                     Ctrl  f6  - Previous Error
;                           f7  - GoTo Line
;                           f8  - Comment Region
;                     Shift f8  - Uncomment Region
;                           f9  - Indent Region
;                           f10 - One Window
;                     Shift f10 - Two Windows (Top and Bottom)
;                     Ctrl  f10 - Two Windows (Left and Right)
;                           f11 - Switch Window
;                *          f12 - Start/End Keyboard Macro
;                     Shift f12 - Name Last Keyboard Macro
;                     Ctrl  f12 - Call Last Keyboard Macro
;                - Buffer opens in same window
;                - Disable C-x f since C-x C-f is find file
;                - Disable C-x C-k since C-x k is kill
;                - Disable C-t since it's close to y
;                - Disable C-a since I think Select All
;                - Disable C-q since I think Quit
;                * Disable S-backspace
;                - Load Buffer Menu in same window with C-x C-b
;                - Undo with C-z
;                - Save with C-s
;           V.   Mouse Bindings
;                - Scroll with Mouse-1
;                - Select from completion list with Mouse-1
;                - Select from Buffer Menu with Mouse-1
;                - Show Context-Sensitive Menu with Mouse-2
;           VI.  Mail
;                - Enable alias
;           VII. Additional Functions
;                - Open .emacs with Shift-f3, by Richard Shiao
;                - Toggle keyboard macro recording with f12
;                - Save all with Shift-f2
;                - Save all and Quit with Shift-f4
;                - Buffer Switching, by Young-il Choo
;                  Use C-tab to switch buffer.
;                - Saving the Emacs Desktop, by Richard Shiao
;                  Opens files from last session upon starting.
;           Look for successful loading confirmation in Messages buffer.
;
; * denotes a feature that is not yet implemented or buggy.
;
; Version History:
;      Created:  Richard Shiao
;                IntroToEECS@yahoo.com
;                2000/06/01
;      Modified:  
;
; If you are accessing this file indirectly, there is a good chance that it
; has been modified.  To see the original file, official releases, and
; the most recent version, go to:
; www.geocities.com/IntroToEECS
;============================================================================


;--- Copyright and Legal Information ----------------------------------------
; (c)Copyright 2000 by Richard Shiao.
; You may share, use, and modify it freely, provided you include the
; following text next to borrowed code:
;
;    Original File: Richard E. Shiao 2000/06/03
;    For the most recent version of original file,
;    go to  www.geocities.com/IntroToEECS
;---------------------------------------------------------------------------

;--- Credits ----------------------------------------------------------------
; Here is a basic list of where some of my ideas came from:
;
; Steve Ackermann <sackermann@itree.com.au> -
; PC-style selection and bindings.  Simple two-liner setting, but it
; made a huge difference, and was one of the main goals of my writing
; my own .emacs file.
;
; Young-il Choo <choo@cs.yale.edu> -
; Control-Tab between buffers.  Convenient.  I also see it all over the
; place in many different people's files.  Some people tried to steal credit
; for themselves, even with the function named "yic-next-buffer"!
;
; Steve Dodd <sdodd@undergrad.math.uwaterloo.ca> -
; Mouse and keyboard bingdings.  Many useful features.  Another file liked
; by many people.
;
; Dave Gallucci <David.Gallucci@nasd.com> -
; Set a backups directory.  It's good to centralize those backup~ files.
; Too bad I don't have the "backup" package to actually use it yet.
;
; Ingo Koch <koch@dotemacs.de> -
; Confirmation message at the end.
; (This person maintains a whole website devoted to .emacs files.
; It's current and useful.  Check it out at: www.dotemacs.de)
;
; Jayakrishnan Nair <jayakrishnan@netscape.net> -
; Debug-on-error and writing progress messages to the Message buffer.
; I don't use it, but it's nice to know it's there if I ever want to.
;
; Jason Rumney <jasonr@altavista.net> -
; Mouse-2 menu.  Cool... who pastes with the mouse-2 button anyway?
;---------------------------------------------------------------------------

;--- Notes and Reminders ---------------------------------------------------
; By:     Richard Shiao
; Date:   2000/06/01
; Source: www.geocities.com/IntroToEECS
;
; Customizing: Use Help/Customize menu to change settings-
;              User personal information and colors
;
; Help:        Type: C-h or F1
;              Mode Help: C-h m
;              Look under the Help/Manuals menu for detailed information.
;              The FAQ file is a useful place to start.
;
; Mail:        Enter mail mode, type `C-x m'
;              Enter RMAIL (for reading mail), type `M-x rmail'
;
; Scheme:      Type: M-x run-scheme, but it doesn't work on my system right
;              now for some reason.
;
; Language:    Stephen Tse's file has Chinese capabilities.  Available
;              at www.dotemacs.de.  Also see www.dict.org
;
; Macros:      Start with C-x ( or F12.
;              Type macro.
;              Finish with C-x ) or F12.
;              M-x name-last-kbd-macro to name macro.
;              M-x call-last-kbd-macro to execute.
;              M-x insert-kbd-macro followed by the name
;                 to insert the key sequence equivalent into your code
;                 for your .emacs file.  (This is very useful if you are
;                 unfamiliar with the key binding syntax).
;
; Compiling:   Byte compile this file to make emacs load faster.
;              Select "Byte Compile This File" under the Emacs-Lisp menu.
;              Compile it as .NameOfFile.elc and then put
;                 (load-file "~/.NameOfFile.elc")
;              in your normal .emacs file (where NameOfFile is any name
;              you choose).
;---------------------------------------------------------------------------



;--- Starting Emacs --------------------------------------------------------
; By:     Richard Shiao
; Date:   2000/06/01
; Source: www.geocities.com/IntroToEECS

;(setq debug-on-error t) ;; Currently turned off
(message "Now loading Richard Shiao's .emacs file...")
(message "Scroll down the message buffer to see if loading successful...")

(defun running-at-least (major minor)
  (or (> emacs-major-version major)
	(and (= emacs-major-version major)
	     (>= emacs-minor-version minor))))

(if (running-at-least 20 4)
    (message "Running at least Emacs 20.4 ... Welcome to Emacs!")
    (message "WARNING: Whoa, you should upgrade Emacs to at least 20.4!"))

; Setting home directory
; If I ever use emacs on a pc,
; (setenv "HOME" "c:/emacs")

; If I ever want to turn off the beep...
; (set-message-beep 'silent)

; Confirm Emacs exit
;(setq kill-emacs-query-functions
;      (cons (lambda () (y-or-n-p "Quit Emacs?"))
;	    kill-emacs-query-functions))
;---------------------------------------------------------------------------


;--- Display and Colors ----------------------------------------------------
; By:     Richard Shiao
; Date:   2000/06/01
; Source: www.geocities.com/IntroToEECS
;
; Default color, location, size, and title options for all frames
; Note: Go to Edit/Text Properties/Display Faces to see a list of available
;       faces and their current color settings.
;       Go to Edit/Text Properties/Display Colors to see a list of available
;       colors
; Note: Some settings like font-lock-mode and show-paren-mode in particular
;       need to come before the color assignments to the faces.
;       Make sure you preserve this order.
  
; Use color coding for syntax during programming.
; Important line!
(global-font-lock-mode t)

; Show matching parentheses upon cursor-over
(show-paren-mode 1)
;font size
(set-default-font "8x13")


;--- BEGIN COLORING ---
; By:     Richard Shiao
; Date:   2000/06/01
; Source: www.geocities.com/IntroToEECS

(setq default-frame-alist  
      (append default-frame-alist  
              '((top                  .            0)
                (left                 .            0)
                (width                .            138)
                (height               .            47)
                (vertical-scroll-bars .            right)
                (foreground-color     .            "Black")
                (background-color     .            "white")
                (cursor-color         .            "CornflowerBlue"))))

(set-face-foreground 'font-lock-builtin-face       "deep sky blue")
(set-face-foreground 'font-lock-comment-face       "green4")
(set-face-foreground 'font-lock-constant-face      "maroon1")
(set-face-foreground 'font-lock-function-name-face "grey38")
(make-face-bold      'font-lock-function-name-face)
(set-face-foreground 'font-lock-keyword-face       "blue4")
(set-face-foreground 'font-lock-string-face        "red1")
(set-face-foreground 'font-lock-type-face          "DeepPink1")
(set-face-foreground 'font-lock-variable-name-face "purple4")
(set-face-foreground 'font-lock-warning-face       "firebrick1")
(make-face-bold      'font-lock-warning-face)
(set-face-foreground 'bold                         "salmon3")
(set-face-background 'bold                         "Navy")
(set-face-foreground 'bold-italic                  "darkorange4")
(set-face-background 'bold-italic                  "DarkGoldenrod2")
(set-face-foreground 'highlight                    "cyan1")
(set-face-background 'highlight                    "green1")
(set-face-foreground 'italic                       "seagreen2")
; (set-face-foreground 'modeline                     "yellow")
;(set-face-background 'modeline                     "DarkRed")
;(make-face-bold      'modeline)
(set-face-foreground 'region                       "orange4")
(set-face-background 'region                       "plum2")
(set-face-background 'secondary-selection          "DarkFirebrick")
;(set-face-background 'show-paren-match-face        "DarkBlue")

; "... Down with the Red and White!
;  California's out for a victory..."
;  From: The "Stanfurd Jonah" Fight Song
;        Ted Haley, Class of 1915
; Following settings signal a parentheses error.
;(set-face-background 'show-paren-mismatch-face     "Red")
;(set-face-foreground 'show-paren-mismatch-face     "Black")
;(make-face-bold      'show-paren-mismatch-face)

; Calendar highlighting colors
(setq calendar-load-hook
      '(lambda ()  
         (set-face-foreground 'diary-face          "MediumBlue")
         (set-face-background 'holiday-face        "SlateBlue")
         (set-face-foreground 'holiday-face        "DarkBrown")))

;--- END COLORING ---

; Title Bar (%f is file name, %b is buffer name)
; Original title follows, but is too long, so I'm using the alternate below.
;(setq-default frame-title-format
;              (list "Richard's Emacs" emacs-version "("
;                    invocation-directory invocation-name "@" system-name
;                    ")- %f"))
(setq-default frame-title-format "Emacs - %b")


; Icon Bar
(setq-default icon-title-format "Emacs - %b")

; Show name of current function in modeline
(which-func-mode t)

; Show column number in modeline
(setq column-number-mode t)

; If I want to show clock in modeline for some reason
; even though there is a clock in the lower right hand corner...
;(setq display-time-24hr-format nil)
;(setq display-time-day-and-date t)
;(display-time)
;---------------------------------------------------------------------------


;--- Program Behavior  -----------------------------------------------------
; By:     Richard Shiao
; Date:   2000/06/01
; Source: www.geocities.com/IntroToEECS

; Use text mode as default
(setq default-major-mode 'text-mode)

; Number of kills to keep in memory
(setq kill-ring-max 50)

; Autosave every n characters typed
; Default is 300
(setq auto-save-interval 500)

; Use Transient mark mode
(setq transient-mark-mode '1)

; Use Auto Fill word wrapping
(add-hook 'text-mode-hook 'turn-on-auto-fill)

; Column beyond which to do word wrap
(setq-default fill-column 120)
;(setq fill-column 120)

; If I decide I actually don't want word wrapping...
;  (hscroll-global-mode t)

; Scroll down 1 line at a time rather than a huge section
(setq scroll-step 1)

; Don't add more lines when scrolling past end of buffer  
(setq next-line-add-newlines nil)

; Resize mini-buffer automatically
;(resize-minibuffer-mode)
;(setq resize-minibuffer-window-exactly nil)

; Substitute yes/no responses to y/n
(fset 'yes-or-no-p 'y-or-n-p)

; Set tab-width
(setq tab-width 5)

; Substitute tabs with spaces, since some programs can't read tabs correctly
(setq-default indent-tabs-mode nil)

(defun my-c++-indent-setup ()
  (setq-default tab-width 4)
  (c-set-style "ellemtel")
  (setq c-basic-offset 4)
  (setq indent-tabs-mode nil))
;  (setq c-auto-newline 1))

(add-hook 'c++-mode-hook 'my-c++-indent-setup)


; Make searches non-case-sensitive
(set-default 'case-fold-search t)

; End files with the newline character
(setq require-final-newline t)
;---------------------------------------------------------------------------


;--- Key Bindings ----------------------------------------------------------
; By:     Richard Shiao
; Date:   2000/06/01
; Source: www.geocities.com/IntroToEECS

;-- Setting:
; Use PC-style key bindings and selection
;(pc-bindings-mode)
;(pc-selection-mode)

; Shift-Tab completes words
(global-set-key [S-iso-lefttab] 'dabbrev-completion)

; Delete key deletes forward
(setq delete-key-deletes-forward t)

; C-Backspace deletes word
(global-set-key [\C-backspace] 'backward-kill-word)

; C-PageUp/PageDown scrolls the other buffer
(global-set-key [C-next] 'scroll-other-window)
(global-set-key [C-prior] 'scroll-other-window-down)

; Page Up and Down remembers cursor position
(setq scroll-preserve-screen-position t)

; C-c * shortcuts
(global-set-key "\C-cx"    "\C-w")                  ; cut
(global-set-key "\C-c\C-x" "\C-w")                  ; cut
(global-set-key "\C-cc"    "\C-w\C-y")              ; copy
(global-set-key "\C-c\C-c" "\C-w\C-y")              ; copy
(global-set-key "\C-cv"    "\C-y")                  ; paste
(global-set-key "\C-c\C-v" "\C-y")                  ; paste
(global-set-key "\C-ca"    [C-home C-S-end])        ; select all
(global-set-key "\C-c\C-a" [C-home C-S-end])        ; select all
(global-set-key "\C-cw"    'compare-windows)        ;
(global-set-key "\C-cg"    'goto-line)              ;
(global-set-key "\C-ci"    'indent-region)          ;
(global-set-key "\C-c\C-e" 'center-line)            ;
(global-set-key "\C-co"    'comment-region)         ;
(global-set-key "\C-cb"    'universal-argument)     ; I use this for S-f8 below
                                         

; Function Keys
(global-set-key [f1]    'help)                      ;
(global-set-key [S-f1]  'man)                       ;

(global-set-key [f2]    'save-buffer)               ;
; Shift f2              'see function below         ; saves all buffers
(global-set-key [f3]    'find-file)                 ; open new or existing file
; Shift f3              'see function below         ; opens .emacs file
(global-set-key [f4]    'kill-buffer)               ; close current file
;(global-set-key [S-f4]  [?\S-f2 ?\M-f4])            ; save-all and quit ********************

(global-set-key [f5]    'compile)                   ;
(global-set-key [S-f6]  'first-error)               ;
(global-set-key [C-f6]  'previous-error)            ;
(global-set-key [f6]    'next-error)                ;
(global-set-key [f7]    'goto-line)                 ;
(global-set-key [f8]    'comment-region)            ;
(global-set-key [S-f8]  'uncomment-region)          ;
(fset 'uncomment-region
   [?\C-c ?b f8]) ; dependent on C-c b defintion for universal-argument
                  ; (see C-c definitions above)


(global-set-key [f9]    'indent-region)             ;

(global-set-key [f10]   'delete-other-windows)      ;
(global-set-key [S-f10] 'split-window-vertically)   ;
(global-set-key [C-f10] 'split-window-horizontally) ;

(global-set-key [f11]   'other-window)

; F12                   'see function below         ; toggles kbd macro recording
(global-set-key [S-f12] 'name-last-kbd-macro)       ;
(global-set-key [C-f12] 'call-last-kbd-macro)       ;


; I don't need these...
;(global-set-key [f9]    'new-frame)
;(global-set-key [S-f9]  'delete-frame)
;(global-set-key [C-f9]  'delete-window)


;-- Unsetting: (Things I don't use, but may press by mistake)
(global-unset-key "\C-xf")
(global-unset-key "\C-x\C-k")
(global-unset-key "\C-t")
(global-unset-key "\C-a")
(global-unset-key "\C-q")
(global-unset-key [S-backspace]) ;;;;;;;;;;;;;;;;;;;; doesn't work yet

;-- Resetting:
(global-set-key "\C-x\C-b" 'buffer-menu)            ; opens in same window
(global-set-key "\C-z" 'undo)                       ; used to the pc binding
;(global-set-key "\C-s" 'save-buffer)                ; convenient
;(global-set-key "\C-xs" 'save-buffer)               ; convenient
;---------------------------------------------------------------------------


;--- Mouse -----------------------------------------------------------------
; By:     Richard Shiao
; Date:   2000/06/01
; Source: www.geocities.com/IntroToEECS
; Mouse-1 takes over Mouse-2:

; Drag scroll bar with Mouse-1
(global-set-key [vertical-scroll-bar down-mouse-1] 'scroll-bar-drag)

; Select from the completion list with Mouse-1
(add-hook 'completion-list-mode-hook
  '(lambda() (define-key completion-list-mode-map [down-mouse-1]  
               'mouse-choose-completion)))

; Select from the Buffer Menu with Mouse-1
(add-hook 'buffer-menu-mode-hook
  '(lambda() (define-key Buffer-menu-mode-map [down-mouse-1]  
               'Buffer-menu-mouse-select)))

; Mouse-2 shows context sensitive menu
(define-key global-map [mouse-2] 'mouse-major-mode-menu)
;---------------------------------------------------------------------------



;--- Mail ------------------------------------------------------------------
; By:     Richard Shiao
; Date:   2000/06/01
; Source: www.geocities.com/IntroToEECS

; Aliases are stored in `~/.mailrc' in this format:
;    alias me IntroToEECS@yahoo.com
; Turn on aliases
(setq mail-aliases t)
;---------------------------------------------------------------------------



;--- Snippet Functions follow: ---------------------------------------------
; By:     Richard Shiao
; Date:   2000/06/01
; Source: www.geocities.com/IntroToEECS

; You can copy and paste them to your .emacs file.
; Just make sure there are no key-binding conflicts with
; other parts of your file.  It's a good idea to keep these
; snippets intact.


;--- "Open .emacs with Shift-f3" -------------------------------------------
;     By: Richard Shiao
;     Description: Opens the init file .emacs with S-f3
;     Modified: Richard Shiao 2000/06/03
;---------------------------------------------------------------------------
(defun open-dot-emacs ()
  "Opening .emacs"
  (interactive) ;this makes the function a command too
  (find-file "~/RSemacs.emacs"))

(global-set-key [S-f3]  'open-dot-emacs)

;******************************************************************************************
;--- "Toggle Keyboard Macro Recording with f12" ----------------------------
;     By: Richard Shiao
;     Description: Starts and ends keyboard macro recording
;     Modified: Richard Shiao 2000/06/05
;---------------------------------------------------------------------------
; (fset 'start [?\C-x ?\(])
; (fset 'end   [?\C-x ?\)])

; (defvar recording-kbd-macro nil) ; Initially recording is not on.
; (defun toggle-kbd-macro-recording ()
;   "Toggle keyboard macro recording."
;   (interactive) ; Makes the function a command too
;   (if recording-kbd-macro
;       (end-kbd-macro)
;       (start-kbd-macro))
;   (setq recording-kbd-macro (not recording-kbd-macro)))
; Toggle truncate lines
;;; Toggle line wrapping buffer locally
(setq-default truncate-lines t)

; (global-set-key [f12]  'toggle-kbd-macro-recording)


;--- "Buffer Switching" ----------------------------------------------------
;     By:       Young-il Choo
;     Original: yic-buffer.el
;     From:     choo@cs.yale.edu (young-il choo)
;     Date:     1990/08/07
;     (Modified)
;---------------------------------------------------------------------------
(global-set-key [\C-tab] 'yic-next-buffer)
(global-set-key [\C-\S-tab] 'yic-prev-buffer)
; The above line doesn't seem to apply anymore... Richard Shiao 2000/06/02
; Emacs just beeps.

(defun yic-ignore (str)
  (or
   ;;buffers I don't want to switch to  
   (string-match "\\*Buffer List\\*" str)
   (string-match "^TAGS" str)
   (string-match "^\\*Messages\\*$" str)
   (string-match "^\\*Completions\\*$" str)
   (string-match "^ " str)

   ;;Test to see if the window is visible on an existing visible frame.
   ;;Because I can always ALT-TAB to that visible frame, I never want to  
   ;;Ctrl-TAB to that buffer in the current frame.  That would cause  
   ;;a duplicate top-level buffer inside two frames.
   (memq str                 
         (mapcar  
          (lambda (x)  
            (buffer-name  
             (window-buffer  
              (frame-selected-window x))))
          (visible-frame-list)))
   ))

(defun yic-next (ls)
  "Switch to next buffer in ls skipping unwanted ones."
  (let* ((ptr ls)
         bf bn go
         )
    (while (and ptr (null go))
      (setq bf (car ptr)  bn (buffer-name bf))
      (if (null (yic-ignore bn))        ;skip over
   (setq go bf)
        (setq ptr (cdr ptr))
        )
      )
    (if go
        (switch-to-buffer go))))

(defun yic-prev-buffer ()
  "Switch to previous buffer in current window."
  (interactive)
  (yic-next (reverse (buffer-list))))

(defun yic-next-buffer ()
  "Switch to the other buffer (2nd in list-buffer) in current window."
  (interactive)
  (bury-buffer (current-buffer))
  (yic-next (buffer-list)))
;---------------------------------------------------------------------------


;--- "Saving the Emacs Desktop" --------------------------------------------
;     By:         Richard Shiao
;     Purpose:    Open files from last session upon starting.
;     Note:       Keep this function at the bottom to avoid any
;                 potential improper overwriting.
;     Note:       First time saving desktop, you'll need to use
;                 M-x desktop-save
;---------------------------------------------------------------------------
(load "desktop")
(desktop-load-default)
(desktop-read)
;---------------------------------------------------------------------------

;(add-to-list 'load-path (expand-file-name "~/files/xae-1.0beta8/lisp"))
;(require 'xae)


; If execution reaches the end, then success!
(message "                                                    ")
(message "    <----<---<--<-<<  YES!!! >>->-->--->---->       ")
(message "..... The file .emacs has loaded successfully! .....")
(message "                                                    ")



;Add matlab funtionality

(autoload 'matlab-mode "~/matlab.el" "Enter Matlab mode." t)
(setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))
(autoload 'matlab-shell "~/matlab.el" "Interactive Matlab mode." t) 


;add processing
(add-to-list 'load-path "~/Downloads/processing-2.1.2/processing2-emacs/")
(autoload 'processing-mode "processing-mode" "Processing mode" t)
(add-to-list 'auto-mode-alist '("\\.pde$" . processing-mode))

;Add the following to set up processing snippets for yasnippet:
;(autoload 'processing-snippets-initialize "processing-snippets" nil nil nil)
;(eval-after-load 'yasnippet '(processing-snippets-initialize))


;Add json
(autoload 'espresso-mode "~/espresso.el" "Start espresso-mode" t)
(add-to-list 'auto-mode-alist '("\\.js$" . espresso-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . espresso-mode))

;Save backups in onle folder
(setq backup-directory-alist'((""."~/.emacs.d/backup")))

;=== end of file ===========================================================



(defun dos-unix ()
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))
(defun unix-dos ()
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\n" nil t) (replace-match "\r\n")))

     (defun up-slightly () (interactive) (scroll-up 5))
      (defun down-slightly () (interactive) (scroll-down 5))
      (global-set-key [mouse-4] 'down-slightly)
      (global-set-key [mouse-5] 'up-slightly)
      
      (defun up-one () (interactive) (scroll-up 1))
      (defun down-one () (interactive) (scroll-down 1))
      (global-set-key [S-mouse-4] 'down-one)
      (global-set-key [S-mouse-5] 'up-one)
      
      
      (defun up-a-lot () (interactive) (scroll-up))
      (defun down-a-lot () (interactive) (scroll-down))
      (global-set-key [C-mouse-4] 'down-a-lot)
      (global-set-key [C-mouse-5] 'up-a-lot)
