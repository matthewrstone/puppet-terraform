Facter.add('terraform_version') do
    setcode do
        case Facter.value('kernel')
        when 'windows'
            okgo = (Facter::Core::Execution.execute('c:\windows\system32\where.exe terraform')).nil?
        when 'Linux'
            okgo = (Facter::Core::Execution.execute('which terraform').chop!).nil?
        end
        if okgo == false
            Facter::Core::Execution.execute('terraform version').sub!('Terraform v', '')
        end
    end
end