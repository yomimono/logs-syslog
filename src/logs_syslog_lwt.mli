(** Logs reporter via syslog, using Lwt

    Please read {!Logs_syslog} first. *)

(** [udp_reporter ~hostname remote_ip ~port ()] is [reporter], which sends
    syslog message using the given [hostname] to [remote_ip, remote_port] via
    UDP.  The [hostname] default to [Lwt_unix.gethostname ()], [port] to 514. *)
val udp_reporter :
  ?hostname:string -> Lwt_unix.inet_addr -> ?port:int -> unit ->
  Logs.reporter Lwt.t

(** [tcp_reporter ~hostname remote_ip ~port ()] is [Ok reporter] or [Error msg].
    The [reporter] sends each log message to [remote_ip, port] via TCP.  If the
    initial TCP connection to the [remote_ip] fails, an [Error msg] is returned
    instead.  If the TCP connection fails, the log message is reported to
    standard error, and attempts are made to re-establish the TCP connection.
    Each syslog message is terminated with a 0 byte.  The [hostname] default to
    [Lwt_unix.gethostname ()], [port] to 514, [framing] appends a 0 byte by
    default. *)
val tcp_reporter : ?hostname:string -> Lwt_unix.inet_addr -> ?port:int ->
  ?framing:Logs_syslog.framing -> unit ->
  (Logs.reporter, string) Result.result Lwt.t

(** {1:lwt_example Example usage}

    To install a Lwt syslog reporter, sending via UDP to localhost, use the
    following snippet:
{[
let install_logger () =
  udp_reporter (Unix.inet_addr_of_string "127.0.0.1") () >|= fun r ->
  Logs.set_reporter r

let _ = Lwt_main.run (install_logger ())
]}

    And via TCP:
{[
let install_logger () =
  tcp_reporter (Unix.inet_addr_of_string "127.0.0.1") () >|= function
    | Ok r -> Logs.set_reporter r
    | Error e -> print_endline e

let _ = Lwt_main.run (install_logger ())
]}

*)
