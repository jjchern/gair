#' Get US Air Data from the EPA website
#'
#' This function downloads air data for EPA.
#' @param year EPA offers data from 1990-2014, default is 2002
#' @param type o3, so2, co, no2, pm25, pm25a, pm10, pm25spec, wind, temp, bp, rhdp, haps, vocs, lead
#' @param freq daily, or hourly
#' @param keepcsv Whether to keep the csv data; default is FALSE
#' @keywords air pollution
#' @return A rda file in current directory
#' @examples 
#' gairEPA(year = c(2013-2014), type = "so2")
#' gairEPA(2000, "co2", "hourly")
#' @export
gairEPA <- function(year = 2012, type = "o3", freq = "daily", keepcsv = FALSE){    
    # assign EPA air data code
    if (type == "o3"){
        typecode <- as.character(44201)
    } else if (type == "so2") {
        typecode <- as.character(42401)
    } else if (type == "co") {
        typecode <- as.character(42101)
    } else if (type == "no2") {
        typecode <- as.character(42602)
    } else if (type == "pm25") {
        typecode <- as.character(88101)
    } else if (type == "pm25a") {
        typecode <- as.character(88502)
    } else if (type == "pm10") {
        typecode <- as.character(81102)
    } else if (type == "pm25spec") {
        typecode <- "SPEC"
    } else if (type == "wind") {
        typecode <- "WIND"
    } else if (type == "temp") {
        typecode <- "TEMP"
    } else if (type == "bp") {
        typecode <- "PRESS"
    } else if (type == "rhdp") {
        typecode <- "RH_DP"
    } else if (type == "haps") {
        typecode <- "HAPS"
    } else if (type == "vocs") {
        typecode <- "VOCS"
    } else if (type == "lead") {
        typecode <- "LEAD"
    }
    for (yr in year) {
        url.dir <- "http://aqsdr1.epa.gov/aqsweb/aqstmp/airdata/"
        zip.file <- paste0(freq, "_", typecode, "_", yr, ".zip")
        url <- paste0(url.dir, zip.file)
        download.file(url, zip.file)
        unzip(zip.file)
        csv.file <- sub("\\.[[:alnum:]]+$", ".csv", zip.file)
        r.file <- read.csv(csv.file)
        save(r.file, file = paste0(freq, "_", type, "_", yr, ".rda"))
        if (keepcsv == FALSE) {
            unlink(csv.file)
        }
        unlink(zip.file)
    }
}