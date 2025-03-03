; inherits: html

; Svelte-specific text objects
; based on grammar defined at
; https://github.com/tree-sitter-grammars/tree-sitter-svelte

; for this to take effect, link to the correct path, e.g if using lazy-vim & nvim-treesitter-textobjects:

; ```
; ln -s path/to/this/file ~/.local/share/nvim/lazy/nvim-treesitter-textobjects/queries/svelte/textobjects.scm
; ```

; directives
(attribute
  (attribute_name) @_name
  (expression)? @svelte.directive.inner
  (#match? @_name "^(bind|use|transition|in|out|animate|style|class):.*$")) @svelte.directive.outer

; if block
(if_statement) @svelte.block.outer @svelte.if.outer @conditional.outer

(if_statement
  (if_start)
  .
  (_) @_start
  (_)? @_end
  .
  (if_end)
  (#make-range! "svelte.block.inner" @_start @_end)
  (#make-range! "svelte.if.inner" @_start @_end)
  (#make-range! "conditional.inner" @_start @_end))

; each block
(each_statement) @svelte.block.outer @svelte.each.outer @loop.outer

(each_statement
  (each_start)
  .
  (_) @_start
  (_)? @_end
  .
  (each_end)
  (#make-range! "svelte.block.inner" @_start @_end)
  (#make-range! "svelte.each.inner" @_start @_end)
  (#make-range! "loop.inner" @_start @_end))

; key block
(key_statement) @svelte.block.outer @svelte.key.outer

(key_statement
  (key_start)
  .
  (_) @_start
  (_)? @_end
  .
  (key_end)
  (#make-range! "svelte.block.inner" @_start @_end)
  (#make-range! "svelte.key.inner" @_start @_end))

; await block
(await_statement) @svelte.block.outer @svelte.await.outer

(await_statement
  (await_start)
  .
  (_) @_start
  (_)? @_end
  .
  (await_end)
  (#make-range! "svelte.block.inner" @_start @_end)
  (#make-range! "svelte.await.inner" @_start @_end))

; snippet block
(snippet_statement) @svelte.block.outer @svelte.snippet.outer

(snippet_statement
  (snippet_start)
  .
  (_) @_start
  (_)? @_end
  .
  (snippet_end)
  (#make-range! "svelte.block.inner" @_start @_end)
  (#make-range! "svelte.snippet.inner" @_start @_end))


