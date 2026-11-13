#!/bin/bash
# Script de verificación de despliegue VieraTechSolution
# Ejecutar después de desplegar el sitio web

echo "=========================================="
echo "Verificación de Despliegue VieraTechSolution"
echo "=========================================="
echo ""

# Reemplazar con la URL real del sitio desplegado
URL="${1:-https://vieratechsolution.netlify.app}"

echo "URL a verificar: $URL"
echo ""

# Verificar HTTP 200
echo "1. Verificando código HTTP..."
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$URL")
if [ "$HTTP_STATUS" == "200" ]; then
    echo "   ✅ HTTP Status: $HTTP_STATUS (OK)"
else
    echo "   ❌ HTTP Status: $HTTP_STATUS (Falló)"
fi

# Verificar que el sitio carga
echo ""
echo "2. Verificando carga de página..."
TIME_TO_FIRST_BYTE=$(curl -s -o /dev/null -w "%{time_starttransfer}" "$URL")
if (( $(echo "$TIME_TO_FIRST_BYTE < 2" | bc -l) )); then
    echo "   ✅ Tiempo de respuesta: ${TIME_TO_FIRST_BYTE}s (Rápido)"
else
    echo "   ⚠️ Tiempo de respuesta: ${TIME_TO_FIRST_BYTE}s (Lento)"
fi

# Verificar contenido clave
echo ""
echo "3. Verificando contenido esencial..."
TITLE=$(curl -s "$URL" | grep -o '<title>.*</title>' | sed 's/<[^>]*>//g')
if echo "$TITLE" | grep -q "VieraTechSolution"; then
    echo "   ✅ Título correcto: $TITLE"
else
    echo "   ❌ Título incorrecto: $TITLE"
fi

DESC=$(curl -s "$URL" | grep -o 'meta name="description" content="[^"]*"' | cut -d'"' -f4)
if echo "$DESC" | grep -q "Soluciones tecnológicas"; then
    echo "   ✅ Meta descripción presente"
else
    echo "   ❌ Meta descripción faltante"
fi

# Verificar secciones
echo ""
echo "4. Verificando secciones del sitio..."
SECTIONS_OK=true
for section in "inicio" "servicios" "casos" "precios" "contacto"; do
    if curl -s "$URL" | grep -q "id=\"$section\""; then
        echo "   ✅ Sección #$section presente"
    else
        echo "   ❌ Sección #$section faltante"
        SECTIONS_OK=false
    fi
done

# Verificar formulario
echo ""
echo "5. Verificando formulario de contacto..."
if curl -s "$URL" | grep -q "contactForm"; then
    echo "   ✅ Formulario de contacto presente"
else
    echo "   ❌ Formulario de contacto faltante"
fi

echo ""
echo "=========================================="
if [ "$HTTP_STATUS" == "200" ]; then
    echo "✅ DESPLIEGUE VERIFICADO EXITOSAMENTE"
else
    echo "❌ ERROR: El sitio no responde correctamente"
fi
echo "=========================================="