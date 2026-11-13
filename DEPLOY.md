# Guía de Despliegue - VieraTechSolution

## Sitio Web Listo para Desplegar

El sitio web está completo y optimizado para VieraTechSolution.

### Ubicación del Código
```
/c/Users/Brayan/proyectos-ia/vieratechsolution/
├── index.html          # Página principal (23.7KB)
├── package.json        # Configuración del proyecto
└── DEPLOY.md          # Esta guía
```

### Características Implementadas

✅ **Hero Section**: Propuesta de valor para negocios de Piura
✅ **Servicios**: 3 servicios con descripción detallada
✅ **Casos de Éxito**: Ejemplo visual de transformación digital
✅ **Precios**: 3 planes claros y directos
✅ **Formulario de Contacto**: Conectado a Calendly (URL a configurar)
✅ **Footer**: Datos de contacto y dirección en Piura, Perú

### Opción 1: GitHub Pages (Recomendado)

1. Crear repositorio público en GitHub: `vieratechsolution-website`
2. Subir archivos desde esta carpeta
3. En Settings → Pages → Source: `main` branch / `root`
4. URL generada automáticamente

### Opción 2: Netlify (Más rápido)

1. Arrastrar la carpeta completa a la interfaz de Netlify Deploy
2. O conectar el repositorio GitHub

### URL Esperada (una vez desplegado)
- GitHub Pages: `https://brayanvi.github.io/vieratechsolution-website/`
- Netlify: URL personalizada configurable

### Script de Verificación HTTP 200

```bash
curl -I https://<tu-dominio-desplegado>.com | grep "HTTP/2 200"
```

---

## Para el Agente de Prospección de Sellbird

Una vez verificado el HTTP 200, el enlace para la prospección será:

```
https://brayanvi.github.io/vieratechsolution-website/
```

*(Actualizar con la URL real después del despliegue)*