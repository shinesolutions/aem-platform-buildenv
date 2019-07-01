Configuration
-------------

The following configurations are available for users to customise the creation process and the resulting machine images.

Check out the [example configuration files](https://github.com/shinesolutions/aem-helloworld-config/tree/ecr-support/aem-platform-buildenv/sandpit) as reference.

### User configuration properties for Docker:

| Name | Description | Required? | Default |
|------|-------------|-----------|---------|
| docker.timezone | [TZ Database name](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List) | Optional | `Australia/Melbourne` |
| docker.repository | [Docker Hub user name](https://docs.docker.com/docker-hub/repos/) or [AWS ECR URI(\<aws_account_id\>.dkr.ecr.\<region\>.amazonaws.com)](https://docs.aws.amazon.com/AmazonECR/latest/userguide/Registries.html#registry_auth) | Optional | `shinesolutions` |

### AWS platform type configuration properties:

| Name | Description | Required? | Default |
|------|-------------|-----------|---------|
| aws.region | [AWS region name](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html), only needed if you're using AWS ECR as Docker registry. | Optional | `ap-southeast-2` |

### Official configuration properties
| Name | Description | Required? | Default |
|------|-------------|-----------|---------|
| docker.image.name | The docker image name | Mandatory | `aem-platform-buildenv` |
| docker.image.version | The docker image version | Mandatory | `<latest_version_number>` |
