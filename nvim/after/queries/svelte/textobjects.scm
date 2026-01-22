; extends

; Svelte-specific text objects
; based on grammar defined at
; https://github.com/tree-sitter-grammars/tree-sitter-svelte

; for this to take effect, link to the correct path, e.g if using lazy-vim & nvim-treesitter-textobjects:

; ```
; ln -s path/to/this/file ~/.local/share/nvim/lazy/nvim-treesitter-textobjects/queries/svelte/textobjects.scm
; ```

; For tree-sitter grammar and query documentation, see:
; https://tree-sitter.github.io/tree-sitter/index.html

; directives
(attribute
  (attribute_name) @_name
  (expression)? @svelte.directive.inner
  (#match? @_name "^(bind|use|transition|in|out|animate|style|class):.*$")) @svelte.directive.outer

; if block
(if_statement
  (if_start)
	_* @svelte.if.inner @svelte.block.inner @conditional.inner
  (if_end)
) @svelte.if.outer @svelte.block.outer @conditional.outer

; each block
(each_statement
  (each_start)
	_* @svelte.each.inner @svelte.block.inner @loop.inner
  (each_end)
) @svelte.each.outer @svelte.block.outer @loop.outer

; key block
(key_statement
  (key_start)
	_* @svelte.block.inner @svelte.key.inner
  (key_end)
) @svelte.block.outer @svelte.key.outer

; await block
(await_statement
  (await_start)
	_* @svelte.block.inner @svelte.await.inner
  (await_end)
) @svelte.block.outer @svelte.await.outer

; snippet block
(snippet_statement
  (snippet_start)
	_* @svelte.block.inner @svelte.snippet.inner
  (snippet_end)
) @svelte.block.outer @svelte.snippet.outer

