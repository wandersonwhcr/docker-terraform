# docker-terraform

A Simple Docker Terraform Image

## Usage

### Docker

```
docker build . --tag wandersonwhcr/terraform

docker run --rm --interactive --tty \
    --env HOME=/app \
    --user `id -u`:`id -g` \
    --volume `pwd`:/app \
    wandersonwhcr/terraform terraform init
```

### Docker Compose

```
docker-compose up --detach

docker-compose exec cli terraform init
docker-compose exec cli terraform plan
docker-compose exec cli terraform apply
docker-compose exec cli terraform destroy

docker-compose exec cli bash
```
