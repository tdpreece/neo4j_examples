CREATE (:Film { title: "The Shawshank Redemption" });
CREATE (:Film { title: "The Godfather" });
CREATE (:Film { title: "The Godfather: Part II" });
CREATE (:Film { title: "The Dark Knight" });
CREATE (:Film { title: "Pulp Fiction" });
CREATE (:Film { title: "Schindler's List" });
CREATE (:Film { title: "12 Angry Men" });
CREATE (:Film { title: "The Good, the Bad and the Ugly" });
CREATE (:Film { title: "The Lord of the Rings: The Return of the King" });
CREATE (:Film { title: "Fight Club" });

CREATE (:Person { name: "Adrian" });
CREATE (:Person { name: "Fabrizio" });
CREATE (:Person { name: "Jake" });
CREATE (:Person { name: "Paul" });
CREATE (:Person { name: "Tim" });

MATCH (f:Film)
WHERE f.title="The Shawshank Redemption" OR
      f.title="The Dark Knight" OR
      f.title="Pulp Fiction"
WITH COLLECT(f) AS films
MATCH (p:Person)
WHERE p.name="Adrian"
FOREACH (film in films | CREATE (p)-[:LIKES]->(film));

MATCH (f:Film)
WHERE f.title="12 Angry Men" OR
      f.title="The Good, the Bad and the Ugly" OR
      f.title="The Lord of the Rings: The Return of the King"
WITH COLLECT(f) AS films
MATCH (p:Person)
WHERE p.name="Fabrizio"
FOREACH (film in films | CREATE (p)-[:LIKES]->(film));

MATCH (f:Film)
WHERE f.title="12 Angry Men" OR
      f.title="The Good, the Bad and the Ugly" OR
      f.title="Pulp Fiction"
WITH COLLECT(f) AS films
MATCH (p:Person)
WHERE p.name="Jake"
FOREACH (film in films | CREATE (p)-[:LIKES]->(film));

MATCH (p:Person), (f:Film)
WHERE p.name="Paul" AND f.title="The Shawshank Redemption"
CREATE (p)-[:LIKES]->(f);


