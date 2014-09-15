#!/bin/sh

# Script will upgrade an OMERO instance, provided you have the 
# OME standard setup of a symlink OMERO-CURRENT pointing to an unzipped
# OMERO binary distribution downloaded from downloads.openmicroscopy.org
# and a foldder called web-extensions for the add-on web apps like OMERO.figure

set -e
set -u
set -x

# If you're setting the ICE env var based on OME standard multi-ice config...
eval $(./ice/ice-multi-config.sh ice35)

DIR=$1

OMERO-CURRENT/bin/omero admin status --nodeonly && OMERO-CURRENT/bin/omero admin stop
OMERO-CURRENT/bin/omero web stop
cp OMERO-CURRENT/etc/grid/config.xml $HOME/
rm -f OMERO-CURRENT
ln -s $DIR OMERO-CURRENT
cd OMERO-CURRENT
cp $HOME/config.xml etc/grid

# khgillen 20140808 - Memory settings now controlled by bin/omero jvmcfg
# If you're mainting and OMERO 4.x server, set the memory settings here:
#perl -i -pe 's/Xmx512M/Xmx8192M<\/option><option>-XX:MaxPermSize=256M/' etc/grid/templates.xml

# OMERO startup
bin/omero admin start
bin/omero web start

# figure script upload
cd ..
cd web-extensions/
cd figure
# It's important to be in this folder when you run the script upload
cd scripts/
../../../OMERO-CURRENT/bin/omero script upload omero/figure_scripts/Figure_To_Pdf.py --official
