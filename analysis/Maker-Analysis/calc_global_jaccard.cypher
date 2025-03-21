MATCH (m1:Maker)-[:MAKES]->(model1:Model)<-[s1:SUPPLIES_PART]-(supplier:Supplier)-[s2:SUPPLIES_PART]->(model2:Model)<-[:MAKES]-(m2:Maker)
WHERE m1 <> m2 AND m1 < m2
WITH m1, m2,
     COUNT(DISTINCT supplier) AS intersection,
     COLLECT(DISTINCT supplier) AS sharedSuppliers
WITH m1, m2, intersection, sharedSuppliers,
    [(m1)-[:MAKES]->(model1:Model)<-[:SUPPLIES_PART]-(supplier:Supplier) | supplier] AS m1Suppliers,
    [(m2)-[:MAKES]->(model2:Model)<-[:SUPPLIES_PART]-(supplier:Supplier) | supplier] AS m2Suppliers
WITH m1, m2, intersection, sharedSuppliers,
     apoc.coll.union(m1Suppliers, m2Suppliers) AS unionSuppliers
WITH m1, m2, intersection,  unionSuppliers, sharedSuppliers,
     toFloat(intersection) / SIZE(unionSuppliers) AS jaccardSimilarity
WHERE intersection > 5
ORDER BY jaccardSimilarity DESC, m1.name, m2.name
RETURN m1.name AS Maker1, m2.name AS Maker2, jaccardSimilarity, intersection, [s IN sharedSuppliers | s.name] AS sharedSuppliers