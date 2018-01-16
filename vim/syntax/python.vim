" Vim syntax file
let pythonOperatorList  = '[-&|+<>=*/!~]'     " A list of symbols that we don't want to immediately precede the operator
let pythonOperatorList .= '\@<!'              " Negative look-behind (check that the preceding symbols aren't there)
let pythonOperatorList .= '\%('               " Beginning of a list of possible operators
let pythonOperatorList .=     '\('            " First option, the following symbols...
let pythonOperatorList .=        '[-&|+<>=.\\/^*!$%:;?)(}{\]\[~]'
let pythonOperatorList .=     '\)'
let pythonOperatorList .=     '\1\?'          " Followed by (optionally) the exact same symbol, so -, --, =, ==, &, && etc
let pythonOperatorList .= '\|'                " Next option:
let pythonOperatorList .=     '->'            " Pointer dereference operator
let pythonOperatorList .= '\|'                " Next option:
let pythonOperatorList .=     '[-+*/%&^|!~]=' " One of the listed symbols followed by an =, e.g. +=, -=, &= etc
let pythonOperatorList .= '\|'                " Next option:
let pythonOperatorList .=     '[*?,!%~]'      " Some simple single character operators
let pythonOperatorList .= '\|'                " Next option:
let pythonOperatorList .=     '\('            " One of the shift characters:
let pythonOperatorList .=         '[<>]'
let pythonOperatorList .=     '\)'
let pythonOperatorList .=     '\2'            " Followed by another identical character, so << or >>...
let pythonOperatorList .=     '='             " Followed by =, so <<= or >>=.
let pythonOperatorList .= '\)'                " End of the long list of options
let pythonOperatorList .= '[-&|+<>=*/!~]'     " The list of symbols that we don't want to follow
let pythonOperatorList .= '\@!'               " Negative look-ahead (this and the \@<! prevent === etc from matching)

exe "syn match pythonOperator display '" . pythonOperatorList . "'"

syn match pythonOperator display ';'
hi link pythonOperator Operator
" vim:set sw=2 sts=2 ts=8 noet:
