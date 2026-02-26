# terraform-aws-sqs

Este módulo de Terraform crea una cola SQS en AWS con soporte para colas FIFO y Dead Letter Queue (DLQ), permitiendo la integración sencilla de colas en tus arquitecturas de nube.

## Características

- Creación de colas SQS estándar o FIFO
- Soporte para Dead Letter Queue (DLQ) opcional
- Configuración automática del sufijo `.fifo` para colas FIFO
- Política de redrive configurable
- Timeout de visibilidad personalizable

## Variables de entrada

| Nombre                        | Descripción                                           | Tipo        | Requerido | Default |
| ----------------------------- | ----------------------------------------------------- | ----------- | --------- | ------- |
| `name`                        | Nombre de la cola SQS (sin sufijo .fifo)              | string      | Sí        | -       |
| `fifo_queue`                  | Indica si la cola es FIFO                             | bool        | No        | false   |
| `create_dlq`                  | Indica si se debe crear una Dead Letter Queue         | bool        | No        | true    |
| `visibility_timeout_seconds`  | Tiempo de visibilidad del mensaje en segundos        | number      | Sí        | -       |
| `redrive_policy`              | Política de redrive para la cola                      | map(string) | No        | null    |
| `common_tags`                 | Tags aplicados a la cola y DLQ                        | map(string) | Sí        | -       |

## Variables de salida

| Nombre       | Descripción                        |
| ------------ | ---------------------------------- |
| `queue_arn`  | ARN de la cola SQS                 |
| `queue_url`  | URL de la cola SQS                 |
| `queue_name` | Nombre de la cola SQS              |
| `dlq_arn`    | ARN de la Dead Letter Queue        |
| `dlq_url`    | URL de la Dead Letter Queue        |
| `dlq_name`   | Nombre de la Dead Letter Queue     |

## Ejemplo de uso

### Cola estándar con DLQ

```hcl
module "sqs_standard" {
  source = "<ruta-al-repositorio>"

  name                       = "mi-cola-sqs"
  fifo_queue                 = false
  create_dlq                 = true
  visibility_timeout_seconds = 30
  redrive_policy = {
    maxReceiveCount = "3"
  }
  common_tags = {
    Environment = "dev"
    Project     = "ejemplo"
  }
}
```

### Cola FIFO con DLQ

```hcl
module "sqs_fifo" {
  source = "<ruta-al-repositorio>"

  name                       = "mi-cola-fifo"
  fifo_queue                 = true
  create_dlq                 = true
  visibility_timeout_seconds = 60
  redrive_policy = {
    maxReceiveCount = "5"
  }
  common_tags = {
    Environment = "prod"
    Project     = "ejemplo"
  }
}
```

### Cola sin DLQ

```hcl
module "sqs_no_dlq" {
  source = "<ruta-al-repositorio>"

  name                       = "mi-cola-simple"
  fifo_queue                 = false
  create_dlq                 = false
  visibility_timeout_seconds = 30
  redrive_policy             = null
  common_tags = {
    Environment = "test"
    Project     = "ejemplo"
  }
}
```

## Notas importantes

- Para colas FIFO, el módulo automáticamente agrega el sufijo `.fifo` al nombre
- La DLQ se crea con el sufijo `-dlq` agregado al nombre de la cola principal
- Si `create_dlq` es `false`, no se debe especificar `redrive_policy`
- El `visibility_timeout_seconds` debe ser apropiado para el tiempo de procesamiento de tus mensajes

## Licencia

Este proyecto está licenciado bajo la [Licencia Apache 2.0](./LICENCE). 