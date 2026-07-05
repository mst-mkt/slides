#!/usr/bin/env nu

def main [slug?: string, date?: string, --title: string] {
  let today: string = (date now | format date "%Y%m%d")

  let slug: string = (if $slug == null { input "slug: " | str trim } else { $slug })
  let title: string = (if $title == null { input $"title \(default ($slug)): " | str trim | default --empty $slug } else { $title })
  let date: string = (if $date == null { input $"date [yyyymmdd] \(default ($today)): " | str trim | default --empty $today } else { $date })

  if ($slug | is-empty) { error make { msg: "slug is required" } }
  if not ($date =~ '^\d{8}$') { error make { msg: $"date must be yyyymmdd, got: ($date)" } }

  let name = $"($date)_($slug)"
  let dir = $"slides/($name)"
  if ($dir | path exists) { error make { msg: $"already exists: ($dir)" } }

  mkdir $dir
  ls scripts/templates
  | where type == file
  | each {|f|
    open $f.name --raw
    | str replace --all "{{NAME}}" $name
    | str replace --all "{{SLUG}}" $slug
    | str replace --all "{{TITLE}}" $title
    | str replace --all "{{DATE}}" $date
    | save $"($dir)/($f.name | path basename)"
  }
  | ignore

  print $"Created ($dir)"
  print $"  pnpm install"
  print $"  vp run -F ($name) dev"
}
