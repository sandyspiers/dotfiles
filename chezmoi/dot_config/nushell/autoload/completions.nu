# External completions via fish (aliases are expanded by nu before this runs)
# https://www.nushell.sh/cookbook/external_completers.html#fish-completer
let fish_completer = {|place: record|
    fish --command $"complete '--do-complete=($place.command | str replace --all "'" "\\'" | str join ' ')'"
    | from tsv --flexible --noheaders --no-infer
    | rename value description
    | update value {|row|
      let value = $row.value
      let need_quote = ['\' ',' '[' ']' '(' ')' ' ' '\t' "'" '"' "`"] | any {$in in $value}
      if ($need_quote and ($value | path exists)) {
        let expanded_path = if ($value starts-with '~') {$value | path expand --no-symlink} else {$value}
        $'"($expanded_path | str replace --all "\"" "\\\"")"'
      } else {$value}
    }
}

$env.config.completions.algorithm = "fuzzy"
$env.config.completions.external.enable = true
$env.config.completions.external.completer = $fish_completer

# z completes from zoxide's database; overrides the z alias from zoxide init
# https://www.nushell.sh/cookbook/custom_completers.html#zoxide-path-completions
def "nu-complete zoxide path" [place: record] {
    let parts = $place.command | skip 1
    {
      options: {sort: false, completion_algorithm: substring, case_sensitive: false}
      completions: (^zoxide query --list --exclude $env.PWD -- ...$parts | lines)
    }
}

def --env --wrapped z [...rest: string@"nu-complete zoxide path"] {
  __zoxide_z ...$rest
}
