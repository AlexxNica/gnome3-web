#! /bin/bash -e

# make sure all HTML files are valid XML, this will be required by xml2po
# in the second phase...
for HTMLFILE in $(ls ../*.html | grep -v video)
do
    xmllint --noout $HTMLFILE
done

xml2po -e -m xhtml -o gnome3.pot $(ls ../*.html | grep -v video)
for LANG in $(cat LINGUAS)
do
    POFILE=$LANG.po
    for HTMLFILE in $(ls ../*.html | grep -v video)
    do
      echo "Writing $HTMLFILE.$LANG"
      xml2po -p $POFILE -m xhtml -o $HTMLFILE.$LANG $HTMLFILE
      grep -q '<script src' $HTMLFILE.$LANG && \
        sed -i -e 's/\(<script src.*\)/\1<\/script>/' $HTMLFILE.$LANG
      grep -q '<iframe' $HTMLFILE.$LANG && \
        sed -i -e 's/\(<iframe.*\)/\1<\/iframe>/' $HTMLFILE.$LANG
      grep -q '<div class="clear"\/>' $HTMLFILE.$LANG && \
        sed -i -e 's/<div class="clear"\/>/<div class="clear"><\/div>/' $HTMLFILE.$LANG
      grep -q 'index.html\"' $HTMLFILE.$LANG && \
        sed -i -e "s/index.html\"/index.html.$LANG\"/" $HTMLFILE.$LANG
      grep -q 'faq.html' $HTMLFILE.$LANG && \
        sed -i -e "s/faq.html/faq.html.$LANG/" $HTMLFILE.$LANG
      grep -q 'tryit.html' $HTMLFILE.$LANG && \
        sed -i -e "s/tryit.html/tryit.html.$LANG/" $HTMLFILE.$LANG
    done
done

for HTMLFILE in ../*.html
do
    cp $HTMLFILE $HTMLFILE.en
done
