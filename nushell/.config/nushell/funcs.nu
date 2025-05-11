def fx [] {
	fzf | hx $in
}

def mirror-update [] {
	sudo reflector --verbose --country Australia --sort rate --latest 20 --save /etc/pacman.d/mirrorlist
	open /etc/pacman.d/mirrorlist
}

def fmd [] {
	^fmt -u -w 85
}

def bt [] {
	"`"
}

