# container-nmrml2isa

Version:1.0.0 

## Short description
A docker container for nmrml2isa suite, allowing creating an ISA-Tab stub document from a collection of nmrML files

## Description
a docker container for a microservice for extraction data acquisition parameters from a set of nmrML document and bootstrap the creation of an ISA experiment metadata file.  As an option, ISA syntactic validation may be invoked by providing two additional arguments: a boolean set to true to indicate validation is requested and a path to an ISA configuration.

## Functionality
- Other Tools

## Tool Authors
- [ISA Team](http://isa-tools.org)

## Container Contributors
- [Martin Larralde](https://github.com/althonos) (Ecole Normale Superieure de Cachan)
- [Thomas Lawson](https://github.com/Tomnl) (University of Birmingham)
- [Pablo Moreno](https://github.com/pcm32) (European Bioinformatics Institute)

## Git Repository
- https://github.com/phnmnl/container-nmrml2isa.git

## Installation
For local installation of the container:
```
docker pull docker-registry.phenomenal-h2020.eu/phnmnl/container-nmrml2isa
```
## Future Developments
- multidimensional NMR


## Publications
- ML2ISA, manuscript submitted
- Sansone, Susanna-Assunta, Rocca-Serra, Philippe, Gonzalez-Beltran, Alejandra, Johnson, David, & ISA Community. (2016, October 28). ISA Model and Serialization Specifications 1.0. Zenodo. http://doi.org/10.5281/zenodo.163640
