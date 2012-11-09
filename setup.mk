#==================================================================================
# A common setup file  for all makefile in the source tree.
# Note that all the flags in this file can be overreide by the command line 
# arguement: e.g. make env=gps
#==================================================================================

#-------------------------------------------------------------
# 0. Java/Hadoop directories, only required for HDFS suport and 
# Giraph backend
#-------------------------------------------------------------
# Top directory of GM
GM_TOP= $(dir $(lastword $(MAKEFILE_LIST)))
# hadoop distribution (for HDFS suupport and Giraph backend)
HADOOP_HOME=/cm/shared/apps/hadoop/current
#jdk (for HDFS support and Giraph backend)
JAVA_HOME=/usr/java/default
# Name of hadoop core jar (For HDFS support and Giraph backend)
#HADOOP_CORE_JAR=hadooop-core-0.20.2-cdh3u4.jar
HADOOP_CORE_JAR=hadooop-core-1.0.3.jar


#-------------------------------------------------------------
# 1. Building the compiler
#-------------------------------------------------------------
# (nothing)


#-------------------------------------------------------------
# 2. Compiling the GM applications
#-------------------------------------------------------------
# Choose the backend where the gm source file is be compiled into:
#  cpp_omp, cpp_seq, gps, giraph
env=cpp_omp

# any other gm_comp arguments to be applied when compiling sample programs
GM_ARGS=

# Pacakge name of generated giraph applications (for Giraph)
OUTPUT_PACKAGE=my.app

#-------------------------------------------------------------
# 3. Building shared-memory backend (gm_graph)
#-------------------------------------------------------------
# Flag for Oracle SPARC environment
ORACLE=0  

# Enforce 64bit binary or 32bit binary
FORCE64_BIT=0
FORCE32_BIT=0

# Bit width of node-id type and, edge-id type: 
# one of (32,32), (32,64), (64,64)
NODE_SIZE=32
EDGE_SIZE=32

# Support reading/writing graph files from HDFS
SUPPORT_HDFS=0

# Directories for SUPPORT_HDFS
#location of libhdfs.so
LIBHDFS_DIR =$(HADOOP_HOME)/c++/lib
#location of hdfs.h
INCHDFS_DIR = $(HADOOP_HOME)/src/c++/libhdfs 
#location of libhdfs.so
LIBJVM_DIR  =$(JAVA_HOME)/jre/lib/amd64/server
#location of jni.h
INCJNI_DIR  =$(JAVA_HOME)/include
#location of jni_md.h
INCJNIMD_DIR = $(JAVA_HOME)/include/linux
#location of hadoop core
#HADOOP_CORE_DIR = $(HADOOP_HOM)
HADOOP_CORE_DIR=$(GM_TOP)/apps/output_giraph/lib



#--------------------------------------------------------
# 4. Building Giraph bakcend 
#--------------------------------------------------------