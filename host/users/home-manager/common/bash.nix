# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {

  programs.bash = {
    enable = true;
    enableCompletion = true;
    historyControl = ["erasedups" "ignorespace"];
    initExtra = ''
      # Extra settings for non-login shells.

      # some more ls aliases
      alias ll='ls -alF'
      alias la='ls -A'
      alias l='ls -CF'

      alias mullvad-open='mullvad lockdown-mode set on && mullvad connect'
      alias mullvad-close='mullvad lockdown-mode set off && mullvad disconnect'

      set -o vi

      alias cls='clear;clear'

      # Source bash auto-complete for python3 apps under ~/.venv
      complete_dir="$HOME/.venv/etc/bash_completion.d"
      if [ -d "$complete_dir" ]
      then
          cd $complete_dir
          for i in `ls`
          do
              source $i
          done
          cd - > /dev/null
      fi

      export EDITOR=vim
      export VISUAL=vim

      alias gla='git log --graph --oneline --date-order --decorate=short --all'

      function ytdl {
          if [ $# -ne 2 ]; then
              echo "Download a YouTube video as a specific format"
              echo "usage: ytdl <url> <dest.format>"
              echo ""
              echo "eg. ytdl https://www.youtube.com/watch?v=sVx1mJDeUjY after-dark.mp3"
              return 1
          fi

          local url=$1
          local dest=$2

          local tmpout=$(mktemp)
          yt-dlp -o "$tmpout" "$url"
          if [ $? != 0 ]
          then
              echo "ERROR: yt-dlp could not download the video." >&2
              rm "$tmpout"
              return 1
          fi

          ffmpeg -i "$tmpout.webm" "$dest"
          rm "$tmpout.webm"
      }

      # Unlimited and global bash history
      export HISTSIZE=-1
      export HISTCONTROL="erasedups $HISTCONTROL"
      export HISTFILE=$HOME/.bash_history
      PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

      # append to the history file, don't overwrite it
      shopt -s histappend

      # cd to the first item reported by find.
      function findcd {
          cd $(find $@ -print -quit | head -n 1)
      }

      # Push the current git branch to origin, with force
      function git-force-push {
          git push origin $(git branch --show-current) --force
      }

      # Switch to a git test branch.
      function git-test-switch {
          if [ $(git branch --show-current) == testbranch ]
          then
              echo "Already on testbranch" >&2
              return 1
          fi

          git branch -D testbranch
          git checkout -b testbranch

          return 0
      }

      # Prints your public IP address.
      function ifconfig-public {
          wget http://checkip.dyndns.org/ -O - -o /dev/null | cut -d: -f 2 | cut -d\< -f 1
      }

      # Set gnome-terminal title.
      function set-title {
          if [[ -z "$ORIG" ]]; then
              ORIG=$PS1
          fi
          TITLE="\[\e]2;$*\a\]"
          PS1=''${ORIG}''${TITLE}
      }

      # Rename all files in a dir to the date-time of their last modification.
      function date-rename() {
          # First confirmation prompt
          read -p "Rename all files in $PWD to their modification date-times? [y/N]" REPLY
          [[ $REPLY =~ ^[Yy]$ ]] || return 1

          # Second confirmation prompt
          read -p "Are you sure? [y/N] " REPLY
          [[ $REPLY =~ ^[Yy]$ ]] || return 1

          # Count files to be renamed
          file_count=0
          for file in *; do [ -f "$file" ] && ((file_count++)); done
          echo "Found $file_count files to process..."

          # Process each file
          renamed_count=0
          for file in *; do
              # Skip if not a regular file
              [ -f "$file" ] || continue

              # Get file extension
              filename="''${file%.*}"
              extension="''${file##*.}"

              # Handle files without extension
              if [ "$extension" = "$file" ] || [ "$filename" = "" ]
              then
                  extension=""
              else
                  extension=".$extension"
              fi

              # Get last modification date in YYYY-MM-DD_HH-MM-SS format
              mdate=$(date -r "$file" +"%Y-%m-%d_%H-%M-%S")

              # Construct new filename
              newname="''${mdate}''${extension}"

              # Skip if name wouldn't change
              [ "$file" = "$newname" ] && continue

              # Handle potential name collisions
              counter=1
              while [ -e "$newname" ]; do
                  newname="''${mdate}_''${counter}''${extension}"
                  ((counter++))
              done

              # Rename the file
              mv -n -- "$file" "$newname"
              if [ $? != 0 ]
              then
                  echo "Renamed '$file' to '$newname'"
                  ((renamed_count++))
              else
                  echo "Error renaming '$file'" >&2
              fi
          done

          echo "Done. Renamed $renamed_count of $file_count files."
      }

      # Double ended fork-bomb. Do not type. Ravens carry guns.
      # alias emacs=":(){ :|:& };:"
      '';
  };
}
