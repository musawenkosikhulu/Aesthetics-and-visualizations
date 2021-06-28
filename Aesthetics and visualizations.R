#In this example, you are a junior data analyst working for the same hotel booking company from earlier. 
#Last time, you created some simple visualizations with `ggplot2` to give your stakeholders quick insights into your data. 
#Now, you are are interested in creating visualizations that highlight different aspects of the data to present to your stakeholder. 
#You are going to expand on what you have already learned about `ggplot2` and create new kinds of visualizations like bar charts.

#First we need to import the data
hotel_bookings <- read.csv("hotel_bookings.csv")

# I will run two code chunks below to get at a sample of the data and also preview all the column names.
head(hotel_bookings)
colnames(hotel_bookings)

#I need to install and load ggplot2 to run the vizzes
install.packages('ggplot2')
library(ggplot2)

# The stakeholder is interested in developing promotions based on different booking distributions, 
# but first they need to know how many of the transactions are occurring for each different distribution type.
# I can tell `ggplot()` what type of chart I want to create by using the `geom_` argument

ggplot(data = hotel_bookings) + geom_bar(mapping = aes( x = distribution_channel))

# Diving deeper into bar charts
# The stakeholder has more questions. 
# Now they want to know if the number of bookings for each distribution type 
# is different depending on whether or not there was a deposit or what market segment they represent. 

ggplot(data = hotel_bookings) + geom_bar(mapping = aes(x = distribution_channel, fill=deposit_type))

#This bar chart is similar to the previous chart, except that 'market_segment' 
#data is being recorded in the color-coded sections of each bar.

ggplot(data = hotel_bookings) + geom_bar(mapping = aes(x = distribution_channel, fill=market_segment))

# After reviewing the new charts, my stakeholder asks me to 
# create separate charts for each deposit type and market segment to help them understand the differences more clearly.
# I know that the `facet_` function can do this very quickly.

ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_wrap(~deposit_type)

# This code chunk creates three bar charts for 'no_deposit', non_refund', and 'refundable' deposit types. 
# I notice that it's hard to read the x-axis labels here, so I will add one piece of code at the end that rotates the text to 45 degrees to make it easier to read

ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_wrap(~deposit_type) +
  theme(axis.text.x = element_text(angle = 45))

# This code chunk creates a similar bar chart to the previous chunk, 
# but now the labels on the x axis with the different distribution channels are clearer.

ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_wrap(~market_segment) +
  theme(axis.text.x = element_text(angle = 45))

# The `facet_grid` function does something similar. The main 
# difference is that `facet_grid` will include plots even if they are empty

ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_grid(~deposit_type) +
  theme(axis.text.x = element_text(angle = 45))
# I should have three bar charts-- but notice that the 'Refundable' chart has much less data plotted than the other two.

