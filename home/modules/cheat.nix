{ config, pkgs, ...}:

{
  programs.cheat = {
    enable = true;
  };

  home.file."${config.xdg.configHome}/cheat/conf.yml" = {
    text = 
    ''
    ---
# The editor to use with 'cheat -e <sheet>'. Defaults to $EDITOR or $VISUAL.
editor: vim

# Should 'cheat' always colorize output?
colorize: true

# Which 'chroma' colorscheme should be applied to the output?
# Options are available here:
#   https://github.com/alecthomas/chroma/tree/master/styles
style: gruvbox

# Which 'chroma' "formatter" should be applied?
# One of: "terminal", "terminal256", "terminal16m"
formatter: terminal256

# Through which pager should output be piped?
# 'less -FRX' is recommended on Unix systems
# 'more' is recommended on Windows
pager: less

# Cheatpaths are paths at which cheatsheets are available on your local
# filesystem.
#
# Cheatpaths can be also configured to automatically apply tags to cheatsheets
# on certain paths, which can be useful for querying purposes.
# Example: 'cheat -t work jenkins'.
cheatpaths:
  # Cheatpath properties mean the following:
  #   'name': the name of the cheatpath (view with 'cheat -d', filter with 'cheat -p')
  #   'path': the filesystem path of the cheatsheet directory (view with 'cheat -d')
  #   'tags': tags that should be automatically applied to sheets on this path
  #   'readonly': shall user-created ('cheat -e') cheatsheets be saved here?
  - name: community
    path: /home/jaximo/.config/cheat/cheatsheets/community
    tags: [ community ]
    readonly: true

  # If you have personalized cheatsheets, list them last. They will take
  # precedence over the more global cheatsheets.
  - name: personal
    path: $JAXOS/cheatsheets/
    tags: [ personal ]
    readonly: false

  # While it requires no configuration here, it's also worth noting that
  # cheat will automatically append directories named '.cheat' within the
  # current working directory to the 'cheatpath'. This can be very useful if
  # you'd like to closely associate cheatsheets with, for example, a directory
  # containing source code.
  #
  # Such "directory-scoped" cheatsheets will be treated as the most "local"
  # cheatsheets, and will override less "local" cheatsheets. Similarly,
  # directory-scoped cheatsheets will always be editable ('readonly: false').
    '';
  };
}