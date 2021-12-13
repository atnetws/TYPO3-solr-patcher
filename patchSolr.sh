#/bin/bash

SOLRDIR="/opt/solr/"
LIBDIR="server/lib/ext/"
SOLRUSR="solr"
SOLRGRP="solr"

#modify startup script
cp ${SOLRDIR}bin/solr.in.sh ${SOLRDIR}bin/solr.in.sh.bak
echo 'SOLR_OPTS="$SOLR_OPTS -Dlog4j2.formatMsgNoLookups=true"' >> ${SOLRDIR}bin/solr.in.sh


#download latest log4j
mkdir /tmp/log4j-dl
cd /tmp/log4j-dl
wget https://dlcdn.apache.org/logging/log4j/2.15.0/apache-log4j-2.15.0-bin.tar.gz
tar -xzf apache-log4j-2.15.0-bin.tar.gz
cd apache-log4j-2.15.0-bin

#backup old jar files
mkdir -p /tmp/solr-bak/log4j
mv -v ${SOLRDIR}${LIBDIR}log4j* /tmp/solr-bak/log4j

#copy new jar files to solr lib dir
#log4j-1.2-api-2.11.2.jar
cp log4j-1.2-api-2.15.0.jar ${SOLRDIR}${LIBDIR}

#log4j-api-2.11.2.jar
cp log4j-api-2.15.0.jar ${SOLRDIR}${LIBDIR}

#log4j-core-2.11.2.jar
cp log4j-core-2.15.0.jar ${SOLRDIR}${LIBDIR}

#log4j-slf4j-impl-2.11.2.jar
cp log4j-slf4j-impl-2.15.0.jar ${SOLRDIR}${LIBDIR}

#log4j-web-2.11.2.jar
cp log4j-web-2.15.0.jar ${SOLRDIR}${LIBDIR}

#set rights
chown ${SOLUSR}:${SOLGRP} ${SOLRDIR}${LIBDIR}log4j*


echo "Please restart your Solr server now."