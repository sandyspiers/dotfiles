do --env {
    # If SSH_AUTH_SOCK is already set (e.g., from SSH agent forwarding),
    # don't mess with it - just use what's provided
    if ($env.SSH_AUTH_SOCK? | is-not-empty) {
        return
    }
    
    let ssh_agent_file = (
        $nu.temp-dir | path join $"ssh-agent-($env.USER? | default $env.USER).nuon"
    )

    if ($ssh_agent_file | path exists) {
        let ssh_agent_env = open ($ssh_agent_file)
        if ($"/proc/($ssh_agent_env.SSH_AGENT_PID)" | path exists) {
            load-env $ssh_agent_env
            return
        } else {
            rm $ssh_agent_file
        }
    }

    # If you find this doesnt work, make sure that
    # in .ssh/config you have AddKeysToAgent yes
    let ssh_agent_env = ^ssh-agent -c
        | lines
        | first 2
        | parse "setenv {name} {value};"
        | transpose --header-row
        | into record
    load-env $ssh_agent_env
    $ssh_agent_env | save --force $ssh_agent_file
}
