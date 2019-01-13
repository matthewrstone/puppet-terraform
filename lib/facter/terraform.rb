Facter.add('terraform_version') do
    setcode do
      check = Facter::Core::Execution.execute('which terraform')
      if check then
        Facter::Core::Execution.execute('terraform version').sub!('Terraform v', '')
      end
    end
end