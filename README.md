## Logs-syslog - Logs output via syslog
%%VERSION%%

This library provides log reporters over syslog with various effectful layers:
Unix, Lwt, MirageOS.  It integrated the
[Logs](http://erratique.ch/software/logs) library, which provides logging
infrastructure for OCaml, with the
[syslog-message](http://verbosemo.de/syslog-message/) library, which provides
encoding and decoding of syslog messages ([RFC
3164](https://tools.ietf.org/html/rfc3164)).

Six ocamlfind libraries are provided: the bare `Logs-syslog`, a minimal
dependency Unix `Logs-syslog-unix`, a Lwt one `Logs-syslog-lwt`, another one
with Lwt and TLS ([RFC 5425](https://tools.ietf.org/html/rfc5425)) support
`Logs-syslog-lwt-tls`, a MirageOS one `Logs-syslog-mirage`, and a MirageOS one
using TLS `Logs-syslog-mirage-tls`.

## Documentation

[![Build Status](https://travis-ci.org/hannesm/logs-syslog.svg?branch=master)](https://travis-ci.org/hannesm/logs-syslog)

[API documentation](https://hannesm.github.io/logs-syslog/doc/) is available online.

## Installation

This is targeting other libraries (apart from syslog-message) which are released to opam-repository.

```
opam pin add syslog-message --dev-repo
opam pin add logs-syslog https://github.com/hannesm/logs-syslog.git
```

Use the [dev branch](https://github.com/hannesm/logs-syslog/tree/dev) for Mirage3 support.
