#!/bin/bash

docker run \
       -e "BRANCH_NAME=lineage-17.1" \
       -e "DEVICE_LIST=${1:?Usage: build.sh DEVICE(S)}" \
       -e "INCLUDE_PROPRIETARY=false" \
       -e "CLEAN_AFTER_BUILD=false" \
       -e "SIGN_BUILDS=true" \
       -e "SIGNATURE_SPOOFING=yes" \
       -e "SUPPORT_UNIFIEDNLP=true" \
       -e "BOOT_IMG=true" \
       -e "CUSTOM_PACKAGES=F-DroidPrivilegedExtension GmsCore" \
       -v "$PWD/src:/srv/src":Z \
       -v "$PWD/zips:/srv/zips":Z \
       -v "$PWD/logs:/srv/logs":Z \
       -v "$PWD/ccache:/srv/ccache":Z \
       -v "$PWD/local_manifests:/srv/local_manifests":Z \
       -v "$PWD/userscripts:/srv/userscripts":Z \
       -v "$HOME/.android-certs:/srv/keys":Z \
       docker-lineage-cicd

# Keep the android signing keys in the home directory to avoid accidentally including in a git commit

# we don't include proprietary, and instead specify the proprietary repos in local_manifests because lineageos 17.1 isn't supported in the default proprietary repos.
