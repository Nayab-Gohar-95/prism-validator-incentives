# Modeling and Verification of Validator Incentives in PRISM Blockchain

## Overview
This repository contains the model and verification files for analyzing validator incentives in the **PRISM blockchain**. The research focuses on validating six key properties of validator incentives using **probabilistic model checking**.

## Files Included
- **`rewards.pm`**: The PRISM model defining the validator reward mechanism.
- **`properties.props`**: The verification properties used to check correctness and fairness of incentives.

## Requirements
To run these files, you need **PRISM Model Checker** installed. You can download it from:
[PRISM Model Checker](http://www.prismmodelchecker.org/)

## Running the Model
1. Open the PRISM tool.
2. Load the **`rewards.pm`** model.
3. Load the **`properties.props`** file.
4. Click on **Analyze Properties** to verify the results.

## Expected Output
When executed correctly, PRISM will verify that the model satisfies all six validator incentive properties. The output should confirm:
- **Correct reward distribution**.
- **Fair incentivization**.
- **Security against malicious behavior**.

## Future Work
- Refining the model with more real-world blockchain parameters.
- Extending the verification to dynamic adversarial scenarios.
- Publishing a detailed research paper on findings.



