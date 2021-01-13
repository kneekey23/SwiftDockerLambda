 FROM swiftlang/swift:nightly-5.3-amazonlinux2
 RUN yum -y install git \
 jq \
 tar \
 zip
 WORKDIR /build-lambda
 RUN mkdir -p /Sources/SwiftDockerLambda/
 RUN mkdir -p /Tests/SwiftDockerLambda
 ADD /Sources/ ./Sources
 ADD /Tests/ ./Tests/
 COPY Package.swift .
 RUN cd /build-lambda && swift build -c release -Xswiftc -static-stdlib
 RUN mkdir -p .build/lambda/SwiftDockerLambda/
 COPY /.build/release/SwiftDockerLambda /.build/lambda/SwiftDockerLambda/
 RUN cd /.build/lambda/SwiftDockerLambda/ && ln -s SwiftDockerLambda bootstrap
 WORKDIR /var/runtime/
 COPY /.build/lambda/bootstrap /bootstrap
 RUN chmod 755 bootstrap
 WORKDIR /var/task
 COPY /build-lambda/.build/x86_64-unknown-linux-gnu/release/SwiftDockerLambda /SwiftDockerLambda
 CMD ["./SwiftDockerLambda"]
