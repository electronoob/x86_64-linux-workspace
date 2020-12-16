#!/bin/bash

echo -e "This script is for downloading, then parsing, Linux kernel source to obtain a syscall table.\n"

echo -e "Getting an up-to-date list of recent kernel releases from kernel.org\n"

#LIST=$(curl -s https://www.kernel.org/|grep -Eo 'http.*.tar.gz|http.*.tar.xz'| sort -V|uniq|sed "s/.*\///")
LIST_FILE=$(cat file.html|grep -Eo 'http.*.tar.gz|http.*.tar.xz'| sort -V|uniq|sed "s/.*\///")
LIST_URL=$(cat file.html|grep -Eo 'http.*.tar.gz|http.*.tar.xz'| sort -V|uniq)

mapfile -t <<< $LIST_FILE
LIST_FILE_ARRAY=("${MAPFILE[@]}")
mapfile -t <<< $LIST_URL
LIST_URL_ARRAY=("${MAPFILE[@]}")

for index in ${!LIST_FILE_ARRAY[@]}
do
	echo $index: ${LIST_FILE_ARRAY[index]}
done

echo -e "\nCTRL+C to cancels\n"
echo -ne "Which one do we download? "
read input

URL=("${LIST_URL_ARRAY[$input]}")
FILENAME=("${LIST_FILE_ARRAY[$input]}")
DIRNAME="${FILENAME%%.tar.*}"

echo -ne "Grabbing '$URL' in 3..."
sleep 1
echo -n "2..."
sleep 1
echo  "1..."
sleep 1

if [ ! -f "$FILENAME" ]; then
	curl -OJ "$URL"
fi

echo -ne "\nExtracting \"$FILENAME\" ..."

if [ ! -d "$DIRNAME" ]; then
	tar xf "${FILENAME}"
fi

echo -e "DONE!"



cat "${DIRNAME}/arch/x86/entry/syscalls/syscall_64.tbl"

