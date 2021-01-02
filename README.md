Final Deliverable: https://fmp17.shinyapps.io/final-project/ 

# Domain of Interest
* Our general domain is cardiovascular diseases.
* Interest in Cardiovascular Disease
  + Cardiovascular diseases are the number of cause of death in the US and pose a high burden on the healthcare system because of the lack of cure.
  + These diseases can be well mitigated through changes in individual and societal behaviors, such as daily exercise and balanced childhood nutrition in schools.
  + It is important to education ourselves about cardiovascular (CV) diseases so we can keep our hearts healthy.
* Data Driven Project Examples Related to CV Diseases
  + Diabetes and CV diseases
    + [Link here](https://bmcmedinformdecismak.biomedcentral.com/articles/10.1186/s12911-019-0918-5)
    + The project developed a model for acquiring CV diseases through machine learning.     + They came up with waist size, age, self-reported weight, leg length and sodium          intake as the top 5 predictors for diabetes and subsequent CV disease.
  + Identifying people with high risk of CV diseases
    + [Link here](https://academic.oup.com/jamia/article/26/2/155/5218978)
    + This project aimed to figure out whether a tool that included health-related             behaviors to identify CV risk was better than the old cholesterol levels approach.
  + Improving treatment approaches to CV diseases
    + [Link here](https://www.healthcatalyst.com/wp-content/uploads/2016/10/Data-Driven-Approach-to-Improving-Cardiovascular-Care.pdf)
    + AllinaHealth used the data present in their systems to see where clinical               practices varied and operational resource based issues were mismanaged. They came       to conclusions where $75M in the healthcare industry could have been saved instead       of spent.
* Potential Data Driven Questions About CV Diseases
  + How irreversible is heart disease?
    + We could look at data on the percentage of initially CV disease diagnosed cases           that did not see repeat hospitalizations.
  + Is chronic stress because of high-paying jobs more associated with CV diseases than     medium-paying lower stress jobs?
    + We could directly compare statistics of CV diseases in people with high-paying           jobs and medium-paying jobs. It doesn't make sense to compare low-paying jobs           because there may have the stress of not having the security of savings. For this       job categorization, we may just have to try to find income levels of people with         CV diseases.
  + What are the success rates of home-based behavioral interventions to risk of CV         disease vs professional-based? Would compliance to change in behaviors be entirely       dependent on the will of the patient or whether is a professional always checking       their nutrition and exercise behaviors?
    + I am not sure where we could find the home-based behavioral change data.                 Potentially, people may give this data to phone apps that monitor fitness levels         and this data may be depersonalized and available on the internet. Professional-         based data can be found on the websites for fitness and diet improvement                 businesses.
  + How does the hospital perform against CV disease (heart attack, heart failure)
    + We can look into hospital mortality rate data realted to CV dieases, and we can also
    potentially find the average success rate of professional institution in the state.
# Finding Data

## Hospital outcome measure
* Where did you download the data (e.g., a web URL)?
  + [Link here](https://datascience-enthusiast.com/R/hospital_rank.html)
  + The dataset is originally from *data.medicare.gov*, but it's no longer
  available on the website. The only link is from this research journal.
* How was the data collected or generated? Make sure to explain who collected
the data (not necessarily the same people that host the data), and who or what
the data is about?
  + The origin website provides direct access to data from CMS (Center for
  Medicare & Medicaid Services), which is a federal agency within the department
  of Health and Human Services. The data is collected directly from physicians
  and hospitals.
* How many observations (rows) are in your data?
  + There are 4,706 rows.
* How many features (columns) are in the data?
  + There are 46 columns.
* What questions (from above) can be answered using the data in this dataset?
  + This dataset can be used to answer the nation wide hospital performance against CV diease, since it has the thirth-day mortality rate range of each hospital with different heart condition (heart attack & heart failure). There is also the total number of patients that we can potentially get the success rate against CV diease for each hospital.

## National Health Interview Survey NHIS-National Cardiovascular Disease Surveillance Data
* Where did you download the data (e.g., a web URL)?
  + [Link here](https://healthdata.gov/dataset/national-health-interview-survey-nhis-national-cardiovascular-disease-surveillance-data)
* How was the data collected or generated? Make sure to explain who collected
the data (not necessarily the same people that host the data), and who or what
the data is about?
  + Data was collected through personal household interviews, where participants are asked a series of questions about their personal health, including their heart. Data was collected by the NHIS, a branch of the CDC. The data shows the proportion of the people who surveyed had cardiovascular disease, among other risk factors, within in a certain subset of the overall population of people surveyed.
* How many observations (rows) are in your data?
  + 15,841 different rows
* How many features (columns) are in the data?
  + 29 separate columns
* What questions (from above) can be answered using the data in this dataset?
  + This dataset can help answer the second and the third question, since it has the information of the various risk factors that can lead to CV, whether that would be from having high stress jobs, as the second question asks, or from various behaviors that lead to CV, as the third question asks.

## Heart Disease Data Set UCI
* Where did you download the data (e.g., a web URL)?
  + [Link here](https://www.kaggle.com/ronitf/heart-disease-uci)
  + We downloaded the data set from Kaggle. UCI has the same table on their website, but we weren't able to access it from their website.
* How was the data collected or generated? Make sure to explain who collected
the data (not necessarily the same people that host the data), and who or what
the data is about?
  + This data set was generated by Cleveland Clinic Foundation, Hungarian Institute of Cardiology Budapest, V.A. Medical Center Long Beach CA, and University Hospital Zurich Switzerland. The original database had 76 raw dimensions, but this only includes 14 of them. This data set was previously used for probability algorithms used to predict for the diagnosis of coronary artery disease.
* How many observations (rows) are in your data?
  + The data set has 304 rows.
* How many features (columns) are in the data?
  + The data set has 14 columns
* What questions (from above) can be answered using the data in this dataset?
  + This data set could help answer question three. They measure the blood sugar content after fasting. This would be a good measure of the patients diet. Unfortunately there isn't much personal information associated with the patients.
