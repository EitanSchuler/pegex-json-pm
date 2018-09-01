#!/usr/bin/env testml

*toload.loadfirst == *result

=== Parse backslash escapes work
--- toload: '["a\bc\nd"]'
--- result: 'a\x{08}c\x0ad'
