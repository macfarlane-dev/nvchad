# Lessons on Vim

These notes shall record key learnings which are otherwise not recorded in the ReadMe or native documentation.

### Help!

Some plugins like nvim-tree have hidden help.
Use `g?` while the cursor is focused on a plugin window for related keybindings.

### Escaping INSERT and TERMAINAL mode fast is a jk

As an alternative to `<ESC>` we provide a shortcut `jk` to escape INSERT and TERMINAL mode.

### Navigation

Nvim-tree is a useful navigational aid, but it is not the most efficient way.
You will be more efficient if you can get used to searching files, e.g. `<space>fg`.

### Text completion

NvChad provides the plugin `hrsh7th/nvim-cmp` as a dependency for completion.
In Insert mode, use `<C-space>` to get suggested completions. 

### Multiline Editing

1. `<C-q>` OR `<A-left click>`, select rows 
2. `I`, begin editing one row
3. `Esc`, apply changes to all rows

### Terminal management

Toggle a single terminal open and closed with `<Alt-v>`. 
Spawn new terminals with `<leader>v`.
In **TERMINAL** mode, use `<ESC>` or `jk` to enter **NTERMINAL** mode.

### Markdown tabs and indentation

In insert mode:
* `<C-d>` deletes indentation at the start of the line
* `<C-t>` adds indentation at the start of the line

### Increment and Decrement Numbers

* `<C-a>` increments the number under the cursor or the first occurrence of a number to the right of the cursor
* `<C-x>` decrements the number under the cursor or the first occurrence of a number to the right of the cursor

### Paste-replacing a visual selection

`shift + p` or `P` replaces the visually selected block with the default register.

[Read more here](https://learnbyexample.github.io/tips/vim-tip-1/).

### Format text width

1. Set textwidth to 80 (`:set textwidth=80`)
2. Make a selection
	* *Whole file:* move to the start of the file (can be done with Ctrl-Home or `gg`), and type `gqG`.
	* *Visual selection*: `gq`

### Extend visual selections

`o` toggles if a visual selection extends from the top or bottom of the selection.

### Checking file type

`:set filetype?`
