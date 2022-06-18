{ config, lib, ...}:
let
  opsSrc =  builtins.fetchGit {
    url = "https://github.com/NixOS/nixops.git";
    rev = "0c989d79c9052ebf52f12964131f4fc31ac20a18";
  };
  url = "https://github.com/NixOs/nixops-aws.git";
  src =  builtins.fetchGit {
    inherit url;
    rev = "83900880a413218020ddd91d6cd3f5b823acb3fb";
  };
  importModule = path: import "${src}/${path}" {
    inherit lib;
    name = "{name}"; uuid = "{uuid}";
    config = (config // { name = "name"; });
  };
in
{
  about.sources = "- [NixOps AWS](${url})";
  files.docs."/gh-pages/src/nixops-aws.md".modules = [
    "${opsSrc}/nix/options.nix"
    "${src}/nixops_aws/nix/ec2.nix"
    "${src}/nixops_aws/nix/route53.nix"
  ];
  files.docs."/gh-pages/src/nixops-aws-data.md".modules = [
    (importModule "nixops_aws/nix/aws-data-lifecycle-manager.nix")
  ];
  files.docs."/gh-pages/src/nixops-aws-vpn-connection.md".modules = [
    (importModule "nixops_aws/nix/aws-vpn-connection.nix")
  ];
  files.docs."/gh-pages/src/nixops-aws-vpn-connection-route.md".modules = [
    (importModule "nixops_aws/nix/aws-vpn-connection-route.nix")
  ];
  files.docs."/gh-pages/src/nixops-aws-vpn-gateway.md".modules = [
    (importModule "nixops_aws/nix/aws-vpn-gateway.nix")
  ];
  files.docs."/gh-pages/src/nixops-aws-cloudwatch-log-group.md".modules = [
    (importModule "nixops_aws/nix/cloudwatch-log-group.nix")
  ];
  files.docs."/gh-pages/src/nixops-aws-cloudwatch-log-stream.md".modules = [
    (importModule "nixops_aws/nix/cloudwatch-log-stream.nix" )
  ];
  # files.docs."/gh-pages/src/nixops-aws-cloudwatch-metric.md".modules = [
  #   (importModule "nixops_aws/nix/cloudwatch-metric-alarm.nix")
  # ];
  # files.docs."/gh-pages/src/nixops-aws-ebs.md".modules = [
  #   (importModule "nixops_aws/nix/ebs-volume.nix")
  # ];
  files.docs."/gh-pages/src/nixops-aws-ec2-keypair.md".modules = [
    (importModule "nixops_aws/nix/ec2-keypair.nix")
  ];
  files.docs."/gh-pages/src/nixops-aws-ec2-placement.md".modules = [
    (importModule "nixops_aws/nix/ec2-placement-group.nix")
  ];
  files.docs."/gh-pages/src/nixops-aws-ec2-rds-dbinstance.md".modules = [
    (importModule "nixops_aws/nix/ec2-rds-dbinstance.nix")
    #(importModule "nixops_aws/nix/ec2-security-group.nix")
  ];
  files.docs."/gh-pages/src/nixops-aws-ec2-rds-dbsecurity.md".modules = [
    (importModule "nixops_aws/nix/ec2-rds-dbsecurity-group.nix")
  ];
  files.docs."/gh-pages/src/nixops-aws-ec2-security.md".modules = [
    (importModule "nixops_aws/nix/ec2-security-group.nix")
  ];
  files.docs."/gh-pages/src/nixops-aws-eslatic-file-system.md".modules = [
    (importModule "nixops_aws/nix/elastic-file-system.nix")
  ];
  files.docs."/gh-pages/src/nixops-aws-eslatic-file-sistem-mount.md".modules = [
    (importModule "nixops_aws/nix/elastic-file-system-mount-target.nix")
  ];
  files.docs."/gh-pages/src/nixops-aws-eslatic-ip.md".modules = [
    (importModule "nixops_aws/nix/elastic-ip.nix")
  ];
  files.docs."/gh-pages/src/nixops-aws-iam.md".modules = [
    (importModule "nixops_aws/nix/iam-role.nix")
  ];
  files.docs."/gh-pages/src/nixops-aws-rds.md".modules = [
    (importModule "nixops_aws/nix/rds-subnet-group.nix")
  ];
  files.docs."/gh-pages/src/nixops-aws-route53.md".modules = [
    #(importModule "nixops_aws/nix/route53-health-check.nix")
    #(importModule "nixops_aws/nix/route53-hosted-zone.nix")
    (importModule "nixops_aws/nix/route53-recordset.nix")
  ];
  files.docs."/gh-pages/src/nixops-aws-s3.md".modules = [
    (importModule "nixops_aws/nix/s3-bucket.nix")
  ];
  # files.docs."/gh-pages/src/nixops-aws-sns.md".modules = [
  #   (importModule "nixops_aws/nix/sns-topic.nix")
  # ];
  files.docs."/gh-pages/src/nixops-aws-sqs.md".modules = [
    (importModule "nixops_aws/nix/sqs-queue.nix")
  ];
  files.docs."/gh-pages/src/nixops-aws-vpc.md".modules = [
    (importModule "nixops_aws/nix/vpc.nix")
  ];
  files.docs."/gh-pages/src/nixops-aws-vpc-customer.md".modules = [
    (importModule "nixops_aws/nix/vpc-customer-gateway.nix")
  ];
  files.docs."/gh-pages/src/nixops-aws-vpc-dhcp.md".modules = [
    (importModule "nixops_aws/nix/vpc-dhcp-options.nix")
  ];
  files.docs."/gh-pages/src/nixops-aws-vpc-egress.md".modules = [
    (importModule "nixops_aws/nix/vpc-egress-only-internet-gateway.nix")
  ];
  files.docs."/gh-pages/src/nixops-aws-vpc-endpoint.md".modules = [
    (importModule "nixops_aws/nix/vpc-endpoint.nix")
  ];
  files.docs."/gh-pages/src/nixops-aws-vpc-internet.md".modules = [
    (importModule "nixops_aws/nix/vpc-internet-gateway.nix")
  ];
  files.docs."/gh-pages/src/nixops-aws-vpc-nat.md".modules = [
    (importModule "nixops_aws/nix/vpc-nat-gateway.nix")
  ];
  # files.docs."/gh-pages/src/nixops-aws-vpc-network-acl.md".modules = [
  #   (importModule "nixops_aws/nix/vpc-network-acl.nix")
  # ];
  files.docs."/gh-pages/src/nixops-aws-vpc-network-interface.md".modules = [
    (importModule "nixops_aws/nix/vpc-network-interface.nix")
  ];
  files.docs."/gh-pages/src/nixops-aws-vpc-network-interface-attachment.md".modules = [
    (importModule "nixops_aws/nix/vpc-network-interface-attachment.nix")
  ];
  files.docs."/gh-pages/src/nixops-aws-vpc-route.md".modules = [
    (importModule "nixops_aws/nix/vpc-route.nix")
  ];
  files.docs."/gh-pages/src/nixops-aws-vpc-route-table.md".modules = [
    (importModule "nixops_aws/nix/vpc-route-table.nix")
  ];
  files.docs."/gh-pages/src/nixops-aws-vpc-route-table-association.md".modules = [
    (importModule "nixops_aws/nix/vpc-route-table-association.nix")
  ];
  files.docs."/gh-pages/src/nixops-aws-vpc-subnet.md".modules = [
    (importModule "nixops_aws/nix/vpc-subnet.nix")
  ];
  files.mdbook.summary =  let
    nurs = map (v: "- [${v}](./nixops-aws-${v}.md)") [
      "data"
      "vpn-connection"
      "vpn-connection-route"
      "vpn-gateway"
      "cloudwatch-log-group"
      "cloudwatch-log-stream"
    # "cloudwatch-metric"
    # "ebs"
      "ec2-keypair"
      "ec2-placement"
      "ec2-rds-dbinstance"
      "ec2-rds-dbsecurity"
      "ec2-security"
      "eslatic-file-system"
      "eslatic-file-sistem-mount"
      "eslatic-ip"
      "iam"
      "rds"
      "route53"
      "s3"
    # "sns"
      "sqs"
      "vpc"
      "vpc-customer"
      "vpc-dhcp"
      "vpc-egress"
      "vpc-endpoint"
      "vpc-internet"
      "vpc-nat"
    # "vpc-network-acl"
      "vpc-network-interface"
      "vpc-network-interface-attachment"
      "vpc-route"
      "vpc-route-table"
      "vpc-route-table-association"
      "vpc-subnet"
    ];
  in ''
    ---
    - [NixOps AWS](./nixops-aws.md)
      ${builtins.concatStringsSep "\n  " nurs}
  '';
}
