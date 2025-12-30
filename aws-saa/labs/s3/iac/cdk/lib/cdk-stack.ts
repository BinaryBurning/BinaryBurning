// import { Duration, Stack, StackProps } from 'aws-cdk-lib/core'; // from version 1
import { Stack, StackProps, RemovalPolicy } from 'aws-cdk-lib'; import * as s3 from 'aws-cdk-lib/aws-s3'; import { Construct } from 'constructs';


export class CdkStack extends Stack {
  constructor(scope: Construct, id: string, props?: StackProps) {
    super(scope, id, props);

    new s3.Bucket(this, 'Bucket');
    // new s3.Bucket(this, 'Bucket', {
    //   blockPublicAccess: s3.BlockPublicAccess.BLOCK_ALL,
    //   encryption: s3.BucketEncryption.S3_MANAGED,
    //   enforceSSL: false,
    //   versioned: false,
    //   removalPolicy: RemovalPolicy.RETAIN,
    // });
  }
}
