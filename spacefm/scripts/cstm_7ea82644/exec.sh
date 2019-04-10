#!/bin/bash

# Command "Go to Trash".

# Import file manager variables (scroll down for info).
$fm_import

# Localization, requirements, variables, files and functions.
. "$fm_cmd_dir/init.inc.sh"

########################################################################
##
## Main script code.
##
########################################################################

# Home trash directory.

if [[ $fm_pwd != $trash/files ]]; then
	# Note: the home trash directory is opened immediately instead of being
	# added in the trash array below. The reasons are that the user will mostly
	# expect to go instantly to the home trash, and some devices (for example
	# some removable encrypted devices) parsed below may be relatively slow to
	# access in order to test for the presence of top directory trashes.
	spacefm "$trash/files"
fi

# Top directory trashes.

# From the specification: "If an implementation provides trashing in top directories
# at all, it MUST support both (1) and (2). If an implementation does NOT provide
# such trashing, and does provide the user with some interface to view and/or
# undelete trashed files, it SHOULD make a “best effort” to show files trashed in
# top directories (by both methods) to the user, among other trashed files or in
# a clearly accessible separate way."

if type mount > /dev/null 2>&1; then
	getTrashDevice
	filesystemTypes="ext2 ext3 ext4 hfsplus ntfs reiserfs vfat xfs"
	topDirTrashes=()
	everythingIsRead=false
	
	until "$everythingIsRead"; do
		# Example of output: "/dev/sda4 on /home type ext4 (rw,commit=0)".
		read -r mountedFilesystem || everythingIsRead=true
		
		if [[ ! $mountedFilesystem =~ ^([^\ ]+\ ){2}([^\ ]+)\ [^\ ]+\ ([^\ ]+) ]]; then
			continue
		fi
		
		filesystemType=${BASH_REMATCH[3]}
		
		if [[ $filesystemTypes != *$filesystemType* ]]; then
			continue
		fi
		
		# Top directory trashes, method 1 ("$topdir/.Trash").
		
		topDirectoryTrash1=${BASH_REMATCH[2]}
		
		if [[ $topDirectoryTrash1 == */ ]]; then
			topDirectoryTrash1+=.Trash
		else
			topDirectoryTrash1+=/.Trash
		fi
		
		if [[ -d $topDirectoryTrash1 && $(stat -c %D "$topDirectoryTrash1") != $trashDevice ]]; then
			# From the specification: "If this directory is present, the implementation
			# MUST, by default, check for the “sticky bit”. [...] The implementation
			# also MUST check that this directory is not a symbolic link.
			# If any of these checks fail, the implementation MUST NOT use this
			# directory for either trashing or undeleting files, even is an
			# appropriate $uid directory (see below) already exists in it.
			# Besides, the implementation SHOULD report the failed check to the
			# administrator, and MAY also report it to the user."
			if [[ ! -k $topDirectoryTrash1 ]]; then
				printf "${msg[ERR_STICKY_BIT_TRASH]}\n\n" "$topDirectoryTrash1" >&2
			elif [[ -L $topDirectoryTrash1 ]]; then
				printf "${msg[ERR_LINK_TRASH]}\n\n" "$topDirectoryTrash1" >&2
			elif [[ -n $UID ]] && isNotEmpty "$topDirectoryTrash1/$UID/files"; then
				topDirTrashes+=("$topDirectoryTrash1/$UID/files")
			fi
		fi
		
		# Top directory trashes, method 2 ("$topdir/.Trash-$UID").
		if [[ -n $UID ]]; then
			topDirectoryTrash2=$topDirectoryTrash1-$UID
		
			if isNotEmpty "$topDirectoryTrash2/files" && [[ $(stat -c %D "$topDirectoryTrash2") != $trashDevice ]]; then
				topDirTrashes+=("$topDirectoryTrash1-$UID/files")
			fi
		fi
	done < <(mount)
	
	if ((${#topDirTrashes[@]} > 0)); then
		spacefm "${topDirTrashes[@]}"
	fi
fi

exit $?

# Example variables available for use: (imported by $fm_import)
# These variables represent the state of the file manager when command is run.
# These variables can also be used in command lines and in the Smartbar.

# "${fm_files[@]}"          selected files              ( same as %F )
# "$fm_file"                first selected file         ( same as %f )
# "${fm_files[2]}"          third selected file

# "${fm_filenames[@]}"      selected filenames          ( same as %N )
# "$fm_filename"            first selected filename     ( same as %n )

# "$fm_pwd"                 current directory           ( same as %d )
# "${fm_pwd_tab[4]}"        current directory of tab 4
# $fm_panel                 current panel number (1-4)
# $fm_tab                   current tab number

# "${fm_panel3_files[@]}"   selected files in panel 3
# "${fm_pwd_panel[3]}"      current directory in panel 3
# "${fm_pwd_panel3_tab[2]}" current directory in panel 3 tab 2
# ${fm_tab_panel[3]}        current tab number in panel 3

# "${fm_desktop_files[@]}"  selected files on desktop (when run from desktop)
# "$fm_desktop_pwd"         desktop directory (eg '/home/user/Desktop')

# "$fm_device"              selected device (eg /dev/sr0)  ( same as %v )
# "$fm_device_udi"          device ID
# "$fm_device_mount_point"  device mount point if mounted (eg /media/dvd) (%m)
# "$fm_device_label"        device volume label            ( same as %l )
# "$fm_device_fstype"       device fs_type (eg vfat)
# "$fm_device_size"         device volume size in bytes
# "$fm_device_display_name" device display name
# "$fm_device_icon"         icon currently shown for this device
# $fm_device_is_mounted     device is mounted (0=no or 1=yes)
# $fm_device_is_optical     device is an optical drive (0 or 1)
# $fm_device_is_table       a partition table (usually a whole device)
# $fm_device_is_floppy      device is a floppy drive (0 or 1)
# $fm_device_is_removable   device appears to be removable (0 or 1)
# $fm_device_is_audiocd     optical device contains an audio CD (0 or 1)
# $fm_device_is_dvd         optical device contains a DVD (0 or 1)
# $fm_device_is_blank       device contains blank media (0 or 1)
# $fm_device_is_mountable   device APPEARS to be mountable (0 or 1)
# $fm_device_nopolicy       udisks no_policy set (no automount) (0 or 1)

# "$fm_panel3_device"       panel 3 selected device (eg /dev/sdd1)
# "$fm_panel3_device_udi"   panel 3 device ID
# ...                       (all these are the same as above for each panel)

# "fm_bookmark"             selected bookmark directory     ( same as %b )
# "fm_panel3_bookmark"      panel 3 selected bookmark directory

# "fm_task_type"            currently SELECTED task type (eg 'run','copy')
# "fm_task_name"            selected task name (custom menu item name)
# "fm_task_pwd"             selected task working directory ( same as %t )
# "fm_task_pid"             selected task pid               ( same as %p )
# "fm_task_command"         selected task command

# "$fm_command"             current command
# "$fm_value"               menu item value             ( same as %a )
# "$fm_user"                original user who ran this command
# "$fm_cmd_name"            menu name of current command
# "$fm_cmd_dir"             command files directory (for read only)
# "$fm_cmd_data"            command data directory (must create)
#                                 To create:   mkdir -p "$fm_cmd_data"
# "$fm_plugin_dir"          top plugin directory
# tmp="$(fm_new_tmp)"       makes new temp directory (destroy when done)
#                                 To destroy:  rm -rf "$tmp"

# $fm_import                command to import above variables (this
#                           variable is exported so you can use it in any
#                           script run from this script)


# Script Example 1:

#   # show MD5 sums of selected files
#   md5sum "${fm_files[@]}"


# Script Example 2:

#   # Build list of filenames in panel 4:
#   i=0
#   for f in "${fm_panel4_files[@]}"; do
#       panel4_names[$i]="$(basename "$f")"
#       (( i++ ))
#   done
#   echo "${panel4_names[@]}"


# Script Example 3:

#   # Copy selected files to panel 2
#      # make sure panel 2 is visible ?
#      # and files are selected ?
#      # and current panel isn't 2 ?
#   if [ "${fm_pwd_panel[2]}" != "" ] \
#               && [ "${fm_files[0]}" != "" ] \
#               && [ "$fm_panel" != 2 ]; then
#       cp "${fm_files[@]}" "${fm_pwd_panel[2]}"
#   else
#       echo "Can't copy to panel 2"
#       exit 1    # shows error if 'Popup Error' enabled
#   fi


# Bash Scripting Guide:  http://www.tldp.org/LDP/abs/html/index.html

# NOTE: Additional variables or examples may be available in future versions.
#       Create a new command script to see the latest list of variables.

