##---------------Predicting Salaries of Football Players by Position in 2020----------------##

setwd("~/Downloads")

## 2020 League Shooting (only FW or FW hybrid players considered = 930) 
l.shooting <- read.csv(file = "League Shooting.csv", header = TRUE)
head(l.shooting)
summary(l.shooting)

summary(l.s)
l.s <- l.shooting[,-1] # Take out Player
l.s <- l.s[,-3] # Take out squad
l.s <- l.s[,-19] # Take out year
l.s <- l.s[,-1] # Take out nation

pred_ls <- glm(formula = l.s$Salary~., family = "gaussian", data = l.s) # Estimate gaussian glm
summary(pred_ls)

p_ls <- predict(pred_ls, l.s) # predict salaries using model
head(p_ls)
summary(p_ls)
pls_df <- data.frame(p_ls)
head(pls_df)
write.csv(pls_df, file = "Shooting Predicted Salary League 2020.csv")

# 2129
## 2020 League Midfielders (only MF or MF hybrid players = 1244) using passing data
l.midfielders <- read.csv(file = "League Midfielders.csv", header = TRUE)
head(l.midfielders)
summary(l.midfielders)

summary(l.m)
l.m <- l.midfielders[,-1] # Take out Player
l.m <- l.m[,-3] # Take out squad
l.m <- l.m[,-17] # Take out year
l.m <- l.m[,-1] # Take out Nation

pred_lm <- glm(formula = l.m$Salary~., family = "gaussian", data = l.m) # Estimate gaussian glm
summary(pred_lm)

p_lm <- predict(pred_lm, l.m) # predict salaries using model
head(p_lm)
summary(p_lm)
plm_df <- data.frame(p_lm)
head(plm_df)
write.csv(plm_df, file = "Midfielder Predicted Salary League 2020.csv")

## 2020 League Goalkeeping (only GK or GK hybrid players considered = 192) 
l.goalkeeping <- read.csv(file = "League Goalkeeping.csv", header = TRUE)
head(l.goalkeeping)
summary(l.g)

l.g <- l.goalkeeping[,-1] # Take out Player
l.g <- l.g[,-2] # Take out squad
l.g <- l.g[,-12] # Take out year
l.g <- l.g[,-1] # Take out Nation

pred_lg <- glm(formula = l.g$Salary~., family = "gaussian", data = l.g) # Estimate gaussian glm
summary(pred_lg)

p_lg <- predict(pred_lg, l.g) # predict salaries using model
head(p_lg)
summary(p_lg)
plg_df <- data.frame(p_lg)
head(plg_df)
write.csv(plg_df, file = "Predicted Salary League Goalkeeping 2020.csv")


## 2020 League Defense (only DF or DF hybrid players = )
l.defense <- read.csv(file = "League Defense 2020 Pos Only.csv", header = TRUE)
head(l.defense)
summary(l.d)

l.d <- l.defense[,-1] # Take out Player
l.d <- l.d[,-3] #Take out Squad
l.d <- l.d[,-24] # Take out Year
l.d <- l.d[,-1] # Take out Nation

pred_ld <- glm(formula = l.d$Salary~., family = "gaussian", data = l.d) #Estimate gaussian glm
summary(pred_ld)

p_ld <- predict(pred_ld, l.d) # predict salaries using model
head(p_ld)
summary(p_ld)
pld_df <- data.frame(p_ld)
head(pld_df)
write.csv(pld_df, file = "Predicted Salary League Defense 2020.csv")


##-----------Predicting 2021 Salaries of Football Players by Position using 2020 training model------------##

## Predicting 2021 League Shooting Salaries
l.shooting2021 <- read.csv(file = "League Shooting 2021.csv", header = TRUE)
head(l.shooting2021)
summary(l.s2021)

l.s2021 <- l.shooting2021[,-1] # Take out Player
l.s2021 <- l.s2021[,-3] # Take out Squad
l.s2021 <- l.s2021[,-19] # Take out Year
l.s2021 <- l.s2021[,-1] # Take out Nation

p_ls2021 <- predict(pred_ls, l.s2021)
head(p_ls2021)
summary(p_ls2021)
pls_df2021 <- data.frame(p_ls2021)
head(pls_df2021)
write.csv(pls_df2021, file = "Predicted Salary League Shooting 2021.csv")

## Predicting 2021 League Midfielders Salaries
l.midfielders2021 <- read.csv(file = "League Midfielders 2021.csv", header = TRUE)
head(l.midfielders2021)
summary(l.m2021)

l.m2021 <- l.midfielders2021[,-1] # Take put Player
l.m2021 <- l.m2021[,-3] # Take out squad
l.m2021 <- l.m2021[,-17] # Take out Year
l.m2021 <- l.m2021[,-1] # Take out Nation

p_lm2021 <- predict(pred_lm, l.m2021)
head(p_lm2021)
summary(p_lm2021)
plm_df2021 <- data.frame(p_lm2021)
head(plm_df2021)
write.csv(plm_df2021, file = "Predicted Salary League Midfielders 2021.csv")

## Predicting 2021 League Goalkeeping Salaries
l.goalkeeping2021 <- read.csv(file = "League Goalkeeping 2021.csv", header = TRUE)
head(l.goalkeeping2021)
summary(l.g2021)

l.g2021 <- l.goalkeeping2021[,-1] # Take out Player
l.g2021 <- l.g2021[,-2] # Take out squad
l.g2021 <- l.g2021[,-12] # Take out Year
l.g2021 <- l.g2021[,-1] # Take out Nation

p_lg2021 <- predict(pred_lg, l.g2021)
head(p_lg2021)
summary(p_lg2021)
plg_df2021 <- data.frame(p_lg2021)
head(plg_df2021)
write.csv(plg_df2021, file = "Predicted Salary League Goalkeeping 2021.csv")

## Predicting 2021 League Defense Salaries
l.defense2021 <- read.csv(file = "League Defense 2021.csv", header = TRUE)
head(l.defense2021)
summary(l.d2021)

l.d2021 <- l.defense2021[,-1] # Take out Player
l.d2021 <- l.d2021[,-3] # Take out squad
l.d2021 <- l.d2021[,-24] # Take out Year
l.d2021 <- l.d2021[,-1] # Take out Nation

p_ld2021 <- predict(pred_ld, l.d2021)
head(p_ld2021)
summary(p_ld2021)
pld_df2021 <- data.frame(p_ld2021)
head(pld_df2021)
write.csv(pld_df2021, file = "Predicted Salary League Defense 2021.csv")

