# Tema 12 - Minería de datos

## 1) ¿Qué es la minería de datos y por qué aparece?

La **minería de datos** surge con la consolidación de **almacenes de datos (Data Warehouses)**: al acumular grandes volúmenes de información, se vuelve posible extraer **reglas, patrones y estructuras útiles** mediante análisis estadísticos y técnicas (semi)automáticas. Su objetivo es **encontrar conocimiento** a partir de datos históricos, pero es clave entender que las “reglas” halladas **dependen del dataset** (no son universales).

**Ejemplo real**: una compañía telefónica analiza históricos de clientes (antigüedad, tipo de tarifa, incidencias abiertas, consumo de datos/voz, uso de roaming, llamadas al call center, quejas y cambios de plan) para detectar patrones de **churn** (probabilidad de baja), no para “adivinar” quién se irá, sino para **priorizar acciones de retención** (ofertas personalizadas, revisión proactiva de incidencias, mejoras de servicio y campañas segmentadas).

## 2) Qué problemas resuelve

### A) Predicción y clasificación

* **Predicción**: estima un valor/resultado a partir de atributos conocidos.
* **Clasificación** (caso particular de predicción): asigna una clase a un nuevo elemento (p.ej. “riesgo alto/medio/bajo”).

**Ejemplos reales**

* **Banca/Fintech**: decidir si conceder un crédito (aprobado/denegado) con variables como ingresos, historial, endeudamiento.
* **E-commerce**: predecir probabilidad de compra o churn.
* **Ciberseguridad**: clasificar eventos como “benignos” vs “sospechosos”.

**Herramientas recomendadas**

* **Python**: pandas + scikit-learn (árboles de decisión, regresión, validación).
* **Weka / Orange / KNIME / RapidMiner**: alternativas visuales “low-code” para clasificar y evaluar modelos.

### B) Asociación (reglas de co-ocurrencia)

Busca productos/elementos que suelen aparecer juntos (reglas del tipo *si A entonces B*).

**Ejemplos reales**

* **Retail**: “quienes compran pasta suelen comprar salsa”.
* **Plataformas de streaming**: reglas de co-visualización para recomendaciones.

**Herramientas recomendadas**

* **Python** (mlxtend para Apriori/FP-Growth) o herramientas visuales tipo Orange/KNIME.

### C) Agrupación (clustering)

Encuentra **grupos naturales** en los datos sin etiquetas previas: útil para segmentar usuarios o detectar perfiles.

**Ejemplos reales**

* **Segmentación de usuarios** en un comercio online (compradores recurrentes vs ocasionales).
* **Gaming**: detectar “tipos de jugadores” (exploradores, competitivos, coleccionistas).

**Herramientas recomendadas**

* **Python**: K-means, DBSCAN (scikit-learn).
* **Power BI / Tableau** para explorar segmentos (aunque el clustering “duro” suele hacerse fuera).

## 3) Proceso típico de minería de datos (pipeline)

El tema resume el proceso en **tres etapas**:

1. **Exploración inicial**: limpieza, selección de subconjuntos, selección de atributos relevantes.
2. **Construcción del modelo**: probar varios modelos sobre muestras; elegir el que mejor rinde para el objetivo.
3. **Implementación**: aplicar el modelo final a nuevos datos para generar predicciones/estimaciones.

**Ejemplo de aula (rápido y realista)**:
Dataset de tickets de soporte (fecha, categoría, severidad, tiempo de resolución, canal) → limpiar → entrenar un modelo que **prediga tiempo de resolución** (regresión) y/o **clasifique severidad**.

## 4) Otros tipos de minería: texto y visualización

### Minería de texto

Aplicar técnicas a documentos (logs, emails, reseñas, incidencias).

**Ejemplos reales**: análisis de reclamaciones, detección de temas frecuentes, historial de navegación.

**Herramientas**

* **Python**: spaCy / scikit-learn (TF-IDF + clasificadores), o transformers si el nivel lo permite.
* **Elastic / OpenSearch**: indexado + analítica sobre texto.

### Visualización de datos (como soporte a decisión)

La visualización no “decide”, pero permite entender grandes volúmenes rápidamente, y es un componente crítico del proceso.

**Herramientas**

* **Power BI / Tableau / Looker Studio**
* **Python**: matplotlib/plotly para análisis exploratorio (EDA).
