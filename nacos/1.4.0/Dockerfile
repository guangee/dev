FROM openjdk:8u282-jre
RUN echo "Asia/Shanghai" > /etc/timezone
WORKDIR /root

ENV Xms 256
ENV Xmx 512
ENV Xmn 256

RUN wget https://github.com/alibaba/nacos/releases/download/1.4.0/nacos-server-1.4.0.tar.gz && tar -xzvf nacos-server-1.4.0.tar.gz && rm nacos-server-1.4.0.tar.gz
ADD application.properties /root/nacos/conf/application.properties
EXPOSE 8848
CMD ["java","-Xms${Xms}m", "-Xmx${Xmx}m","-Xmn${Xmn}m","-Dnacos.standalone=true","-jar","/root/nacos/target/nacos-server.jar","--spring.config.additional-location=file:/root/nacos/conf/,classpath:/,classpath:/config/,file:./,file:./config/","--server.max-http-header-size=524288"]
