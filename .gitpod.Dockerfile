FROM gitpod/workspace-full

WORKDIR /home/gitpod
RUN wget https://github.com/TravaOpenJDK/trava-jdk-11-dcevm/releases/download/dcevm-11.0.6%2B1/java11-openjdk-dcevm-linux.tar.gz && mv java11-openjdk-dcevm-linux.tar.gz  trava.tgz
RUN wget https://oss.sonatype.org/content/repositories/snapshots/org/hotswapagent/hotswap-agent/1.4.1-SNAPSHOT/hotswap-agent-1.4.1-20200507.153018-6.jar
RUN mkdir ~/.trava && tar zxvf trava.tgz --strip-components=1 -C ~/.trava
RUN mv hotswap-agent-1.4.1-20200507.153018-6.jar ~/.trava/lib/hotswap/hotswap-agent.jar
RUN echo "export JAVA_HOME=/home/gitpod/.trava" > ~/.mavenrc
