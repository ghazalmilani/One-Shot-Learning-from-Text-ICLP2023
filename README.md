# Towards One-Shot Learning for Text Classification using Inductive Logic Programming
This repository presents the implementation and results of the paper "<a href="https://arxiv.org/abs/2308.15885"> Towards One-Shot Learning for Text Classification using Inductive Logic Programming</a>",  presented at ICLP 2023. The study explores the use of Inductive Logic Programming (ILP), particularly Meta-Interpretive Learning (MIL), for one-shot text classification with the integration of commonsense knowledge from ConceptNet.

## Overview
The project demonstrates how to classify short text ("tasks") using minimal training data by:
- Leveraging Meta-Interpretive Learning (MIL) to generate human-readable classification rules.
- Integrating commonsense knowledge from ConceptNet.
- Comparing performance with Siamese Networks, a deep learning model for few-shot learning.

### Key Features
- **One-Shot Learning**: Learns from as few as one positive and one negative example.
- **Recursive Rule Learning**: Supports predicate invention and recursive hypotheses.
- **Commonsense Knowledge**: Uses ConceptNet to enrich background knowledge.
- **Comparative Analysis**: Benchmarks MIL against Aleph (traditional ILP) and Siamese Networks.

### Datasets
- **Task Classification Dataset**:
Custom dataset for family, work, and sport categories.
Includes positive and negative examples for training and evaluation.
- **News Category Dataset**:
Publicly available dataset with diverse topics (sports, technology, environment, etc.).
Used to validate the generalization capabilities of the MIL approach.


### Citation

If you find this work useful in your research, please consider citing:

@article{afroozi2023towards,
  title={Towards One-Shot Learning for Text Classification using Inductive Logic Programming},
  author={Afroozi Milani, Ghazal and Cyrus, Daniel and Tamaddoni-Nezhad, Alireza},
  journal={arXiv e-prints},
  pages={arXiv--2308},
  year={2023}
}


