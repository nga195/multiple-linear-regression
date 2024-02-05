# multiple-linear-regression
Forecast real estates prices using Multiple Linear Regression

## Table of Contents

- [Introduction](#introduction)
- [Data Description](#data-description)
- [Methodology](#methodology)
- [Analysis](#analysis)
- [Result and discussion](#result-and-discussion)
- [References](#references)


## Introduction
This project aims to build a model for the real estate prices in Taiwan during the 2012-2013 years. The model has been created by analysing multiple factors based on the market historical data set of real estate valuation from Xindian District, New Taipei City, Taiwan. The source of our data is the UCI Machine Learning Repository and the dataset contains 414 observations. The multilinear regression model has two types of variables, independent variable (regressor) and the dependent variable (response variable). 

House price of unit area is the response variable in our study since that is what we are attempting to predict using other independent variables. The transaction date, the house age, the distance to the nearest MRT station, the number of convenience stores in the living circle on foot, the geographic coordinate latitude and the geographic coordinate, longitude were among the 6 explanatory variables in the original data set. However we did not consider the transaction date, since on our assumptions of uncorrelated or independent errors, would not be appropriate for a time series data since the errors in time series data exhibit some type of autocorrelated structure. 



## Data Description

The data source for this report is a historical dataset of real estate valuations collected from Sindian District, New Taipei City, Taiwan. This dataset provides a comprehensive view of the real estate market in the area, offering valuable insights into property values and their influencing factors.

The dataset includes the following variables:

**Response Variable:**
- y= house price of unit area (10000 New Taiwan Dollar/Ping, a local currency unit, 1 Ping = 3.3 m2)

**Regressors:**
- x1= the house age (unit: year)
- x2= the distance to the nearest MRT station (unit: metre)
- x3= the number of convenience stores in the living circle on foot (integer)
- x4= the geographic coordinate, latitude. (unit: degree)
- x5= the geographic coordinate, longitude. (unit: degree)


This dataset, with its diverse set of variables, offers a robust foundation for analyzing and predicting real estate prices in Sindian District, New Taipei City, Taiwan. The insights derived from this data can be instrumental in understanding the dynamics of the real estate market in the area.


Data Source: [https://archive.ics.uci.edu/dataset/477/real+estate+valuation+data+set]


## Methodology

Multiple linear regression models offer several advantages, particularly when analyzing real estate data as in this case:

1. Multivariate Analysis: Multiple linear regression allows for the simultaneous analysis of multiple independent variables. This is particularly useful in real estate valuation where property prices can be influenced by several factors such as house age, distance to the nearest MRT station, number of convenience stores in the living circle, and geographic coordinates.

2. Quantifying Relationships: The model quantifies the strength of the relationship between each independent variable and the dependent variable, while controlling for the other independent variables. This allows us to understand how each factor individually contributes to the property price.

3. Predictive Power: Multiple linear regression models can be used to predict the dependent variable (house price in this case) based on the values of the independent variables. This can be particularly useful for predicting property prices in the future.

4. Model Flexibility: Multiple linear regression models can handle both continuous (like house age and distance to MRT station) and categorical variables (like number of convenience stores), offering flexibility in data analysis.

5. Understanding Interactions: The model can be extended to understand the interactions between different independent variables and how these interactions impact the dependent variable. For example, the interaction between house age and distance to the nearest MRT station might be significant in predicting house prices.

6. Identifying Outliers: Multiple linear regression analysis can help identify outliers in the dataset. These are observations that have a large residual, i.e., a large difference between the observed and predicted values of the dependent variable.

7. Model Improvement: The methodology allows for transformations and model selection processes to improve the model fit. For instance, if the relationship between the dependent and independent variables is not linear, transformations (like logarithmic or reciprocal) can be applied to achieve linearity.

## Analysis

**Model Specification**: The initial model includes all the independent variables of interest, with the house price of unit area as the dependent variable. The model is represented as: 

$$y = −4945.59 − 0.2689x1 − 0.004259x2 + 1.1630x3 + 237.7672x4 − 7.8054x5$$



**Significance of the Overall Model**: The first step in the analysis is to examine the significance of the overall model. The null hypothesis (H0) states that all the parameters are equal to zero, and the alternative hypothesis (H) states that at least one of the parameters does not equal zero. If the F statistic of the model is greater than the critical F value and the p-value is very small, we reject the null hypothesis, concluding that at least one of our parameters is significant.


**Individual T-tests for Each Parameter**: Next, individual T-tests are performed for each parameter to identify those that are not significant. The null hypothesis for these tests is that the parameter equals zero, and the alternative hypothesis is that the parameter does not equal zero.


**Parameter Selection**: By examining the p-values for our parameters, we can identify any insignificant parameters. For example, if the p-value for a parameter is remarkably large, we fail to reject the null hypothesis for that parameter, concluding that it is insignificant. In such cases, we might consider excluding this parameter from the model.


**Model Selection**: We use the “R-Square Selection Method” to identify the best model for our data. The model with the highest R-square and the smallest residual sum of squares among all models is considered preferable.


**Reduced Model**: Based on the analysis, we define a new reduced model excluding the insignificant parameters. For example, if parameter x5 (the geographic coordinate, longitude) is found to be insignificant, the reduced model would be:   

 $$ y  =  −5916.0064  −  0.26872x1 − 0.00418x2 − 1.16478x3 − 238.63573x4 $$



**Investigation of Scatter Plots**: To improve our model, we investigate scatter plots of y versus each independent variable. If there is a noticeable curvature in the scatter plot of y versus a particular independent variable, we might consider transforming that variable.


**Transformations**: Based on the scatter plots, we decide to use both reciprocal transformation (y’ = 1/y) and log transformation (y’ = ln(y)) on our reduced model and compare the two to obtain the best model appropriate for the measured variables.


**Reciprocal Transformation**: The predicted model based on stepwise selection after reciprocal transformation might be: 

 $$ y = 7.96063 + 0.0002042x1 + 0.00000572x2 − 0.00065271x3 − 0.31788x4 $$



**Significance of the Reduced Reciprocal Model**: We check the significance of the overall reduced reciprocal model. If the F statistic of the model is greater than the critical F value and the p-value is very small, we conclude that the model is significant.


This analysis provides a comprehensive approach to performing multiple linear regression analysis on your dataset. It includes model specification, parameter selection, model selection, and transformations to ensure the best fit for the data.



## Result and discussion


After analysing the four reduced models and the full model, we recommend one of the subset models, the reciprocal model without the outliers as the final model, 

  $$y = 6.51242 + 0.000172871x1 + 0.00000617x2 - 0.00057680x3 - 0.25991x4$$
  
We chose this as our final model for a few reasons. First of all, it is simpler than the full model with one less variable while also having a smaller variance. On top of that, it has the lowest PRESS value of 0.01180 and the second highest adjusted R2 of 0.7985 which is just slightly lower than the log model without outliers. With the least squares estimators above, we can better predict the house prices in Xindian District in Taipei City given the information of the house age, the distance to the nearest MRT station, the number of convenience stores in the living circle on foot, and the latitude coordinates. We are concluding that above regressors are influencing the response variable, house prices to a certain extent.




## References

1. Yeh, I-Cheng. (2018). UCI Machine Learning Repository [https://archive.ics.uci.edu/ml/datasets/Real+estate+valuation+data+set#]. Taiwan: Tamkang University, Department of Civil Engineering.
2. Montgomery, Douglas C., Elizabeth A. Peck, and G. Geoffrey Vining. Introduction to Linear Regression Analysis. Oxford: Wiley-Blackwell, 2013.









