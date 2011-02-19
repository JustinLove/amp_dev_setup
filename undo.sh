#!/bin/sh

rvm use 1.9.2
rvm gemset delete amp_dev
rvm gemset delete amp_dev_rugged

cd libgit2
./waf uninstall
cd ..

rm -rf amp_complete
rm -rf amp_repo_spec
rm -rf amp_rugged
rm -rf rugged
rm -rf libgit2

