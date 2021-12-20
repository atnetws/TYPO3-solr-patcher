#/bin/bash

SOLRDIR="/opt/solr/"
LIBDIR="server/lib/ext/"
SOLRUSR="solr"
SOLRGRP="solr"
VERSION="2.17.0"

#modify startup script
cp ${SOLRDIR}bin/solr.in.sh ${SOLRDIR}bin/solr.in.sh.bak
echo 'SOLR_OPTS="$SOLR_OPTS -Dlog4j2.formatMsgNoLookups=true"' >> ${SOLRDIR}bin/solr.in.sh


#download latest log4j
mkdir /tmp/log4j-dl
cd /tmp/log4j-dl
wget https://dlcdn.apache.org/logging/log4j/${VERSION}/apache-log4j-${VERSION}-bin.tar.gz
tar -xzf apache-log4j-${VERSION}-bin.tar.gz
cd apache-log4j-${VERSION}-bin

#backup old jar files
mkdir -p /tmp/solr-bak/log4j
mv -v ${SOLRDIR}${LIBDIR}log4j* /tmp/solr-bak/log4j

#copy new jar files to solr lib dir
#log4j-1.2-api-2.11.2.jar
cp log4j-1.2-api-${VERSION}.jar ${SOLRDIR}${LIBDIR}

#log4j-api-2.11.2.jar
cp log4j-api-${VERSION}.jar ${SOLRDIR}${LIBDIR}

#log4j-core-2.11.2.jar
cp log4j-core-${VERSION}.jar ${SOLRDIR}${LIBDIR}

#log4j-slf4j-impl-2.11.2.jar
cp log4j-slf4j-impl-${VERSION}.jar ${SOLRDIR}${LIBDIR}

#log4j-web-2.11.2.jar
cp log4j-web-${VERSION}.jar ${SOLRDIR}${LIBDIR}

#set rights
chown ${SOLUSR}:${SOLGRP} ${SOLRDIR}${LIBDIR}log4j*


echo "Please restart your Solr server now."