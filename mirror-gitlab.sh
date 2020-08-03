#!/bin/bash
# apt-get update && apt-get install git;
# apk add --no-cache git;

git config --global user.email "youremail@example.com";
git config --global user.name "Your Name";
git config --global pull.rebase false;
git lfs install;

today=$(date +"%Y-%m-%d");
pwd=$(pwd);


# function that mirror one repo
# Arguments: 1. url of target repo; 2 url of mirror repo, 3 local folder
mirror () {
  repo_target=$1;
  repo_mirror=$2;
  folder=$3;
  git clone "${repo_target}" "${folder}" --mirror;
  cd ${folder};
  git remote add mirror ${repo_mirror};
  git lfs fetch --all;
  git push mirror --mirror;
  git lfs push --all ${repo_mirror};
  cd ..;
  echo "将repo: ${repo_target}";
  echo "成功镜像至: ${repo_mirror}";
  rm -r ${folder};
}

repo_source=https://$API_TOKEN_GITHUB@github.com/chinatimeline/chinatimeline.github.io.git;
repo_mirror=https://$USERNAME_GITLAB:$API_TOKEN_GITLAB@gitlab.com/$USERNAME_GITLAB/chinatimeline.github.io.git;
folder=chinatimeline.github.io;

mirror ${repo_source} ${repo_mirror} ${folder};

repo_source=https://$API_TOKEN_GITHUB@github.com/chinatimeline/data.git;
repo_mirror=https://$USERNAME_GITLAB:$API_TOKEN_GITLAB@gitlab.com/$USERNAME_GITLAB/chinatimeline.data.git;
folder=chinatimeline.data;

mirror ${repo_source} ${repo_mirror} ${folder};

echo "完成镜像-${today}";
