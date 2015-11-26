# == Class: sahara::notify::qpid
#
#  Qpid broker configuration for Sahara
#  Deprecated class
#
# === Parameters
#
# [*durable_queues*]
#   (Optional) Use durable queues in broker.
#   Defaults to $::os_service_default.
#
# [*qpid_hostname*]
#   (Optional) IP or hostname of the qpid server.
#   Defaults to $::os_service_default.
#
# [*qpid_port*]
#   (Optional) Port of the qpid server.
#   Defaults to $::os_service_default.
#
# [*qpid_username*]
#   (Optional) User to connect to the qpid server.
#   Defaults to 'guest'.
#
# [*qpid_password*]
#   (Optional) Password to connect to the qpid server.
#   Defaults to 'guest'.
#
# [*qpid_sasl_mechanisms*]
#   (Optional) String of SASL mechanisms to use.
#   Defaults to $::os_service_default.
#
# [*qpid_heartbeat*]
#   (Optional) Seconds between connection keepalive heartbeats.
#   Defaults to $::os_service_default.
#
# [*qpid_protocol*]
#   (Optional) Protocol to use for qpid (tcp/ssl).
#   Defaults to $::os_service_default.
#
# [*qpid_tcp_nodelay*]
#   (Optional) Whether to disable the Nagle algorithm.
#   Defaults to $::os_service_default.
#
# [*qpid_receiver_capacity*]
#   (Optional) Number of prefetched messages to hold.
#   Defaults to $::os_service_default.
#
# [*qpid_topology_version*]
#   (Optional) Version of qpid toplogy to use.
#   Defaults to $::os_service_default.
#
# [*notification_topics*]
#   (Optional) Topic to use for notifications.
#   Defaults to $::os_service_default.
#
# [*control_exchange*]
#   (Optional) The default exchange to scope topics.
#   Defaults to $::os_service_default.
#
# == DEPRECATED PARAMETERS
#
#  [*kombu_ssl_version*]
#    (optional) SSL version to use (valid only if SSL enabled).
#    Valid values are TLSv1, SSLv23 and SSLv3. SSLv2 may be
#    available on some distributions.
#    Defaults to undef
#
# [*kombu_ssl_keyfile*]
#   (Optional) SSL key file (valid only if SSL enabled).
#   Defaults to undef.
#
# [*kombu_ssl_certfile*]
#   (Optional) SSL cert file (valid only if SSL enabled).
#   Defaults to undef.
#
# [*kombu_ssl_ca_certs*]
#   (optional) SSL certification authority file (valid only if SSL enabled).
#   Defaults to undef.
#
# [*kombu_reconnect_delay*]
#   (Optional) Backoff on cancel notification (valid only if SSL enabled).
#   Defaults to undef
#
class sahara::notify::qpid(
  $durable_queues         = $::os_service_default,
  $qpid_hostname          = $::os_service_default,
  $qpid_port              = $::os_service_default,
  $qpid_username          = 'guest',
  $qpid_password          = 'guest',
  $qpid_sasl_mechanisms   = $::os_service_default,
  $qpid_heartbeat         = $::os_service_default,
  $qpid_protocol          = $::os_service_default,
  $qpid_tcp_nodelay       = $::os_service_default,
  $qpid_receiver_capacity = $::os_service_default,
  $qpid_topology_version  = $::os_service_default,
  $notification_topics    = $::os_service_default,
  $control_exchange       = $::os_service_default,
  # DEPRECATED PARAMETERS
  $kombu_ssl_version      = undef,
  $kombu_ssl_keyfile      = undef,
  $kombu_ssl_certfile     = undef,
  $kombu_ssl_ca_certs     = undef,
  $kombu_reconnect_delay  = undef,
) {

  warning('This class is deprecated. Use sahara::init for configuration rpc options instead')
  warning('This class is deprecated. Use sahara::notify for configuration ceilometer notifications instead')
  warning('Default values for qpid_username and qpid_password parameters are different from OpenStack project defaults')

  if $kombu_ssl_version {
    warning('The kombu_ssl_version parameter is deprecated and has no effect.')
  }

  if $kombu_ssl_keyfile {
    warning('The kombu_ssl_keyfile parameter is deprecated and has no effect.')
  }

  if $kombu_ssl_certfile {
    warning('The kombu_ssl_certfile is deprecated and has no effect.')
  }

  if $kombu_ssl_ca_certs {
    warning('The kombu_ssl_ca_certs is deprecated and has no effect.')
  }

  if $kombu_reconnect_delay {
    warning('The kombu_reconnect_delay is deprecated and has no effect.')
  }

  sahara_config {
    'DEFAULT/rpc_backend':                        value => 'qpid';

    'oslo_messaging_qpid/amqp_durable_queues':    value => $durable_queues;
    'oslo_messaging_qpid/qpid_hostname':          value => $qpid_hostname;
    'oslo_messaging_qpid/qpid_port':              value => $qpid_port;
    'oslo_messaging_qpid/qpid_username':          value => $qpid_username;
    'oslo_messaging_qpid/qpid_password':
      value => $qpid_password,
      secret => true;
    'oslo_messaging_qpid/qpid_sasl_mechanisms':   value => $qpid_sasl_mechanisms;
    'oslo_messaging_qpid/qpid_heartbeat':         value => $qpid_heartbeat;
    'oslo_messaging_qpid/qpid_protocol':          value => $qpid_protocol;
    'oslo_messaging_qpid/qpid_tcp_nodelay':       value => $qpid_tcp_nodelay;
    'oslo_messaging_qpid/qpid_receiver_capacity': value => $qpid_receiver_capacity;
    'oslo_messaging_qpid/qpid_topology_version':  value => $qpid_topology_version;
    'DEFAULT/notification_topics':                value => $notification_topics;
    'DEFAULT/control_exchange':                   value => $control_exchange;
  }
}
