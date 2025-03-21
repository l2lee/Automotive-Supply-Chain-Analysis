MATCH (m1:Maker)-[:MAKES]->(model1:Model)<-[s1:SUPPLIES_PART]-(supplier:Supplier)-[s2:SUPPLIES_PART]->(model2:Model)<-[:MAKES]-(m2:Maker)
WHERE m1 <> m2 AND s1.product = s2.product AND m1 < m2
WITH m1, m2, s1.product AS Product,
     COUNT(DISTINCT supplier) AS intersection,
     COLLECT(DISTINCT supplier) AS sharedSuppliers
WITH m1, m2, Product, intersection, sharedSuppliers,
    [(m1)-[:MAKES]->(model1:Model)<-[s1:SUPPLIES_PART]-(supplier:Supplier) WHERE s1.product = Product | supplier] AS m1Suppliers,
    [(m2)-[:MAKES]->(model2:Model)<-[s2:SUPPLIES_PART]-(supplier:Supplier) WHERE s2.product = Product | supplier] AS m2Suppliers
WITH m1, m2, Product, intersection, sharedSuppliers,
     apoc.coll.union(m1Suppliers, m2Suppliers) AS unionSuppliers
WITH m1, m2, Product, intersection, unionSuppliers, sharedSuppliers,
     toFloat(intersection) / SIZE(unionSuppliers) AS jaccardSimilarity
WHERE intersection > 5 // Filter by intersection size
ORDER BY jaccardSimilarity DESC, m1.name, m2.name, Product
RETURN m1.name AS Maker1, m2.name AS Maker2, Product, jaccardSimilarity, intersection, [s IN sharedSuppliers | s.name] AS sharedSuppliers