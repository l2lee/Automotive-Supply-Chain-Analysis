<h1 align="center">Automotive Supply Chain Analysis</h1>


<div align="center">

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](/LICENSE)

</div>

---

<p align="center"> Final project of DSC202 - Data Management for Data Science (2025 WINTER)
    <br> 
</p>

## 📝 Table of Contents

- [📝 Table of Contents](#-table-of-contents)
- [🧐 About ](#-about-)
- [📂 Datasets ](#-datasets-)
- [📖 Methodology ](#-methodology-)
- [✨ Demostration ](#-demonstration-)
- [✍️ Authors ](#️-authors-)
- [✨ Reference ](#-reference-)

## 🧐 About <a name = "about"></a>

This repository contains the final project for DSC202 - Data Management for Data Science.
The objective of this project is to explore automotive components and supply chain analysis in MarkLines. We investigate the industry's structure and relationships by addressing three key questions:
#### 1. Supply chain overview: Who are the primary suppliers for each product, and what is the structure of the key supply network?
#### 2. Key suppliers: Who are the key autosuppliers, and how have their positions evolved over time?
#### 3. Maker's similarity: Who are the dominant automakers, and how have their positions evolved over time?

To answer these questions, we leverage PostgreSQL, Neo4j, and Python for data preprocessing, statistical analysis, and network visualization. Our analysis spans from 2015 to 2025, offering insights into supply chain trends and competitive dynamics.

## 📂 Datasets <a name="datasets"></a>
This repository utilizes datasets from MarkLines, focusing on supply relationships among suppliers, automakers, and their respective models across various automotive components.
### Data Location
* Raw data: Stored in the `dataset/raw_data` directory.
* Processed data: Stored in the `dataset/preprocessed_data` directory.

### Data Processing Steps
1. Combine Datasets & Assign Trading Volumes
* All CSV files are merged, and trading volumes are randomly assigned in Python for further analysis.
* Script: `preprocessing/combine.py`
2. Standardize Regions, Calculate Yearly Trading Volumes, and Combine Supply Group Data
* The process regularizes model region data with the formatted country data. Output is stored in `preprocessing/combined_preprocessed.csv`.
* Scripts: `preprocessing/country.sql` & `preprocessing/combined_preprocessed.sql`
3. Extract parent company / supplier group data from supplier data
* Take supplier group name from supply group data for further analysis. Output is stored in `preprocessing/supplier.csv`.
* Script: `?????`

### Processed Data Outputs
* `combined_preprocessed.csv` – Supply dataset with region, maker, model, model year, supplier, product, yearly volume conlums.
* `supplier.csv` – Supplier and the respective group's name.

## 📖 Methodology <a name="methodology"></a>

The following are the example results in answering the questions.
#### 1. Supply chain overview: Who are the primary suppliers for each product, and what is the structure of the key supply network?

#### (a) Total trading volume analysis
This approach identifies market leaders based on 5-year aggregated trading volume using the following files:
* Dataset: `preprocessing/combined_preprocessed.csv`, `preprocessing/supplier.csv`
* Analysis Script: `Analysis/Supply-chain-overview/groupby_supplier-group.sql`

#### Implementation:a
1. Use `combined_preprocessed.csv`, join supplier group data from `supplier.csv`, and categorize years into 5-year intervals (2005-2010, 2011-2015, 2016-2020, 2021-2025)
2. Follow `groupby_supplier-group.sql` to categorize years into 5-year intervals, aggregate trading volumes, and get the top 5 suppliers in each product

#### (b) Key Supply Network Analysis
This method identifies the top suppliers for each automotive component based on the number of supply relationships. In this example, we extract the top 3 suppliers in 'transmission shaft' using the following files:
* Dataset: `preprocessing/combined_preprocessed.csv`, `preprocessing/supplier.csv`
* Analysis Scripts:
    * `Analysis/Supply-chain-overview/groupby_maker.sql`
    * `Analysis/Supply-chain-overview/top_3_transmission_shaft.cypher`

#### Implementation:
1. Follow the `groupby_maker.sql` to categorize supply relationships into 5-year intervals
2. Supplier Ranking: We identified the most connected suppliers for each component category across time periods using Neo4j graph analysis




#### 2. Which companies compete in the same component markets? How similar are automakers in their supply relationships


#### 3. Who are the dominant automakers, and how have their positions evolved over time?

## 📖 Demonstration <a name="demonstration"></a>

### 1. Key suppliers
#### (a) Supply Relationship Frequency Analysis
The following is the example result of our analysis, which shows the top 3 suppliers in 'automated_manual_transmission' across different time frames:
* Green nodes represent automakers, which corresponds to the 'maker' data in csv.
* Brown nodes represent suppliers, which corresponds to the 'supplier_group' data in csv.
* Edges indicate a "SUPPLIES_TO" relationship, where a supplier provides a specific automotive component to an automaker in the given year range.
* Edge colors differentiate supply relationships across different time frames, with red (2005-2010), yellow (2011-2015), green (2016-2020), blue (2021-2025).

<p align="center">
<img src="https://github.com/l2lee/Automotive-Supply-Chain-Analysis/blob/main/Analysis/Key%20Supplier/key_supplier_year_range%20(automated_manual_transmission).png" width="70%">
</p>

Similarly, the following show the same supply network in 'automated_manual_transmission', with only the size of edge is changing to show the different count of supply record:
* Green nodes represent automakers, which corresponds to the 'maker' data in csv.
* Brown nodes represent suppliers, which corresponds to the 'supplier_group' data in csv.
* Edges indicate a "SUPPLIES_TO" relationship, where a supplier provides a specific automotive component to an automaker in the given year range.
* Edge colors differentiate supply relationships across different time frames, with red (2005-2010), yellow (2011-2015), green (2016-2020), blue (2021-2025).
<p align="center">
<img src="https://github.com/l2lee/Automotive-Supply-Chain-Analysis/blob/main/Analysis/Key%20Supplier/key_supplier_trade_cnt%20(automated_manual_transmission).png" width="70%">
</p>

From the above analysis, we can see that the key suppliers change over years. Marelli, for instance, used to be the most important supplier in the early stage. However, as time goes by, the position of key supplier has been shifted to Asin, Magneti Marelli.

The network visualization reveals a significant transformation in the automotive supplier ecosystem from 2005 to projected 2025. Marelli (bottom left), for instance, initially established a dominant position with extensive connections to automotive makers like Peugeot and Citroen primarily during 2005-2015. These relationships appear predominantly as red and yellow arrows, indicating supply relationship during this specific timeframe.

As the industry evolved, Aisin (center) emerged as a central hub with more diverse and numerous connections spanning multiple time periods. Its partnerships extend to various Chinese manufacturers (Dongfeng, Changan, SAIC), Japanese brands, and international companies, demonstrating remarkable expansion and adaptability. The varied colored arrows (yellow, green, blue) connecting to Aisin illustrate how this supplier has maintained and grown relationships across different time periods.

It has shown that there is a gengraphic shift in the supply chain of 'automated manual transmission' over time. Earlier key suppliers mostly are from Europe, while newer  ones come from both European countries and Japan.

### (b) Annual trading volume analysis to determine leading suppliers
The final output consists of the top five suppliers in each of the automotive component each year range based on annual supply volume.
A screenshot of the data is as follow, full data could be found in `key_supplier_annual_volume.csv`
<p align="center">
<img src="https://github.com/l2lee/Automotive-Supply-Chain-Analysis/blob/main/Analysis/Key%20Supplier/key_supplier_annual_volume.png">
</p>

### 2. Maker's similarity

### 3. Dominant automakers


## ✍️ Authors <a name="authors"></a>
- [@ripple-space](https://github.com/ripple-space) - Yi Lien
- [@l2lee](https://github.com/l2lee) - Lucas Lee
- [@Jeanhsu0707](https://github.com/Jeanhsu0707) - Hua Jin Hsu


## ✨ Reference <a name="reference"></a>
- [MarkLines](https://www.marklines.com/en/)
