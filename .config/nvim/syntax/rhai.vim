" Vim syntax file
" Language:     Rhai
" Maintainer:   Luc Roobrouck
" Last Change:  Apr 12, 2021

if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

" Syntax definitions {{{1
" Basic keywords {{{2
syn keyword   rhaiConditional switch if else
syn keyword   rhaiRepeat for loop while
syn keyword   rhaiTypedef type nextgroup=rhaiIdentifier skipwhite skipempty
syn keyword   rhaiStructure struct enum nextgroup=rhaiIdentifier skipwhite skipempty
syn keyword   rhaiUnion union nextgroup=rhaiIdentifier skipwhite skipempty contained
syn match rhaiUnionContextual /\<union\_s\+\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*/ transparent contains=rhaiUnion
syn keyword   rhaiOperator    as

syn match     rhaiAssert      "\<assert\(\w\)*!" contained
syn match     rhaiPanic       "\<panic\(\w\)*!" contained
syn keyword   rhaiKeyword     break
syn keyword   rhaiKeyword     box nextgroup=rhaiBoxPlacement skipwhite skipempty
syn keyword   rhaiKeyword     continue
syn keyword   rhaiKeyword     extern nextgroup=rhaiExternCrate,rhaiObsoleteExternMod skipwhite skipempty
syn keyword   rhaiKeyword     fn nextgroup=rhaiFuncName skipwhite skipempty
syn keyword   rhaiKeyword     in impl let
syn keyword   rhaiKeyword     pub nextgroup=rhaiPubScope skipwhite skipempty
syn keyword   rhaiKeyword     return
syn keyword   rhaiSuper       super
syn keyword   rhaiKeyword     unsafe where
syn keyword   rhaiKeyword     use nextgroup=rhaiModPath skipwhite skipempty
" FIXME: Scoped impl's name is also fallen in this category
syn keyword   rhaiKeyword     mod trait nextgroup=rhaiIdentifier skipwhite skipempty
syn keyword   rhaiStorage     move mut ref static const
syn match rhaiDefault /\<default\ze\_s\+\(impl\|fn\|type\|const\)\>/

syn keyword   rhaiInvalidBareKeyword crate

syn keyword rhaiPubScopeCrate crate contained
syn match rhaiPubScopeDelim /[()]/ contained
syn match rhaiPubScope /([^()]*)/ contained contains=rhaiPubScopeDelim,rhaiPubScopeCrate,rhaiSuper,rhaiModPath,rhaiModPathSep,rhaiSelf transparent

syn keyword   rhaiExternCrate crate contained nextgroup=rhaiIdentifier,rhaiExternCrateString skipwhite skipempty
" This is to get the `bar` part of `extern crate "foo" as bar;` highlighting.
syn match   rhaiExternCrateString /".*"\_s*as/ contained nextgroup=rhaiIdentifier skipwhite transparent skipempty contains=rhaiString,rhaiOperator
syn keyword   rhaiObsoleteExternMod mod contained nextgroup=rhaiIdentifier skipwhite skipempty

syn match     rhaiIdentifier  contains=rhaiIdentifierPrime "\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained
syn match     rhaiFuncName    "\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained

syn region    rhaiBoxPlacement matchgroup=rhaiBoxPlacementParens start="(" end=")" contains=TOP contained
" Ideally we'd have syntax rules set up to match arbitrary expressions. Since
" we don't, we'll just define temporary contained rules to handle balancing
" delimiters.
syn region    rhaiBoxPlacementBalance start="(" end=")" containedin=rhaiBoxPlacement transparent
syn region    rhaiBoxPlacementBalance start="\[" end="\]" containedin=rhaiBoxPlacement transparent
" {} are handled by rhaiFoldBraces

syn region rhaiMacroRepeat matchgroup=rhaiMacroRepeatDelimiters start="$(" end=")" contains=TOP nextgroup=rhaiMacroRepeatCount
syn match rhaiMacroRepeatCount ".\?[*+]" contained
syn match rhaiMacroVariable "$\w\+"

" Reserved (but not yet used) keywords {{{2
syn keyword   rhaiReservedKeyword alignof become do offsetof priv pure sizeof typeof unsized yield abstract virtual final override macro

" Built-in types {{{2
syn keyword   rhaiType        isize usize char bool u8 u16 u32 u64 u128 f32
syn keyword   rhaiType        f64 i8 i16 i32 i64 i128 str Self

" Things from the libstd v1 prelude (src/libstd/prelude/v1.rs) {{{2
" This section is just straight transformation of the contents of the prelude,
" to make it easy to update.

" Reexported core operators {{{3
syn keyword   rhaiTrait       Copy Send Sized Sync
syn keyword   rhaiTrait       Drop Fn FnMut FnOnce

" Reexported functions {{{3
" There’s no point in highlighting these; when one writes drop( or drop::< it
" gets the same highlighting anyway, and if someone writes `let drop = …;` we
" don’t really want *that* drop to be highlighted.
"syn keyword rhaiFunction drop

" Reexported types and traits {{{3
syn keyword rhaiTrait Box
syn keyword rhaiTrait ToOwned
syn keyword rhaiTrait Clone
syn keyword rhaiTrait PartialEq PartialOrd Eq Ord
syn keyword rhaiTrait AsRef AsMut Into From
syn keyword rhaiTrait Default
syn keyword rhaiTrait Iterator Extend IntoIterator
syn keyword rhaiTrait DoubleEndedIterator ExactSizeIterator
syn keyword rhaiEnum Option
syn keyword rhaiEnumVariant Some None
syn keyword rhaiEnum Result
syn keyword rhaiEnumVariant Ok Err
syn keyword rhaiTrait SliceConcatExt
syn keyword rhaiTrait String ToString
syn keyword rhaiTrait Vec

" Other syntax {{{2
syn keyword   rhaiSelf        self
syn keyword   rhaiBoolean     true false

" If foo::bar changes to foo.bar, change this ("::" to "\.").
" If foo::bar changes to Foo::bar, change this (first "\w" to "\u").
syn match     rhaiModPath     "\w\(\w\)*::[^<]"he=e-3,me=e-3
syn match     rhaiModPathSep  "::"

syn match     rhaiFuncCall    "\w\(\w\)*("he=e-1,me=e-1
syn match     rhaiFuncCall    "\w\(\w\)*::<"he=e-3,me=e-3 " foo::<T>();

" This is merely a convention; note also the use of [A-Z], restricting it to
" latin identifiers rather than the full Unicode uppercase. I have not used
" [:upper:] as it depends upon 'noignorecase'
"syn match     rhaiCapsIdent    display "[A-Z]\w\(\w\)*"

syn match     rhaiOperator     display "\%(+\|-\|/\|*\|=\|\^\|&\||\|!\|>\|<\|%\)=\?"
" This one isn't *quite* right, as we could have binary-& with a reference
syn match     rhaiSigil        display /&\s\+[&~@*][^)= \t\r\n]/he=e-1,me=e-1
syn match     rhaiSigil        display /[&~@*][^)= \t\r\n]/he=e-1,me=e-1
" This isn't actually correct; a closure with no arguments can be `|| { }`.
" Last, because the & in && isn't a sigil
syn match     rhaiOperator     display "&&\|||"
" This is rhaiArrowCharacter rather than rhaiArrow for the sake of matchparen,
" so it skips the ->; see http://stackoverflow.com/a/30309949 for details.
syn match     rhaiArrowCharacter display "->"
syn match     rhaiQuestionMark display "?\([a-zA-Z]\+\)\@!"

syn match     rhaiMacro       '\w\(\w\)*!' contains=rhaiAssert,rhaiPanic
syn match     rhaiMacro       '#\w\(\w\)*' contains=rhaiAssert,rhaiPanic

syn match     rhaiEscapeError   display contained /\\./
syn match     rhaiEscape        display contained /\\\([nrt0\\'"]\|x\x\{2}\)/
syn match     rhaiEscapeUnicode display contained /\\u{\x\{1,6}}/
syn match     rhaiStringContinuation display contained /\\\n\s*/
syn region    rhaiString      start=+b"+ skip=+\\\\\|\\"+ end=+"+ contains=rhaiEscape,rhaiEscapeError,rhaiStringContinuation
syn region    rhaiString      start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=rhaiEscape,rhaiEscapeUnicode,rhaiEscapeError,rhaiStringContinuation,@Spell
syn region    rhaiString      start='b\?r\z(#*\)"' end='"\z1' contains=@Spell

syn region    rhaiAttribute   start="#!\?\[" end="\]" contains=rhaiString,rhaiDerive,rhaiCommentLine,rhaiCommentBlock,rhaiCommentLineDocError,rhaiCommentBlockDocError
syn region    rhaiDerive      start="derive(" end=")" contained contains=rhaiDeriveTrait
" This list comes from src/libsyntax/ext/deriving/mod.rs
" Some are deprecated (Encodable, Decodable) or to be removed after a new snapshot (Show).
syn keyword   rhaiDeriveTrait contained Clone Hash rhaicEncodable rhaicDecodable Encodable Decodable PartialEq Eq PartialOrd Ord Rand Show Debug Default FromPrimitive Send Sync Copy

" Number literals
syn match     rhaiDecNumber   display "\<[0-9][0-9_]*\%([iu]\%(size\|8\|16\|32\|64\|128\)\)\="
syn match     rhaiHexNumber   display "\<0x[a-fA-F0-9_]\+\%([iu]\%(size\|8\|16\|32\|64\|128\)\)\="
syn match     rhaiOctNumber   display "\<0o[0-7_]\+\%([iu]\%(size\|8\|16\|32\|64\|128\)\)\="
syn match     rhaiBinNumber   display "\<0b[01_]\+\%([iu]\%(size\|8\|16\|32\|64\|128\)\)\="

" Special case for numbers of the form "1." which are float literals, unless followed by
" an identifier, which makes them integer literals with a method call or field access,
" or by another ".", which makes them integer literals followed by the ".." token.
" (This must go first so the others take precedence.)
syn match     rhaiFloat       display "\<[0-9][0-9_]*\.\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\|\.\)\@!"
" To mark a number as a normal float, it must have at least one of the three things integral values don't have:
" a decimal point and more numbers; an exponent; and a type suffix.
syn match     rhaiFloat       display "\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\%([eE][+-]\=[0-9_]\+\)\=\(f32\|f64\)\="
syn match     rhaiFloat       display "\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\=\%([eE][+-]\=[0-9_]\+\)\(f32\|f64\)\="
syn match     rhaiFloat       display "\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\=\%([eE][+-]\=[0-9_]\+\)\=\(f32\|f64\)"

" For the benefit of delimitMate
syn region rhaiLifetimeCandidate display start=/&'\%(\([^'\\]\|\\\(['nrt0\\\"]\|x\x\{2}\|u{\x\{1,6}}\)\)'\)\@!/ end=/[[:cntrl:][:space:][:punct:]]\@=\|$/ contains=rhaiSigil,rhaiLifetime
syn region rhaiGenericRegion display start=/<\%('\|[^[cntrl:][:space:][:punct:]]\)\@=')\S\@=/ end=/>/ contains=rhaiGenericLifetimeCandidate
syn region rhaiGenericLifetimeCandidate display start=/\%(<\|,\s*\)\@<='/ end=/[[:cntrl:][:space:][:punct:]]\@=\|$/ contains=rhaiSigil,rhaiLifetime

"rhaiLifetime must appear before rhaiCharacter, or chars will get the lifetime highlighting
syn match     rhaiLifetime    display "\'\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*"
syn match     rhaiLabel       display "\'\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*:"
syn match   rhaiCharacterInvalid   display contained /b\?'\zs[\n\r\t']\ze'/
" The groups negated here add up to 0-255 but nothing else (they do not seem to go beyond ASCII).
syn match   rhaiCharacterInvalidUnicode   display contained /b'\zs[^[:cntrl:][:graph:][:alnum:][:space:]]\ze'/
syn match   rhaiCharacter   /b'\([^\\]\|\\\(.\|x\x\{2}\)\)'/ contains=rhaiEscape,rhaiEscapeError,rhaiCharacterInvalid,rhaiCharacterInvalidUnicode
syn match   rhaiCharacter   /'\([^\\]\|\\\(.\|x\x\{2}\|u{\x\{1,6}}\)\)'/ contains=rhaiEscape,rhaiEscapeUnicode,rhaiEscapeError,rhaiCharacterInvalid

syn match rhaiShebang /\%^#![^[].*/
syn region rhaiCommentLine                                                  start="//"                      end="$"   contains=rhaiTodo,@Spell
syn region rhaiCommentLineDoc                                               start="//\%(//\@!\|!\)"         end="$"   contains=rhaiTodo,@Spell
syn region rhaiCommentLineDocError                                          start="//\%(//\@!\|!\)"         end="$"   contains=rhaiTodo,@Spell contained
syn region rhaiCommentBlock             matchgroup=rhaiCommentBlock         start="/\*\%(!\|\*[*/]\@!\)\@!" end="\*/" contains=rhaiTodo,rhaiCommentBlockNest,@Spell
syn region rhaiCommentBlockDoc          matchgroup=rhaiCommentBlockDoc      start="/\*\%(!\|\*[*/]\@!\)"    end="\*/" contains=rhaiTodo,rhaiCommentBlockDocNest,@Spell
syn region rhaiCommentBlockDocError     matchgroup=rhaiCommentBlockDocError start="/\*\%(!\|\*[*/]\@!\)"    end="\*/" contains=rhaiTodo,rhaiCommentBlockDocNestError,@Spell contained
syn region rhaiCommentBlockNest         matchgroup=rhaiCommentBlock         start="/\*"                     end="\*/" contains=rhaiTodo,rhaiCommentBlockNest,@Spell contained transparent
syn region rhaiCommentBlockDocNest      matchgroup=rhaiCommentBlockDoc      start="/\*"                     end="\*/" contains=rhaiTodo,rhaiCommentBlockDocNest,@Spell contained transparent
syn region rhaiCommentBlockDocNestError matchgroup=rhaiCommentBlockDocError start="/\*"                     end="\*/" contains=rhaiTodo,rhaiCommentBlockDocNestError,@Spell contained transparent
" FIXME: this is a really ugly and not fully correct implementation. Most
" importantly, a case like ``/* */*`` should have the final ``*`` not being in
" a comment, but in practice at present it leaves comments open two levels
" deep. But as long as you stay away from that particular case, I *believe*
" the highlighting is correct. Due to the way Vim's syntax engine works
" (greedy for start matches, unlike rhai's tokeniser which is searching for
" the earliest-starting match, start or end), I believe this cannot be solved.
" Oh you who would fix it, don't bother with things like duplicating the Block
" rules and putting ``\*\@<!`` at the start of them; it makes it worse, as
" then you must deal with cases like ``/*/**/*/``. And don't try making it
" worse with ``\%(/\@<!\*\)\@<!``, either...

syn keyword rhaiTodo contained TODO FIXME XXX NB NOTE

" Folding rules {{{2
" Trivial folding rules to begin with.
" FIXME: use the AST to make really good folding
syn region rhaiFoldBraces start="{" end="}" transparent fold

" Default highlighting {{{1
hi def link rhaiDecNumber       rhaiNumber
hi def link rhaiHexNumber       rhaiNumber
hi def link rhaiOctNumber       rhaiNumber
hi def link rhaiBinNumber       rhaiNumber
hi def link rhaiIdentifierPrime rhaiIdentifier
hi def link rhaiTrait           rhaiType
hi def link rhaiDeriveTrait     rhaiTrait

hi def link rhaiMacroRepeatCount   rhaiMacroRepeatDelimiters
hi def link rhaiMacroRepeatDelimiters   Macro
hi def link rhaiMacroVariable Define
hi def link rhaiSigil         StorageClass
hi def link rhaiEscape        Special
hi def link rhaiEscapeUnicode rhaiEscape
hi def link rhaiEscapeError   Error
hi def link rhaiStringContinuation Special
hi def link rhaiString        String
hi def link rhaiCharacterInvalid Error
hi def link rhaiCharacterInvalidUnicode rhaiCharacterInvalid
hi def link rhaiCharacter     Character
hi def link rhaiNumber        Number
hi def link rhaiBoolean       Boolean
hi def link rhaiEnum          rhaiType
hi def link rhaiEnumVariant   rhaiConstant
hi def link rhaiConstant      Constant
hi def link rhaiSelf          Constant
hi def link rhaiFloat         Float
hi def link rhaiArrowCharacter rhaiOperator
hi def link rhaiOperator      Operator
hi def link rhaiKeyword       Keyword
hi def link rhaiTypedef       Keyword " More precise is Typedef, but it doesn't feel right for rhai
hi def link rhaiStructure     Keyword " More precise is Structure
hi def link rhaiUnion         rhaiStructure
hi def link rhaiPubScopeDelim Delimiter
hi def link rhaiPubScopeCrate rhaiKeyword
hi def link rhaiSuper         rhaiKeyword
hi def link rhaiReservedKeyword Error
hi def link rhaiRepeat        Conditional
hi def link rhaiConditional   Conditional
hi def link rhaiIdentifier    Identifier
hi def link rhaiCapsIdent     rhaiIdentifier
hi def link rhaiModPath       Include
hi def link rhaiModPathSep    Delimiter
hi def link rhaiFunction      Function
hi def link rhaiFuncName      Function
hi def link rhaiFuncCall      Function
hi def link rhaiShebang       Comment
hi def link rhaiCommentLine   Comment
hi def link rhaiCommentLineDoc SpecialComment
hi def link rhaiCommentLineDocError Error
hi def link rhaiCommentBlock  rhaiCommentLine
hi def link rhaiCommentBlockDoc rhaiCommentLineDoc
hi def link rhaiCommentBlockDocError Error
hi def link rhaiAssert        PreCondit
hi def link rhaiPanic         PreCondit
hi def link rhaiMacro         Macro
hi def link rhaiType          Type
hi def link rhaiTodo          Todo
hi def link rhaiAttribute     PreProc
hi def link rhaiDerive        PreProc
hi def link rhaiDefault       StorageClass
hi def link rhaiStorage       StorageClass
hi def link rhaiObsoleteStorage Error
hi def link rhaiLifetime      Special
hi def link rhaiLabel         Label
hi def link rhaiInvalidBareKeyword Error
hi def link rhaiExternCrate   rhaiKeyword
hi def link rhaiObsoleteExternMod Error
hi def link rhaiBoxPlacementParens Delimiter
hi def link rhaiQuestionMark  Special

" Other Suggestions:
" hi rhaiAttribute ctermfg=cyan
" hi rhaiDerive ctermfg=cyan
" hi rhaiAssert ctermfg=yellow
" hi rhaiPanic ctermfg=red
" hi rhaiMacro ctermfg=magenta

syn sync minlines=200
syn sync maxlines=500

let b:current_syntax = "rhai"
