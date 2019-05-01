# vimdiff Cheat Sheet

## This is my vimdiff Cheat Sheet

### Navigating

|------------------------|-------------------|
|<kbd>[</kbd><kbd>c</kbd>|Previous difference|
|<kbd>]</kbd><kbd>c</kbd>|Next difference    |

### Editing
|-------------------------|--------------------------------------|
|<kbd>d</kbd><kbd>o</kbd> |Obtain difference                     |
|                         |Pull the changes to the current file. |
|<kbd>d</kbd><kbd>p</kbd> |Put difference                        |
|                         |Push the changes to the other file.   |
|<kbd>:</kbd>diffupdate   |Re-scan the files for differences.    |
|<kbd>Z</kbd><kbd>Q</kbd> |Quit without checking changes         |

### Managing Folds
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
