//getting Lisa
MATCH (p:PERSON {name: 'Lisa'})
RETURN p

//getting the Name of Lisas Cat
MATCH (:PERSON {name: 'Lisa'}) -[:HAS_PET]-> (c:CAT)
RETURN c.name

//Can also queried with Where Condition
MATCH (p:PERSON) -[:HAS_PET]-> (c:CAT)
WHERE p.name = 'Lisa'
RETURN c.name

//Create Nodes with aliases and Create the relationship
CREATE (ann:PERSON {name: 'Ann'}), (bello:DOG {name: 'Bello'})
CREATE (ann) -[:HAS_PET{since: 2015}]-> (bello)

//create it in one line
CREATE (:PERSON {name: 'Ann'}) -[:HAS_PET{since: 2015}]-> (:DOG {name: 'Bello'})

//upadate the age and the weight of a dog
MATCH (p:PERSON) -[:HAS_PET]-> (d:DOG {name: 'Bello'})
WHERE p.name = 'Ann'
SET d.age = 12, d.weight = 22
RETURN d

// Delete node and relationships
MATCH(dog:DOG {name: "Bello"})
DETACH DELETE dog


CREATE (node) -[relationship]-> (node)

MATCH (reference:LABEL{property}) -[reference:LABEL{property}]-> (reference:LABEL{property})
WHERE reference.property = 'value'
RETURN reference
ORDER BY reference.property