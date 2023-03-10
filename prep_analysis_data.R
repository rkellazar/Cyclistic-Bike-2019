
q1_avg_rlength <- divvy_q1 %>% 
  select(usertype, ride_length) %>% 
  group_by(usertype) %>% 
  summarise(avg_ride = mean(ride_length))

q2_avg_rlength <- divvy_q2 %>% 
  select(usertype, ride_length) %>% 
  group_by(usertype) %>% 
  summarise(avg_ride = mean(ride_length))

q3_avg_rlength <- divvy_q3 %>% 
  select(usertype, ride_length) %>% 
  group_by(usertype) %>% 
  summarise(avg_ride = mean(ride_length))

q4_avg_rlength <- divvy_q4 %>% 
  select(usertype, ride_length) %>% 
  group_by(usertype) %>% 
  summarise(avg_ride = mean(ride_length))

quarter_num <- c("Q1", "Q2", "Q3", "Q4")
casual_avg_rlength <- c(q1_avg_rlength[[2]][1], q2_avg_rlength[[2]][1], 
                q3_avg_rlength[[2]][1], q4_avg_rlength[[2]][1])
member_avg_rlength <- c(q1_avg_rlength[[2]][2], q2_avg_rlength[[2]][2], 
                q3_avg_rlength[[2]][2], q4_avg_rlength[[2]][2])

divvy_avg_rlength <- data_frame(
  quarters = quarter_num, 
  casual = casual_avg_rlength, 
  member = member_avg_rlength
)

# ------------------------------------------------------------------------------

w1_avg_rlength <- divvy_q1 %>% 
  select(usertype, ride_length, day_of_week) %>% 
  group_by(usertype, day_of_week) %>% 
  summarise(avg_ride = mean(ride_length))

w2_avg_rlength <- divvy_q2 %>% 
  select(usertype, ride_length, day_of_week) %>% 
  group_by(usertype, day_of_week) %>% 
  summarise(avg_ride = mean(ride_length))

w3_avg_rlength <- divvy_q3 %>% 
  select(usertype, ride_length, day_of_week) %>% 
  group_by(usertype, day_of_week) %>% 
  summarise(avg_ride = mean(ride_length))

w4_avg_rlength <- divvy_q4 %>% 
  select(usertype, ride_length, day_of_week) %>% 
  group_by(usertype, day_of_week) %>% 
  summarise(avg_ride = mean(ride_length))

wcasual_avg_rlength <- data.frame(
  quarter = quarters, 
  sun = rep(NA, 4), 
  mon = rep(NA, 4), 
  tue = rep(NA, 4), 
  wed = rep(NA, 4), 
  thu = rep(NA, 4), 
  fri = rep(NA, 4), 
  sat = rep(NA, 4)
)

wmember_avg_rlength <- data.frame(
  quarter = quarters, 
  sun = rep(NA, 4), 
  mon = rep(NA, 4), 
  tue = rep(NA, 4), 
  wed = rep(NA, 4), 
  thu = rep(NA, 4), 
  fri = rep(NA, 4), 
  sat = rep(NA, 4)
)

for (i in 1:7) {
  wcasual_avg_rlength[1,i+1] <- w1_avg_rlength[[3]][i]
  wcasual_avg_rlength[2,i+1] <- w2_avg_rlength[[3]][i]
  wcasual_avg_rlength[3,i+1] <- w3_avg_rlength[[3]][i]
  wcasual_avg_rlength[4,i+1] <- w4_avg_rlength[[3]][i]
  
  wmember_avg_rlength[1,i+1] <- w1_avg_rlength[[3]][i+7]
  wmember_avg_rlength[2,i+1] <- w2_avg_rlength[[3]][i+7]
  wmember_avg_rlength[3,i+1] <- w3_avg_rlength[[3]][i+7]
  wmember_avg_rlength[4,i+1] <- w4_avg_rlength[[3]][i+7]
}

# ------------------------------------------------------------------------------

rcounts_q1 <- divvy_q1 %>% 
  count(usertype, day_of_week)

rcounts_q2 <- divvy_q2 %>% 
  count(usertype, day_of_week)

rcounts_q3 <- divvy_q3 %>% 
  count(usertype, day_of_week)

rcounts_q4 <- divvy_q4 %>% 
  count(usertype, day_of_week)


rcounts_casual <- data.frame(
  quarter = quarters, 
  sun = rep(NA, 4), 
  mon = rep(NA, 4), 
  tue = rep(NA, 4), 
  wed = rep(NA, 4), 
  thu = rep(NA, 4), 
  fri = rep(NA, 4), 
  sat = rep(NA, 4)
)

rcounts_member <- data.frame(
  quarter = quarters, 
  sun = rep(NA, 4), 
  mon = rep(NA, 4), 
  tue = rep(NA, 4), 
  wed = rep(NA, 4), 
  thu = rep(NA, 4), 
  fri = rep(NA, 4), 
  sat = rep(NA, 4)
)

for (i in 1:7) {
  rcounts_casual[1,i+1] <- rcounts_q1[[3]][i]
  rcounts_casual[2,i+1] <- rcounts_q2[[3]][i]
  rcounts_casual[3,i+1] <- rcounts_q3[[3]][i]
  rcounts_casual[4,i+1] <- rcounts_q4[[3]][i]
  
  rcounts_member[1,i+1] <- rcounts_q1[[3]][i+7]
  rcounts_member[2,i+1] <- rcounts_q2[[3]][i+7]
  rcounts_member[3,i+1] <- rcounts_q3[[3]][i+7]
  rcounts_member[4,i+1] <- rcounts_q4[[3]][i+7]
}

# ------------------------------------------------------------------------------

most_q1_sname <- divvy_q1 %>% count(from_station_name, sort = TRUE)
most_q2_sname <- divvy_q2 %>% count(from_station_name, sort = TRUE)
most_q3_sname <- divvy_q3 %>% count(from_station_name, sort = TRUE)
most_q4_sname <- divvy_q4 %>% count(from_station_name, sort = TRUE)

rbind(most_q1_sname, most_q2_sname, most_q3_sname, most_q4_sname)

# ------------------------------------------------------------------------------

most_q1_ename <- divvy_q1 %>% count(to_station_name, sort = TRUE)
most_q2_ename <- divvy_q2 %>% count(to_station_name, sort = TRUE)
most_q3_ename <- divvy_q3 %>% count(to_station_name, sort = TRUE)
most_q4_ename <- divvy_q4 %>% count(to_station_name, sort = TRUE)

rbind(most_q1_ename, most_q2_ename, most_q3_ename, most_q4_ename)
