<h1 align="center">Automotive Supply Chain Analysis</h1>


<div align="center">

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](/LICENSE)

</div>

---

<p align="center"> Final project of DSC202 - Data Management for Data Science (2025 WINTER)
    <br> 
</p>

## Presentation Recording
Our presentation can be found here: [link](https://www.youtube.com/watch?v=J7cBdm22pNc)

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
* All CSV files are merged, and trading volumes are randomly generate from Uniform distribution U(100, 1000) in Python for further analysis.
* Script: `preprocessing/combine.py`
2. Standardize Regions, Calculate Yearly Trading Volumes, and Combine Supply Group Data
* The process regularizes model region data with the formatted country data. Output is stored in `preprocessing/combined_preprocessed.csv`.
* Scripts: `preprocessing/country.sql` & `preprocessing/combined_preprocessed.sql`
3. Extract parent company / supplier group data from supplier data
* Take supplier group name from supply group data for further analysis. Output is stored in `preprocessing/supplier.csv`.
* Script: `?????`

### Processed Data Outputs
* `preprocessing/combined_preprocessed.csv` – Supply dataset with region, maker, model, model year, supplier, product, yearly volume conlums.
* `preprocessing/supplier.csv` – Supplier and the respective group's name.

## 📖 Methodology <a name="methodology"></a>

The following are the example results in answering the questions.
#### 1. Supply chain overview: Who are the primary suppliers for each product, and what is the structure of the key supply network?

#### (a) Total trading volume analysis
This approach identifies the top 5 suppliers based on 5-year aggregated trading volume.

#### Data Location
* Dataset: `preprocessing/combined_preprocessed.csv`, `preprocessing/supplier.csv`
* Analysis Script: `analysis/Supply-chain-overview/groupby_supplier-group.sql`

#### Implementation
1. Import all datasets into PostgreSQL
2. Follow `groupby_supplier-group_year_range.sql` to conduct the following analysis:
   * Combine combined_preprocessed with supplier_group data
   * Categorize years into 5-year intervals (2005-2010, 2011-2015, 2016-2020, 2021-2025)
   * Aggregate trading volumes
   * Get the top 5 suppliers in each product

#### Outputs
* `analysis/Supply-chain-overview/groupby_supplier-group.csv` – Top 5 suppliers in each product category in a given year range

#### (b) Key Supply Network Analysis
This method identifies the top suppliers for each automotive component based on **the number of trade count**, or **the total trading volume**.
In this example, we extract the top 3 suppliers in 'transmission shaft' and visualize the key supply network over time.

#### Data Location
* Dataset: `preprocessing/combined_preprocessed.csv`, `preprocessing/supplier.csv`
* Analysis Scripts:
    * `analysis/Supply-chain-overview/groupby_maker.sql`
    * `analysis/Supply-chain-overview/top_3_transmission_shaft.cypher`

#### Implementation
1. Import all datasets in PostgreSQL
2. Follow the `groupby_maker.sql` to process the data in the following steps:
   * Aggregate the annual volume in combined_preprocess
   * Combine data with supplier_group data
   * Categorize years into 5-year intervals (2005-2010, 2011-2015, 2016-2020, 2021-2025)
   * Aggregate trade count as trade_year_cnt and trading volumes as total_volume
3. Implement `top_3_transmission_shaft.cypher` to generate the visualization in the following steps:
    * Load the groupby_maker table we just created in PostgreSQL into Neo4j
    * Merge nodes and edges, set the supply product information in the edges
    * Keep product type = 'transmission_shaft'
    * Aggregate the trade_year_cnt (or total_volume) to find the top 3 suppliers
    * Create virtual edges
    * Return makers, top 3 suppliers, and the edges

Noted that you can either select the top 3 suppliers based on trade_year_cnt or total_volume. You should implement the corresponding cypher code in the file. 

#### 2. Which companies compete in the same component markets? How similar are automakers in their supply relationships


#### 3. Who are the dominant automakers, and how have their positions evolved over time?

## 📖 Demonstration <a name="demonstration"></a>

### 1. Supply chain overview
#### (a) Total Trading Volume Analysis
The final output consists of the top 5 suppliers in each of the automotive component each year range based on the trading volume.
Full data could be found in `groupby_supplier-group.csv`

### (b) Key Supply Network Analysis
The following is the example result of our analysis, which shows the top 3 suppliers in 'transmission_shaft' across different time frames:
* Green nodes represent automakers, which corresponds to the 'maker' data in csv.
* Brown nodes represent suppliers, which corresponds to the 'supplier_group' data in csv.
* Edges indicate that there is a "SUPPLIES_TO" relationship, where a supplier provides a specific automotive component to an automaker in the given year range.
* Edge colors differentiate supply relationships across different time frames, with red (2005-2010), yellow (2011-2015), green (2016-2020), blue (2021-2025).

<p align="center">
<img src="https://github.com/l2lee/Automotive-Supply-Chain-Analysis/blob/main/Analysis/Supply-chain-overview/top_3_year_trade_cnt_transmission_shaft_1.png" width="70%">
</p>

Similarly, the following show the same supply network in 'transmission_shaft', with only the size of edge is changing to show the different count of supply record:
* Green nodes represent automakers, which corresponds to the 'maker' data in csv.
* Brown nodes represent suppliers, which corresponds to the 'supplier_group' data in csv.
* Edges indicate that there is a "SUPPLIES_TO" relationship, where a supplier provides a specific automotive component to an automaker in the given year range.
* Edge width represents the frequency of supply within the given year range, on a scale from 1 to 5. A value of 1 indicates that the supply occurred in only one year, while a value of 5 means the supply was continuous throughout the entire year range.
<p align="center">
<img src="https://github.com/l2lee/Automotive-Supply-Chain-Analysis/blob/main/Analysis/Supply-chain-overview/top_3_year_trade_cnt_transmission_shaft_2.png" width="70%">
</p>

On the other hand, we also use the total trading volume to extract the top 3 suppliers in 'transmission_shaft'.\:
* Green nodes represent automakers, which corresponds to the 'maker' data in csv.
* Brown nodes represent suppliers, which corresponds to the 'supplier_group' data in csv.
* Edges indicate that there is a "SUPPLIES_TO" relationship, where a supplier provides a specific automotive component to an automaker in the given year range.
* Edge colors differentiate supply relationships across different time frames, with red (2005-2010), yellow (2011-2015), green (2016-2020), blue (2021-2025).
<p align="center">
<img src="https://github.com/l2lee/Automotive-Supply-Chain-Analysis/blob/main/Analysis/Supply-chain-overview/top_3_total_volume_transmission_shaft.png" width="70%">
</p>

The network visualization highlights a significant transformation in the automotive supplier ecosystem from 2005 to the landscape of 2025.

* Early Period (2005–2010): Neumay dominated the transmission shaft market, primarily supplying European manufacturers.
* Transition Period (2011–2015): Bosch expanded its presence by establishing relationships with Chinese automakers such as SAIC, Dongfeng, and BAIC, while Qianchao Sunway Co., Ltd. developed connections with joint ventures like SAIC Volkswagen and FAW-Volkswagen.
* Mature Period (2016–2020): SKF emerged as a key hub, forming extensive connections with manufacturers in the United States and Japan.
* Recent Period (2021–2025): Japanese supplier Aichi has strengthened its relationships with domestic manufacturers, including Toyota and Mitsubishi, indicating a shift toward more specialized Asian supplier networks.

This analysis reveals a clear geographic shift in the transmission shaft supply chain over time. The transition from Neumay to SKF reflects manufacturers’ evolving sourcing strategies and efforts to diversify trading relationships, particularly for North American brands. Initially, European suppliers primarily served European manufacturers. Over time, Chinese joint ventures integrated into the supply chain, and in recent years, Japanese suppliers have entered the market, competing with dominant players over Asian automakers.

### 2. Maker's similarity

### 3. Dominant automakers


## ✍️ Authors <a name="authors"></a>
- [@ripple-space](https://github.com/ripple-space) - Yi Lien
- [@l2lee](https://github.com/l2lee) - Lucas Lee
- [@Jeanhsu0707](https://github.com/Jeanhsu0707) - Hua Jin Hsu


## ✨ Reference <a name="reference"></a>
- [MarkLines](https://www.marklines.com/en/)
