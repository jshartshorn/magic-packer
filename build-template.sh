packer build \
    -var 'aws_access_key=example' \
    -var 'aws_secret_key=example' \
    -var 'vm_name=example' \
    -force \
    packer-template.json
