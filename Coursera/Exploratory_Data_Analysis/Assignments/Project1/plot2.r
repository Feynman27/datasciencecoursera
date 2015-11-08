df <- read.csv2("/home/thomas/Coursera/Exploratory_Data_Analysis/Assignments/household_power_consumption.txt")
df$Date <- as.Date(df$Date,format="%d/%m/%Y")
df.sub <- subset(df, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02") )
# create new timestamp column
x<-paste(df.sub$Date,df.sub$Time)
df.sub$DateTime <- strptime(x,"%Y-%m-%d %H:%M:%S")
head(df.sub)

# save to png
png(file="plot2.png")
with(df.sub, plot(df.sub$DateTime, df.sub$Global_active_power,type="l",xlab='',ylab='Global Active Power (kilowatts)'))
dev.off()
