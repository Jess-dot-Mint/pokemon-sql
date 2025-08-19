# Proyecto SQL: Análisis de Pokémon

Este proyecto consiste en analizar un dataset de Pokémon utilizando **MySQL**.  
El dataset contiene información sobre 1025 Pokémon, incluyendo sus tipos, estadísticas base, generación y primera aparición.

## 📂 Dataset
Columnas principales:
- `pokemon_id`: Identificador único del Pokémon.
- `name`: Nombre del Pokémon.
- `primary_type`: Tipo primario.
- `secondary_type`: Tipo secundario (puede ser nulo).
- `first_appreance`: Juego en el que apareció por primera vez.
- `generation`: Generación a la que pertenece.
- `category`: Clasificación del Pokémon (regular, legendario, etc.).
- `total_base_stats`: Suma de las estadísticas base.
- `hp`, `attack`, `defense`, `special_attack`, `special_defense`, `speed`: Estadísticas individuales.

## 🎯 Objetivo
Practicar consultas SQL en distintos niveles de dificultad y generar insights relevantes a partir de los datos.

## 🛠 Tecnologías
- MySQL Workbench
- SQL estándar

## 📊 Consultas realizadas

### Nivel Básico
1. Listar todos los Pokémon con su tipo primario y secundario.
2. Mostrar todos los Pokémon ordenados por `total_base_stats` de mayor a menor.
3. Filtrar Pokémon por tipo secundario específico.
4. Contar cuántos Pokémon hay por `primary_type`.

### Nivel Intermedio
1. Promedio de `attack` y `defense` por tipo primario.
2. Pokémon más rápido (`speed`) de cada generación.
3. Top 10 Pokémon con mayor `special_attack`.
4. Cantidad de Pokémon sin tipo secundario.
5. Distribución de Pokémon por generación.

### Nivel Avanzado
1. Tipos primarios cuyo promedio de `total_base_stats` es mayor a 500.
2. Pokémon más fuerte de cada generación (subconsulta).
3. Comparación de promedios de ataque y defensa entre Pokémon con y sin tipo secundario.
4. Clasificación de Pokémon por rango de poder usando `CASE`.
5. Ranking de Pokémon por velocidad dentro de cada tipo primario (`RANK()`).

## 📌 Conclusiones
_(Aquí irán los hallazgos más importantes una vez hechas las consultas)_

---

💡 **Nota:** Este proyecto está diseñado para mostrar dominio progresivo en SQL, desde consultas simples hasta técnicas más avanzadas como funciones de ventana y subconsultas.
