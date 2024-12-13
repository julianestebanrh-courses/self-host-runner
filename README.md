## 🛠️ Runners Disponibles

### Node.js Runner
- Basado en `node:18-bullseye`
- Ambiente especializado para proyectos Node.js
- Incluye:
  - Node.js 18.x
  - Git
  - Herramientas esenciales de construcción

### .NET Runner
- Basado en `mcr.microsoft.com/dotnet/sdk:7.0`
- Ambiente especializado para proyectos .NET
- Incluye:
  - SDK .NET 7.0
  - Git
  - Herramientas esenciales de construcción

### Multi-environment Runner
- Basado en `ubuntu:22.04`
- Ambiente completo con múltiples herramientas
- Incluye:
  - Node.js 18.x
  - .NET SDK (última versión LTS)
  - Python 3
  - Java 11 JDK
  - Git
  - Build Essential
  - Herramientas de construcción esenciales

## 🔒 Seguridad

- El archivo `.env` está incluido en `.gitignore` para prevenir commits accidentales
- Los runners se ejecutan con un usuario no-root dedicado
- Contenedores aislados para cada tipo de runner
- Se recomienda usar tokens de GitHub con los permisos mínimos necesarios
- Los runners generan nombres únicos automáticamente para evitar conflictos

## 📁 Estructura del Proyecto

```
.
├── dockerfile.nodejs    # Configuración para runner Node.js
├── dockerfile.dotnet    # Configuración para runner .NET
├── dockerfile.multi     # Configuración para runner multi-ambiente
├── docker-compose.yml   # Configuración de servicios
├── entrypoint.sh       # Script de inicio para los runners
├── .env.template       # Plantilla de variables de entorno
└── .gitignore         # Configuración de archivos ignorados
```

## 📝 Licencia

[MIT](LICENSE)

## ✒️ Autor

- **Julian Esteban** - [julianestebanrh](https://github.com/julianestebanrh)
