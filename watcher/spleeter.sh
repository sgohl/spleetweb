#!/bin/bash

if [[ ! -d /files/input ]]; then

	mkdir -p /files/input/{2stem,4stem,5stem}
	exit
fi

file="${@}"
output=$(echo $file|cut -f4 -d'/')

if [[ ${file} != *".droppy-upload" ]]; then

	echo "processing $file ..."
        mkdir -p "/files/output/$output/${file##*/}"
#        cp -Rfv "$file" "/files/output/${output}/${file##*/}/"

	docker run -v ${FILES:-spleetweb_files}:/files researchdeezer/spleeter \
		separate -i "${file}" \
	-o /files/output

#        mkdir -p /files/archive/$output
#        mv "$file" /files/archive/$output/

#	echo "/files/output/${output}/${file##*/}/" >> /files/log.txt
fi
