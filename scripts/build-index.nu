#!/usr/bin/env nu

def page [content: string]: nothing -> string {
  $'<!doctype html>
<html lang="ja">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>slides.keito.dev</title>
<link rel="icon" href="https://serenity.keito.dev/🧶/ico?square" />
</head>
<body>
($content)
</body>
</html>'
}

def slide-item [name: string]: nothing -> string {
  let title = open $"slides/($name)/slides.md" --raw | split row '---' | get 1 | from yaml | get title
  let date = $name | split row '_' | first | into datetime --format '%Y%m%d' | format date '%Y-%m-%d'
  $'<li><time>($date)</time> <a href="/($name)/">($title)</a></li>'
}

def main [] {
  let items = ls slides
    | where type == dir
    | get name
    | path basename
    | where $it !~ '^00000000_'
    | sort --reverse
    | each {|name| slide-item $name }
    | str join "\n"

  mkdir dist
  page $"<ul>\n($items)\n</ul>" | save --force dist/index.html
}
