FROM haskell:latest

ADD /src/ /src/

WORKDIR /src/

RUN ["apt-get", "update"]

RUN ["apt-get", "install", "-y", "vim"]

RUN cabal update

RUN cabal install syb-0.6 unification-fd-0.10.0.1 list-extras-0.4.1.4

RUN ["ghci"]
