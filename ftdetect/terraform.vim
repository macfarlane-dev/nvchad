autocmd BufRead,BufNewFile *.tf,*.tfvars setfiletype terraform
autocmd BufRead,BufNewFile *.hcl setfiletype hcl
autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup setfiletype json
autocmd BufRead,BufNewFile .terraformrc,terraform.rc setfiletype hcl
