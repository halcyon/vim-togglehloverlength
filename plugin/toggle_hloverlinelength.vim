"
" Toggle comments plugin for quickly toggling comments variable on and off
" Maintainer:   Scott McLeod <halcyonblue@gmail.com>
" Version:      Vim 7 (may work with lower Vim versions, but not tested)
" URL:          http://github.com/halcyon/vim-togglecomments
"
" Only do this when not done yet for this buffer

if exists("b:loaded_toggle_hloverlinelength")
    finish
endif
let b:loaded_toggle_hloverlinelength = 1

fun! s:ToggleHlOverLength()
  if !exists("s:hloverlength")
    let s:hloverlength="ctermbg=red ctermfg=white guibg=#592929"
    exec "hi OverLength ".s:hloverlength
    match OverLength /\%78v.\+/
    echo "OverLength Enabled!"
  else
    unlet s:hloverlength
    hi clear OverLength
    echo "OverLength Disabled!"
  endif
endfunction

" Add mappings, unless the user didn't want this.
" The default mapping is registered under to <F10> by default, unless the user
" remapped it already (or a mapping exists already for <F10>)
"
if !exists("no_plugin_maps") && !exists("no_toggle_comments_maps")
    if !hasmapto('<SID>ToggleComments()')
        noremap <F11> :call <SID>ToggleHlOverLength()<CR>
        inoremap <F11> <Esc>:call <SID>ToggleHlOverLength()<CR>
    endif
endif

"command TC :call <SID>ToggleHlOverLength()
