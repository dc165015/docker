notify installing nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash

notify installing nodejs
curl -sL https://deb.nodesource.com/setup_9.x | bash -
apt-fast install -y nodejs
apt-fast install -y npm

notify installing cnpm
npm install -g cnpm --registry=https://registry.npm.taobao.org
cnpm update

notify installing tslint eslint types jquery typescript gulp mocha yarn webpack
cnpm i -g tslint eslint types jslint jquery typescript gulp gulp-cli mocha yarn webpack

notify installing eslint airbnb.react+meteor dependencies
(export PKG=eslint-config-airbnb-base; cnpm info "$PKG@latest" peerDependencies --json | command sed 's/[\{\},]//g ; s/: /@/g' | xargs cnpm install -g --save-dev "$PKG@latest")
cnpm install -g babel-eslint eslint-config-airbnb eslint-plugin-import eslint-plugin-meteor eslint-plugin-react eslint-plugin-jsx-a11y eslint-import-resolver-meteor eslint @meteorjs/eslint-config-meteor
