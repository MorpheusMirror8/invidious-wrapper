export INVIDIOUS_VERSION=$(awk 'match($0,/version:[^ ]*/){ print substr($0, RSTART+9,5)}'  manifest.yaml | awk 'NR == 1')
echo 'v'$INVIDIOUS_VERSION
