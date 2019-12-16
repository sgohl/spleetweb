#!/bin/bash

if [[ ! -d /files/input ]]; then

	mkdir -p /files/input/{2stems,4stems,5stems}
	exit
fi

file="${@}"
output=$(echo $file|cut -f4 -d'/')

if [[ ${file} != *".droppy-upload" ]]; then

	echo "processing $file ..."

	docker run --rm -v ${FILES:-spleetweb_files}:/files researchdeezer/spleeter \
		separate -i "${file}" \
	-o /files/output

	#-p spleeter:${output} \
fi
