function isplit --description "Split an image into multiple parts using ImageMagick" --argument-names input
	# parse options
	set options $options (fish_opt -s h -l help)
	set options $options (fish_opt -s m -l max --optional-val)
	argparse $options -- $argv

	if test "$_flag_help"; or test -z "$input"
		echo "Usage: isplit input [OPTIONS]"
		echo
		echo "Split an image into multiple parts using ImageMagick"
		echo
		echo "Positional arguments:"
		echo "  input               Input image file"
		echo
		echo "Options:"
		echo "  -h, --help          Show this help message and exit"
		echo "  -m, --max MAX       Maximum size for either side of the image (default: 4096)"
		return 0
	end

	# parse positional arguments
	if test -z "$input"
		echo "Expect an input file in positional argument"
		return 1
	end
	set --local base (path change-extension '' $input)
	set --local ext (path extension $input)

	# get image dimensions into $width and $height
	set --local dimensions (magick identify -format "%wx%h" $argv[1])
	set --local width (string split x $dimensions)[1]
	set --local height (string split x $dimensions)[2]

	# maximum is 4096px for either side, according to
	# https://help.figma.com/hc/en-us/articles/360040028034-Add-images-and-videos-to-designs
	# so we split the image into the minimum number of parts so that no part exceeds 4096px
	set --local max $_flag_max
	if test -z $max
		set max 4096
	end

	set --local x_parts 1
	if test $width -gt $max
		set --function x_parts (math ceil $width / $max)
	end
	set --local x_percent $(math 100 / $x_parts)

	set --local y_parts 1
	if test $height -gt $max
		set y_parts (math ceil $height / $max)
	end
	set --local y_percent $(math 100 / $y_parts)

	if test $x_parts -eq 1 -a $y_parts -eq 1
		echo "No need to split $input, image is already within size limits"
		return 0
	end

	echo "Splitting $input ($width x $height) into $x_parts x $y_parts parts of size $x_percent% x $y_percent%"

	for i in (seq 0 (math $x_parts - 1))
		for j in (seq 0 (math $y_parts - 1))
			set --local x_offset (math $i \* $x_percent / 100)
			set --local y_offset (math $j \* $y_percent / 100)

			set --local output "$base-$i-$j$ext"
			if test $x_parts -eq 1
				set output "$base-$j$ext"
			else if test $y_parts -eq 1
				set output "$base-$i$ext"
			end

			magick $input -gravity NorthWest -crop "$x_percent%x$y_percent%+%[fx:w*$x_offset]+%[fx:h*$y_offset]" $output
		end
	end
end

