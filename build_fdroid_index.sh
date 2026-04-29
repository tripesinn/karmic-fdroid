#!/bin/bash
set -e

APKSIGNER=/root/.buildozer/android/platform/android-sdk/build-tools/37.0.0/apksigner

echo "==> Installation fdroidserver"
pip install fdroidserver --quiet

echo "==> Génération config avec apksigner"
cat > /repo/config.yml <<EOF
repo_url: "https://tripesinn.github.io/karmic-fdroid/repo"
repo_name: "Karmic Gochara"
repo_description: "F-Droid repository for Karmic Gochara Lite. Astrological transit calculator — Vedic / DK sidereal."
keystore: "keystore/fdroid.jks"
keystorepass: "6Z0HrgPU#NS1kWmI"
repo_keyalias: "fdroid"
keypass: "6Z0HrgPU#NS1kWmI"
apksigner: "$APKSIGNER"
EOF

echo "==> fdroid update"
cd /repo
fdroid update --create-metadata --verbose

echo "==> Done. Fichiers générés :"
ls -la /repo/repo/
