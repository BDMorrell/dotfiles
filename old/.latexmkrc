$pdf_previewer = 'open -a Preview';
$xelatex = 'xelatex -synctex=1 -interaction=nonstopmode';
$pdflatex = 'pdflatex -synctex=1 -interaction=nonstopmode';
@generated_exts = (@generated_exts, 'synctex.gz')
