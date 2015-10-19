" tComment.vim -- An easily extensible & universal comment plugin 
" @Author:      Tom Link (micathom AT gmail com)
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     27-Dez-2004.
" @Last Change: 2015-10-02.
" @Revision:    965
" GetLatestVimScripts: 1173 1 tcomment.vim

if &cp || exists('loaded_tcomment')
    finish
endif
let loaded_tcomment = 308

let s:save_cpo = &cpo
set cpo&vim


if !exists('g:tcommentMaps')
    " If true, set maps.
    let g:tcommentMaps = 1   "{{{2
endif

if !exists("g:tcommentMapLeader1")
    " g:tcommentMapLeader1 should be a shortcut that can be used with 
    " map, imap, vmap.
    let g:tcommentMapLeader1 = '<c-_>' "{{{2
endif

if !exists("g:tcommentMapLeader2")
    " g:tcommentMapLeader2 should be a shortcut that can be used with 
    " map, xmap.
    let g:tcommentMapLeader2 = '<Leader>_' "{{{2
endif

if !exists("g:tcommentMapLeaderOp1")
    " See |tcomment-operator|.
    let g:tcommentMapLeaderOp1 = 'gc' "{{{2
endif

if !exists("g:tcommentMapLeaderUncommentAnyway")
    " See |tcomment-operator|.
    let g:tcommentMapLeaderUncommentAnyway = 'g<' "{{{2
endif

if !exists("g:tcommentMapLeaderCommentAnyway")
    " See |tcomment-operator|.
    let g:tcommentMapLeaderCommentAnyway = 'g>' "{{{2
endif

if !exists('g:tcommentTextObjectInlineComment')
    let g:tcommentTextObjectInlineComment = 'ic'   "{{{2
endif


" :display: :[range]TComment[!] ?ARGS...
" If there is a visual selection that begins and ends in the same line, 
" then |:TCommentInline| is used instead.
" The optional range defaults to the current line. With a bang '!', 
" always comment the line.
"
" ARGS... are either (see also |tcomment#Comment()|):
"   1. a list of key=value pairs
"   2. 1-2 values for: ?commentBegin, ?commentEnd
command! -bar -bang -range -nargs=* -complete=customlist,tcomment#CompleteArgs TComment
            \ keepjumps call tcomment#Comment(<line1>, <line2>, 'G', "<bang>", <f-args>)

" :display: :[range]TCommentAs[!] commenttype ?ARGS...
" TCommentAs requires g:tcomment_{filetype} to be defined.
" With a bang '!', always comment the line.
"
" ARGS... are either (see also |tcomment#Comment()|):
"   1. a list of key=value pairs
"   2. 1-2 values for: ?commentBegin, ?commentEnd
command! -bar -bang -complete=customlist,tcomment#Complete -range -nargs=+ TCommentAs 
            \ call tcomment#CommentAs(<line1>, <line2>, "<bang>", <f-args>)

" :display: :[range]TCommentRight[!] ?ARGS...
" Comment the text to the right of the cursor. If a visual selection was 
" made (be it block-wise or not), all lines are commented out at from 
" the current cursor position downwards.
" With a bang '!', always comment the line.
"
" ARGS... are either (see also |tcomment#Comment()|):
"   1. a list of key=value pairs
"   2. 1-2 values for: ?commentBegin, ?commentEnd
command! -bar -bang -range -nargs=* -complete=customlist,tcomment#CompleteArgs TCommentRight
            \ keepjumps call tcomment#Comment(<line1>, <line2>, 'R', "<bang>", <f-args>)

" :display: :[range]TCommentBlock[!] ?ARGS...
" Comment as "block", e.g. use the {&ft}_block comment style. The 
" commented text isn't indented or reformated.
" With a bang '!', always comment the line.
"
" ARGS... are either (see also |tcomment#Comment()|):
"   1. a list of key=value pairs
"   2. 1-2 values for: ?commentBegin, ?commentEnd
command! -bar -bang -range -nargs=* -complete=customlist,tcomment#CompleteArgs TCommentBlock
            \ keepjumps call tcomment#Comment(<line1>, <line2>, 'B', "<bang>", <f-args>)

" :display: :[range]TCommentInline[!] ?ARGS...
" Use the {&ft}_inline comment style.
" With a bang '!', always comment the line.
"
" ARGS... are either (see also |tcomment#Comment()|):
"   1. a list of key=value pairs
"   2. 1-2 values for: ?commentBegin, ?commentEnd
command! -bar -bang -range -nargs=* -complete=customlist,tcomment#CompleteArgs TCommentInline
            \ keepjumps call tcomment#Comment(<line1>, <line2>, 'I', "<bang>", <f-args>)

" :display: :[range]TCommentMaybeInline[!] ?ARGS...
" With a bang '!', always comment the line.
"
" ARGS... are either (see also |tcomment#Comment()|):
"   1. a list of key=value pairs
"   2. 1-2 values for: ?commentBegin, ?commentEnd
command! -bar -bang -range -nargs=* -complete=customlist,tcomment#CompleteArgs TCommentMaybeInline
            \ keepjumps call tcomment#Comment(<line1>, <line2>, 'i', "<bang>", <f-args>)

let &cpo = s:save_cpo
unlet s:save_cpo
" vi: ft=vim:tw=72:ts=4:fo=w2croql
