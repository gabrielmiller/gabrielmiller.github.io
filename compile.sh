cwd=`pwd`
www=$cwd/jekyll/_site

rm -r $www && mkdir $www

cd jekyll && jekyll build

cd $cwd
compass compile -c scss/config.rb
