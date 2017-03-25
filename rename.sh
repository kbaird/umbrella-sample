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

perl -pi -e "s#SampleApp#${NewName}#g" apps/sample_app/README.md
perl -pi -e "s#SampleApp#${NewName}#g" apps/sample_app/mix.exs
perl -pi -e "s#SampleApp#${NewName}#g" apps/sample_app/*/*.ex*
perl -pi -e "s#SampleApp#${NewName}#g" apps/sample_app/*/*/*.ex*

perl -pi -e "s#sample_app#${new_name}#g" apps/sample_app/README.md
perl -pi -e "s#sample_app#${new_name}#g" apps/sample_app/mix.exs
perl -pi -e "s#sample_app#${new_name}#g" apps/sample_app/*/*.ex*
perl -pi -e "s#sample_app#${new_name}#g" apps/sample_app/*/*/*.ex*

perl -pi -e "s#SampleApp#${NewName}#g" apps/sample_app_web/README.md
perl -pi -e "s#SampleApp#${NewName}#g" apps/sample_app_web/mix.exs
perl -pi -e "s#SampleApp#${NewName}#g" apps/sample_app_web/*/*.e*
perl -pi -e "s#SampleApp#${NewName}#g" apps/sample_app_web/*/*/*.e*
perl -pi -e "s#SampleApp#${NewName}#g" apps/sample_app_web/*/*/*/*.e*

perl -pi -e "s#sample_app#${new_name}#g" apps/sample_app_web/README.md
perl -pi -e "s#sample_app#${new_name}#g" apps/sample_app_web/mix.exs
perl -pi -e "s#sample_app#${new_name}#g" apps/sample_app_web/*/*.e*
perl -pi -e "s#sample_app#${new_name}#g" apps/sample_app_web/*/*/*.e*
perl -pi -e "s#sample_app#${new_name}#g" apps/sample_app_web/*/*/*/*.e*

mv apps/sample_app/lib/sample_app         apps/sample_app/lib/$new_name
mv apps/sample_app                        apps/$new_name
mv apps/sample_app_web/lib/sample_app_web apps/sample_app_web/lib/$new_name_web
mv apps/sample_app_web                    apps/$new_name_web
