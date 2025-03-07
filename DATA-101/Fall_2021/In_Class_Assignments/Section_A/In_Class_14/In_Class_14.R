## reading the csv file 
churn = read.csv(file = 'Customer_Churn.csv')
head(churn)

## Changing labels to 0-1
churn$Churn_0_1 = ifelse(churn$Churn == 'No', 0, 1)
head(churn)

library(rpart)

## Building the decision tree model 
tree_md = rpart(Churn_0_1 ~ tenure + MonthlyCharges, data = churn)

## Defining the new observation
newdata = data.frame('tenure' = 12, 'MonthlyCharges' = 250)

## Predicting the likelihood of churn
predict(tree_md, newdata)
