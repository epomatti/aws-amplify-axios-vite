# AWS Amplify + Vite and Axios

### Localhost

```sh
cp example.env .env

yarn install
yarn dev
```

### AWS

To use GitHub Apps, first make sure you've granted permissions to the specific region you're using. Example:

```sh
https://github.com/apps/aws-amplify-us-east-2
```

The token permissions required are defined as follows:

> Select scopes section, select admin:repo_hook

You can check the [documentation](https://docs.aws.amazon.com/amplify/latest/userguide/setting-up-GitHub-access.html) for additional information.

> You can use AWS CloudFormation, the Amplify CLI, and the SDKs to deploy a new Amplify app that uses the GitHub App for repo access. This process requires that you first install the Amplify GitHub App in your GitHub account. Next, you will need to generate a personal access token in your GitHub account. Lastly, deploy the app and specify the personal access token.

#### Console

You can easily create a Hosting using the web console.

#### Terraform

#### CLI

If you're using GitHub App, don't forget to give permissions

> Using [GitHub App tokens](https://docs.aws.amazon.com/amplify/latest/userguide/setting-up-GitHub-access.html#setting-up-github-app-cloudformation) should be preferred.

```sh
token=<TOKEN>

aws amplify create-app \
  --name myviteapp \
  --region us-east-2
  --repository "https://github.com/epomatti/aws-amplify-axios-vite" \
  --enable-branch-auto-build \
  --access-token $token

aws amplify create-branch \
  --app-id <appid> \
  --branch-name main \
  --stage "PRODUCTION" \
  --environment-variables '{ "VITE_API_BASE_URL": "https://dummyjson.com" }'
```
