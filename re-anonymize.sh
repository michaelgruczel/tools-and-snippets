#!/bin/bash

# add anon.log to .gitignore
# before commit execute ./anonymize.sh to replace tokens in java files
# tokens must have format ....="aVerySecureToken";//ANONYMIZE
# after commit restore by ./re-anonymize.sh

FILES=$(find . -name *.java) 

for f in $FILES
do
    LINE=$(head -1 anon.log)
    echo "$LINE"
    echo "$f"    
    sed -i '' 's,\"1234\";\/\/ANONYMIZE,'"$LINE"',g' $f
done

rm anon.log
