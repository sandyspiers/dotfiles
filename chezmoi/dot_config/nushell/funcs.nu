# This file is for functions that do cool things
# Its not really for tiny short-named functions,
# those are in alias.nu
 
def mirror-update [] {
	sudo reflector --verbose --country Australia --sort rate --latest 20 --save /etc/pacman.d/mirrorlist
	open /etc/pacman.d/mirrorlist
}

def git-repo-name [] {
  let git_root = do { git rev-parse --show-toplevel } | complete
  
  if $git_root.exit_code == 0 {
    $git_root.stdout | str trim | path basename
  } else {
    pwd | path basename
  }
}

def zj [] {
    let session_name = git-repo-name
    zellij attach $session_name --create
}

def fzf-tail [] {
  let file = (fzf)
  tail -f $file
}

# Download the latest release asset from a GitHub repository
def gh-latest-release [
    repo: string          # GitHub repo in format "owner/repo"
    --pattern: string     # Optional pattern to match asset name (e.g., "linux", ".tar.gz")
    --all                 # Download all assets
    --output-dir: string = "." # Output directory for downloads
] {
    let api_url = $"https://api.github.com/repos/($repo)/releases/latest"
    
    # Fetch release data
    let release = http get $api_url
    
    print $"Latest release: ($release.tag_name) - ($release.name)"
    
    # Get assets
    let assets = $release.assets
    
    if ($assets | is-empty) {
        print "No assets found in latest release"
        return
    }
    
    # Filter assets by pattern if provided
    let filtered_assets = if ($pattern != null) {
        $assets | where name =~ $pattern
    } else {
        $assets
    }
    
    if ($filtered_assets | is-empty) {
        print $"No assets matching pattern '($pattern)'"
        print "Available assets:"
        $assets | select name size | print
        return
    }
    
    # Download assets
    if $all {
        print $"Downloading ($filtered_assets | length) assets..."
        $filtered_assets | each {|asset|
            let output_path = $"($output_dir)/($asset.name)"
            print $"Downloading ($asset.name)..."
            http get $asset.browser_download_url | save -f $output_path
            print $"✓ Saved to ($output_path)"
        }
    } else {
        # Download first matching asset
        let asset = $filtered_assets | first
        let output_path = $"($output_dir)/($asset.name)"
        print $"Downloading ($asset.name)..."
        http get $asset.browser_download_url | save -f $output_path
        print $"✓ Saved to ($output_path)"
    }
}

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
