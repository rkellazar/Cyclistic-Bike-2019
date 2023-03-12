ggplot(wcasual_avg_rlength, aes(x = day_of_week, y = avg_ride, fill = day_of_week)) + 
  geom_bar(position = "dodge", stat = "identity") + facet_wrap(~quarter) +
  scale_y_continuous(limits=c(0, 50))

ggplot(wmember_avg_rlength, aes(x = day_of_week, y = avg_ride, fill = day_of_week)) + 
  geom_bar(position = "dodge", stat = "identity") + facet_wrap(~quarter) +
  scale_y_continuous(limits=c(0, 50))

ggplot(rcounts_casual, aes(x = day_of_week, y = n, fill = day_of_week)) + 
  geom_bar(position = "dodge", stat = "identity") + facet_wrap(~quarter)

ggplot(rcounts_member, aes(x = day_of_week, y = n, fill = day_of_week)) + 
  geom_bar(position = "dodge", stat = "identity") + facet_wrap(~quarter)