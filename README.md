# terraform-aws-sqs

Este módulo de Terraform crea una cola SQS en AWS, permitiendo la integración sencilla de colas en tus arquitecturas de nube.

## Variables de entrada

| Nombre          | Descripción                        | Tipo         | Requerido |
| --------------- | ---------------------------------- | ------------ | --------- |
| `name`          | Nombre de la cola SQS              | string       | Sí        |
| `fifo_queue`    | Indica si la cola es FIFO          | bool         | No        |
| `tags`          | Tags aplicados a la cola           | map(string)  | No        |

## Variables de salida

| Nombre        | Descripción                        |
| ------------- | ---------------------------------- |
| `queue_arn`   | ARN de la cola SQS                 |
| `queue_url`   | URL de la cola SQS                 |

## Ejemplo de uso

```hcl
module "sqs" {
  source = "<ruta-al-repositorio>"

  name = "mi-cola-sqs"
  fifo_queue = false
  tags = {
    Environment = "dev"
    Project     = "ejemplo"
  }
}
```

## Licencia

Este proyecto está licenciado bajo la [Licencia Apache 2.0](./LICENCE). 