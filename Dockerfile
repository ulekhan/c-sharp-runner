FROM microsoft/aspnetcore-build:2.0
ENV PATH="/sonar:${PATH}"

RUN apt-get update -y && \
    apt-get install -y unzip && \
    echo "installing java ----------------------------------------------------------------------------------------" && \
    apt-get install default-jre -y && \
    echo "installing mono -----------------------------------------------------------------------------------------" && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
    echo "deb http://download.mono-project.com/repo/ubuntu stable-xenial main" | tee /etc/apt/sources.list.d/mono-official-stable.list && \
    apt-get update -y && \
    apt-get install -y --allow-unauthenticated mono-devel && \
    echo "installing sonar" && \
    mkdir sonar && \
    cd sonar && \
    wget https://github.com/SonarSource/sonar-scanner-msbuild/releases/download/4.0.2.892/sonar-scanner-msbuild-4.0.2.892.zip && \
    unzip sonar-scanner-msbuild-4.0.2.892.zip && \
    cd sonar-scanner-3.0.3.778/bin/ && \
    chmod +x sonar-scanner && \
    cd /
ENTRYPOINT [ ]