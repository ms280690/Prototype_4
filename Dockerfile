# Get latest haskell platform
FROM haskell:latest

# Add our source folder to /src/ of the container
ADD /src/ /src/

# cd into the /src/
VOLUME /src/

# Update package list
# RUN ["apt-get", "update"]

# Install vim
# RUN ["apt-get", "install", "-y", "vim"]

# Update cabal package list
RUN cabal update

# Install dependencies. This could be improved bu automatically detect and list out dependencies.
RUN cabal install syb-0.6 unification-fd-0.10.0.1 list-extras-0.4.1.4

# Compile the required files, so if there is n error you get it when building the container
# RUN ["ghc", "IOSketch.hs"]

# RUN ["ghc", "IOSketchM.hs"]

# Run GHCI
# RUN ["ghci"]
