#!/usr/bin/env bash

# This script backups untracked git files to tar archive.
# Creates directory ~/tmp/ansible_webserver_backup
# If you need another directory, create symlink or pass
# your path as an argument.

# See 'man bash', chapter 'Parameter Expansion' to understand
# how to set default values.
# No need in quotes here!
BACKUPDIR=${1:-~/tmp/ansible_webserver_backup}
test -d "${BACKUPDIR}" || mkdir -vp "${BACKUPDIR}"
git ls-files --others -z | xargs -0 tar -czvf "${BACKUPDIR}/backup-untracked_$(date +%F_%H-%M-%S).tgz"
