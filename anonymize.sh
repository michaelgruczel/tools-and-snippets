#!/bin/bash

# add anon.log to .gitignore
# before commit execute ./anonymize.sh to replace tokens in java files
# tokens must have format ....="aVerySecureToken";//ANONYMIZE

rm anon.log
#find . -name *.java -exec cp {} ./../anon/ \;
find . -name *.java -print0 | xargs -0 grep -e 'ANONYMIZE' | cut -d '=' -f 2 >> anon.log
find . -name *.java -print0 | xargs -0 sed -i '' 's/".*";\/\/ANONYMIZE/"1234";\/\/ANONYMIZE/g'
