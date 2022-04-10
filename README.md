# Actuarial Theory and Practice A
# Modelling Rarita's New Football Team and its Economic Impact

__By Pratyush Charde, Abinesh David, Saraf Jilani, Areeba Khan, and Theodore Sugita__

<p align="center">
<img src="https://user-images.githubusercontent.com/103352579/162608657-f0c744f0-cc80-4f9d-aa18-4ff24eb06bc8.jpeg" > 
</p>
---

# Table of Contents

1. [Objectives of Analysis](#objectives-of-analysis)
2. [Team Selection](#team-selection)
3. [Economic Impact](#economic-impact)
4. [Implementation Plan](#implementation-plan)
5. [Assumptions](#assumptions)
6. [Risk Mitigation Strategies](#risk-mitigation-strategies)
7. [Data and Data Limitations](#data-and-data-limitations)
8. [References](#references)

# Objectives of Analysis 

Forming a competitive national team is a complex process. The aim of this report is to assist this process via two main components. First, an outline of the method of selecting team players by analysing the player data available. Second, a forecast of the economic gains to Rarita generated by having a competitive team. Specifically, in terms of selecting players, a boosting regression was implemented to predict player salaries based on skills relevant to their position. For economic forecasting, a Holt-Winters exponential smoothing model was utilised to predict future revenues. Following from these analyses the report will outline a general implementation plan over the next ten years, list the assumptions used in the models, as well as consider the risks involved and the data limitations present.  

# Team Selection

## Competitiveness

Competitive viability for team selection as follows: 

- Maintain a sound financial standing, generating profits to boost the economy over the next 10 years 
- Build a skilled team by choosing the best players using our selection criteria defined below 

## Selection Criteria 

The rationale behind player selection is centred around salaries. Specifically, whilst player salaries are known, the approach taken assumes that some players are overpaid or underpaid based on their skills and performance. According to a study conducted by Togler & Schmidt, salary has a significant predictor of a player’s performance (2007) [1]. Hence, a Gradient Boosting Machine Regression (GBM) was used to predict skill-based salaries. 

Recognising the relation between salary and skill, we use the GBM to choose the highest paid and under-priced players for every position as shown in figures below. All high salary players belong to countries ranking in the top 10 tournament standings to boost the “competitiveness” of our team. Furthermore, we have also chosen young and the most under-priced players to maintain a competitive team throughout the next 10 years, while remaining financially sustainable (shown below). We have also included at least 1 Raritan national for every position, to promote the sport within the country.  

## Probability of Being Competitive 

A logistic regression was implemented for relevant statistics in each position to predict the probability that an individual player would be on a competitive team.These probabilities were averaged to create a metric for overall team competitiveness. Competitiveness was quantified by a categorical proxy variable labelled Top10, where:

<p align="center">
<img src="https://user-images.githubusercontent.com/103352150/162612755-fa95f495-e093-4c8a-a2b5-e187fe3c61ad.png" > 
</p>

This Top10 variable was the dependent variable of the logistic regression, with the explanatory variables being the relevant skill columns for the position. For example, the goalkeeping logistic regression modelled was as follows:

<p align="center">
<img src="https://user-images.githubusercontent.com/103352150/162612750-e3cc670e-d456-4496-a37d-9f3d482fd5df.png" > 
</p>

Average Pr(Competitive team) = 0.60

A majority of players have a probability greater than 80% of being part of a competitive team. There exist a few players with low probabilities (chosen based on their under-priced salary relative to performance). However, they are greatly outnumbered and may improve as explained below. 

Positive peer effects can enable lower probability players to increase their probability of competitiveness through the influence of higher probability players. This can be supported by the labour economics literature. According to MIT professor Daron Acemolu (2017), peer effects may have a positive externality [2] that improve the performance of lower performing participants within a group. If the players’ utility functions exhibit submodularity, that is, negative cross partial derivatives, we can expect lower probability players to be positively influenced by most higher probability players. This will increase overall team competitiveness through time.  

## Revenues & Expenses generated from a competitive team

We have used Holt-Winters forecasting, a time series method to predict the future revenues based on historical data provided. This method assigns exponentially decreasing weights to older values, keeping our results relevant, and as better to data without an obvious trend or pattern [3]. 

Inflation was predicted using exponential forecasting over the next 10 years and used in all calculations. 


|YEAR |Revenue (∂millions) |Expenses (∂millions) |Salaries (∂millions) |Profits (∂millions) |
| - | - | - | - | - |
|1 |410 |289.5 |191.3 |121 |
|2 |420 |294.2 |194.9 |126 |
|3 |430 |298.2 |199.0 |132 |
|4 |440 |300.6 |203.3 |140 |
|5 |450 |301.7 |207.9 |148 |
|6 |460 |300.6 |212.1 |159 |
|7 |470 |298.8 |216.4 |171 |
|8 |480 |296.1 |221.0 |184 |
|9 |490 |292.3 |225.3 |198 |
|10 |500 |288.1 |229.5 |212 |

        Table 2.2 

Using the spot rates provided and assumption (1), the results of the calculated NPV is shown below:

TOTAL NET PRESENT VALUES (∂Millions) 


||SALARY |1,953.8 |
| :- | - | - |
||REVENUE |4,230.7 |
||EXPENSES |2,764.2 |
||PROFITS |1,466.6 |

    Table 2.3 

We will not be loaning out players from our country as to preserve national competitiveness. Furthermore, our models have predicted that we have approximately 47% of our budget remaining after considering all direct team expenses for the next 10 years.   

# Economic Impact 

## Impact on GDP 

According to Keynesian economic theory, an increase in one of the components of aggregate demand (AD) will lead to a multi-fold increase in total GDP through the multiplier effect. The multiplier effect encapsulates the idea that once spending is distributed, it flows on into other channels of the economy.  

Applying this framework will illuminate how a competitive football team can improve Rarita’s GDP and economic performance overall. The football team’s profits will increase AD through consumption and/or investment, and thus increase total GDP by a greater amount via the multiplier. 

Standard macroeconomic theory indicates that the multiplier can be computed by:

<p align="center">
<img src="https://user-images.githubusercontent.com/103352150/162612950-20eb51b2-3060-42ce-8253-6341b044de08.png" > 
</p>


Where k=the multiplier and MPS = the Marginal Propensity to Save. The MPS indicates the proportion that is saved for every extra unit of income. Hence the intuition for this formula is that the greater one’s MPS, the less money continues to flow through the economy. Therefore, a greater MPS will result in a lower multiplier. 

To compute Rarita’s MPS the following formula was used:

<p align="center">
<img src="https://user-images.githubusercontent.com/103352150/162612975-c5603520-48fd-49e5-8fe8-d58954f2586f.png" > 
</p>
Which was determined using the economic data given by:

<p align="center">
<img src="https://user-images.githubusercontent.com/103352150/162613087-92eb1f67-704d-4e21-80d5-12cc7c6cc227.png" > 
</p>

A multiplier of 1.7 has been calculated for Rarita’s economy using the GDP and household savings rate data given. Using the projected profits of the football team, this multiplier will determine the total increase in the country’s GDP. The results to total GDP are shown below: 



|YEAR |PROFITS  (∂ Millions) |Impact to Total GDP (∂ Millions) |Impact to Total GDP |
| - | :- | :- | - |
|1 |121|205.7 |∂2.49B |
|2 |126|214.2 ||
|3 |132|224.4 ||
|4 |140|238 ||
|5 |148|251.6 ||
|6 |159|270.3 ||
|7 |171|290.7 ||
|8 |184|312.8 ||
|9 |198|336.6 ||
|10 |212|360.4 ||

    Table 3.1 

The total impact to GDP was projected to have a NPV of ∂2.49B using cashflows discounted by spot rates with yearly yield to maturity for 2021. 

## Universal Healthcare Access Initiative 

The establishment of Rarita’s football team also provides the Raritan government a unique opportunity to address some of the structural societal issues the country is currently facing. More specifically, the government can begin to tackle the large disparity in healthcare spending across Rarita’s three provinces.  

It has been observed that despite West Rarita comprising of 60% of Rarita’s total population, it only represents 16% of the nation’s total healthcare spending in 2020. The underfunded nature of West Rarita’s healthcare system is demonstrated in its ∂460 healthcare spending per capita, in stark contrast to East and Central Rarita, at ∂4,979 and ∂2,839 respectively.  

It was initially assumed that reinvestments of proceeds from the Raritan football team, in addition to other pertinent factors impacting provincial economic growth would naturally address this issue. However, empirical analysis shows that West Rarita’s marginal propensity to spend on healthcare is only at 3.5%. This is contrasted to Central Rarita’s driven commitment to developing their healthcare system at 10.9%, and East Rarita’s strong 4.8%, despite currently retaining ∂4,979 in healthcare spending per capita (over 10 times West Rarita’s equivalent figure). As such, it is possible that prosperous economic growth could actually worsen the healthcare inequality.  

When analysing the impact of a lump sum subsidy to West Rarita’s healthcare in 2030, we observe that allocating 70% of the Raritan football team’s projected surplus increases healthcare spending per capita by 40% 

This investment impact was less material than expected, with West Rarita currently projected to have a healthcare spending per capita at only 36% of the projected national average. As such, it is suggested that the fund be the beginning a long-term initiative for structural reform in addressing the current inequitable access to healthcare. 

The “Universal Healthcare Access Initiative” would involve restructuring the healthcare system to become more centralised, to capitalise upon the previously misallocated distribution of spending. Nationalising the healthcare system reduces the need for, and complexity of external investment. In 2030, it is projected that a national healthcare system would require to grow by ∂9.89B in order keep up with population growth and maintain current national healthcare spending per capita levels. This figure represents 47% of the Raritan football team’s forecasted profits in 2030 dropping from 79% in 2021, suggesting that the Raritan football team could serve as a potential long-term fund source in order to maintain national healthcare spending per capita, and allow the government to maintain its obligation to provide equitable access to healthcare. 

# Implementation Plan 

## Implementation Timeline

**Metric 1. Reassessing the FSA champion team (i.e., that scored the first position) against the chosen Rarita’s team through critical attributes that are crucial in players across all the positions.** 

Key Reporting Assessment:  

- We will be completing yearly assessments of key attributes of the top three teams as 

the performance indicators for Rarita’s football team across the following positions: 

1. Shooting: Standard SoT, Standard SoT%, Standard SoT90/Sh90, Standard G/SoT  
1. MidFielder: Total Cmp%, Total TotDist, Short Cmp%, Medium Cmp% and Long Cmp% 
1. Goalkeeping: Performance GA, Performance Save%, Performance CS%, 

Penalty Kicks Save%, Playing Time 90s. 

4. Defence: Tackles TklW/Tackles TKl, Tackles Def 3rd, Tackles Mid 3rd, Tackles Att 3rd, Vs Dribbles Tkl%, Vs Dribbles Past, Pressures %, Pressures Def 3rd, Pressures Mid 3rd, Pressures Att 3rd, Blocks Sh, Blocks ShSv, Blocks Pass 

Solution:  

- Personalised training programs for players in need of specific training  
- Assess whether new coaches or trainers are required to ensure training is successful 

Schedule of reporting: End of every FSA Championship League. 

**Metric 2. Keep track of over and underpriced salaries using GBM to ensure financially viability.**  

Key Reporting Assessment:  

- Adding the previous year’s data to the current information used for our modelling, where a new predictive salary must be estimated. As a result, there can be two of the following outcomes: 

Outcome 1. Predictive salary is lower than the Current salary as per the contract of the player 

Outcome 2. The predictive salary is higher than the player’s current salary  

Solution:  

Outcome 1: In this instance, the contract details (provided in the Assumptions section (3)) stipulates that the country has the power to provide the team’s individuals with a 2- month warning to show that they are working towards increasing their performance. If not, considerations will be made to reduce the player’s salary.  

Outcome 2: This will ensure that the plan is going as per the proposed strategy, and the players can be provided with yearly bonuses.   

Schedule of reporting: At the beginning of every new year. 

**Metric 3. Ensuring that all players’ overall probability of competitiveness is increased by 10% at every championship league over the next ten years compared to their initial 59%.**  

Key Reporting Assessment:  

- Yearly friendly test matches between Rarita and the top ten countries that will participate in the championship. Based on the friendly matches, we will ensure an increase in competitiveness. We will aim for a 70% win rate in 2023. By 2026, we aim to win all friendly matches, which will also drive the success rate of Rarita winning the FSA championship.  

Solution: 

- Customised training for each player  
- Incorporate the critical attributes shown by winning players in each position into our customised training program. The cost associated with this training programme is given in Assumption 8. 

Schedule of reporting: Beginning of every year. 

**Implementation Process:**  

This depicts the ACC implementation of the identified metrics.  

![Aspose Words 27e20f33-eb6d-4efe-8a9a-c53b3fcd9610 006](https://user-images.githubusercontent.com/103352579/162608663-340e981f-1c3d-4591-b256-91f79df3af72.jpeg)
<p align="center">
<img src="https://user-images.githubusercontent.com/103352579/162608663-340e981f-1c3d-4591-b256-91f79df3af72.jpeg" > 
</p>
Figure 4.1 

Note: Appendix A6 breaks down the budget allocation for the implementation timeline across the different key metrics identified in the analysis above.  

# Assumptions 
- Average staff expenses to total expenses were found to be 66% for all other countries. Assuming staff expenses majorly consists of salaries, we have replicated this ratio in calculating expenses & salaries (Appendix A2) in the table above.  
- Assume a multiplier effect of 1.7, given the calculations performed (Appendix A3). 
- The players have signed a lock-in contract that prevents them from quitting. However, the contract is contingent on their performance where the country retains the right to reduce their yearly salaries with a 2-month warning notice before taking any action.  
- No government mandated lockdowns or restrictions.  
- Players can play for countries other than their nationalities. 
- Rarita’s revenue follows the trends of the top ten current nations. 
- Rarita’s economy is suitably similar to that of the other top ten nations. 
- The cost of training excluded from calculating expenses. 
- Players will remain over a tenure above ten years (hence players younger than 27 years old). 


# Risk Mitigation Strategies 

## RCD Tool with Risk Mitigation Response (Qualitative Risks) 

|Risk Category |Risk Division |Definition |Risk Mitigation Strategy |
| - | - | - | - |
|Operational |Health: Pandemic |Infect Rarita’s players and management staff |Reduce: Hire 5 substitutes to mitigate the risk of a shortage of players |
|Operational |Human resources: labour |Players leave for another team |Remove: Establish lock-in contracts for all players |
|Operational |Human resources: labour |Injured players |Reduce: Employ physiotherapists to treat injuries and substitute players |
|Operational |Security: terrorism |Terrorist attack in Rarita football stadium |Reduce: Hire security staff on grounds during matches and training |
|Strategic |Competition: outperformed |Other teams outperform Rarita out of the top ten |Retain: accept risk due to the intrinsic nature of the industry and appeal of the sport |
|Strategic |Competition: high-profile player  |Rarita competes against a team with a superstar player who drastically reduces their chance of winning |Exploit: use as a marketing opportunity to raise the stakes and generate a larger fan following |
|Strategic |Economic |Unforeseen recession reduces tourism demand |Reduce: implement expansionary monetary and fiscal policy to recover the economy |
|Financial |Liquidity  |Liquidity risk if cash flows become negative |Reduce: raise capital from investment banks and other non – governmental funding  |
Table 6.1 

## Risk Map for Qualitative Risks: 

![Risk Map](https://user-images.githubusercontent.com/103352144/162609731-ea4fabc6-c6d2-49f6-bcf0-111dc114185e.png)

As illustrated in the diagram above, the qualitative risks have an ideal trade-off between impact and likelihood. Furthermore, the risk map illustrates the impact and likelihood 

before risk mitigation is implemented. Hence, after these strategies are implemented, it is expected that these likelihoods will fall significantly. In the case of ‘Player Leaves’, likelihood will fall to zero, due to the introduction of lock-in contracts. 

## Quantitative Risk: Implementation Modelling Risk 

The quantitative risk considered was the accuracy of the salary models. Two models (GBM, MLR) were fitted, and model selection was determined using MSE and goodness-of-fit  graphs.The test results are depicted in the graphs above,as indicated in Figures 6.2 and 6.3, the goodness-of-fit of the GBM outperforms that of MLR.

![Aspose Words 27e20f33-eb6d-4efe-8a9a-c53b3fcd9610 007](https://user-images.githubusercontent.com/103352579/162608664-33959d0b-d2ae-4eec-8c46-3fbe621e97ad.jpeg)

![Aspose Words 27e20f33-eb6d-4efe-8a9a-c53b3fcd9610 008](https://user-images.githubusercontent.com/103352579/162608666-e792e2e9-ea10-4e8d-ae9d-21a27288f2a1.jpeg)

Figure 6.2: GBM Goodness of Fit Graphs 

![Aspose Words 27e20f33-eb6d-4efe-8a9a-c53b3fcd9610 009](https://user-images.githubusercontent.com/103352579/162608667-c52d7d1f-15d5-450a-acda-b66549a2232a.jpeg)

Figure 6.3: MLR Goodness of Fit Graphs 


# Data and Data Limitations 
- Data cleaning has been performed by using multicollinearity matrix (Appendix A5). Furthermore, noise in the data has been reduced by eliminating/modifying data accordingly (Appendix A4). 
- Missing data has been imputed as tournament averages. 
- Only four years of data was provided for Holt-Winters forecasting, which did not allow for the detection of any seasonality.  
- The tournament data for players consisted of variables that had more than 80% of missing values (for e.g., Standard Dist). These variables were removed from consideration.  

# References 
1. ResearchGate. (n.d.). (PDF) What shapes player performance in soccer? Empirical findings from a panel analysis. [online] Available at: https://www.researchgate.net/publication/43104075\_What\_shapes\_player\_performance\_i n\_soccer\_Empirical\_findings\_from\_a\_panel\_analysis [Accessed 18 Mar. 2022]. 
1. Mit, D. and Acemoglu, D. (2017). [online] Available at: https://economics.mit.edu/files/13900 [Accessed 19 Mar. 2022] 
1. Elegantjbi.com. 2022. What is the Holt-Winters Forecasting Algorithm and How Can it be Used for Enterprise Analysis? [online] Available at: <https://www.elegantjbi.com/blog/what-is-the-holt-winters-forecasting-algorithm-and- how-can-it-be-used-for-enterprise-analysis.htm> [Accessed 27 March 2022]. 

1. GeeksforGeeks. (2020). Time Series Analysis using ARIMA model in R Programming. [online] Available at: https://www.geeksforgeeks.org/time-series-analysis-using-arima- model-in-r- programming/#:~:text=In%20R%20programming%2C%20arima%20%28%29%20function%2 0is%20used [Accessed 20 Mar. 2022] 
