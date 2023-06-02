# AWS Amplify + Vite and Axios

### Localhost

```sh
cp example.env .env

yarn install
yarn dev
```

### AWS

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
