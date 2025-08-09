Assignment 04: Docker Image Optimization and Spring PetClinic

This project demonstrates the creation and optimization of Docker images using various configurations, including the impact of .dockerignore on build efficiency and image size. It includes examples with a simple Alpine-based image and the Spring PetClinic application, comparing setups with and without .dockerignore.

Table of Contents





Overview



Prerequisites



Project Structure



Image Examples





Image 1



Image 2



Image 3 (with .dockerignore)



Spring PetClinic Examples





Without .dockerignore



With .dockerignore



Installation and Setup



Running the Images



Contributing



License

Overview

This assignment explores Docker image optimization techniques, focusing on:





Building lightweight images using alpine:latest as a base.



Comparing the effect of caching and .dockerignore on image size and build time.



Applying these concepts to the Spring PetClinic application, a well-known Spring Boot project.

The project includes multiple Dockerfiles and configurations to demonstrate best practices for minimizing image size and improving build performance.

Prerequisites

Before you begin, ensure you have the following installed:





Docker: Latest version (e.g., Docker Desktop or Docker Engine)



Git: For cloning the repository



Optional: A text editor (e.g., VS Code) for reviewing files

Project Structure

assignment_04/
├── image1/
│   └── Dockerfile
├── image2/
│   └── Dockerfile
├── image3_with_dockerignore/
│   ├── Dockerfile
│   └── .dockerignore
├── spring-petclinic/
│   ├── Dockerfile
│   └── [Spring PetClinic files]
├── spring-petclinic_using_doc_ignore/
│   ├── Dockerfile
│   └── .dockerignore
└── README.md





image1/: Basic Alpine image with caching enabled.



image2/: Optimized Alpine image with --no-cache for smaller size.



image3_with_dockerignore/: Alpine image with .dockerignore to exclude unnecessary files.



spring-petclinic/: Spring PetClinic setup without .dockerignore.



spring-petclinic_using_doc_ignore/: Spring PetClinic with .dockerignore for optimization.

Image Examples

Image 1





Description: A basic Docker image based on alpine:latest with curl installed using apk add curl.



Dockerfile Highlights:





Uses ARG USER_NAME=abduu and ENV USER_NAME=${USER_NAME} for environment setup.



Copies hello.txt and extracts file1.tar.gz.



Installs curl with caching enabled.



Build Command:

cd image1
docker build -t image1 .



Run Command:

docker run -it image1

Image 2





Description: An optimized version of Image 1, using --no-cache to reduce image size.



Dockerfile Highlights:





Same as Image 1 but uses RUN apk add --no-cache curl to avoid caching.



Build Command:

cd image2
docker build -t image2 .



Run Command:

docker run -it image2



Note: This image should be smaller than Image 1 due to the removal of apk cache.

Image 3 (with .dockerignore)





Description: An Alpine-based image with .dockerignore to exclude unnecessary files from the build context.



Dockerfile Highlights:





Similar to Image 2 with the addition of .dockerignore.



.dockerignore Example:

.git
target
*.md



Build Command:

cd image3_with_dockerignore
docker build -t image3 .



Run Command:

docker run -it image3



Note: Faster build time and potentially smaller build context due to .dockerignore.

Spring PetClinic Examples

Without .dockerignore





Description: Spring PetClinic application built without .dockerignore, including all project files in the build context.



Build Command:

cd spring-petclinic
docker build -t spring-petclinic .



Run Command:

docker run -d -p 9966:9966 spring-petclinic



Note: Larger build context and potential increase in image size due to unnecessary files.

With .dockerignore





Description: Optimized Spring PetClinic build using .dockerignore to exclude files like .git, target, and src/test.



.dockerignore Example:

.git
target
*.md
.idea
*.iml
src/test



Build Command:

cd spring-petclinic_using_doc_ignore
docker build -t spring-petclinic-optimized .



Run Command:

docker run -d -p 9966:9966 spring-petclinic-optimized



Note: Reduced build time and context size, leading to a more efficient build process.

Installation and Setup





Clone the repository:

git clone https://github.com/your-username/assignment_04.git
cd assignment_04



Navigate to the desired folder (e.g., image1, spring-petclinic) and follow the build instructions.

Running the Images





Use the docker run commands provided above for each image.



Access the Spring PetClinic application at http://localhost:9966 after running the container.

