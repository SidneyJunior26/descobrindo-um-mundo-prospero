#!/usr/bin/env bash
# Gera o index.html (página completa, servida pelo GitHub Pages) a partir do
# sales-page.html (que é só o corpo, formato exigido pelo artifact do Claude).
#
# Rode isto sempre que editar o sales-page.html, e commite os dois arquivos.

set -euo pipefail
cd "$(dirname "$0")"

{
cat <<'HEAD'
<!doctype html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Um livro que une o universo quântico e prosperidade: nada muda na sua vida até mudar antes na sua consciência. Ebook de Marília Ravelli.">
<meta name="author" content="Marília Ravelli">
<meta property="og:type" content="book">
<meta property="og:title" content="Descobrindo um Mundo Próspero — Marília Ravelli">
<meta property="og:description" content="Um livro que une o universo quântico e prosperidade: nada muda na sua vida até mudar antes na sua consciência.">
<meta property="og:locale" content="pt_BR">
<meta name="twitter:card" content="summary_large_image">
<link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>📖</text></svg>">
HEAD
cat sales-page.html
cat <<'FOOT'
</body>
</html>
FOOT
} > index.html

# O sales-page.html abre com <title> e <style>, que pertencem ao <head>;
# o </head><body> precisa entrar logo antes do <main>.
python3 - <<'PY'
import re
html = open('index.html', encoding='utf-8').read()
html = html.replace('<main>', '</head>\n<body>\n<main>', 1)
open('index.html', 'w', encoding='utf-8').write(html)
PY

echo "index.html gerado ($(wc -c < index.html) bytes)"
