#! /bin/bash -e

xml2po -e -m xhtml -o gnome3.pot *.html
for POFILE in po/*.po
do
    LANG=$(basename $POFILE .po)
    for HTMLFILE in *.html
    do
      echo "Writing $HTMLFILE.$LANG"
      xml2po -p $POFILE -m xhtml -o $HTMLFILE.$LANG $HTMLFILE
    done
done

