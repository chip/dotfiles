# Updates to environment

See README for details

# Configuration files

* Files that should be symlinked to ~/code/dotfiles are located in `~/.config/nvim`

* Plugins are located in `~/.local/share/nvim/plugged`

* See `aliases` for shortcuts.

# Help

## Follow link under keywords

  <C-]>

# Changing text

## Change until

ct

## Change until colon, including it

ct:

## Change until colon, not including it

cf:

## Change until the end of the line

c$

## Change until the end of the line (shorthand)

C

## Change line, remove character under cursor first

cl

## Change line, remove character under cursor first (shorthand)
# https://vimgifs.com/s://vimgifs.com/s/

s

## Change until the end of the line, but move to beginning of text first
^C

## Change until the end of the line, but move to beginning of text first (shorthand)
# https://vimgifs.com/s://vimgifs.com/s/

S

## Enter Insert mode, but move to beginning of text first

^i

## Enter Insert mode, but move to beginning of text first (shorthand)

I

## Enter Insert mode after cursor

a

# Movement

## Go back to the beginning of a word

b

## Go back to the beginning of a word (separated by whitespace)

B

## Go back to the end of a word

ge

## Go back to the end of a word (separated by whitespace)

gE

## Go to the end of a word

e

## Go to the end of a word (separated by whitespace)

E

## Searches for a character

f

## like f, but searches until that character

t

## Remembers the last search

;

## Last search in reverse

### Holy crap there are uppercase counterparts, yes!

## Same as f, but searches backwards, son!

F

## Same as t, but searches backwards, son!

T

## Find text

?

## Screen Navigation

## High part of screen

H

## Middle part of screen

M

## Low part of screen

L

## Up paragraph

{

## Down paragraph

}

## Move up half a page

<C-u>

## Move down half a page

<C-d>

## Scroll down a bit

<C-e>

## Scroll up a bit

<C-y>

## Move between enclosing (e.g., parens, braces)

%

# Buffers

## Help

:h bufdo

## Help grep

:helpg pattern

## Show buffers

:ls

## Show unlisted buffers

:ls!

## Go to buffer 4

:b4

## auto-complete buffer names

:b <tab>  

# Delete all buffers

:%bd

# Misc

insert mode <C-x><C-l> will finish a line

use <C-k>, <C-j> within CtrlP plugin to go up/down the matching files

# Folding

## Help

:h folds

## Vimcast http://vimcasts.org/episodes/how-to-fold/

zi     switch folding on or off
Space  toggle current fold open/closed
zc     close current fold
zR     open all folds
zM     close all folds
zv     expand folds to reveal cursor

# Quickfix window

## Show quickfix help in only 1 window

:h quickfix | only

# Search

## Set highlight search

:set hlsearch

## forward cycle through search matches

*

## backward cycle through search matches
#

## Search for term without word boundary

G*

## Goes to next search term

n

## Goes to previous search term

N

# Quick Fix menu

:copen

# Windows

## Close split window

<C-wo>

## Move to previous window

<C-wp>

## Cycle windows

<C-w><C-w>

## Window movement

### Move up 

<C-w>Shift-k

### Move down 

<C-w>Shift-j

### Move left 

<C-w>Shift-h

### Move right 

<C-w>Shift-l


# Motion

## Motion help

:h motion.txt

# Marks

## List marks

:marks

## Set a mark for a

ma

## Go to mark a

'a

## Go back to last mark

''

# Visual mode

## Perform last visual selection

gv

## Match within visual selection

:help \%V


# Expression registers

http://vimcasts.org/episodes/simple-calculations-with-vims-expression-register/

<C-r>=

# Paste from insert mode

http://vimcasts.org/episodes/pasting-from-insert-mode/

<C-r><C-o>


# Argslist

http://vimcasts.org/episodes/meet-the-arglist/

## Show the args

:args

## Repeat last substitute command without flags (see :h substitute)

:&

## Repeat last substitute globally

:&g

## Repeat last substitute with flags

:&&


## Matches at any position, and sets the start of the match there

http://vimcasts.org/episodes/project-wide-find-and-replace/

:help /\zs

# Replace mode
# https://vimgifs.com/r/

R

# Change list

:changes
:h changes
:h changelist

## Navigate to the next change

g;

## Navigate to the previous change

g,

## Go to the last insert mode position

gi

## Operate on regions of text that match the current search pattern

http://vimcasts.org/episodes/operating-on-search-matches-using-gn/

:h gn

# Jump list

:jumps
:h jumps
:h jumplist
:h jump-motions

## Go back

<C-o>

## Go forward

<C-i>

# Macros

:h q

## Record a macro

q{register}

## Stop recording

q

## Inspect macro registers

:reg

http://vimcasts.org/episodes/using-vims-named-registers/

## Play a macro

@{register}

## Insert contents of let variable during macro (see tip #60 of Practical Vim)

I<C-R>i<Enter>

# Argdo

## Run macro 'a' in normal mode

:argdo normal @a

## Normal mode help

:h :normal

## Revert changes for all files in the argslist

:argdo edit!

## Update all files in the argslist

:argdo update

## Suppress errors

:silent argdo command


# Regular Expressions

## Use pattern matching similar to Perl, Ruby. "very" magic.

\v

## Just prefix the regex with \v

/\v## Change/

## Use the "very nomagic" search to turn off special meaning for . and * and ?

\V

## Search for a.k.a without escaping

/\Va.k.a/

## Search for pattern 'lang', but place cursor at the end of the match

/lang/e

# ctags

## jsctags

https://github.com/mozilla/doctorjs

# Autocompletion

## Next match (Down arrow, or)

<C-n>

## Previous match (Up arrow, or)

<C-p>

## Accept match (press Enter, or)

<C-y>

## Exit match

<C-e>

# netrw plugin

## Explore files from directory of current file

:E

## Create file

%

## Create directory

d

# Wrapped lines

## Go to start of wrapped line (not numbered line)

g0

## Go to end of wrapped line (not numbered line)

g$

## Go down to next wrapped line (not numbered line)

gj

## Go up to next wrapped line (not numbered line)

gk

# visual block mode

http://vimcasts.org/episodes/selecting-columns-with-visual-block-mode/

## Alter opposite end of visual selection

o

# Command-line window

## Show window of commands

q:

## Show window of searches

q/

# Get output from external script via "read-bang" Ex command

http://vimcasts.org/episodes/evaluating-scripts-with-vims-expression-register/

:read !ruby fake-credentials.rb
:r !ruby fake-credentials.rb

# Access the system clipboard

http://vimcasts.org/episodes/accessing-the-system-clipboard-from-vim/

## Copy

### Copy the text specified by {motion} into the system clipboard

"+y{motion}

## Paste

### Ex command puts contents of system clipboard on a new line

+p

## Paste Help

:h quoteplus

# Named mappings

:h using-<Plug>

# Map examples

:h map-examples

# External filter

http://vimcasts.org/episodes/using-external-filter-commands-to-reformat-html/

:h filter

:h range

# Snippets

http://vimcasts.org/episodes/meet-ultisnips/

# Quit vim and write file if changes have been made
#
# https://vimgifs.com/ex-x/

:x

(better than :wq)


# View all sourced scripts when you load vim
#
# https://vimgifs.com/ex-scriptnames/

:scriptnames
:scr

# Show an exhaustive list of ex commands
#
# https://vimgifs.com/ex-exusage/

:exu
:exusage

# Jump to the matching (, [, or {.

%

# Show exhaustive list of ex commands

:h holy-grail

# Delete word under cursor while in insert mode
https://vimgifs.com/i_CTRL-W/

# Delete from beginning of line to the cursor while in insert mode
https://vimgifs.com/i_CTRL-U/

# Wrap list with tags
https://vimgifs.com/wrap-list/

# Align text
https://vimgifs.com/alignment/

# Jump to definition
<space>gd 

# Lower case word (g works with many motion commands)
guw

# Upper case word (g works with many motion commands)
gUw
