#!/bin/bash

echo -e "This script is for downloading, then parsing, Linux kernel source to obtain a syscall table.\n"

echo -e "Getting an up-to-date list of recent kernel releases from kernel.org\n"

if [ -f "./kernel.org.html" ]; then
	rm "./kernel.org.html"
fi

curl -so ./kernel.org.html https://www.kernel.org

LIST_FILE=$(cat kernel.org.html|grep -Eo 'http.*.tar.gz|http.*.tar.xz'| sort -V|uniq|sed "s/.*\///")
LIST_URL=$(cat kernel.org.html|grep -Eo 'http.*.tar.gz|http.*.tar.xz'| sort -V|uniq )

mapfile -t <<< $LIST_FILE
LIST_FILE_ARRAY=("${MAPFILE[@]}")
mapfile -t <<< $LIST_URL
LIST_URL_ARRAY=("${MAPFILE[@]}")

for index in ${!LIST_FILE_ARRAY[@]}
do
	echo $index: ${LIST_FILE_ARRAY[index]%%.tar.*}
done

echo -e "\nCTRL+C cancels\n"
echo -ne "Which one do we download? "
read input

URL=("${LIST_URL_ARRAY[$input]}")
FILENAME=("${LIST_FILE_ARRAY[$input]}")
DIRNAME="${FILENAME%%.tar.*}"

secs=3
echo -ne "Grabbing '$URL' in "
while [ "$secs" -gt 0 ]
do
	echo -ne "$((secs--))..."
	sleep 1
done

if [ ! -f "$FILENAME" ]; then
	echo
	curl -OJ "$URL"
	echo
fi

echo -ne "\nExtracting \"$FILENAME\" ..."

if [ ! -d "$DIRNAME" ]; then
	tar xf "${FILENAME}"
fi

echo -e "DONE!"

grep -E "^[[:digit:]].*" "${DIRNAME}/arch/x86/entry/syscalls/syscall_64.tbl"

#dumb regex combinations don't seem to work on egrep, sigh.
#egrep -Roz 'SYSCALL_DEFINE.\(faccessat2.*\n.*\)'
#egrep -Eoz 'SYSCALL_DEFINE.\([[:alnum:][:space:],*]*\)'
#cat linux-5.10.1/fs/open.c| egrep -Eoz 'SYSCALL_DEFINE.\(faccessat[a-z0-9, _*&\r\n\t]*\)'
