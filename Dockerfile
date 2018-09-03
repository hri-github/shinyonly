# Use an official shiny as base image 
FROM rocker/shiny:latest

# Copy the current directory contents into the container at /app
COPY exponentialscoring /srv/shinyserver/

# Set the working directory to /app
WORKDIR /srv/shinyserver

# Copy shiny server configurations 
COPY shiny-server.sh /usr/bin/shiny-server.sh

# Install any needed packages from CRAN
RUN sudo R -e "install.packages(c('shiny', 'rmarkdown'), repos='https://cran.rstudio.com/')"

# Make port 3838 available to the world outside this container
EXPOSE 3838

# Define environment variable
ENV NAME World

# Run shiny when the container launches
CMD ["/usr/bin/shiny-server.sh"]
