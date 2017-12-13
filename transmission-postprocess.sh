#!/bin/bash

echo "Before input params" >> /tmp/postprocess.log

# Input Parameters
ARG_PATH="$TR_TORRENT_DIR/$TR_TORRENT_NAME"
ARG_NAME="$TR_TORRENT_NAME"
ARG_LABEL="N/A"

echo "After input params" >> /tmp/postprocess.log

# Configuration
CONFIG_OUTPUT="/data"

echo "/usr/bin/filebot -script fn:amc --output "$CONFIG_OUTPUT" --action move --conflict skip -non-strict --log-file amc.log --def unsorted=y music=y artwork=y excludeList="/etc/transmission-daemon/.excludes" ut_dir="$ARG_PATH" ut_kind="multi" ut_title="$ARG_NAME" ut_label="N/A"" >> /tmp/postprocess.log

/usr/bin/filebot -script fn:amc --output "$CONFIG_OUTPUT" --action move --conflict skip -non-strict --log-file amc.log --def unsorted=y music=y artwork=y excludeList="/etc/transmission-daemon/.excludes" ut_dir="$ARG_PATH" ut_kind="multi" ut_title="$ARG_NAME" ut_label="N/A"

