#!/usr/bin/env bash

export nfspath="/srv/nfs/user-vols"
export totalvols=200

mkdir -p $nfspath/pv{1..$totalvols}

echo "Creating PV for users.."

for pvnum in {1..$totalvols} ; do
  echo "$nfspath/pv${pvnum} *(rw,root_squash)" >> /etc/exports.d/openshift-uservols.exports
done

chown -R nfsnobody.nfsnobody $nfspath
chmod -R 777 $nfspath
