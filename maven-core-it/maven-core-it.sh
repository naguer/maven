#!/bin/sh

# This process assumes that maven-core-it-verifier has been built.

cp=../maven-core-it-verifier/target/maven-core-it-verifier-1.0.jar

verifier=org.apache.maven.it.Verifier

# TODO: need a consistent way to discover M2_HOME across this, bootstrap and m2 itself, as well as have a sensible
# default, and a way to override. There must be only one way.
# I like the idea of using the one in the path, or using -Dmaven.home to override
# The m2 shell script should not care what installation it is in - it should use the installation defined on the
# command line

jvm_args="$@"

if [ ! -z "$M2_HOME" ]; then
  jvm_args="$jvm_args -Dmaven.home=$M2_HOME"
fi

java $jvm_args -cp "$cp" $verifier

