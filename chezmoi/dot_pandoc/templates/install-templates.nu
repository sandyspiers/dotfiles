print "Sourcing config file..."
source ~/.config/nushell/config.nu

print "Downloading Eisvogel template..."
gh-latest-release Wandmalfarbe/pandoc-latex-template --pattern "Eisvogel.tar.gz"

print "Extracting Eisvogel template..."
tar -xzf Eisvogel.tar.gz

print "Moving templates here..."
mv Eisvogel*/eisvogel.latex .
mv Eisvogel*/eisvogel.beamer .

print "Removing Eisvogel resources.."
rm -f *.tar.gz
rm -rf Eisvogel*/
