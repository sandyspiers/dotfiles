# Nu-only environment. Everything else (PATH, EDITOR, ...) is exported by
# ~/.bash_profile and inherited, so non-nu processes see it too.

# Programs that start $SHELL (nvim :terminal, yazi) get nu, by full path
$env.SHELL = $nu.current-exe
