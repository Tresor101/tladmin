#import of the dataset 
my_data <- read.csv("C:/Users/user/Desktop/Placement_Data_Full_Class.csv")

# remove duplicate rows
my_dataset <- unique(my_data)

# remove rows with missing data
complete_dataset <- na.omit(my_dataset)

# summary of the dataset
summary(my_dataset)
# summary of the complete_dataset
summary(complete_dataset)

# Display the structure of the dataset called my_dataset
str(my_dataset)

# Display the structure of the dataset called my_dataset
str(complete_dataset)

# Display the first few data of the dataset called put in the variable my_dataset
head(my_dataset)

# Display the last 5 rows of data in the dataset called my_dataset
tail(my_dataset,5)

clean_dataset <- unique(my_data)

library(ggplot2)

# create example data
set.seed(123)
my_data <- data.frame(
  gender = sample(c("F", "M"), size = 100, replace = TRUE),
  status = sample(c("Placed", "Not Placed"), size = 100, replace = TRUE)
)

######################################################################################################
####################################Question 1########################################################
######################################################################################################
################################## Analysis 1-1 ######################################################
install.packages("ggplot2")
library(ggplot2)

ggplot(clean_dataset, aes(x = status, fill = status)) +
  geom_bar() +
  scale_fill_manual(values = c("gray", "blue")) +
  labs(title = "Placement Status",
       x = "Placement Status",
       y = "Count") +
  theme(plot.title = element_text(hjust = 0.5))
################################## Analysis 1-2 ######################################################

library(dplyr)
library(magrittr)

clean_dataset %>% 
  group_by(gender, status) %>% 
  summarize(count = n()) %>%
  ggplot(aes(x = status, y = count, fill = gender)) +
  geom_bar(position = "dodge", stat = "identity") +
  labs(title = "Placement Status by Gender",
       x = "Placement Status",
       y = "Count") +
  scale_fill_manual(values = c("blue", "red")) + # specifying colors for male and female
  theme(plot.title = element_text(hjust = 0.5)) # centering graph title

######################################################################################################
####################################Question 2########################################################
######################################################################################################
################################## Analysis 2-1 ######################################################

hist(clean_dataset$etest_p, col = "blue", border = "white", main = "Distribution of Employee Test Scores",
     xlab = "Employee Test Scores")

################################# Analysis 2-2 #######################################################

# Calculate placement rate for those with etest_p above and below 75
above_threshold <- clean_dataset$status[clean_dataset$etest_p > 75]
above_placement_rate <- sum(above_threshold == "Placed") / length(above_threshold)

below_threshold <- clean_dataset$status[clean_dataset$etest_p <= 75]
below_placement_rate <- sum(below_threshold == "Placed") / length(below_threshold)

# Print the results
cat("Placement rate for those with etest_p above 75: ", round(above_placement_rate * 100, 2), "%\n")
cat("Placement rate for those with etest_p at or below 75: ", round(below_placement_rate * 100, 2), "%\n")

################################# Analysis 2-3 #######################################################

# Calculate placement rate overall
placement_rate <- sum(clean_dataset$status == "Placed") / nrow(clean_dataset)
cat("Overall placement rate: ", round(placement_rate * 100, 2), "%\n")

# Calculate placement rate for those with and without work experience
with_experience <- clean_dataset$status[clean_dataset$workex == "Yes"]
with_experience_placement_rate <- sum(with_experience == "Placed") / length(with_experience)

without_experience <- clean_dataset$status[clean_dataset$workex == "No"]
without_experience_placement_rate <- sum(without_experience == "Placed") / length(without_experience)

# Print the results
cat("Placement rate for those with work experience: ", round(with_experience_placement_rate * 100, 2), "%\n")
cat("Placement rate for those without work experience: ", round(without_experience_placement_rate * 100, 2), "%\n")


################################# Analysis 2-4 #######################################################

library(dplyr)
library(tidyr)
library(stats)

# Create a contingency table of major vs. placement status
cont_table <- clean_dataset %>%
  select(degree_t, status) %>%
  table()

# Calculate the chi-squared test of independence
test_results <- chisq.test(cont_table)

# Print the test results
test_results

################################# Analysis 2-5 #######################################################

#Load the necessary packages

library(dplyr)
library(tidyverse)

#Calculate the placement rate by gender

clean_dataset %>%
  group_by(gender) %>%
  summarize(placement_rate = mean(status == "Placed")) %>%
  mutate(placement_rate = round(placement_rate * 100, 2))

#Count the number of students in each job sector

job_count <- clean_dataset %>%
  group_by(degree_t) %>%
  summarize(count = n())

print(job_count)

# Visualize the distribution of job sectors by degree qualification

ggplot(job_count, aes(x = degree_t, y = count, fill = degree_t)) +
  geom_bar(stat = "identity") +
  labs(title = "Distribution of job sectors by degree qualification", x = "Degree Type", y = "Count") +
  scale_fill_brewer(palette = "Set3") +
  theme(plot.title = element_text(hjust = 0.5))

######################################################################################################
####################################Question 3########################################################
######################################################################################################
################################# Analysis 3-1 #######################################################

library(dplyr)

clean_dataset %>%
  group_by(internet) %>%
  summarize(avg_hsc_p = sum(hsc_p) / n())

################################# Analysis 3-2 #######################################################

library(dplyr)

clean_dataset %>%
  group_by(internet) %>%
  summarize(avg_degreep = sum(degree_p) / n())

################################# Analysis 3-3 #######################################################

ggplot(data = clean_dataset, aes(x = Fjob, y = hsc_p, color = Fjob)) +
  geom_point() +
  ggtitle("Father's Occupation vs HSC Exam Scores") +
  xlab("Father's Occupation") +
  ylab("HSC Exam Scores") +
  theme(plot.title = element_text(hjust = 0.5),
        plot.caption = element_text(hjust = 0.5, margin = margin(t = 10)))

clean_dataset %>%
  group_by(Fjob) %>%
  summarize(avg_hsc_p = mean(hsc_p, na.rm = TRUE))

################################# Analysis 3-4 #######################################################

ggplot(data = clean_dataset, aes(x = Mjob, y = hsc_p, color = Fjob)) +
  geom_point() +
  ggtitle("Mother's Occupation vs HSC Exam Scores") +
  xlab("Mother's Occupation") +
  ylab("HSC Exam Scores") +
  theme(plot.title = element_text(hjust = 0.5),
        plot.caption = element_text(hjust = 0.5, margin = margin(t = 10)))

clean_dataset %>%
  group_by(Mjob) %>%
  summarize(avg_hsc_p = mean(hsc_p, na.rm = TRUE))

################################# Analysis 3-4 #######################################################

library(tidyverse)

# Create a contingency table of father's occupation vs. placement status
cont_table_father <- clean_dataset %>%
  select(Fjob, status) %>%
  table()

# Perform the chi-squared test of independence for father's occupation
test_result_father <- chisq.test(cont_table_father)

# Create a contingency table of mother's occupation vs. placement status
cont_table_mother <- clean_dataset %>%
  select(Mjob, status) %>%
  table()

# Perform the chi-squared test of independence for mother's occupation
test_result_mother <- chisq.test(cont_table_mother)

# Print the test results
test_result_father
test_result_mother

######################################################################################################
####################################Question 4########################################################
######################################################################################################
################################## Analysis 4-1 ######################################################

library(dplyr)

# Group the data by major and calculate the mean salary

major_salary <- clean_dataset %>%
  na.omit() %>%
  group_by(degree_t) %>%
  summarize(avg_salary = mean(salary))

# Print the results

major_salary

################################## Analysis 4-2 ######################################################

library(dplyr)

# Group the data by degree and status, and count the number of people in each group
placed_count <- clean_dataset %>%
  filter(!is.na(status)) %>%
  group_by(degree_t, status) %>%
  summarize(count = n())

# Extract the number of people who have been placed for each degree
placed_count %>%
  filter(status == "Placed") %>%
  select(degree_t, count)

################################## Analysis 4-3 ######################################################

library(tidyverse)

# Create a contingency table of high school board vs. placement status
cont_table <- clean_dataset %>%
  select(hsc_s, status) %>%
  table()

# Perform the chi-squared test of independence
test_result <- chisq.test(cont_table)

# Print the test results
test_result

################################## Analysis 4-4 ######################################################

library(tidyverse)
library(RColorBrewer)

# Create boxplot of salary by major with fill color
ggplot(clean_dataset, aes(x = degree_t, y = salary, fill = degree_t)) +
  geom_boxplot() +
  labs(title = "Salary by Major", x = NULL, y = "Salary") +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_fill_brewer(palette = "Set3")

################################## Analysis 4-6 ######################################################
######################################################################################################
####################################Question 5########################################################
######################################################################################################
################################## Analysis 5-1 ######################################################

# Calculate the mean and standard deviation of placement rates for male students
male_placement_data <- clean_dataset %>%
  filter(gender == "M") %>%
  select(status) %>%
  mutate(status = as.integer(status == "Placed"))

male_mean <- mean(male_placement_data$status)
male_sd <- sd(male_placement_data$status)

# Calculate the mean and standard deviation of placement rates for female students
female_placement_data <- clean_dataset %>%
  filter(gender == "F") %>%
  select(status) %>%
  mutate(status = as.integer(status == "Placed"))

female_mean <- mean(female_placement_data$status)
female_sd <- sd(female_placement_data$status)

# Perform the two-sample t-test
t_test <- t.test(male_placement_data$status, female_placement_data$status, var.equal = TRUE)

# Print the results
paste0("Male placement rate mean: ", male_mean, ", SD: ", male_sd, "\n")
paste0("Female placement rate mean: ", female_mean, ", SD: ", female_sd, "\n")
paste0("T-statistic: ", t_test$statistic, ", p-value: ", t_test$p.value)

################################## Analysis 5-2 ######################################################

# Group the data by degree specialism and gender
specialism_gender_data <- clean_dataset %>%
  group_by(degree_t, gender)

# Count the number of male students who were placed in each degree specialism
male_placement_counts <- specialism_gender_data %>%
  filter(gender == "M" & status == "Placed") %>%
  count(degree_t)

# Count the total number of male students in each degree specialism
male_total_counts <- specialism_gender_data %>%
  filter(gender == "M") %>%
  count(degree_t)

# Calculate the percentage of male students who were placed in each degree specialism
male_placement_percentages <- male_placement_counts %>%
  left_join(male_total_counts, by = "degree_t") %>%
  mutate(percent_placed = n.x / n.y * 100)

# Print the result
male_placement_percentages

################################## Analysis 5-3 ######################################################

# Group the data by degree specialism and gender
specialism_gender_data <- clean_dataset %>%
  group_by(degree_t, gender)

# Count the number of female students who were placed in each degree specialism
female_placement_counts <- specialism_gender_data %>%
  filter(gender == "F" & status == "Placed") %>%
  count(degree_t)

# Count the total number of female students in each degree specialism
female_total_counts <- specialism_gender_data %>%
  filter(gender == "F") %>%
  count(degree_t)

# Calculate the percentage of female students who were placed in each degree specialism
female_placement_percentages <- female_placement_counts %>%
  left_join(female_total_counts, by = "degree_t") %>%
  mutate(percent_placed = n.x / n.y * 100)

# Print the result
female_placement_percentages

######################################################################################################
####################################Extra analysis####################################################
######################################################################################################
#################################### Analysis 1 ######################################################

relevant_columns <- clean_dataset %>%
  select(ssc_p, hsc_p, degree_p)

install.packages("ggcorrplot")
library(ggcorrplot)

correlation_matrix <- cor(relevant_columns)
ggcorrplot(correlation_matrix, type = "upper", lab = TRUE)

#################################### Analysis 2 ######################################################

library(tidyverse)

# Subset the data to relevant columns
placement_data <- clean_dataset %>%
  select(hsc_p, status)

# Remove missing or invalid values
placement_data <- placement_data %>%
  drop_na()

# Calculate the correlation coefficient
correlation <- cor(placement_data$hsc_p, placement_data$status == "Placed")

# Create a scatter plot
ggplot(placement_data, aes(x = hsc_p, y = status)) +
  geom_point(aes(color = status)) +
  scale_color_manual(values = c("#FFB6C1", "#90EE90")) +
  labs(title = "High School GPA vs. Placement Rates",
       x = "High School GPA", y = "Placement Status") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))

#################################### Analysis 3 ######################################################

library(ggplot2)

# Calculate the average placement rate for each degree specialism
placement_rates <- clean_dataset %>%
  group_by(degree_t) %>%
  summarise(placement_rate = mean(as.numeric(status == "Placed")) * 100)

# Create a bar chart of the average placement rates
ggplot(placement_rates, aes(x = degree_t, y = placement_rate)) +
  geom_bar(stat = "identity", fill = "#0072B2") +
  labs(title = "Average Placement Rate by Degree Specialism",
       x = "Degree Specialism",
       y = "Placement Rate (%)") +
  coord_flip() +
  theme(plot.title = element_text(hjust = 0.5))

#################################### Analysis 4 ######################################################

#Load the required libraries
library(dplyr)
library(ggplot2)

# Subset the data to relevant columns
extracurricular_placement <- clean_dataset %>%
  select(activities, status)

# Remove missing or invalid values
extracurricular_placement <- extracurricular_placement %>%
  drop_na() %>%
  filter(activities != "None")

# Group the data by extracurricular involvement
extracurricular_placement_rates <- extracurricular_placement %>%
  group_by(activities) %>%
  summarize(placement_rate = mean(status == "Placed"))

# Visualize the placement rate for each group
ggplot(extracurricular_placement_rates, aes(x = activities, y = placement_rate, fill = activities)) +
  geom_bar(stat = "identity") +
  labs(title = "Placement Rate by Extracurricular Involvement", x = NULL, y = "Placement Rate") +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_fill_brewer(palette = "Set3")

#################################### Analysis 5 ######################################################

library(dplyr)       # Load the dplyr package for data manipulation
library(ggplot2)     # Load the ggplot2 package for data visualization

# Subset the data to relevant columns
major_gpa <- clean_dataset %>%
  select(degree_t, ssc_p, hsc_p, degree_p, etest_p)

# Remove missing or invalid values
major_gpa <- major_gpa %>%
  drop_na()

# Calculate the average GPA for each major
major_gpa <- major_gpa %>%
  group_by(degree_t) %>%
  summarize(avg_gpa = mean((ssc_p + hsc_p + degree_p + etest_p) / 4))

# Visualize the relationship between major and GPA
ggplot(major_gpa, aes(x = degree_t, y = avg_gpa, fill = degree_t)) +
  geom_bar(stat = "identity") +
  labs(title = "Average GPA by Major") +
  theme(plot.title = element_text(hjust = 0.5))

#################################### Analysis 6 ######################################################

library(dplyr)
library(ggplot2)

# Subset the data to relevant columns
major_placement <- clean_dataset %>%
  select(degree_t, status)

# Remove missing or invalid values
major_placement <- major_placement %>%
  drop_na()

# Group the data by major
major_placement_rates <- major_placement %>%
  group_by(degree_t) %>%
  summarize(placement_rate = mean(status == "Placed"))

# Visualize the placement rate for each major
ggplot(major_placement_rates, aes(x = degree_t, y = placement_rate, fill = degree_t)) +
  geom_bar(stat = "identity") +
  labs(title = "Placement Rate by Major") +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_fill_brewer(palette = "Set3")

#################################### Analysis 7 ######################################################

library(dplyr)

# Subset the data to relevant columns
placement_gpa <- clean_dataset %>%
  select(status, degree_p)

# Remove missing or invalid values
placement_gpa <- placement_gpa %>%
  drop_na()

# Calculate the average GPA of students who were placed
avg_placement_gpa <- placement_gpa %>%
  filter(status == "Placed") %>%
  summarize(avg_gpa = mean(degree_p))

# Print the result
print(avg_placement_gpa$avg_gpa)

#################################### Analysis 8 ######################################################

clean_dataset$status <- factor(clean_dataset$status, levels = c ("Not Placed", "Placed"))
placements_summary <- summary(clean_dataset$status)
placements_percentages <- round(placements_summary / sum(placements_summary)*100,2)
placements_percentages

#################################### Analysis 9 ######################################################

library(tidyverse)

# Subset the data to relevant columns
gender_field_data <- clean_dataset %>%
  select(gender, degree_t)

# Create a contingency table
gender_field_table <- table(gender_field_data)

# Conduct a chi-squared test
chisq.test(gender_field_table)

#################################### Analysis 10 ######################################################

library(dplyr)
library(ggplot2)

# Subset the data to relevant columns
placement_data <- clean_dataset %>%
  select(activities, workex, status)

# Remove missing or invalid values
placement_data <- placement_data %>%
  na.omit()

# Group the data by extracurricular activities and calculate the placement rate
extracurricular_placement_rates <- placement_data %>%
  group_by(activities) %>%
  summarize(placement_rate = mean(status == "Placed"))

# Group the data by work experience and calculate the placement rate
workexp_placement_rates <- placement_data %>%
  group_by(workex) %>%
  summarize(placement_rate = mean(status == "Placed"))

# Visualize the relationship between extracurricular activities and placement rate
ggplot(extracurricular_placement_rates, aes(x = activities, y = placement_rate, fill = activities)) +
  geom_bar(stat = "identity") +
  labs(title = "Placement Rate by Extracurricular Activity") +
  theme(plot.title = element_text(hjust = 0.5))

# Visualize the relationship between work experience and placement rate
ggplot(workexp_placement_rates, aes(x = workex, y = placement_rate, fill = workex)) +
  geom_bar(stat = "identity") +
  labs(title = "Placement Rate by Work Experience") +
  theme(plot.title = element_text(hjust = 0.5))
#######################################################################################################
#######################################################################################################
#######################################################################################################