# nvim cheatsheet

Leader is `<Space>`.

Open this file any time with `:e ~/.config/nvim/CHEATSHEET.md`. It renders in the
buffer, so read it here rather than on GitHub.

## Learning

| Key | Does |
|---|---|
| `:Tutor` or `<leader>vt` | The built-in 30 minute lesson. Start here. |
| `<leader>pp` | Toggle the motion hints on the current line |

Precognition draws a mark over every column a motion would land on. Read them as
"if I press this, I go there".

| Mark | Key | Lands on |
|---|---|---|
| `0` | `0` | column 1, indent included |
| `^` | `^` | first non-blank character of the line |
| `$` | `$` | end of the line |
| `w` | `w` | start of the next word |
| `b` | `b` | start of the previous word |
| `e` | `e` | end of the current or next word |
| `⌐` | `%` | the matching bracket |
| `f` `F` `t` `T` | see below | a single character on this line |

None of these take a modifier. `^` is the caret key by itself, it is not Ctrl,
the terminal convention where `^T` means Ctrl-T does not apply here. On the
Latin American layout `^` is a dead key and waits for a second keystroke, so
reach for `0` instead, it is one key everywhere. `_` also works if the indent
matters.

Capital means backwards, lowercase means forwards. `f` `F` `t` `T` are
two-keystroke commands: press `T`, then the character. A hint reads as "press
`F` plus the character under this mark", or for `T`, the character just to its
left. They are drawn dimmer than the word motions on purpose.

Motions combine with operators. `d` delete, `c` change, `y` yank, `v` select.
`dw` deletes to the next word, `c$` changes to end of line, `y%` yanks to the
matching bracket. Add a count in front: `3dw` deletes three words.

`f` and `t` pay off with an operator in front. `dt)` deletes up to the closing
paren, `ct"` changes up to the quote, `yf;` yanks through the semicolon. `;`
repeats the jump, `,` repeats it backwards.

The other one worth learning early: `ci"` changes everything inside the quotes,
from anywhere inside them. Same for `ci(`, `ci{`, and `cit` for an HTML tag. Swap
`c` for `d`, `y` or `v`.

`.` repeats the last change. `u` undoes, `<C-r>` redoes.

## Files and buffers

| Key | Does |
|---|---|
| `<F2>` | Toggle NERDTree |
| `<C-l>` / `<C-h>` | Next / previous buffer |
| `:Files` | fzf over files in the project |
| `:Rg <pattern>` | fzf over ripgrep results |
| `:Buffers` | fzf over open buffers |

vim-rooter sets the working directory to the project root, so `:Files` searches
the repo rather than wherever nvim started.

## LSP

Attached to python (ruff + ty), go, and lua buffers.

| Key | Does |
|---|---|
| `gd` | Go to definition |
| `K` | Hover docs |
| `grn` | Rename symbol |
| `gra` | Code action |
| `grr` | List references |
| `gri` | Go to implementation |
| `grt` | Go to type definition |
| `<C-s>` (insert) | Signature help |
| `df` | Format the buffer |
| `sl` | Show the diagnostic under the cursor |
| `]d` / `[d` | Next / previous diagnostic |
| `<C-Space>` (insert) | Trigger completion |
| `<C-y>` | Accept the completion |

The `gr*` maps are Neovim defaults, not ours. `df` and `sl` shadow the `df{char}`
operator and `s` in LSP buffers.

## Git, and reviewing what an agent changed

| Key | Does |
|---|---|
| `]c` / `[c` | Next / previous changed hunk |
| `<leader>hp` | Preview the hunk under the cursor |
| `<leader>hr` | Reset the hunk, throwing the change away |
| `<leader>hd` | Diff this file against the index |
| `<leader>gd` | Full side-by-side diff (fugitive) |
| `:Git` | Fugitive status, stage with `-` |
| `:Git blame` | Blame in a split |

Claude writes files from the tmux pane next door and the buffer reloads on its
own, with "buffer reloaded from disk" in the message line. `u` still undoes those
edits, and undo survives closing nvim.

## Markdown

| Key | Does |
|---|---|
| `<leader>mr` | Toggle rendering, to edit the raw source |

## Other

| Key | Does |
|---|---|
| `<leader>c<Space>` | Toggle comment on the line or selection |
| `<C-n>` | Multiple cursors, on the word under the cursor |
| `<C-y>,` (insert) | Expand an emmet abbreviation |
