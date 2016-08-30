library("dplyr")
library("audio")
notes <- c(A = 0, B = 2, C = 3, D = 5, E = 7, F = 8, G = 10)
pitch <- "D D E D G F# D D E D A G D D D5 B G F# E C5 C5 B G A G"
duration <- c(rep(c(0.75, 0.25, 1, 1, 1, 2), 2),
              0.75, 0.25, 1, 1, 1, 1, 1, 0.75, 0.25, 1, 1, 1, 2)
bday <- data_frame(pitch = strsplit(pitch, " ")[[1]],
                   duration = duration)

bday <-
  bday %>%
  mutate(octave = substring(pitch, nchar(pitch)) %>%
  {suppressWarnings(as.numeric(.))} %>%
    ifelse(is.na(.), 4, .),
  note = notes[substr(pitch, 1, 1)],
  note = note + grepl("#", pitch) -
    grepl("b", pitch) + octave * 12 +
    12 * (note < 3),
  freq = 2 ^ ((note - 60) / 12) * 440)

tempo <- 120
sample_rate <- 44100

make_sine <- function(freq, duration) {
  wave <- sin(seq(0, duration / tempo * 60, 1 / sample_rate) *
                freq * 2 * pi)
  fade <- seq(0, 1, 50 / sample_rate)
  wave * c(fade, rep(1, length(wave) - 2 * length(fade)), rev(fade))
}

bday_wave <-
  mapply(make_sine, bday$freq, bday$duration) %>%
  do.call("c", .)

play(bday_wave)