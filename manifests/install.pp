# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include terraform::install
class terraform::install {
  $version = lookup('terraform::version'),
) {
  archive { "/tmp/terraform_${version}_linux_amd64.zip" :
    ensure       => present,
    extract      => true,
    extract_path => '/usr/local/bin',
    source       => "https://releases.hashicorp.com/terraform/${version}/terraform_${version}_linux_amd64.zip",
    cleanup      => true,
    creates      => '/usr/local/bin/terraform'
  }
}
