#!/bin/bash
if [ -e /KHCoder/khcoder/kh_coder.pl ]; then
    (cd /KHCoder/khcoder; /usr/bin/perl .kh_coder.pl)
else
    /usr/bin/xeyes
fi
