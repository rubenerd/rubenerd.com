#!/bin/sh

cd ./content/post/
posts=`ls -1`

for post in ${posts}; do
    vim ${post}
done

