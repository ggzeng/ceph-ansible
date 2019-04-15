pushd ..
cp site.yml.sample site.yml
sed -i '/group_vars\/\*\.yml/d' .gitignore 

pushd group_vars
cp all.yml.sample all.yml
cp mgrs.yml.sample mgrs.yml
cp osds.yml.sample osds.yml
cp mons.yml.sample mons.yml
cp rgws.yml.sample rgws.yml
cp mdss.yml.sample mdss.yml

popd
popd
