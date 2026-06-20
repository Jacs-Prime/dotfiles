source /usr/share/cachyos-fish-config/cachyos-config.fish

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		builtin cd -- "$cwd"
	end
	command rm -f -- "$tmp"
end

set -gx EDITOR fresh
starship init fish | source

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end
