#
# Script to build a sample dataset of OSINT report
# gathering references from MISP galaxy
#
# https://github.com/MISP/misp-galaxy

cd ../datasets/osint
curl https://raw.githubusercontent.com/MISP/misp-galaxy/main/clusters/threat-actor.json | jq --raw-output ".values | [.[].meta.refs] | flatten | .[] " | grep -v "null" | sort | uniq | parallel "curl -O {}"


