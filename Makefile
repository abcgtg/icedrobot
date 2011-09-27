# IcedRobot simple Makefile

RM = rm -f

.PHONY: icedrobot
icedorobot: clean-all http sip core base

.PHONY: clean-all
clean-all:
	cd android-core && \
	$(RM) generated-aidl/* && \
	$(RM) generated-src/* && \
	$(RM) generated-res/*

.PHONY: core
core:
	cd android-core && mvn clean install

.PHONY: base
base:
	cd android-base && \
	sh generate-aidl.sh && \
	sh generate-manifest.sh && \
	sh generate-logtags.sh && \
	mvn clean install

.PHONY: http
http:
	cd apache-http && mvn clean install

.PHONY: sip
sip:
	cd nist-sip && mvn clean install
