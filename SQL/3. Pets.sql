/**

Information about pets is kept in two separate tables:

TABLE dogs
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(50) NOT NULL

TABLE cats
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(50) NOT NULL
Write a query that select all distinct pet names.

**/

SELECT name
FROM DOGS
UNION
SELECT name
FROM CATS

/**
Output

name    
-----
Bella    
Kitty    
Lola    
**/
