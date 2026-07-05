#!/usr/bin/env nu

def main [] {
  let names: list<string> = (ls slides | where type == dir | get name | path basename | sort)
  if ($names | is-empty) { error make { msg: "no slides in slides/" } }

  let selected = $"($names | input list --fuzzy 'start dev server for')"
  if ($selected | is-empty) { return }

  print $"starting dev server: ($selected)"
  vp run -F $selected dev
}
