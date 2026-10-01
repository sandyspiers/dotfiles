# Build a Markdown file into a PDF with the CCODS template.
def ccods [
    src: path        # markdown source; the pdf lands beside it
    ...rest: string  # extra pandoc options, after a `--`
] {
  let out = $src | path parse | update extension pdf | path join
  (pandoc $src
      --template=ccods
      --pdf-engine=latexmk
      --pdf-engine-opt=-lualatex
      --pdf-engine-opt=-recorder-
      --syntax-highlighting=idiomatic
      --biblatex
      -o $out
      ...$rest)
}
