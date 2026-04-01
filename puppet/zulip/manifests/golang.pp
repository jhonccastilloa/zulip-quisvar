# @summary go compiler and tools
#
class zulip::golang {
  $version = $zulip::common::versions['golang']['version']
  $dir = "/srv/zulip-golang-${version}"
  $bin = "${dir}/bin/go"

  zulip::external_dep { 'golang':
    version        => $version,
    # Use the direct download host; it is generally more reliable in container builds
    # than the go.dev front door, while serving the same tarball content.
    url            => "https://dl.google.com/go/go${version}.linux-${zulip::common::goarch}.tar.gz",
    tarball_prefix => 'go',
  }
}
