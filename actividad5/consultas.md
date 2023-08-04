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

> ## 5. Selecciona filas de la tabla actor donde el nombre sea Angela, Angelina o Audrey usando IN.

### Codigo
```sql
SELECT * FROM actor WHERE first_name IN ('Angela', 'Angelina', 'Audrey');
```
### Evidencia
![Consulta 5](./consulta5.png)

> ## 6. Obtén una lista de actores con el nombre Julia.

### Codigo
```sql
SELECT first_name, last_name FROM actor WHERE first_name = 'Julia';
```
### Evidencia
![Consulta 6](./consulta6.png)

> ## 7. Obtén una lista de actores con los nombres Chris, Cameron o Cuba.

### Codigo
```sql
SELECT first_name, last_name FROM actor WHERE first_name = 'Chris' OR first_name = 'Cameron' OR first_name = 'Cuba';
```
### Evidencia
![Consulta 7](./consulta7.png)

> ## 8. Selecciona la fila de la tabla customer para el cliente con el nombre Jamie Rice.

### Codigo
```sql
SELECT first_name, last_name FROM customer WHERE first_name = 'Jamie' AND last_name = 'Rice';
```
### Evidencia
![Consulta 8](./consulta8.png)

> ## 9. Selecciona el monto y la fecha de pago de la tabla payment donde el monto pagado sea menor a $1.

### Codigo
```sql
SELECT amount, payment_date FROM payment WHERE amount <1;
```
### Evidencia
![Consulta 9](./consulta9.png).

> ## 10. ¿Cuáles son las diferentes duraciones de alquiler permitidas por la tienda?

### Codigo
```sql

```
### Evidencia
![Consulta 10](./consulta10.png)

> ## 11. Ordena las filas en la tabla city por country_id y luego por city.

### Codigo
```sql
SELECT * FROM city ORDER BY country_id ASC, city DESC;
```
### Evidencia
![Consulta 11](./consulta11.png)

> ## 12. ¿Cuáles son los ID de los últimos 3 clientes que devolvieron un alquiler?

### Codigo
```sql
SELECT customer_id FROM rental ORDER BY return_date DESC LIMIT 3;
```
### Evidencia
![Consulta 12](./consulta12.png)

> ## 13. ¿Cuántas películas tienen clasificación NC-17? ¿Cuántas tienen clasificación PG o PG-13?

### Codigo
```sql
SELECT COUNT(rating) FROM film WHERE rating='NC-17' OR rating='PG' OR rating='PG-13';
```
### Evidencia
![Consulta 13](./consulta13.png)

> ## 14. ¿Cuántos clientes diferentes tienen registros en la tabla rental?

### Codigo
```sql
SELECT COUNT(DISTINCT customer_id) FROM rental;
```
### Evidencia
![Consulta 14](./consulta14.png)

> ## 15. ¿Hay algún cliente con el mismo apellido?

### Codigo
```sql

```
### Evidencia
![Consulta 15](./consulta15.png)