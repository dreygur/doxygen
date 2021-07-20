#!/bin/sh
set -x

if [ "$INPUT_DEBUG" = 'true' ]; then
    set -x
    CHECK_CONFIG='yep'
fi

if [ "$INPUT_VERBOSE" = 'true' ]; then
    VERBOSE='yep'
fi

if [ "$INPUT_ENABLED_INCONCLUSIVE" = 'true' ]; then
    ENABLE_INCONCLUSIVE='yep'
fi

cppcheck "$INPUT_PATH" \
    --enable="$INPUT_ENABLED_CHECKS" \
    ${ENABLE_INCONCLUSIVE:+--inconclusive} \
    ${VERBOSE:+--verbose} \
    ${CHECK_CONFIG:+--check-config} \
    -j "$(nproc)"

