#!/bin/bash

if [[ ! -d /files/input ]]; then

	mkdir -p /files/input/{2stem,4stem,5stem}
	exit
fi

file="${@}"
output=$(echo $file|cut -f4 -d'/')

if [[ ${file} != *".droppy-upload" ]]; then

	echo "processing $file ..."

	docker run -v ${FILES:-spleetweb_files}:/files researchdeezer/spleeter \
		separate -i "${file}" \
		-p spleeter:${output} \
	-o /files/output

fi
