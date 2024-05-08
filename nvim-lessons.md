# Lessons on Vim

These notes shall record key learnings which are otherwise not recorded in the ReadMe or native documentation.


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
In **TERMINAL** mode, use `<ESC>` to enter **NTERMINAL** mode.

### Markdown tabs and indentation

In insert mode:
* `<c-d>` deletes indentation at the start of the line
* `<c-t>` adds indentation at the start of the line
