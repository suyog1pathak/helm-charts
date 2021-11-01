# EBS-CSI Installation Chart <img src="https://cncf-branding.netlify.app/img/projects/helm/icon/color/helm-icon-color.svg" width="30px">
![](https://blog.cristienordic.com/hs-fs/hubfs/Tech%20Blog/2020/RedHat/CSI%20blog-1.png?width=1000&name=CSI%20blog-1.png)

* Note: AWS EBS CSI is required. 

* This chart will create storage Classes eks cluster to avail AWS EBS as backend for persistent volumes. (**specific to multiAZ stateful set implementation**)
* Define AZs and property vars to deploy identical storage classes over those AZs.



var          | type |details
------------- |---- |-------------
storage.zones|[]|list of AWS AZs e.g storage.zones[0]="us-east-1a" storage.zones[1]="us-east-1b"
options.allowVolumeExpansion|boolean|PVCs created from this StorageClass will be allowed to trigger volume expansion.
options.volumeBindingMode|""|```https://kubernetes.io/docs/concepts/storage/storage-classes/```
parameters.fsType|""|File system type that will be formatted during volume creation. This parameter is case sensitive!xfs, ext2, ext3, ext4
parameters.type|""|EBS volume type  io1 io2 gp2 gp3 sc1 st1 standard
parameters.iopsPerGB|""|I/O operations per second per GiB. Required when io1 or io2 volume type is specified. If this value multiplied by the size of a requested volume produces a value above the maximum IOPs allowed for the volume type, as documented, AWS will cap the IOPS to maximum supported value. If the value is lower than minimal supported IOPS value per volume, either error is returned (the default behavior) or the value is increased to fit into the supported range when allowautoiopspergbincrease is "true".
parameters.allowAutoIOPSPerGBIncrease|boolean|When "true", the CSI driver increases IOPS for a volume when iopsPerGB * <volume size> is too low to fit into IOPS range supported by AWS. This allows dynamic provisioning to always succeed, even when user specifies too small PVC capacity or iopsPerGB value. On the other hand, it may introduce additional costs, as such volumes have higher IOPS than requested in iopsPerGB.
iops|int|I/O operations per second. Only effetive when gp3 volume type is specified. If empty, it will set to 3000 as documented.
parameters.throughput|int|Throughput in MiB/s. Only effective when gp3 volume type is specified. If empty, it will set to 125MiB/s as documented.
parameters.encrypted|""|Whether the volume should be encrypted or not. Valid values are "true" or "false"
parameters.kmsKeyId|""|The full ARN of the key to use when encrypting the volume. When not specified, the default KMS key is used
 
```https://github.com/kubernetes-sigs/aws-ebs-csi-driver#readme ```\
``` https://github.com/kubernetes-sigs/aws-ebs-csi-driver/blob/master/examples/kubernetes/storageclass/specs/example.yaml``` 