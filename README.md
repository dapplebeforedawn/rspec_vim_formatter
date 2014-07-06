# RspecVimFormatter

Allow rspec to output in a format that VIM's quickfix understands:

```
app/controllers/people_controller.rb:5: GET /peopleworks! (now write some real specs): Could not find table 'people'
```

## Installation

I recommend that you install this as a global gem, since choice of editor is a personal preference.

```
$ gem install rspec_vim_formatter
```

## Usage

**Simple Usage**
```sh
bundle exec rspec --format RspecVimFormatter --out quickfix.out --format progress
```

**Like a Baus**
```viml
" ~/.vimrc

" install thoughtbot's `vim-rspec`
Bundle 'thoughtbot/vim-rspec'

" vim-rspec mappings
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>specn :call RunNearestSpec()<CR>
nnoremap <Leader>spec :call RunLastSpec()<CR>
nnoremap <Leader>a :call RunAllSpecs()<CR>

" <leader>t to open the spec output in quickfix
map <leader>k :cg quickfix.out \| cw<cr>

" dump the spec running command into a fifo
let rspec_command = "bundle exec rspec {spec}"
let rspec_options = " --format RspecVimFormatter --out quickfix.out --format progress"
let g:rspec_command = "echom system('echo \"" . rspec_command . rspec_options . "\" >> ~/.wrench')"
```

```sh
mkfifo ~/.wrench
while true; do cmd=`cat ~/.wrench`; clear; date +%s; echo "$cmd"; sh -c "$cmd"; done
```

Now you can `<leader>t`, to run the current spec asynchronously, and `<leader>k` to quickly jump to the failure!

![rspec_vim_formatter]()

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
