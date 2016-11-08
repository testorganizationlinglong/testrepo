#!/bin/bash

set -e

if [ -f ./vendor/bin/phpcs ]; then
    COMMAND=./vendor/bin/phpcs
elif [ -f ./bin/phpcs ] ; then
    COMMAND=./bin/phpcs
elif which phpcs &> /dev/null; then
    COMMAND=$(which phpcs)
else
    echo "No local installation of phpcs found, installing phpcs... " >&2
    export COMPOSER_HOME=~/.analysis/phpcs
    composer global require --dev 'squizlabs/php_codesniffer:2.*'
    COMMAND=~/.analysis/phpcs/vendor/bin/phpcs
fi

rm -f /tmp/analysis_result_phpcs

echo "Running $COMMAND --report=checkstyle $@" >&2

$COMMAND -p --colors --report-checkstyle=/tmp/analysis_result_phpcs "$@" >&2 || true

cat /tmp/analysis_result_phpcs
rm -f /tmp/analysis_result_phpcs

