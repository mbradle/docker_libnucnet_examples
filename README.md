# libnucnet_examples

This docker image allows users to download [libnucnet](https://sourceforge.net/projects/libnucnet/) data and run the example codes.  You first need to have installed [docker](https://runnable.com/docker/getting-started/) and be able to run it. You can verify that docker is properly installed, for example, by running the Hello, World image in an appropriate shell.  To do so, type:

**docker run hello-world**

With docker correctly installed, you can run the image. First, choose the directory you will download the data to and find its absolute path.   On a linux type system, you can change to an appropriate directory and type

**pwd**

For example, I am on my Mac Desktop, so I find the result is */Users/bradleymeyer/Desktop*.  I will download the data to a directory *data_pub* off my Desktop (you will use the answer to *pwd* instead of */Users/bradleymeyer/Desktop* in your case).  To do so, I type (all on a single line)

**docker run -it -v /Users/bradleymeyer/Desktop/data_pub:/data_directory -e VAR="make libnucnet_data" -e DATA_DIR=/data_directory webnucleo/libnucnet_examples**

This first pulls and installs the necessary codes.  It then downloads the data.  I can now run any of the [libnucnet example codes](https://sourceforge.net/p/libnucnet/home/Home/) in the Tutorials.  For example, I can run

**docker run -it -e VAR='./create_nuc_collection' webnucleo/libnucnet_examples**

If the example requires input data, you must pass the directory into the docker container.  For example, since I downloaded the data to */Users/bradleymeyer/Desktop/data_pub*, I can run

**docker run -it -v /Users/bradleymeyer/Desktop/data_pub:/data_directory -e VAR="./print_nuclides /data_directory/example_nuc.xml \\"[z >= 10 and z <= 20]\\"" webnucleo/libnucnet_examples**

Notice that I escaped the double quotes inside the quotes defining *VAR*.

If the example needs to output data, mount an output directory and specify that.  For example, I can type

**docker run -it -v /Users/bradleymeyer/Desktop/data_pub:/data_directory -v ${PWD}:/output_directory -e VAR="./create_nuc_xml_from_text /data_directory/example_nuc.txt /output_directory/ex_output.xml" webnucleo/libnucnet_examples**

The output is directed into the current directory.  Similarly, if I want to pipe output to a file, I can type

**docker run -it -v /Users/bradleymeyer/Desktop/data_pub:/data_directory -v ${PWD}:/output_directory -e VAR="./print_reactions /data_directory/example_reac.xml \\"[reactant = 'n'  and product = 'gamma']\\" > /output_directory/output.txt" webnucleo/libnucnet_examples**

