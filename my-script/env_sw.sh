#! /bin/bash
#
# Zeng Ganghui 2018/5/15
#


function usage {
  echo "Usage: $0 [env]"
  exit 0
}

env=$1
env_dir=`pwd`
if [ ! -d "$env_dir" ] ; then
  echo "no env dir $env_dir"
  exit 1
fi

git_br="$env"

cd $env_dir
# no git, now
#if ! git checkout $git_br ; then
#  usage
#fi

function switch_dir {
  src_conf=$1
  dst_conf=$2

  if [ ! -d $src_conf ] ; then
    echo "directory $src_conf does not exist"
    return 1
  fi

  if ! rm -f $dst_conf ; then
    echo "rm symbole $dst_conf failed"
    return 1
  fi

  if ln -s $src_conf $dst_conf ; then
    echo -n "."
    return 0
  else
    echo "switch $dst_conf failed."
    return 1
  fi
}

###### switch inventory ######
if ! switch_dir "$env_dir/ansible" "/etc/ansible" ; then
  usage
fi

###### switch hosts ######
rm -f /etc/hosts
if ln -s $env_dir/hosts /etc/hosts ; then
  echo "."
else
  usage
fi
echo "switch to env $env success"

