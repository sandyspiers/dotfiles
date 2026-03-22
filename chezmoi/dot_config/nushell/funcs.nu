# This file is for functions that do cool things
# Its not really for tiny short-named functions,
# those are in alias.nu

# ==========
# Misc Utils
# ==========

def host-name [] {
    let prefix = if ($env.SSH_CLIENT? | is-not-empty) { "ssh-" } else { "" }
    $"($prefix)(sys host | get hostname)"
}
 
def fzf-tail [] {
  let file = (fzf)
  tail -f $file
}

def mirror-update [] {
	sudo reflector --verbose --country Australia --sort rate --latest 20 --save /etc/pacman.d/mirrorlist
	open /etc/pacman.d/mirrorlist
}

# =====================
# Zellij session naming
# =====================

def git-repo-name [] {
  let git_root = do { git rev-parse --show-toplevel } | complete
  
  if $git_root.exit_code == 0 {
    $git_root.stdout | str trim | path basename
  } else {
    pwd | path basename
  }
}

def zellij-attach-git [] {
    let session_name = git-repo-name
    zellij attach $session_name --create
}
alias zj = zellij-attach-git

def zellij-attach-fzf [] {
    let $name = (zellij list-sessions --short | fzf)
    zellij attach $name
}
alias zf = zellij-attach-fzf

# ==================
# Markdown compiling
# ==================

# Compile markdown to PDF using pandoc with Eisvogel template
def md-to-pdf [
    input: string                        # Input markdown file
    --output (-o): string                # Output PDF file (optional)
] {
    let output_file = if ($output != null) {
        $output
    } else {
        $input | path parse | update extension "pdf" | path join
    }
    
    print $"Compiling ($input) -> ($output_file)..."
    
    pandoc $input -o $output_file --template eisvogel --pdf-engine xelatex
    
    print $"✓ Done"
}

# Watch a markdown file and recompile on changes
def md-watch [
    input: string                        # Input markdown file
    --output (-o): string                # Output PDF file (optional)
] {
    # Initial compilation
    if ($output != null) {
        md-to-pdf $input --output $output
    } else {
        md-to-pdf $input
    }

    # View pdf, push to background
    if ($output != null) {
        print $"Viewing pdf ($output)"
        job spawn  { zathura $output }
    } else {
        let pdf_file = $input | path parse | update extension "pdf" | path join
        print $"Viewing pdf ($pdf_file)"
        job spawn { zathura $pdf_file }
    }
    
    # Watch for changes
    print $"\nWatching ($input) for changes..."
    watch $input {
        if ($output != null) {
            md-to-pdf $input --output $output
        } else {
            md-to-pdf $input
        }
    }
}

# ==========
# Usage Bars
# ==========

def bar [percentage: float, --width: int = 10] {
    let blocks = (($percentage / 100) * $width) | math round
    let bar = 0..<$width | each {|i|
        if $i == 0 {
            if $blocks >= 1 { "" } else { "" }
        } else if $i == ($width - 1) {
            if $blocks >= $width { "" } else { "" }
        } else {
            if $blocks >= ($i + 1) { "" } else { "" }
        }
    }
    return ($bar | str join)
}

def cpu-bar [] {
    let cpu_cores = sys cpu | length
    let cpu_usage = ps | get cpu | math sum
    bar ($cpu_usage / $cpu_cores) --width $cpu_cores
}

def mem-bar [] {
    let mem_total = (sys mem).total
    let mem_used = (sys mem).used
    bar (($mem_used / $mem_total) * 100)
}
