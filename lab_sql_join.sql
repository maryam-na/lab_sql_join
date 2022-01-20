# 1. List number of films per category.
use sakila;
SELECT 
    c.name, COUNT(f.film_id) AS number_of_films
FROM
    film f
        JOIN
    film_category fc ON f.film_id = fc.film_id
        JOIN
    category c ON fc.category_id = c.category_id
GROUP BY 1
ORDER BY 2 DESC;


#2- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT 
    c.last_name, SUM(p.amount) AS total_paid
FROM
    payment p
        JOIN
    customer c ON p.customer_id = c.customer_id
GROUP BY 1
ORDER BY 1;
#3- Display the first and last names, as well as the address, of each staff member.
SELECT 
    s. staff_id, s.first_name, s.last_name, a.address
FROM
    staff s
        JOIN
    address a ON s.address_id = a.address_id
GROUP BY staff_id;

#4- Display the total amount rung up by each staff member in August of 2005.
SELECT 
    CONCAT(s.first_name, ' ', s.last_name) AS staff_name,
    SUM(p.amount) AS total_amount,
    p.payment_date 
FROM
    staff s
        JOIN
    payment p ON s.staff_id = p.staff_id
WHERE
    p.payment_date LIKE '2005-08%'
GROUP BY s.staff_id
ORDER BY 2 DESC;

#5- List each film and the number of actors who are listed for that film.
SELECT 
    f.title, COUNT(fa.actor_id) AS number_of_actors
FROM
    film f
        JOIN
    film_actor fa ON f.film_id = fa.film_id
GROUP BY fa.film_id
ORDER BY 2 DESC;
