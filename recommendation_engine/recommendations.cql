// Films that Jake likes
MATCH (subject:Person)-[:LIKES]->(film:Film)
WHERE subject.name="Jake"
RETURN film.title;

// Other's who like the same films as you also like these films.
MATCH (subject:Person)-[:LIKES]->(film:Film)
WHERE subject.name="Jake"
WITH COLLECT(film) AS jakes_films
MATCH (subject:Person)-[:LIKES]->(film:Film)<-[:LIKES]-(:Person)-[:LIKES]->(other_film:Film)
WHERE subject.name="Jake" AND NOT other_film IN jakes_films
RETURN DISTINCT(other_film.title);

// Other's who like the same films as you with score for Jake.
MATCH (subject:Person)-[:LIKES]->(film:Film)<-[:LIKES]-(other_person:Person)
WHERE subject.name="Jake"
RETURN other_person.name, COUNT(*) AS number_of_films_in_common
ORDER BY number_of_films_in_common DESC;

