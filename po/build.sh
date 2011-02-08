#! /bin/bash -e

xml2po -e -m xhtml -o gnome3.pot ../*.html
for LANG in $(cat LINGUAS)
do
    POFILE=$LANG.po
    for HTMLFILE in ../*.html
    do
      echo "Writing $HTMLFILE.$LANG"
      xml2po -p $POFILE -m xhtml -o ../$HTMLFILE.$LANG $HTMLFILE
    done
done

