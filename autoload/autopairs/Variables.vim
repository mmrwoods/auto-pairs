fun! autopairs#Variables#_InitVariables()
    " Default autopairs
    call autopairs#Strings#define("g:AutoPairs", {'(': ')', '[': ']', '{': '}', "'": "'", '"': '"',
                \ '```': '```', '"""':'"""', "'''":"'''", "`":"`"})

    " Defines language-specific pairs. Please read the documentation before using!
    " The last paragraph of the help is extremely important.
    call autopairs#Strings#define("g:AutoPairsLanguagePairs", {
        \ "erlang": {'<<': '>>'},
        \ "tex": {'``': "''", '$': '$'},
        \ "html": {'<': '>'},
        \ 'vim': {'\v(^\s*\zs"\ze|".*"\s*\zs"\ze$|^(\s*[a-zA-Z]+\s*([a-zA-Z]*\s*\=\s*)?)@!(\s*\zs"\ze(\\\"|[^"])*$))': {"close": '', 'mapclose': 0}},
        \ 'rust': {'\w\zs<': '>', '&\zs''': ''},
        \ 'php': {'<?': { 'close': '?>', 'mapclose': ']'}, '<?php': {'close': '?>', 'mapclose': ']'}}
        \ })

    " Krasjet: the closing character for quotes, auto completion will be
    " inhibited when the next character is one of these
    call autopairs#Strings#define('g:AutoPairsQuoteClosingChar', ['"', "'", '`'])

    " Krasjet: if the next character is any of these, auto-completion will still
    " be triggered
    call autopairs#Strings#define('g:AutoPairsNextCharWhitelist', [])

    " Krasjet: don't perform open balance check on these characters
    call autopairs#Strings#define('g:AutoPairsOpenBalanceBlacklist', [])

    " Krasjet: turn on/off the balance check for single quotes (')
    " suggestions: use ftplugin/autocmd to turn this off for text documents
    call autopairs#Strings#define('g:AutoPairsSingleQuoteBalanceCheck', 1)

    " Disables the plugin in some directories.
    " This is not available in a whitelist variant, because I'm lazy.
    " (Pro tip: also a great use for autocmds and default-disable rather than
    " plugin configuration. Project .vimrcs work too)
    call autopairs#Strings#define('g:AutoPairsDirectoryBlacklist', [])
    call autopairs#Strings#define('g:AutoPairsFiletypeBlacklist', [])

    call autopairs#Strings#define('g:AutoPairsCompatibleMaps', 1)

    " Olivia: set to 0 based on my own personal biases
    call autopairs#Strings#define('g:AutoPairsMapBS', 0)
    call autopairs#Strings#define('g:AutoPairsMultilineBackspace', 0)

    call autopairs#Strings#define('g:AutoPairsMapCR', 1)

    call autopairs#Strings#define('g:AutoPairsCRKey', '<CR>')

    call autopairs#Strings#define('g:AutoPairsMapSpace', 1)

    call autopairs#Strings#define('g:AutoPairsCenterLine', 1)

    call autopairs#Strings#define('g:AutoPairsShortcutToggle', g:AutoPairsCompatibleMaps ? '<M-p>': '<C-p><C-t>')
    call autopairs#Strings#define('g:AutoPairsShortcutFastWrap', g:AutoPairsCompatibleMaps ? '<M-e>' : '<C-f>')

    call autopairs#Strings#define('g:AutoPairsMoveCharacter', "()[]{}\"'")
    call autopairs#Strings#define('g:AutoPairsMoveExpression', '<C-p>%key')

    " Variable controlling whether or not to require a space or EOL to complete
    " bracket pairs. Extension off Krasjet.
    call autopairs#Strings#define('g:AutoPairsCompleteOnlyOnSpace', 0)

    call autopairs#Strings#define('g:AutoPairsShortcutJump', g:AutoPairsCompatibleMaps ? '<M-n>' : '<C-p><C-s>')

    " Fly mode will for closed pair to jump to closed pair instead of insert.
    " also support AutoPairsBackInsert to insert pairs where jumped.
    call autopairs#Strings#define('g:AutoPairsFlyMode', 0)

    " Default behavior for jiangmiao/auto-pairs: 1
    call autopairs#Strings#define('g:AutoPairsMultilineCloseDeleteSpace', 1)

    " Work with Fly Mode, insert pair where jumped
    call autopairs#Strings#define('g:AutoPairsShortcutBackInsert', g:AutoPairsCompatibleMaps ? '<M-b>' : '<C-p><C-b>')

    call autopairs#Strings#define('g:AutoPairsNoJump', 0)

    call autopairs#Strings#define('g:AutoPairsInitHook', 0)

    call autopairs#Strings#define('g:AutoPairsSearchCloseAfterSpace', 1)

    call autopairs#Strings#define('g:AutoPairsSingleQuoteMode', 2)

    call autopairs#Strings#define('g:AutoPairsSingleQuoteExpandFor', 'fbr')

    call autopairs#Strings#define('g:AutoPairsAutoLineBreak', [])

    call autopairs#Strings#define('g:AutoPairsCarefulStringExpansion', 1)
    call autopairs#Strings#define('g:AutoPairsQuotes', ["'", '"'])

    call autopairs#Strings#define('g:AutoPairsMultilineFastWrap', 0)

    call autopairs#Strings#define('g:AutoPairsFlyModeList', '}\])')
    call autopairs#Strings#define('g:AutoPairsJumpBlacklist', [])

    call autopairs#Strings#define('g:AutoPairsMultibyteFastWrap', 1)

    call autopairs#Strings#define('g:AutoPairsReturnOnEmptyOnly', 1)

    call autopairs#Strings#define('g:AutoPairsShortcutMultilineClose', '<C-p>c')

    call autopairs#Strings#define('g:AutoPairsExperimentalAutocmd', 0)
    call autopairs#Strings#define('g:AutoPairsStringHandlingMode', 0)
    call autopairs#Strings#define('g:AutoPairsSingleQuotePrefixGroup', '^|\W')

    if exists('g:AutoPairsEnableMove')
        echom "g:AutoPairsEnableMove has been deprecated. If you set it to 1, you may remove it."
                    \ . " If you set it to 0, let g:AutoPairsMoveExpression = '' to disable move again."
                    \ . "  See the documentation for both variables for more details."
    endif
endfun


fun! autopairs#Variables#_InitBufferVariables()
    call autopairs#Strings#define('b:autopairs_enabled', 1)
    call autopairs#Strings#define('b:AutoPairs', autopairs#AutoPairsDefaultPairs())
    call autopairs#Strings#define('b:AutoPairsQuoteClosingChar', copy(g:AutoPairsQuoteClosingChar))
    call autopairs#Strings#define('b:AutoPairsNextCharWhitelist', copy(g:AutoPairsNextCharWhitelist))
    call autopairs#Strings#define('b:AutoPairsOpenBalanceBlacklist', copy(g:AutoPairsOpenBalanceBlacklist))
    call autopairs#Strings#define('b:AutoPairsSingleQuoteBalanceCheck', g:AutoPairsSingleQuoteBalanceCheck)
    call autopairs#Strings#define('b:AutoPairsMoveCharacter', g:AutoPairsMoveCharacter)
    call autopairs#Strings#define('b:AutoPairsCompleteOnlyOnSpace', g:AutoPairsCompleteOnlyOnSpace)
    call autopairs#Strings#define('b:AutoPairsFlyMode', g:AutoPairsFlyMode)
    call autopairs#Strings#define('b:AutoPairsNoJump', g:AutoPairsNoJump)
    call autopairs#Strings#define('b:AutoPairsSearchCloseAfterSpace', g:AutoPairsSearchCloseAfterSpace)
    call autopairs#Strings#define('b:AutoPairsSingleQuoteMode', g:AutoPairsSingleQuoteMode)
    call autopairs#Strings#define('b:AutoPairsSingleQuoteExpandFor', g:AutoPairsSingleQuoteExpandFor)
    call autopairs#Strings#define('b:AutoPairsAutoLineBreak', g:AutoPairsAutoLineBreak)
    call autopairs#Strings#define('b:AutoPairsCarefulStringExpansion', g:AutoPairsCarefulStringExpansion)
    call autopairs#Strings#define('b:AutoPairsQuotes', g:AutoPairsQuotes)
    call autopairs#Strings#define('b:AutoPairsFlyModeList', g:AutoPairsFlyModeList)
    call autopairs#Strings#define('b:AutoPairsJumpBlacklist', g:AutoPairsJumpBlacklist)
    call autopairs#Strings#define('b:AutoPairsMultilineCloseDeleteSpace', g:AutoPairsMultilineCloseDeleteSpace)
    call autopairs#Strings#define('b:AutoPairsMultibyteFastWrap', g:AutoPairsMultibyteFastWrap)
    call autopairs#Strings#define('b:AutoPairsReturnOnEmptyOnly', g:AutoPairsReturnOnEmptyOnly)
    call autopairs#Strings#define('b:AutoPairsStringHandlingMode', g:AutoPairsStringHandlingMode)
    call autopairs#Strings#define('b:AutoPairsSingleQuotePrefixGroup', g:AutoPairsSingleQuotePrefixGroup)
    call autopairs#Strings#define('b:AutoPairsMoveExpression', g:AutoPairsMoveExpression)
    call autopairs#Strings#define('b:AutoPairsMultilineBackspace', g:AutoPairsMultilineBackspace)
endfun