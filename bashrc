# To the extent possible under law, the author(s) have dedicated all
# copyright and related and neighboring rights to this software to the
# public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along
# with this software.
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

# base-files version 4.1-1

# ~/.bashrc: executed by bash(1) for interactive shells.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.bashrc

# Modifying /etc/skel/.bashrc directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bashrc) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bashrc file

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Shell Options
#
# See man bash for more options...
#
# Don't wait for job termination notification
# set -o notify
#
# Allow ^D to exit the shell
set +o ignoreeof
#
# Use case-insensitive filename globbing
# shopt -s nocaseglob
#
# Make bash append rather than overwrite the history on disk
shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell

#
shopt -s checkwinsize

# Completion options
[[ "$OSTYPE" == "cygwin" ]] && shopt -s completion_strip_exe
[[ "$OSTYPE" == "msys" ]] && shopt -s completion_strip_exe
#
# These completion tuning parameters change the default behavior of bash_completion:
#
# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1
#
# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1
#
# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1
#
# Uncomment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
[[ -f /etc/bash_completion ]] && . /etc/bash_completion

# History Options
#
# Don't put duplicate lines in the history.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}erasedups
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
#export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls*:dmesg:htop:top:mount*:umount*:df*:du*:history*:cd*:sync:grep*:ps*'
#
# Save a "bit" more lines on the history
export HISTSIZE=1000000
#
# Whenever displaying the prompt, write the previous line to disk
export PROMPT_COMMAND="history -a"
#
# Set vim as my default editor
export EDITOR=vim
#
# Use vimdiff as the frontend for merging with rpmconf
export MERGE=vimdiff

# Themes settings for QT applications
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_AUTO_SCREEN_SCALE_FACTOR=1

# Video Accelleration Driver T450s
# dnf install intel-media-driver.x86_64
#export LIBVA_DRIVER_NAME=iHD
export LIBVA_DRIVER_NAME=radeonsi

# Make access to cd ~/<dir>
export CDPATH=~:~/git

# Color helper variables
[[ -f "${HOME}/.bashrc.d/common/colors" ]] && source "${HOME}/.bashrc.d/common/colors"

# Aliases
[[ -f "${HOME}/.bashrc.d/common/aliases" ]] && source "${HOME}/.bashrc.d/common/aliases"

# Functions
[[ -f "${HOME}/.bashrc.d/common/functions" ]] && source "${HOME}/.bashrc.d/common/functions"

# Prompts
[[ -f "${HOME}/.bashrc.d/common/prompts" ]] && source "${HOME}/.bashrc.d/common/prompts"

# Umask
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
umask 027
