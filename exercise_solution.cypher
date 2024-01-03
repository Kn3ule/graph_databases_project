//show complete Graph
MATCH (n)
RETURN (n)

//get all nodes with label PLAYER
MATCH (player:PLAYER)
RETURN player

//get player the age of with name Thomas Müller
MATCH (player:PLAYER)
WHERE player.name = "Thomas Müller"
RETURN player.age

MATCH (player:PLAYER {name: "Thomas Müller"})
RETURN player.age

//get all players from VfB Stuttgart
MATCH (player:PLAYER)-[:PLAYS_FOR]-> (team:TEAM)
WHERE team.name = "VfB Stuttgart"
RETURN player

//get the name and salary of all players ordered by the salary
MATCH (player:PLAYER)-[contract:PLAYS_FOR]->(team:TEAM)
RETURN player.name, contract.salary
ORDER BY contract.salary

//create a node and relationship for the player Maximilian Mittelstädt from VfB Stuttgart
//attributes: age:26, number:7, height:1.80, foot:"left",
MATCH (vfb:TEAM{name:"VfB Stuttgart"})
CREATE (mittelstädt:PLAYER{name: "Maximilian Mittelstädt", age: 26, height:1.80, foot:"left", number: 7})
CREATE (mittelstädt)-[:PLAYS_FOR]-> (vfb)

//Update the salary for Maximilian Mittelstädt
MATCH (mittelstädt:PLAYER{name: "Maximilian Mittelstädt"})-[contract:PLAYS_FOR]->(vfb:TEAM{name: "VfB Stuttgart"})
SET contract.salary = 926000

//delete player Serhou Guirassy with relations
MATCH(serhou {name: "Serhou Guirassy"})
DETACH DELETE serhou