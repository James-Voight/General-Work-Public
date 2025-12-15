#1
#imports
install.packages("readxl")
install.packages("caret")
install.packages("arules", dependencies = TRUE)

# Read the dataset
library(readxl)
path <- "C:/Users/james/Downloads/"
spotify <- read_excel(paste0(path, "spotify_dataset-1.xlsx"))

# Check data types and dimensions
print(str(spotify))
print(dim(spotify))

# # Convert data types if necessary
spotify$user_id <- as.factor(spotify$user_id)
spotify$artist <- as.character(spotify$artist)
spotify$track <- as.character(spotify$track)
spotify$playlist <- as.character(spotify$playlist)


#2
# Check for missing values in each column
print(colSums(is.na(spotify)))

# Mode imputation
library(caret)
    # Identify columns with missing values
columns_with_na <- names(spotify)[colSums(is.na(spotify)) > 0]

# Handle each column with missing values
for (column in columns_with_na) {
  if (is.character(spotify[[column]]) || is.factor(spotify[[column]])) {
    # For character or factor columns, use mode imputation
    mode_value <- names(sort(table(spotify[[column]]), decreasing = TRUE))[1]
    spotify[[column]][is.na(spotify[[column]])] <- mode_value
    print(paste("Mode imputation applied to", column))
  }
}

# Check the dimensions after
print("After cleaning")
print(colSums(is.na(spotify)))

print("Total rows after each removal:")
print(nrow(spotify))

# Remove tracks that are not actual songs
spotify <- spotify[!grepl("intro|outro", spotify$track, ignore.case = TRUE), ]

print(nrow(spotify))

# Remove records with special characters in track or artist names
spotify <- spotify[!grepl("[^[:alnum:][:space:]]", spotify$track), ]
spotify <- spotify[!grepl("[^[:alnum:][:space:]]", spotify$artist), ]
print(nrow(spotify))

# Convert data into transactions
library(arules)

# Ensure the tracks and artists are grouped by user_id as transactions
transactions_track <- as(split(spotify$track, spotify$user_id), "transactions")
transactions_artist <- as(split(spotify$artist, spotify$user_id), "transactions")

# Create a combined column and generate transactions for artist-track pairs
spotify$artist_track <- paste(spotify$artist, spotify$track, sep = " - ")
transactions_artist_track <- as(split(spotify$artist_track, spotify$user_id), "transactions")

# Remove duplicates in transactions
# Convert transactions to a list, remove duplicates, and convert back
transactions_artist_list <- as(transactions_artist, "list")
transactions_artist_list <- lapply(transactions_artist_list, unique)
transactions_artist <- as(transactions_artist_list, "transactions")

# Similarly for other transaction objects
transactions_track_list <- as(transactions_track, "list")
transactions_track_list <- lapply(transactions_track_list, unique)
transactions_track <- as(transactions_track_list, "transactions")

transactions_artist_track_list <- as(transactions_artist_track, "list")
transactions_artist_track_list <- lapply(transactions_artist_track_list, unique)
transactions_artist_track <- as(transactions_artist_track_list, "transactions")


non_empty_transactions <- transactions_artist[size(transactions_artist) > 1]
transactions_artist <- non_empty_transactions

#3
library(ggplot2)

# Top 10 tracks
track_freq <- sort(table(spotify$track), decreasing = TRUE)[1:10]
print(ggplot(data.frame(track = names(track_freq), freq = as.numeric(track_freq)), aes(x = reorder(track, freq), y = freq)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  labs(title = "Top 10 Tracks", x = "Track", y = "Frequency"))

# Top 10 artists
artist_freq <- sort(table(spotify$artist), decreasing = TRUE)[1:10]
print(ggplot(data.frame(artist = names(artist_freq), freq = as.numeric(artist_freq)), aes(x = reorder(artist, freq), y = freq)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  labs(title = "Top 10 Artists", x = "Artist", y = "Frequency"))

# Top 10 tracks with artist
track_artist_freq <- sort(table(paste(spotify$track, "-", spotify$artist)), decreasing = TRUE)[1:10]
print(ggplot(data.frame(track_artist = names(track_artist_freq), freq = as.numeric(track_artist_freq)), aes(x = reorder(track_artist, freq), y = freq)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  labs(title = "Top 10 Tracks with Artist", x = "Track - Artist", y = "Frequency"))

# Top 10 users/listeners
user_freq <- sort(table(spotify$user_id), decreasing = TRUE)[1:10]
print(ggplot(data.frame(user = names(user_freq), freq = as.numeric(user_freq)), aes(x = reorder(user, freq), y = freq)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  labs(title = "Top 10 Users", x = "User ID", y = "Frequency"))

#4
library(arulesViz)
library(openxlsx)

#artist
# generate rules
ARules_artist <- apriori(transactions_artist, parameter = list(supp = 0.08, conf = .4, target = 'rules', minlen=3))

# visualize rules
print(plot(ARules_artist, jitter=0))

# take the top 10 rules
top10 <- head(ARules_artist, n=10, by='lift')

print(plot(top10, method='graph', engine='htmlwidget'))

ARules_artist_df <- as(ARules_artist, "data.frame")
file_path <- file.path(path, "ARules_artist.xlsx")

# for writing a data.frame or list of data.frames to an xlsx file
write.xlsx(ARules_artist_df, file_path)

#track
# generate rules
ARules_track <- apriori(transactions_track, parameter = list(supp = 0.04, conf = .5, target = 'rules', minlen=2))

# visualize rules
print(plot(ARules_track, jitter=0))

# take the top 10 rules
top10 <- head(ARules_track, n=10, by='lift')

print(plot(top10, method='graph', engine='htmlwidget'))

ARules_track_df <- as(ARules_track, "data.frame")
file_path <- file.path(path, "ARules_track.xlsx")

# for writing a data.frame or list of data.frames to an xlsx file
write.xlsx(ARules_track_df, file_path)

# artist and track
# generate rules
ARules_ArtistTrack <- apriori(transactions_artist_track, parameter = list(supp = 0.03, conf = .4, target = 'rules', minlen=3))

# visualize rules
print(plot(ARules_ArtistTrack, jitter=0))


# take the top 10 rules
top10 <- head(ARules_ArtistTrack, n=10, by='lift')

print(plot(top10, method='graph', engine='htmlwidget'))

ARules_ArtistTrack_df <- as(ARules_ArtistTrack, "data.frame")
file_path <- file.path(path, "ARules_ArtistTrack.xlsx")

# for writing a data.frame or list of data.frames to an xlsx file
write.xlsx(ARules_ArtistTrack_df, file_path)


# 5
#fp growth

#artist
MRules_artist <- arules::fim4r(transactions_artist, method = 'fpgrowth',
                          target = 'rules',
                          zmin = 3,
                          # zmax = 3,
                          support = 0.08,
                          confidence = 0.40
                          )

print(paste("Number of rules:", length(MRules_artist)))

print(plot(MRules_artist, shading = "order",
           engine = "html",
           main = "Plot FP Rules",
           jitter = 0))

# take the top 10 rules
top10 <- head(MRules_artist, n=10, by='lift')

print(plot(top10, method='graph', engine='htmlwidget'))

MRules_artist_df <- as(MRules_artist, "data.frame")
file_path <- file.path(path, "MRules_artist.xlsx")

# for writing a data.frame or list of data.frames to an xlsx file
write.xlsx(MRules_artist_df, file_path)

# Tracks
MRules_track <- arules::fim4r(transactions_track, method = 'fpgrowth',
                          target = 'rules',
                          zmin = 2,
                          # zmax = 3,
                          support = 0.04,
                          confidence = 0.50
                          )


print(paste("Number of rules:", length(MRules_track)))

print(plot(MRules_track, shading = "order",
           engine = "html",
           main = "Plot FP Rules",
           jitter = 0))

# take the top 10 rules
top10 <- head(MRules_track, n=10, by='lift')

print(plot(top10, method='graph', engine='htmlwidget'))

MRules_track_df <- as(MRules_track, "data.frame")
file_path <- file.path(path, "MRules_track.xlsx")

# for writing a data.frame or list of data.frames to an xlsx file
write.xlsx(MRules_track_df, file_path)


# tracks with artists
MRules_ArtistTrack <- arules::fim4r(transactions_artist_track, method = 'fpgrowth',
                          target = 'rules',
                          zmin = 3,
                          # zmax = 3,
                          support = 0.03,
                          confidence = 0.40
                          )


print(paste("Number of rules:", length(MRules_ArtistTrack)))

print(plot(MRules_ArtistTrack, shading = "order",
           engine = "html",
           main = "Plot FP Rules",
           jitter = 0))

# take the top 10 rules
top10 <- head(MRules_ArtistTrack, n=10, by='lift')

print(plot(top10, method='graph', engine='htmlwidget'))

MRules_ArtistTrack_df <- as(MRules_ArtistTrack, "data.frame")
file_path <- file.path(path, "MRules_ArtistTrack.xlsx")

# for writing a data.frame or list of data.frames to an xlsx file
write.xlsx(MRules_ArtistTrack_df, file_path)