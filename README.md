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
- [✨ Analysis ](#-analysis-)
- [✍️ Authors ](#️-authors-)
- [✨ Reference ](#-reference-)

## 🧐 About <a name = "about"></a>

This repository contains the final project for DSC202 - Data Management for Data Science.
The objective of this project is to explore automotive components and supply chain analysis in MarkLines. We investigate the industry's structure and relationships by addressing three key questions:
#### 1. Who are the key suppliers in the automotive industry (per product)?
#### 2. Which companies compete in the same component markets? How similar are automakers in their supply relationships
#### 3. Who are the dominant automakers, and how have their positions evolved over time?

To answer these questions, we leverage PostgreSQL, Neo4j, and Python for data preprocessing, statistical analysis, and network visualization. Our analysis spans from 2015 to 2025, offering insights into supply chain trends and competitive dynamics.

## 📂 Datasets <a name="datasets"></a>
This repository utilizes datasets from MarkLines, focusing on supply relationships among suppliers, automakers, and their respective models across various automotive components.
### Data Location
* Raw data: Stored in the `dataset/raw_data` directory.
* Processed data: Stored in the `dataset/preprocessed_data` directory.

### Data Processing Steps
1. Combining Datasets & Assigning Trading Volumes
* All CSV files are merged, and trading volumes are randomly assigned in Python for further analysis.
* Script: `preprocessing/combine.py`
2. Standardizing Regions, Calculating Yearly Trading Volumes, and Combine Supply Group Data
* The process regularizes region values, computes yearly trading volumes, and combine the supply group data from the `supplier.csv` at both the model and maker levels.
* Scripts: `preprocessing/country.sql` & `preprocessing/groupby_model_new.sql` & `preprocessing/groupby_maker_new.sql`

### Processed Data Outputs
* `groupby_model_new.csv` – Supply relationship dataset grouped by model
* `groupby_maker_new.csv` – Supply relationship dataset grouped by maker

## ✨ Analysis <a name="analysis"></a>

The following are the example results in answering the questions.
#### 1. Who are the key suppliers in the automotive industry (per product)?
In this analysis, we tried to analyze in 2 perspectives:
(a) Using the count of supply record to filter the top 3 key suppliers in each automotive component.
(b) Using the annual trading volume of autmotive componenet to find the top 3 suppliers.

In part (a), we took the following steps to find the key suppliers:
* Import data and add a year_range column to group the supply_year into 5-year intervals (PostgreSQL)
* Import data and find the top 3 suppliers in each year range in a specific automotive coponent (Neo4j)
The following is the example result of our analysis, which shows the top 3 suppliers in 'manual_transmission' across different time frames.

![image1](https://github.com/l2lee/Automotive-Supply-Chain-Analysis/blob/main/Analysis/Key%20Supplier/key_supplier_year_range%20(automated_manual_transmission).png)

Visualization Components
* Green nodes represent automakers, which corresponds to the 'maker' data in csv.
* Brown nodes represent suppliers, which corresponds to the 'supplier_group' data in csv.
* Edges indicate a "SUPPLIES_TO" relationship, where a supplier provides a specific automotive component to an automaker in the given year range.
* Edge colors differentiate supply relationships across different time frames, with red (2005-2010), yellow (2011-2015), green (2016-2020), blue (2021-2025).

![image2](https://github.com/l2lee/Automotive-Supply-Chain-Analysis/blob/main/Analysis/Key%20Supplier/key_supplier_trade_cnt%20(automated_manual_transmission).png)

Visualization Components
* Green nodes represent automakers, which corresponds to the 'maker' data in csv.
* Brown nodes represent suppliers, which corresponds to the 'supplier_group' data in csv.
* Edges indicate a "SUPPLIES_TO" relationship, where a supplier provides a specific automotive component to an automaker in the given year range.
* Edge width differentiate trading count in the year range

* Data: `groupby_model_new.csv`
* Script: `groupby_maker_year_range`
#### 2. Which companies compete in the same component markets? How similar are automakers in their supply relationships
#### 3. Who are the dominant automakers, and how have their positions evolved over time?


## ✍️ Authors <a name="authors"></a>
- [@ripple-space](https://github.com/ripple-space) - Yi Lien
- [@l2lee](https://github.com/l2lee) - Lucas Lee
- [@Jeanhsu0707](https://github.com/Jeanhsu0707) - Hua Jin Hsu


## ✨ Reference <a name="reference"></a>
- [MarkLines](https://www.marklines.com/en/)
