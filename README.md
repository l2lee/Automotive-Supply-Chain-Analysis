# Automotive-Supply-Chain-Analysis

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
  - [Visualization](#visualization)
- [✍️ Authors ](#️-authors-)
- [✨ Reference ](#-reference-)

## 🧐 About <a name = "about"></a>

This repository contains the final project for DSC202 - Data Management for Data Science. The objective of this project is to explore automotive components and supply chain analysis in MarkLines. In our project, we investigate the industry's structure and relationships by addressing three key questions:
### 1. Who are the key suppliers in the automotive industry (per product)?
### 2. Which companies compete in the same component markets? How similar are automakers in their supply relationships
### 3. Who are the dominant automakers, and how have their positions evolved over time?

To answer these questions, we leverage PostgreSQL, Neo4j, and Python for data preprocessing, statistical analysis, and network visualization. Our analysis spans from 2015 to 2025, offering insights into supply chain trends and competitive dynamics.

## 📂 Datasets <a name="datasets"></a>
This repository utilizes datasets from MarkLines, focusing on supply relationships among suppliers, automakers, and their respective models across various automotive components.
### Data Location
* Raw data: Stored in the `dataset` directory.
* Processed data: Stored in the `preprocessed` directory.

### Data Processing Steps
1. Combining Datasets & Assigning Trading Volumes
* All CSV files are merged, and trading volumes are randomly assigned in Python for further analysis.
* script: `preprocessing/combine.py`
2. Standardizing Regions & Calculating Yearly Trading Volumes
* The process regularizes region values and computes yearly trading volumes at both the model and maker levels.
* Scripts: preprocessing/country.sql & preprocessing/combined_preprocessed.py

### Processed Data Outputs
* `combined_preprocessed.csv` – Supply relationship dataset grouped by model
* `groupby_maker.csv` – Supply relationship dataset grouped by maker

## ✨ Analysis <a name="analysis"></a>

The following are the example results in answering the questions respectively.
### 1. Who are the key suppliers in the automotive industry?
### 2. Which makers are similar to one another?
### 3. Who are the dominant makers in the automotive industry?

### Visualization

The following visualization illustrates the top 5 suppliers in 'steering_gear' across different time frames, as analyzed in our study.

Visualization Components
* Green nodes represent automakers.
* Brown nodes represent suppliers.
* Edges indicate a "SUPPLIES_TO" relationship, where a supplier provides a specific automotive component to a model under an automaker.
* Edge colors differentiate supply relationships across different time frames (2005-2025, divided into 5-year intervals).

![image](https://github.com/...)


## ✍️ Authors <a name="authors"></a>
- [@ripple-space](https://github.com/ripple-space) - Yi Lien
- [@l2lee](https://github.com/l2lee) - Lucas Lee
- [@Jeanhsu0707](https://github.com/Jeanhsu0707) - Hua Jin Hsu


## ✨ Reference <a name="reference"></a>
- [MarkLines](https://www.marklines.com/en/)
