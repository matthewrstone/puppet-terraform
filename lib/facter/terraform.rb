Facter.add('terraform_version') do
    setcode do
        check = Facter::Core::Execution.execute('which terrafdorm').strip!
        if !check.nil?
            Facter::Core::Execution.execute('terraform version').sub!('Terraform v', '')
        end
    end
end