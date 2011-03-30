#! /bin/bash -e

# make sure all HTML files are valid XML, this will be required by xml2po
# in the second phase...
for HTMLFILE in ../*.html
do
    xmllint --noout $HTMLFILE
done

xml2po -e -m xhtml -o gnome3.pot ../*.html
for LANG in $(cat LINGUAS)
do
    POFILE=$LANG.po
    for HTMLFILE in ../*.html
    do
      echo "Writing $HTMLFILE.$LANG"
      xml2po -p $POFILE -m xhtml -o $HTMLFILE.$LANG $HTMLFILE
      grep -q '<script' $HTMLFILE.$LANG && \
        sed -i -e 's/\(<script.*\)/\1<\/script>/' $HTMLFILE.$LANG
      grep -q '<iframe' $HTMLFILE.$LANG && \
        sed -i -e 's/\(<iframe.*\)/\1<\/iframe>/' $HTMLFILE.$LANG
    done
done

