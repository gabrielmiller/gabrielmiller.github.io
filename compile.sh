cwd=`pwd`
www=$cwd/jekyll/_site
static=$cwd/jekyll/_static

compass compile -c scss/config.rb

rm -r $www && mkdir $www

cd jekyll && jekyll build

##This is the poor man's modrewrite
#for file in $(find $www -type f)
#do
#    if [ -f $file ] ; then
#        name=${file%\.*}
#        mv ${file} ${name}
#    fi ;
#done

cp -r $static/* $www/.
