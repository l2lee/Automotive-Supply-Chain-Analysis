// Load data from CSV
// LOAD CSV WITH HEADERS FROM 'file:///groupby_maker.csv' AS row

// Load data from PostgreSQL (please replace your database name, your user name, your password, and other if neccessary)
CALL apoc.load.jdbc(
'jdbc:postgresql://localhost:5432/yourdb?user=yourusername&password=yourpassword',
'SELECT * FROM groupby_maker'
) YIELD row
MERGE (m:Maker {name: row.maker})
MERGE (s:Supplier {name: row.supplier_group})
MERGE (p:Product {name: row.product})
MERGE (m)-[r:SUPPLIES {year_range: row.year_range, trade_year_cnt: toInteger(row.trade_year_cnt), total_volume: toInteger(row.total_volume)}]->(s)
ON CREATE SET r.product = row.product;

// Top 3 suppliers in 'transmission_shaft' based on the number of trade count
// (a) with year_range as edge color

MATCH (m:Maker)-[r:SUPPLIES]->(s:Supplier)
WHERE r.product = 'transmission_shaft'
WITH r.year_range AS year_range, s, SUM(r.trade_year_cnt) AS total_trades
ORDER BY year_range, total_trades DESC
WITH year_range, COLLECT(s)[0..3] AS top_suppliers
UNWIND top_suppliers AS supplier
MATCH (m:Maker)-[r:SUPPLIES]->(supplier)
WHERE r.product = 'transmission_shaft' AND r.year_range = year_range
WITH m, supplier, r.trade_year_cnt AS trade_year_cnt, year_range
CALL apoc.create.vRelationship(
    supplier
    , year_range
    , {year_range: year_range, trade_year_cnt: trade_year_cnt}
    , m)
YIELD rel
RETURN m, supplier, rel
/////////////////////////////////////////////////////////////////////////////////////

// Top 3 suppliers in 'transmission_shaft' based on the number of trade count
// (b) with trade_cnt as edge width

MATCH (m:Maker)-[r:SUPPLIES]->(s:Supplier)
WHERE r.product = 'transmission_shaft'
WITH r.year_range AS year_range, s, SUM(r.trade_year_cnt) AS total_trades
ORDER BY year_range, total_trades DESC
WITH year_range, COLLECT(s)[0..3] AS top_suppliers
UNWIND top_suppliers AS supplier
MATCH (m:Maker)-[r:SUPPLIES]->(supplier)
WHERE r.product = 'transmission_shaft' AND r.year_range = year_range
WITH m, supplier, r.trade_year_cnt AS trade_year_cnt, year_range
CALL apoc.create.vRelationship(
    supplier
    , toString(trade_year_cnt)
    , {year_range: year_range, trade_year_cnt: trade_year_cnt}
    , m)
YIELD rel
RETURN m, supplier, rel
/////////////////////////////////////////////////////////////////////////////////////

// Top 3 suppliers in 'transmission_shaft' based on the total volume
// (c) with year_range as edge color

MATCH (m:Maker)-[r:SUPPLIES]->(s:Supplier)
WHERE r.product = 'transmission_shaft'
WITH r.year_range AS year_range, s, SUM(r.total_volume) AS total_volume
ORDER BY year_range, total_volume DESC
WITH year_range, COLLECT(s)[0..3] AS top_suppliers
UNWIND top_suppliers AS supplier
MATCH (m:Maker)-[r:SUPPLIES]->(supplier)
WHERE r.product = 'transmission_shaft' AND r.year_range = year_range
WITH m, supplier, r.total_volume AS total_volume, year_range
CALL apoc.create.vRelationship(
    supplier
    , year_range
    , {year_range: year_range, total_volume: total_volume}
    , m)
YIELD rel
RETURN m, supplier, rel
