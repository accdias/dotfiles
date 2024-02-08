# To the extent possible under law, the author(s) have dedicated all
# copyright and related and neighboring rights to this software to the
# public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along
# with this software.
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

# base-files version 4.1-1

# ~/.bash_profile: executed by bash(1) for login shells.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.bash_profile

# Modifying /etc/skel/.bash_profile directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bash_profile) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bash_profile file

case "$OSTYPE" in
    linux*)
        OSCODENAME="linux"
        ;;
    cygwin|msys)
        OSCODENAME="cygwin"
        ;;
    darwin*)
        OSCODENAME="macos"
        ;;
    *)
        ;;
esac
export OSCODENAME

# source the users bashrc if it exists
if [[ -r "${HOME}/.bashrc" ]]; then
    source "${HOME}/.bashrc"
fi

# source platform specific profile if it exists
if [[ -r "${HOME}/.bashrc.d/${OSCODENAME}/profile" ]]; then
    source "${HOME}/.bashrc.d/${OSCODENAME}/profile"
fi

# Set PATH so it includes user's private bin if it exists
if [[ -d "${HOME}/.local/bin" ]]; then
    PATH="${HOME}/.local/bin:${PATH}"
fi

# Set MANPATH so it includes users' private man if it exists
if [[ -d "${HOME}/.local/man" ]]; then
    MANPATH="${HOME}/.local/man:${MANPATH}"
fi

# Set INFOPATH so it includes users' private info if it exists
if [[ -d "${HOME}/.local/info" ]]; then
    INFOPATH="${HOME}/.local/info:${INFOPATH}"
fi

# Are you we on a SSH session?
# if [[ -n $SSH_TTY ]]; then
#     # Do we have screen installed?
#     if [[ -n $(which screen) ]]; then
#         # Is screen already running?
#         if [[ ! $TERM =~ ^screen.*  ]]; then
#             screen -xRR
#         fi
#     fi
# fi

[[ -x "$(command -v dircolors)" ]] && eval "$(/usr/bin/dircolors)"

# Disable pygame nag prompt
export PYGAME_HIDE_SUPPORT_PROMPT=yes

# Set default directory for config files
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"

# Use kfc to set the terminal theme
# dnf install -y kfc
[[ -x "$(command -v kfc)" ]] && kfc -s vscode

# JIC
tput init
