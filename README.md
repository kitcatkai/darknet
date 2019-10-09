# Instruction to setup training at EC2

Full instruction can be retrieved from the main link. 

## Setting up an AWS Instance

There are different types of AWS instances. We will use the p2.xlarge for accelerated computing, which contains one NVIDIA K80 GPU.

Create an account here.
Sign in into your account here.
In the top right corner of the home page, click on the location name and set it to US West (Oregon). This AWS region has instances with GPUs, and is close by to most of us.

After selecting the region, click on EC2 under the Compute list.

In order to create a GPU instance, we’ll need to request a limit increase here. Choose Region as US West (Oregon), Instance Type as p2.xlarge, and New limit value as 1. For use case, you can write something like “Training neural networks for the Stanford deep learning class”. AWS will contact you when your increase is approved: then, continue with the following steps.
On the EC2 Dashboard view, click on the “Launch Instance” button.
Search for and select the Deep Learning AMI (Ubuntu). This AMI (Amazon Machine Image) comes with pre-installed deep learning frameworks such as TensorFlow, PyTorch or Keras.
In the next page, select the p2.xlarge instance. Then, click on “Review and Launch”.

Then, click on the blue button “Launch”.
A pop-up window will appear asking for a key pair. You can either provide one or create one. If you create one, you should download it and keep it somewhere it won’t be deleted (if that happens, you won’t be able to access your instance anymore!).
If you downloaded the key file, change its permissions in the terminal to user-only read and write. In Linux, this could be done with chmod 400 PEM_FILENAME where PEM_FILENAME is the file with the key.
After this, click on the blue button “Launch Instances”.
Click on “View Instances” to check that it is “Running” and passed “2/2 status checks”. It will take some time to pass the checks but after that, you will be ready to ssh into the instance. Finally, note down the Public IP of the instance launched (it will be required in the next step).
SSH in your instance with ssh -i PEM_FILENAME ubuntu@PUBLIC_IP.
Your machine comes with many Conda environments pre-installed: each one is a Python environment with deep learning libraries already installed. Look at the README for how to use them. For this section, we can use a Tensorflow environment (conda activate tensorflow_p36).
Important! When you’re done using your instance, be sure to turn it off using the web interface!
Now, let’s use this AWS instance to run our neural style transfer code. It now runs extremely quickly with 1000 iterations!


## Download the weights and the images

1) at the main directory, `wget` https://pjreddie.com/media/files/darknet53.conv.74 
2) at the `.\data` directory `aws s3 cp s3://kelong . --recursive`

## Things to be done

setup a CI/CD pipelines and tests

