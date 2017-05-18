#!/bin/bash
# rename.sh

if [ $# -lt 2 ] ; then
  echo
  echo -e "\e[01;34mUsage\e[0m: \e[01;33m$(basename $0)\e[0m NewName new_name" >&2
  echo
  exit 1
fi

NewName=$1
NewNameWeb="${NewName}Web"

new_name=$2
new_name_web="${new_name}_web"

cd ..
cp -r umbrella-template $new_name
cd $new_name

sed -i "s#SampleApp#${NewName}#g" apps/sample_app_web/README.md \
                                  apps/sample_app_web/mix.exs \
                                  apps/sample_app_web/*/*.e* \
                                  apps/sample_app_web/*/*/*.e* \
                                  apps/sample_app_web/*/*/*/*.e*

sed -i "s#sample_app#${new_name}#g" apps/sample_app_web/README.md \
                                    apps/sample_app_web/mix.exs \
                                    apps/sample_app_web/*/*.e* \
                                    apps/sample_app_web/*/*/*.e* \
                                    apps/sample_app_web/*/*/*/*.e*

mv apps/sample_app_web/lib/sample_app_web apps/sample_app_web/lib/$new_name_web
mv apps/sample_app_web                    apps/$new_name_web

rm -rf .git
echo
echo "Your new app is available at ../$new_name/, ready for git init or whatever else."
echo

