Facter.add('terraform_version') do
    setcode do
      check = Facter::Core::Execution.execute('which terraform')
      if check then
        result = Facter::Core::Execution.execute('terraform version')
      end
    end
end