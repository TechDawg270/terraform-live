# AWS IoT Project Analyzing Temp Data in (near) Real Time

[Implementation based on this blog post tutorial](https://aws.amazon.com/blogs/big-data/perform-near-real-time-analytics-on-streaming-data-with-amazon-kinesis-and-amazon-elasticsearch-service/)

## Getting Started

### Setup environment and infrastructure
Set `env=<env>`

```bash
env=dev
terraform get -update=true
terraform init -backend-config=config/backend-${env}.conf
terraform plan -var-file=config/${env}.tfvars
terraform apply -var-file=config/${env}.tfvars
```

### Process
1. Run [python script](./scripts/load_temp_data_to_kinesis.py) to load raw data into AWS Kinesis
2. Analyze data using the [RANDOM_CUT_FOREST](http://docs.aws.amazon.com/kinesisanalytics/latest/sqlref/random-cut-forest.html) machine learning algorithm to detect anomalies
3. Processed anomaly data is then loaded into the Kinesis Firehose delivery stream
4. Export the processed anomaly data into the service and visualize it with Kibana (very easy with built-in integration between Kinesis Firehose and Amazon ES service)

## Road Map
* Parameterize python script for region and kinesis stream name to make it more dynamic
* Code AWS Kinesis Data Analytics Terraform resource and submit PR
