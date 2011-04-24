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
  if !exists("s:old_hloverlength")
    :redir => s:old_hloverlength
    :silent! :hi OverLength
    :redir END
    :hi clear OverLength
    echo "OverLength Disabled!"
  else
    let s:old_hloverlength="ctermcfg=15 ctermbg=12 guibg=#592929"
    :hi OverLength ctermbg=red ctermfg=white guibg=#592929
    unlet s:old_hloverlength
    echo "OverLength Enabled!"
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
