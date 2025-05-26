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
* `g<C-a>` over a visual block of numbers to automatically increment each line

### Paste-replacing a visual selection

`shift + p` or `P` replaces the visually selected block with the default register.

[Read more here](https://learnbyexample.github.io/tips/vim-tip-1/).

### Format text width

1. Set textwidth to 80 (`:set textwidth=80`)
2. Make a selection
	* *Whole file:* move to the start of the file (can be done with Ctrl-Home or `gg`), and type `gqG`.
	* *Visual selection*: `gq`

### Format JSON buffer

The generic solution for any VIM environment with jq installed: `:%!jq '.'`
`ftdetect/json.vim` sets up jq as the formatter for any json files.
Call the default formatter for any file with `gq` and a motion, e.g. `gq%`.


### Extend visual selections

`o` toggles if a visual selection extends from the top or bottom of the selection.

### Checking file type

`:set filetype?`

## Registers

* `:help registers`
* Insert mode: `Ctrl-r <register>`
* Visual mode: `"<register>`
* Find registers with `:reg` or `<leader>f"`
* `""` Last yank/delete/change/substitute
* `"0` Last yank
* `"1` Last delete
* `"2` - `"9` History of deletes
	* Delete modifiers like	`%`, `(`, ```, `/`, `?` and `n` are excluded
* `"-` 'Small delete register' last delete not containing a new line
* `"a` - `"z` Used for `q` macros
	* Rather than recording a macro `qa`, insert the existing register contents and rewrite it with `:let @a='<Ctrl-r a>'`
* `".` Last insert Mode
* `":` Last command
* `"/` Last search
	* Useful to insert a search into a replace command
* `"%` Current file
	* `:help filename-modifiers` to split filename parts
* `:#` Previous file name
	* `Ctrl-6` navigates to this file
* `"=` Opens a command prompt, the results of which will be inserted
	* Useful as a calculator! `=24*17`
	* List files in a directory `=system('ls ~/my/dir')`
	* Generate a random name `=system('fancy')`
* `"_` Black hole register - delete into this to have no record
* `"*` or `"+` OS clipboard
	* By default, only yanks in vim populate `"+`
	* `set clipboard+=unnamedplus` in vim init will ALWAYS use the clipboard for all operators
	* See `:help clipboard` for OS specific clipboard help

## Reverse the line order of a whole file

```vim
:global/^/move 0
:g/^/m 0
```

## Return to your previous line

- ... after `G` or `gg` with `Ctrl+o`
- and go forwards with `Ctrl+i`
- these can move though your whole view history
