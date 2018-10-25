# sync-photos

watch directory and automatically upload

- JPG => google photos
- RAW => aws glacier


## Usage


### bin/upload_storage.rb

`BUCKET_NAME=XXXX BASEDIR=$HOME/Pictures PREFIX=RawFiles ./bin/upload_storage.rb`

upload `$HOME/Picutures/**/*.CR2` to `s3:XXXX/RawFiles/**/*.CR2`
