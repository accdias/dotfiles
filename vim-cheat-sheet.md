# vim Cheat Sheet

## This is my vim Cheat Sheet

### vimdiff

#### Navigating

|Key combination         |Action             |
|------------------------|-------------------|
|<kbd>[</kbd><kbd>c</kbd>|Previous difference|
|<kbd>]</kbd><kbd>c</kbd>|Next difference    |

#### Editing

|Key combination          |Action                                |
|-------------------------|--------------------------------------|
|<kbd>d</kbd><kbd>o</kbd> |Obtain difference                     |
|                         |Pull the changes to the current file. |
|<kbd>d</kbd><kbd>p</kbd> |Put difference                        |
|                         |Push the changes to the other file.   |
|<kbd>:</kbd>diffupdate   |Re-scan the files for differences.    |
|<kbd>Z</kbd><kbd>Q</kbd> |Quit without checking changes         |

#### Managing Folds

|Key combination                                     |Action                     |
|----------------------------------------------------|---------------------------|
|<kbd>z</kbd><kbd>o</kbd> or <kbd>z</kbd><kbd>O</kbd>|Open                       |
|<kbd>z</kbd><kbd>c</kbd> or <kbd>z</kbd><kbd>C</kbd>|Close                      |
|<kbd>z</kbd><kbd>a</kbd> or <kbd>z</kbd><kbd>A</kbd>|Toggle                     |
|<kbd>z</kbd><kbd>v</kbd>                            |Open folds for this line   |
|<kbd>z</kbd><kbd>M</kbd>                            |Close all                  |
|<kbd>z</kbd><kbd>R</kbd>                            |Open all                   |
|<kbd>z</kbd><kbd>m</kbd>                            |Fold more (foldlevel += 1) |
|<kbd>z</kbd><kbd>r</kbd>                            |Fold less (foldlevel -= 1) |
|<kbd>z</kbd><kbd>x</kbd>                            |Update folds               |

### Editing

#### Changing case

|Key combination                                  |Action                                            |
|-------------------------------------------------|--------------------------------------------------|
|<kbd>~</kbd>                                     |Changes the case of current character             |
|<kbd>g</kbd><kbd>u</kbd><kbd>u</kbd>             |Change current line from upper to lower           |
|<kbd>g</kbd><kbd>U</kbd><kbd>U</kbd>             |Change current LINE from lower to upper           |
|<kbd>g</kbd><kbd>u</kbd><kbd>w</kbd>             |Change to end of current WORD from upper to lower |
|<kbd>g</kbd><kbd>u</kbd><kbd>a</kbd><kbd>w</kbd> |Change all of current WORD to lower               |
|<kbd>g</kbd><kbd>U</kbd><kbd>w</kbd>             |Change to end of current WORD from lower to upper |
|<kbd>g</kbd><kbd>U</kbd><kbd>a</kbd><kbd>w</kbd> |Change all of current WORD to upper               |
|<kbd>g</kbd><kbd>~</kbd><kbd>~</kbd>             |Invert case to entire line                        |
|<kbd>g</kbd><kbd>~</kbd><kbd>w</kbd>             |Invert case to current WORD                       |
|<kbd>g</kbd><kbd>u</kbd><kbd>G</kbd>             |Change to lowercase until the end of document     |
