# Descobrindo um Mundo Próspero — página de vendas

Landing page do ebook de **Marília Ravelli** ([@in.formacaoquantica](https://instagram.com/in.formacaoquantica)).

Compra: https://hotm.io/mJjGjTbt

## Arquivos

| Arquivo | O que é |
|---|---|
| `sales-page.html` | **Fonte.** A página inteira (CSS + HTML + JS num arquivo só) |
| `index.html` | **Gerado.** `sales-page.html` embrulhado num documento HTML completo — é o que o GitHub Pages serve |
| `build.sh` | Gera o `index.html` a partir do `sales-page.html` |

Editou o `sales-page.html`? Rode `./build.sh` e commite os dois.

```bash
./build.sh
```

## Por que dois arquivos

O `sales-page.html` começa direto no `<title>`, sem `<!doctype>`, `<html>`,
`<head>` ou `<body>` — é o formato exigido pela plataforma de artifacts do
Claude, que injeta esse esqueleto na publicação. O GitHub Pages precisa de um
documento HTML completo, então o `build.sh` monta o `index.html` adicionando o
esqueleto mais as meta tags de SEO e compartilhamento.

## Tudo embutido num arquivo só

Fontes (Fraunces e Quicksand) e a imagem da capa estão embutidas em base64
dentro do HTML. Isso deixa o arquivo grande (~480 KB), mas a página não depende
de nenhuma requisição externa — nem CDN, nem pasta de assets.

**Não edite estas linhas** (blobs base64 numa linha só):

- fonte Fraunces, fonte Quicksand — logo no início do `<style>`
- imagem da capa — dentro da seção do hero

Alguns editores travam ao abrir linhas de 176 mil caracteres.

## O ebook não fica aqui

O PDF do livro é produto pago e **nunca** deve ser commitado — este repositório
é público. O `.gitignore` bloqueia `*.pdf` como rede de segurança.

## Stack

HTML, CSS e JavaScript puros. Sem build step, sem dependências, sem framework.

As animações são portes em vanilla de componentes do
[react-bits](https://reactbits.dev): revelação de títulos palavra a palavra com
blur, efeito máquina de escrever, spotlight que segue o cursor, varredura de
brilho e contador. Todas respeitam `prefers-reduced-motion`, e a página funciona
sem JavaScript (o conteúdo aparece normalmente, só sem animação).
