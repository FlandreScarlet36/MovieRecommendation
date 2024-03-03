normalize_text() {
  tr '[:upper:]' '[:lower:]' | sed -e 's/^/__label__/g' | \
    sed -e "s/'/ ' /g" -e 's/"//g' -e 's/\./ \. /g' -e 's/<br \/>/ /g' \
        -e 's/,/ , /g' -e 's/(/ ( /g' -e 's/)/ ) /g' -e 's/\!/ \! /g' \
        -e 's/\?/ \? /g' -e 's/\;/ /g' -e 's/\:/ /g' | tr -s " "
        }

cat dbpedia_csv/train.csv | normalize_text > dbpedia.train

cat dbpedia_csv/test.csv | normalize_text > dbpedia.test

# 打乱文件顺序
shuf dbpedia.train -o dbpedia.train

shuf dbpedia.test -o dbpedia.test