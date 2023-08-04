# Ejercicio de consultas en base de datos ***dvdrental***

> ## 1. Selecciona las columnas film_id y title de la tabla film.

### Codigo
```sql
SELECT film_id, title FROM film;
```
### Evidencia
![Consulta 1](./consulta1.png)

> ## 2. Selecciona 5 filas de la tabla film, obteniendo todas las columnas.

### Codigo
```sql
SELECT * FROM film LIMIT 5;
```
### Evidencia
![Consulta 2](./consulta2.png)

> ## 3. Selecciona filas de la tabla film donde film_id sea menor que 4.

### Codigo
```sql
SELECT * FROM film WHERE film_id<4;
```
### Evidencia
![Consulta 3](./consulta3.png)

> ## 4. Selecciona filas de la tabla film donde el rating sea PG o G.

### Codigo
```sql
SELECT * FROM film WHERE rating = 'PG' OR rating = 'G';
```
### Evidencia
![Consulta 4](./consulta4.png)