library(here)
suppressMessages(library(filesstrings))


extract_carcinoma_data <- function(sub_dir, train_dir, test_dir, file_num){
  
  data_dir <- file.path(here(), subdir, "data_idc")
  tmp_dir <- file.path(here(), subdir, "tmp")
  
  if (!dir.exists(train_dir) || !dir.exists(test_dir)){
    # Download original data zip file - size 1.6 Gb
    download.file("http://andrewjanowczyk.com/wp-static/IDC_regular_ps50_idx5.zip",
                  destfile = file.path(here(), subdir, "tmp.zip"))
    
    # Unzip file
    unzip(file.path(here(), subdir, "tmp.zip"), exdir = tmp_dir)
    
    # Take first "n" randomly selected 50x50 image patches
    tmp_patches <- list.files(tmp_dir, pattern = "*.png", recursive = TRUE,
                              full.names = TRUE)
    
    # random selection
    r_idxes <- sample(1:length(tmp_patches), file_num)
    tmp_patches <- tmp_patches[r_idxes]
    
    # Create data directory for files_to_keep patches
    dir.create(data_dir)
    
    # Moves "n" patches to new dir
    file.move(tmp_patches, destinations = data_dir)
    
    # Clean up and remove original zip file to save space
    dir.remove(tmp_dir)
    file.remove(file.path(here(), subdir, "tmp.zip"))
    rm(tmp_patches)
  }
  
  
  
}