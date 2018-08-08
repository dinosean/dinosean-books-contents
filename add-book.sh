#!/bin/sh
BASE_DIR=`dirname "$0"`
BOOKS_DIR=$BASE_DIR/books

MD5CMD=md5sum
if [ -z `which md5sum` ]; then
	# macOS
	MD5CMD=md5
fi

if [ -z "$1" ]; then
    echo "Usage: $0 bookname"
    exit 1
fi

echo Book name: $1

ID=`echo $1@dinosean | $MD5CMD | awk '{print $1}'`
echo Book ID: $ID

echo Generate a book file.
cp $BOOKS_DIR/.template.md $BOOKS_DIR/$ID.md
sed "s/{{ title }}/$1/g" $BOOKS_DIR/.template.md > $BOOKS_DIR/$ID.md
