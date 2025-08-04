
---

````markdown
# Enforcing CIS Benchmarks in AWS EKS through Compliance as Code

## Overview

Maintaining security and compliance across complex cloud environments is a growing challenge. This project leverages **AWS Config** and **Ansible** to automate compliance enforcement in **Amazon Web Services (AWS)**, using a **Compliance as Code (CaC)** approach. The implementation is based on the **Center for Internet Security (CIS) Benchmarks**, applied to AWS services including:

- Identity and Access Management (IAM)
- EC2 Instances
- S3 Buckets
- Elastic Kubernetes Service (EKS)

The goal is to reduce manual intervention and ensure continuous compliance, eliminating configuration drift and improving overall cloud security posture.

---

## Objectives

- Automate compliance monitoring and enforcement using **AWS-native services** and **open-source tools**
- Apply CIS Benchmark controls across key AWS resources
- Reduce manual errors and misconfigurations
- Improve visibility, governance, and security in AWS cloud environments
- Lay a foundation for future AI-driven compliance automation

---

## Tech Stack

- **AWS Config** – Continuous monitoring and compliance tracking
- **Ansible** – Automation engine for deploying, enforcing, and remediating policies
- **CIS Benchmarks** – Security standards for IAM, EC2, S3, and EKS
- **YAML Playbooks** – Ansible automation scripts for compliance
- **EKS Security Controls** – Kubernetes versioning, control plane logging, secure node groups, and restricted endpoint access

---

## Future Enhancements

* Integration with AWS Security Hub or third-party SIEM tools
* AI/ML-driven compliance insights and anomaly detection
* Extension to multi-cloud (Azure, GCP)
* CI/CD integration for continuous policy evaluation
---

## Keywords

`Security Automation` • `Compliance as Code` • `CIS Benchmarks` • `Ansible` • `AWS Config` • `IAM` • `EC2` • `S3` • `EKS` • `Cloud Security`

```
