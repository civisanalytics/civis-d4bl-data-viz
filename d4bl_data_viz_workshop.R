# Data Visualization for Black Lives: Interactive Workshop
# authors: Cameron Clarke and Brecia Young
# January 12, 2019


library(tidyverse)


## ------------------------------------------------------------------------
# Example - Assigning a variable, y, the value of 2 
y <- 2 

# Exercise - Try assiging the value of 3 to variable y

## ------------------------------------------------------------------
# `myfunc`: 
#   - input:  arg_1, arg_2 (must both be able to be cast as 
#             character strings)
#   - output: the concatenation of arg_1 and arg_2 as characters, 
#             with a comma and a space as a separator
myfunc <- function(arg_1, arg_2) {
  
  output <- paste0(arg_1, ", ", arg_2)
  
  return(output)
  
}


## ------------------------------------------------------------------
myfunc(arg_1 = "a", arg_2 = "b")

## ------------------------------------------------------------------
myfunc("a", "b")

## ------------------------------------------------------------------
myfunc("b", "a")

## ------------------------------------------------------
myfunc("b", a)

## ------------------------------------------------------------------
myvar <- myfunc("a", "b")
myvar

## ------------------------------------------------------------------
myvar_2 <- "a" %>% myfunc("b")
myvar_2

## ------------------------------------------------------------------
myvar_3 <- "b" %>% myfunc("a")
myvar_3

## ------------------------------------------------------------------
myvar_4 <- "b" %>% myfunc("a", .)
myvar_4

## -----------------------------------------------------------------
myvar_5 <- "b" %>% myfunc(arg_1 = "a", arg_2 = .)
myvar_5

## ------------------------------------------------------------------------
full_data_df

## -----------------------------------------------------------------
missing_data_df

## -----------------------------------------------------------------
ggplot2::ggplot(data = full_data_df) +
  ggplot2::geom_point(aes(x = year, y = percentage_estimate)) +
  ggplot2::facet_wrap(race_ethnicity ~ sex)
  

## ------------------------------------------------------------------------
ggplot2::ggplot()

## -----------------------------------------------------
## ggplot2::ggplot(data = <DATA>) +
##   <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))

## -----------------------------------------------------------------
non_hisp_black_df <- full_data_df %>% 
  filter(race_ethnicity == "Black, non-Hispanic")

ggplot2::ggplot(data = non_hisp_black_df) +
  ggplot2::geom_point(mapping = aes(x = year, y = percentage_estimate))

## -----------------------------------------------------------------
ggplot2::ggplot(data = non_hisp_black_df) +
  ggplot2::geom_line(mapping = aes(x = year, y = percentage_estimate))

## -----------------------------------------------------------------
ggplot2::ggplot(data = non_hisp_black_df) +
  ggplot2::geom_point(mapping = aes(x = year, y = percentage_estimate, shape = sex))

## -----------------------------------------------------------------
ggplot2::ggplot(data = non_hisp_black_df) +
  ggplot2::geom_point(mapping = aes(x = year, y = percentage_estimate, color = sex))

## -----------------------------------------------------------------
ggplot2::ggplot(data = non_hisp_black_df) +
  ggplot2::geom_line(mapping = aes(x = year, y = percentage_estimate, color = sex))

## -----------------------------------------------------------------
ggplot2::ggplot(data = non_hisp_black_df) +
  ggplot2::geom_line(mapping = aes(x = year, y = percentage_estimate))

## -----------------------------------------------------------------
ggplot2::ggplot(data = non_hisp_black_df) +
  ggplot2::geom_line(mapping = aes(x = year, y = percentage_estimate)) +
  ggplot2::facet_wrap(~ sex)

## -----------------------------------------------------------------
ggplot2::ggplot(data = non_hisp_black_df) +
  ggplot2::geom_line(mapping = aes(x = year, y = percentage_estimate)) +
  ggplot2::facet_wrap(~ sex, ncol = 1)

## -----------------------------------------------------------------
ggplot2::ggplot(data = non_hisp_black_df) +
  ggplot2::geom_line(mapping = aes(x = year, y = percentage_estimate)) +
  ggplot2::facet_grid(race_ethnicity_plot_label ~ sex)

## -----------------------------------------------------------------
ggplot2::ggplot(data = non_hisp_black_df) +
  ggplot2::geom_line(mapping = aes(x = year, y = percentage_estimate)) +
  ggplot2::facet_grid(sex ~ race_ethnicity_plot_label)

## -----------------------------------------------------------------
ggplot2::ggplot(data = full_data_df) +
  ggplot2::geom_line(mapping = aes(x = year, y = percentage_estimate)) +
  ggplot2::facet_grid(sex_plot_label ~ race_ethnicity_plot_label)

## -----------------------------------------------------------------
df_for_bars <- full_data_df %>% 
  dplyr::filter(year == 2008, sex == 'All sexes in survey sample')

ggplot2::ggplot(data = df_for_bars) +
  ggplot2::geom_bar(mapping = aes(x = race_ethnicity_plot_label, y = percentage_estimate), stat = 'identity')


## -----------------------------------------------------------------
all_sexes_df <- full_data_df %>% 
  dplyr::filter(sex == 'All sexes in survey sample')

ggplot2::ggplot(data = all_sexes_df) +
  ggplot2::geom_bar(mapping = aes(x = race_ethnicity_plot_label, y = percentage_estimate), stat = 'identity') +
  ggplot2::facet_wrap(~ year)

## -----------------------------------------------------------------
ggplot2::ggplot(data = non_hisp_black_df) +
  ggplot2::geom_line(mapping = aes(x = year, y = percentage_estimate, color = sex)) +
  ggplot2::geom_ribbon(mapping = aes(x = year, 
                                     ymin = percentage_estimate - percentage_stderr_estimate,
                                     ymax = percentage_estimate + percentage_stderr_estimate,
                                     fill = sex,
                                     alpha = 0.3))

## -----------------------------------------------------------------
ggplot2::ggplot(
  data = non_hisp_black_df, 
  mapping = aes(x = year,
                y = percentage_estimate,
                ymin = percentage_estimate - percentage_stderr_estimate,
                ymax = percentage_estimate + percentage_stderr_estimate)
  ) +
  ggplot2::geom_line(aes(color = sex)) +
  ggplot2::geom_ribbon(aes(fill = sex, alpha = 0.3))

## -----------------------------------------------------------------
ggplot2::ggplot(data = df_for_bars) +
  ggplot2::geom_bar(mapping = aes(x = race_ethnicity_plot_label, y = percentage_estimate), stat = 'identity')

## -----------------------------------------------------------------
ggplot2::ggplot(data = all_sexes_df) +
  ggplot2::geom_bar(mapping = aes(x = year, y = percentage_estimate, fill = race_ethnicity_plot_label), stat = 'identity')

## -----------------------------------------------------------------
ggplot2::ggplot(data = all_sexes_df) +
  ggplot2::geom_bar(mapping = aes(x = year, y = percentage_estimate, fill = race_ethnicity_plot_label),
                    stat = 'identity', position = "dodge")

## -----------------------------------------------------------------
ggplot2::ggplot(data = df_for_bars) +
  ggplot2::geom_bar(mapping = aes(x = race_ethnicity_plot_label, y = percentage_estimate), stat = 'identity') +
  ggplot2::coord_flip()

## -----------------------------------------------------------------
ggplot2::ggplot(data = df_for_bars) +
  ggplot2::geom_bar(mapping = aes(x = race_ethnicity_plot_label, y = percentage_estimate), stat = 'identity') +
  ggplot2::coord_polar()

## ------------------------------------------------------------------------
ggplot2::ggplot(data = full_data_df) +
  ggplot2::geom_line(mapping = aes(x = year, y = percentage_estimate)) +
  ggplot2::facet_grid(sex_plot_label ~ race_ethnicity_plot_label)

## ------------------------------------------------------------------------
ggplot2::ggplot(data = full_data_df) +
  ggplot2::geom_line(mapping = aes(x = year, y = percentage_estimate)) +
  ggplot2::facet_grid(sex_plot_label ~ race_ethnicity_plot_label) +
  ggplot2::xlab("Year") +
  ggplot2::ylab("Estimated high school\nnon-completion percentage\n(in percentage points)")

## ------------------------------------------------------------------------
ggplot2::ggplot(data = full_data_df) +
  ggplot2::geom_line(mapping = aes(x = year, y = percentage_estimate)) +
  ggplot2::facet_grid(sex_plot_label ~ race_ethnicity_plot_label) +
  ggplot2::xlab("Year") +
  ggplot2::ylab("Estimated high school\nnon-completion percentage\n(in percentage points)") +
  ggplot2::labs(title = "Estimated High School Non-Completion Percentage\namong 18- to 24-year-olds",
                subtitle = "By sex, race/ethnicity, and year, 2000-2013")

## ------------------------------------------------------------------------
ggplot2::ggplot(data = full_data_df) +
  ggplot2::geom_line(mapping = aes(x = year, y = percentage_estimate)) +
  ggplot2::facet_grid(sex_plot_label ~ race_ethnicity_plot_label) +
  ggplot2::xlab("Year") +
  ggplot2::ylab("Estimated high school\nnon-completion percentage\n(in percentage points)") +
  ggplot2::labs(title = "Estimated High School Non-Completion Percentage\namong 18- to 24-year-olds",
                subtitle = "By sex, race/ethnicity, and year, 2000-2013",
                caption = "Source: Aggregates of Current Population Survey (CPS) statistics compiled by the My Brother's Keeper\n(MBK) Key Statistical Indicators on Boys and Men of Color initiative; available from data.gov.\nNOTE: data indicated by MBK to be statistically unreliable is not included in this plot")

############
# APPENDIX #
############

## ------------------------------------------------------------------------
mbk_all_data_df

## -----------------------------------------------------------------

cols_with_NAs <- function(df) {
  return(colnames(df)[colSums(is.na(df)) > 0])
}


## -----------------------------------------------------------------
cols_with_NAs(mbk_all_data_df)

## -----------------------------------------------------------------
mbk_all_data_df <- mbk_all_data_df %>% 
  mutate(
    Percentage = stringr::str_sub(Percentage, start = 1, end = -2),
    Percentage = as.double(Percentage)
  )

## -----------------------------------------------------------------
mbk_all_data_df %>% 
  dplyr::select(Sex) %>% 
  unique()

## -----------------------------------------------------------------
mbk_all_data_df %>% 
  dplyr::filter(is.na(Sex))

## -----------------------------------------------------------------
mbk_all_data_df <- mbk_all_data_df %>% 
  dplyr::mutate(
    Sex = tidyr::replace_na(Sex, "All sexes in survey sample")
  )

## -----------------------------------------------------------------
mbk_all_data_df %>% 
  dplyr::select(Sex) %>% 
  unique()

## -----------------------------------------------------------------
mbk_all_data_df %>% 
  dplyr::filter(Sex == "All sexes in survey sample")

## -----------------------------------------------------------------
mbk_all_data_df <- mbk_all_data_df %>% 
  dplyr::mutate(
    `Race/ethnicity` = tidyr::replace_na(`Race/ethnicity`, "All racial and ethnic groups in survey sample")
  )

## -----------------------------------------------------------------
mbk_all_data_df <- mbk_all_data_df %>% 
  dplyr::select(-Characteristic)

## -----------------------------------------------------------------
mbk_all_data_df

## -----------------------------------------------------------------
cols_with_NAs(mbk_all_data_df)

## -----------------------------------------------------------------
mbk_all_data_df %>% 
  dplyr::filter(is.na(Percentage))

## -----------------------------------------------------------------
mbk_all_data_df %>% 
  dplyr::filter(is.na(Percentage)) %>% 
  dplyr::arrange(`Race/ethnicity`, Sex, Year)

## -----------------------------------------------------------------
mbk_all_data_df %>% 
  dplyr::filter(!is.na(Percentage), !is.na(`Note on Percentage`)) %>% 
  dplyr::arrange(`Race/ethnicity`, Sex, Year) %>% 
  dplyr::select(`Race/ethnicity`, Sex, Year, `Note on Percentage`)

## -----------------------------------------------------------------
group_data_is_missing <- mbk_all_data_df %>%
  dplyr::group_by(Sex, `Race/ethnicity`) %>% 
  dplyr::summarize(has_relevant_NAs = any(is.na(Percentage) | is.na(`Standard Error on Percentage`))) %>% 
  dplyr::select(Sex, `Race/ethnicity`, has_relevant_NAs) %>% 
  dplyr::ungroup()

## -----------------------------------------------------------------
group_data_is_missing

## -----------------------------------------------------------------
mbk_all_data_df <- dplyr::inner_join(mbk_all_data_df, group_data_is_missing,
                                      by = c("Sex", "Race/ethnicity"))

## -----------------------------------------------------------------
missing_data_df <- mbk_all_data_df %>% 
  dplyr::filter(has_relevant_NAs == TRUE)

full_data_df <- mbk_all_data_df %>% 
  dplyr::filter(has_relevant_NAs == FALSE)

## -----------------------------------------------------------------
missing_data_df

## -----------------------------------------------------------------
full_data_df

