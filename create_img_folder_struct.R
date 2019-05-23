library(here)

# Code to extract data into ./data directory
extract_imgs = function(data_dir, zip_file){
  xray_dir = dirname(data_dir)
  if (!dir.exists(data_dir) && length(zip_file) == 1){
    unzip(file.path(xray_dir, zip_file), exdir = xray_dir)
    
    if (!dir.exists(data_dir)){
      stop("./data directory not create - please try again and see troubleshooting README")
    }
  }
  
  # Check if original zip file is not present
  if (length(zip_file) != 1){
    warning("X-ray data zip file or images not found! Please make sure you the following directory exists in the current git repo at the same level as this Rmd\n ./data\n Please see README for troubleshooting purposes")
  }
}
