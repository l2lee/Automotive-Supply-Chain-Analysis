// Load CSV with headers
LOAD CSV WITH HEADERS FROM 'file:///combined_preprocessed.csv' AS row

// Create unique nodes (using MERGE to prevent duplicates)
MERGE (region:Region {name: row.region})
MERGE (maker:Maker {name: row.maker})
MERGE (model:Model {
    name: row.model,
    model_year: toInteger(row.model_year),
    model_region: row.model_region
})
MERGE (supplier:Supplier {name: row.supplier})
MERGE (product:Product {name: row.product})

// Create relationships
MERGE (maker)-[:MAKES]->(model)
MERGE (maker)-[:LOCATED_IN]->(region)
MERGE (supplier)-[s:SUPPLIES]->(product)
MERGE (model)-[u:USES]->(product)

// Set the yearly volume as a property on the USES relationship since it connects model and product
SET u.yearly_volume = toInteger(row.yearly_volume)