# Creates the image from the selected directory and DOCKERFILE
docker build --tag <image_name> . 

# Runs the images and attaches it to the script directory for testing (data folder etc)
# with iterative mode and current folder attached - you need to run main R

docker run --volume `pwd`:`pwd` -w `pwd` --entrypoint /bin/bash -i -t <image_name>  

# run from the bash the R script
 Rscript ./main.R /data/