<h1 align="center">Automotive Supply Chain Analysis</h1>


<div align="center">

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](/LICENSE)

</div>

---

<p align="center"> Final project of DSC202 - Data Management for Data Science (2025 WINTER)
    <br>
</p>

## Presentation Recording & Report
* Our presentation video can be found [here!](https://www.youtube.com/watch?v=J7cBdm22pNc)
* Slides can be found in `introduction/Presentation_Automotive Supply Chain Analysis.pdf`
* Full report can also be found in `introduction/???`

## 📝 Table of Contents

- [📝 Table of Contents](#-table-of-contents)
- [🧐 About ](#-about-)
- [📂 Datasets ](#-datasets-)
- [📖 Methodology ](#-methodology-)
- [✨ Demostration ](#-demonstration-)
- [✍️ Authors ](#️-authors-)
- [🌐 Reference ](#-reference-)

## 🧐 About <a name = "about"></a>

This repository contains the final project for DSC202 - Data Management for Data Science.
The objective of this project is to explore automotive components and supply chain analysis in MarkLines. We investigate the industry's structure and relationships by addressing three key questions:
#### 1. Supply chain overview: Who are the primary suppliers for each product, and what is the structure of the key supply network?
#### 2. Time series analysis: Who are the key autosuppliers, and how have their positions evolved over time?
#### 3. Maker's similarity: How can we quantify similarity of makers? How similar are automakers in their supply relationships?

To answer these questions, we leverage PostgreSQL, Neo4j, and Python for data preprocessing, statistical analysis, and network visualization. Our analysis spans from 2005 to 2025, offering insights into supply chain trends and competitive dynamics.

## 📂 Datasets <a name="datasets"></a>
This repository utilizes datasets from MarkLines, focusing on supply relationships among suppliers, automakers, and their respective models across various automotive components.
### Data Location
* Raw data: Stored in the `dataset/raw_data` directory.

### Data Processing Steps
1. Combine Datasets & Assign Trading Volumes
* All CSV files are merged, and trading volumes are randomly generate from Uniform distribution U(100, 1000) in Python for further analysis.
* Script: `preprocessing/combine.py`
2. Standardize Regions, Calculate Yearly Trading Volumes, and Combine Supply Group Data
* The process regularizes model region data with the formatted country data. Output is stored in `preprocessing/combined_preprocessed.csv`.
* Scripts: `preprocessing/country.sql` & `preprocessing/combined_preprocessed.sql`
3. Extract parent company / supplier group data from supplier data
* Take supplier group name from supply group data for further analysis. Output is stored in `preprocessing/supplier.csv`.
* Script: `preprocessing/supplier.sql`

### Processed Data Outputs
* `preprocessed_data/combined_preprocessed.csv` – Supply dataset with region, maker, model, model year, supplier, product, yearly volume conlums.
* `preprocessed_data/supplier.csv` – Supplier and the respective group's name.

## 📖 Methodology <a name="methodology"></a>

The following are the example results in answering the questions.
#### 1. Supply chain overview

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

#### Output
* `result/Supply-chain-overview/groupby_supplier-group.csv` – Top 5 suppliers in each product category in a given year range

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

#### Outputs
* `result/Supply-chain-overview/top_3_year_trade_cnt_transmission_shaft_1.png` – Top 3 suppliers based on trade_year_cnt in 'transmission shaft' in a given year range
* `result/Supply-chain-overview/top_3_year_trade_cnt_transmission_shaft_2.png` – Top 3 suppliers based on trade_year_cnt  in 'transmission shaft' in a given year range
* `result/Supply-chain-overview/top_3_total_volume_transmission_shaft.png` – Top 3 suppliers based on total_volume  in 'transmission shaft' in a given year range

#### 2. Time series analysis

#### (a) 2025 Top 10 Automotive Suppliers
Our primary goal here is to examine the trend among the top 10 automotive suppliers in 2025.

#### Data Location
* Dataset: `preprocessing/combined_preprocessed.csv`, `preprocessing/supplier.csv`
* Analysis Scripts:
    * `analysis/Time-Series-Analysis/Identify 2025 Top 10 Suppliers.sql`
    * `analysis/Time-Series-Analysis/Market Share Trends of 2025’s Top 10 Suppliers Over Time.sql`

#### Implementation
1. Follow the `Identify 2025 Top 10 Suppliers.sql` to process the data in the following steps:
   * Rank suppliers by annual sales volume using a window function.
   * Calculate year-over-year (YoY) changes by linking each supplier’s data to the previous year.
   * Filter the top 10 suppliers in 2025 to focus on dominant market players.
2. Run the `Supplier Collaborations by Region and Product.sql` to gain closer examination of Faurecia and FinDreams
3. Implement `Market Share Trends of 2025’s Top 10 Suppliers Over Time` to generate the data of Market Share Trends


#### (b) Supplier-Automaker Collaborations
We want to explore which companies collaborate with the most different automakers, and we analyze the number of distinct makers each supplier works with annually to see the companies that have the widest range of automaker partnerships.

#### Data Location
* Dataset: `preprocessing/combined_preprocessed.csv`, `preprocessing/supplier.csv`
* Analysis Scripts:
    * `analysis/Time-Series-Analysis/Average Maker Amount.sql`

#### Implementation
1. Follow the `Average Maker Amount.sql` to process the data in the following steps:
   * Count Distinct Automakers per Year
   * Calculate the Average Maker Count per Supplier
   * Group by Parent Company for clearer analysis
   * Rank the Top 10 Suppliers with the widest automaker partnerships.

#### (c) Case Study: Bosch & ZF
As Bosch and ZF emerged as two of the strongest performers over time, we further analyzed their regional distribution and product focus trends to gain deeper insights into their market strategies.

#### Data Location
* Dataset: `preprocessing/combined_preprocessed.csv`, `preprocessing/supplier.csv`
* Analysis Scripts:
    * `analysis/Time-Series-Analysis/Case Study.sql`

#### Implementation
1. Follow the `Case Study.sql` to process the data in the following steps:
   * Applied a CASE statement to align model regions with broader maker region segments for consistency in regional analysis
2. For Bosch’s Changes in Maker Regional Distribution:
   * Paste the results after running `Case Study.sql`
   * Filter the parent_company with `Bosch`
   * Select `region` as column, `model_year` as row and `share` as value to visualze the results in Excel.
3. For Bosch’s Changes in Model Regional Distribution:
   * Paste the results after running `Case Study.sql`
   * Filter the parent_company with `Bosch`
   * Select `model_region` as column, `model_year` as row and `share` as value to visualze the results in Excel.
4. For Bosch’s Changes in Product Focus:
   * Paste the results after running `Case Study.sql`
   * Filter the parent_company with `Bosch`
   * Select `product` as column, `model_year` as row and `share` as value to visualze the results in Excel.
5. For ZF’s Changes in Maker Regional Distribution:
   * Paste the results after running `Case Study.sql`
   * Filter the parent_company with `ZF`
   * Select `region` as column, `model_year` as row and `share` as value to visualze the results in Excel.
6. For ZF’s Changes in Model Regional Distribution:
   * Paste the results after running `Case Study.sql`
   * Filter the parent_company with `ZF`
   * Select `model_region` as column, `model_year` as row and `share` as value to visualze the results in Excel.
7. For ZF’s Changes in Product Focus:
   * Paste the results after running `Case Study.sql`
   * Filter the parent_company with `ZF`
   * Select `product` as column, `model_year` as row and `share` as value to visualze the results in Excel.

#### (d) Top 3 Suppliers in Each Product Category
This approach provides a clearer view of sustained market presence rather than volatile year-over-year fluctuations.

#### Data Location
* Dataset: `preprocessing/combined_preprocessed.csv`, `preprocessing/supplier.csv`
* Analysis Scripts:
    * `analysis/Time-Series-Analysis/Top 3 Suppliers in Each Product Category.sql`

#### Implementation
1. Follow the `Top 3 Suppliers in Each Product Category.sql` to process the data in the following steps:
   * Rank Suppliers by Product and Year
   * Identify Consistently High-Ranking Suppliers
   * Rank Suppliers by Market Presence

#### (e) Component Competition Analysis
In this section, we analyze the competitiveness of different automotive components by examining the number of suppliers for each product category over time.

#### Data Location
* Dataset: `preprocessing/combined_preprocessed.csv`, `preprocessing/supplier.csv`
* Analysis Scripts:
    * `analysis/Time-Series-Analysis/Component Competition Analysis.sql`

#### Implementation
1. Run the `Component Competition Analysis.sql` to gain the data of Component Competition Analysis

#### 3. Maker Analysis
##### Data Location
* Dataset: `preprocessing/combined_preprocessed.csv`

##### Steps to reproduce:
###### Loading data:
1. Make sure you have `preprocessing/combined_preprocessed.csv` in the folder of the Neo4j server.
2. Use `analysis/Maker-Analysis/load_data.cypher` to load the data into create the graphical databse.
   * Note that we recommend changing the following in order to fit the data within a single query:
     * `server.memory.heap.initial_size=16G`
     * `server.memory.heap.max_size=16G`
     * `dbms.memory.transaction.total.max=12G`
   * The graph contains 16941 nodes and 49993 edges.
###### Global Jaccard Analysis
1. Run `analysis/Maker-Analysis/calc_global_jaccard.cypher`
###### Product-level Jaccard Analysi
1. Run `analysis/Maker-Analysis/calc_product_jaccard.cypher`
###### Weighted Jaccard
1. From the outputs of the previous step save the CSV from Neo4j into the same directory of the notebook
2. Run `analysis/Maker-Analysis/weighted_sum_analysis.ipynb`, changing the name of the CSV if necessary
3. There is a sample provided looking at the similarities between Nissan and Toyota
4. There is a function `maker_weighted_sim(df, maker_1, maker_2, weights)`, with sample calls shown in the notebook

## 📖 Demonstration <a name="demonstration"></a>

### 1. Supply chain overview
#### (a) Total Trading Volume Analysis
The final output consists of the top 5 suppliers in each of the automotive component each year range based on the trading volume.
Full data could be found in `result/Supply-Chain-Overview/groupby_supplier-group.csv`

#### (b) Key Supply Network Analysis
The following is the example result of our analysis, which shows the top 3 suppliers in 'transmission_shaft' across different time frames:
* Green nodes represent automakers, which corresponds to the 'maker' data in csv.
* Brown nodes represent suppliers, which corresponds to the 'supplier_group' data in csv.
* Edges indicate that there is a "SUPPLIES_TO" relationship, where a supplier provides a specific automotive component to an automaker in the given year range.
* Edge colors differentiate supply relationships across different time frames, with red (2005-2010), yellow (2011-2015), green (2016-2020), blue (2021-2025).

<p align="center">
<img src="https://github.com/l2lee/Automotive-Supply-Chain-Analysis/blob/main/result/Supply-Chain-Overview/top_3_year_trade_cnt_transmission_shaft_1.png" width="70%">
</p>

Similarly, the following show the same supply network in 'transmission_shaft', with only the size of edge is changing to show the different count of supply record:
* Green nodes represent automakers, which corresponds to the 'maker' data in csv.
* Brown nodes represent suppliers, which corresponds to the 'supplier_group' data in csv.
* Edges indicate that there is a "SUPPLIES_TO" relationship, where a supplier provides a specific automotive component to an automaker in the given year range.
* Edge width represents the frequency of supply within the given year range, on a scale from 1 to 5. A value of 1 indicates that the supply occurred in only one year, while a value of 5 means the supply was continuous throughout the entire year range.
<p align="center">
<img src="https://github.com/l2lee/Automotive-Supply-Chain-Analysis/blob/main/result/Supply-Chain-Overview/top_3_year_trade_cnt_transmission_shaft_2.png" width="70%">
</p>

In addition, we also use the total trading volume to extract the top 3 suppliers in 'transmission_shaft'.\:
* Green nodes represent automakers, which corresponds to the 'maker' data in csv.
* Brown nodes represent suppliers, which corresponds to the 'supplier_group' data in csv.
* Edges indicate that there is a "SUPPLIES_TO" relationship, where a supplier provides a specific automotive component to an automaker in the given year range.
* Edge colors differentiate supply relationships across different time frames, with red (2005-2010), yellow (2011-2015), green (2016-2020), blue (2021-2025).
<p align="center">
<img src="https://github.com/l2lee/Automotive-Supply-Chain-Analysis/blob/main/result/Supply-Chain-Overview/top_3_total_volume_transmission_shaft.png" width="70%">
</p>

### 2. Time series analysis
#### (a) 2025 Top 10 Automotive Suppliers
* Identify 2025 Top 10 Suppliers
      From the results, we observed:
        – Bosch leads the market, contributing nearly a quarter of the total supply chain.
        – Faurecia and FinDreams demonstrate significant YoY growth, nearly tripling their sales from the previous year.
<p align="center">
<img src="https://github.com/l2lee/Automotive-Supply-Chain-Analysis/blob/main/result/Time-Series-Analysis/Identify 2025 Top 10 Suppliers.png" width="70%">
</p>

* Drivers Behind Faurecia’s and FinDreams’s High YoY Growth
      A closer examination of Faurecia and FinDreams reveals that their impressive YoY growth in 2025 is largely driven by strong collaborations with Chinese and Indian manufacturers.
<p align="center">
<img src="https://github.com/l2lee/Automotive-Supply-Chain-Analysis/blob/main/result/Time-Series-Analysis/Supplier Collaborations by Region and Product.png" width="70%">
</p>

* Market Share Trends
      The chart reveals key trends in supplier market share over time.
<p align="center">
<img src="https://github.com/l2lee/Automotive-Supply-Chain-Analysis/blob/main/result/Time-Series-Analysis/Market Share Trends.png" width="70%">
</p>

#### (b) Supplier-Automaker Collaborations
<p align="center">
<img src="https://github.com/l2lee/Automotive-Supply-Chain-Analysis/blob/main/result/Time-Series-Analysis/Average Maker Amount.png" width="70%">
</p>

#### (c) Case Study: Bosch & ZF

* Bosch’s Changes in Maker Regional Distribution
<p align="center">
<img src="https://github.com/l2lee/Automotive-Supply-Chain-Analysis/blob/main/result/Time-Series-Analysis/Bosch’s Changes in Maker Regional Distribution.png" width="70%">
</p>

* Bosch’s Changes in Model Regional Distribution
<p align="center">
<img src="https://github.com/l2lee/Automotive-Supply-Chain-Analysis/blob/main/result/Time-Series-Analysis/Bosch’s Changes in Model Regional Distribution.png" width="70%">
</p>

* Bosch’s Changes in Product Focus
<p align="center">
<img src="https://github.com/l2lee/Automotive-Supply-Chain-Analysis/blob/main/result/Time-Series-Analysis/Bosch’s Changes in Product Focus.png" width="70%">
</p>

* ZF’s Changes in Maker Regional Distribution
<p align="center">
<img src="https://github.com/l2lee/Automotive-Supply-Chain-Analysis/blob/main/result/Time-Series-Analysis/ZF’s Changes in Maker Regional Distribution.png" width="70%">
</p>

* ZF’s Changes in Model Regional Distribution
<p align="center">
<img src="https://github.com/l2lee/Automotive-Supply-Chain-Analysis/blob/main/result/Time-Series-Analysis/ZF’s Changes in Model Regional Distribution.png" width="70%">
</p>

* ZF’s Changes in Product Focus
<p align="center">
<img src="https://github.com/l2lee/Automotive-Supply-Chain-Analysis/blob/main/result/Time-Series-Analysis/ZF’s Changes in Product Focus.png" width="70%">
</p>

#### (d) Top 3 Suppliers in Each Product Category
<p align="center">
<img src="https://github.com/l2lee/Automotive-Supply-Chain-Analysis/blob/main/result/Time-Series-Analysis/Top 3 Suppliers in Each Product Category.png " width="70%">
</p>

#### (e) Component Competition Analysis
<p align="center">
<img src="https://github.com/l2lee/Automotive-Supply-Chain-Analysis/blob/main/result/Time-Series-Analysis/Component Competition Analysis.png " width="70%">
</p>



### 3. Maker's similarity


## ✍️ Authors <a name="authors"></a>
- [@ripple-space](https://github.com/ripple-space) - Yi Lien
- [@l2lee](https://github.com/l2lee) - Lucas Lee
- [@Jeanhsu0707](https://github.com/Jeanhsu0707) - Hua Jin Hsu


## 🌐 Reference <a name="reference"></a>
- [MarkLines](https://www.marklines.com/en/)
