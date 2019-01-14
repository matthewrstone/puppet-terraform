Facter.add('terraform_version') do
    setcode do
        if !(Facter::Core::Execution.execute('which terraform').chop!).nil?
            Facter::Core::Execution.execute('terraform version').sub!('Terraform v', '')
        end
    end
end