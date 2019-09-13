# permet la synchronisation latex entre emacs et skim
# going to Skim -> Preferences -> Sync, selecting Custom and entering /usr/local/bin/emacsclient appears to have corrected my inverse search issues.
$pdflatex = 'pdflatex -interaction=nonstopmode -synctex=1 %O %S';
$pdf_previewer = 'open -a skim';
$clean_ext = 'bbl rel %R-blx.bib %R.synctex.gz';
