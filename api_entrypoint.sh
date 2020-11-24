#! /bin/bash

if [ ! -f $MODEL_LOCATION ];         then echo "Missing file: ${MODEL_LOCATION}"; exit 1; fi
if [ ! -f $TFIDF_LOCATION ];         then echo "Missing file: ${TFIDF_LOCATION}"; exit 1; fi
if [ ! -f $VECTORIZER_LOCATION ];          then echo "Missing file: ${VECTORIZER_LOCATION}"; exit 1; fi

CPUS=`nproc --all`
#WORKERS=$((4 * $CPUS + 1))
WORKERS=3
export PYTHONUNBUFFERED=TRUE

exec gunicorn api \
     -w $WORKERS \
     -b 0.0.0.0:5001 \
     --timeout 1800 \
     --log-file "-"
     --enable-stdio-inheritance \
     --reload \
     --log-level "debug"
