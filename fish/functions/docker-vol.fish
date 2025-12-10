function docker-vol --description "Utilities to work with docker volume" --argument-names command
	# parse options
	set options $options (fish_opt -s h -l help)

	# if backup command
	if test "$command" = "backup"
		set options $options (fish_opt -s v -l volume --required-val)
		set options $options (fish_opt -s o -l output --required-val)
		argparse $options -- $argv

		echo $_flag_volume $_flag_output

		# if help flag or no option is not specified, print help
		if test "$_flag_help"; or test -z "$_flag_volume" -a -z "$_flag_output"
			echo "Usage: docker-vol backup <OPTIONS>"
			echo
			echo "Backup a docker volume into a tarball"
			echo
			echo "Options:"
			echo "  -h, --help          Show this help message and exit"
			echo "  -v, --volume VOL    Name of the docker volume to backup (required), can be seen from 'docker volume ls'"
			echo "  -o, --output FILE   Output tarball file (required)"
			return 0
		end

		# if one of the required options is not specified, print error
		if test -z "$_flag_volume"; or test -z "$_flag_output"
			echo "-v (--volume) and -o (--output) options are required for backup command"
			return 1
		end

		# check if the specified docker volume exists
		if not docker volume inspect $_flag_volume > /dev/null 2>&1
			echo "Docker volume '$_flag_volume' does not exist"
			return 1
		end

		docker run --rm --volume $_flag_volume:/voldata --volume (pwd):/backup busybox tar cvf /backup/$_flag_output /voldata
	else if test "$command" = "restore"
		set options $options (fish_opt -s v -l volume --required-val)
		set options $options (fish_opt -s i -l input --required-val)
		argparse $options -- $argv

		# if help flag or no option is not specified, print help
		if test "$_flag_help"; or test -z "$_flag_volume" -a -z "$_flag_input"
			echo "Usage: docker-vol restore <OPTIONS>"
			echo
			echo "Restore a docker volume from a tarball"
			echo
			echo "Options:"
			echo "  -h, --help          Show this help message and exit"
			echo "  -v, --volume VOL    Name of the docker volume to restore to (required), can be seen from 'docker volume ls'"
			echo "  -i, --input FILE    Input tarball file (required)"
			return 0
		end

		# if one of the required options is not specified, print error
		if test -z "$_flag_volume"; or test -z "$_flag_input"
			echo "-v (--volume) and -i (--input) options are required for restore command"
			return 1
		end

		# don't check for volume existence, as user may want to restore to a new volume
		# some services don't allow volume override when they are running; if so try to stop the service first,
		# or create a volume before starting the service

		docker run --rm --volume $_flag_volume:/voldata --volume (pwd):/backup busybox tar xvf /backup/$_flag_input -C /voldata --strip 1
	else
		argparse $options -- $argv

		if test "$_flag_help"; or test -z "$command"
			echo "Usage: docker-vol command"
			echo
			echo "Utilities to work with docker volume"
			echo
			echo "Positional arguments:"
			echo "  command               'backup' or 'restore'"
			return 0
		else
			echo "Unknown command: $command. Check 'docker-vol --help' for usage."
			return 1
		end
	end
end
