#!/bin/sh

# git clone amp_dev_setup
# sh amp_dev_setup/setup.sh

git clone git://github.com/JustinLove/amp_repo_spec.git
git clone git://github.com/JustinLove/amp_complete.git
git clone git://github.com/JustinLove/amp_rugged.git
git clone git://github.com/libgit2/rugged.git
git clone git://github.com/libgit2/libgit2.git

cd libgit2
./waf configure
./waf build-static
./waf build-shared
#./waf test
sudo ./waf install
cd ..

rvm use 1.9.2
rvm gemset create amp_dev
echo "rvm use 1.9.2@amp_dev" > .rvmrc
rvm gemset create amp_dev_rugged
echo "rvm use 1.9.2@amp_dev_rugged" > rugged/.rvmrc

cd rugged
gem install rake-compiler mg
rake gem
rvm 1.9.2@amp_dev gem install dist/*.gem
cd ..

cp amp_dev_setup/Gemfile.amp_rugged amp_rugged/Gemfile
cd amp_rugged
bundle install
rake spec

