Facter.add('terraform_version') do
    setcode do
      check = Facter::Core::Execution.execute('which terraform').chop!
      if check then
        Facter::Core::Execution.execute('terraform version')
      end
    end
end