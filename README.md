<h1 align="center">fake-dynamodb</h1>

<p align="center">
  (Docker) Container that runs AWS local DynamoDB 🐳
</p>

## Usage

```
dynamo:
  image: vidsyhq/fake-dynamodb:latest
  ports:
    - 6001:6001
```

> Based off [spurious-io/dynamodb](https://github.com/spurious-io/dynamodb).

## Releases

After merge to **master**, remember to tag your merge commit:

```
make push-tag
```
