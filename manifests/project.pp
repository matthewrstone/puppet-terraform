# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include terraform::project
class terraform::project(
  String $project_folder = '/home/terraform',
  Boolean $use_hiera = true
) {
  file { $project_folder : ensure => directory }

  if $use_hiera {
    lookup('terraform::projects').each | $tfname, $tfproject | {
      vcsrepo { "${project_folder}/${tfname}" : * => $tfproject }
    }
  } 
  else {
    fail('Normalcy is not yet implemented.')
  }
}
