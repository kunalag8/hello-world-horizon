import os # import the os module to access environment variables
import logging # import the logging module to handle logging messages 
from dotenv import load_dotenv #this allows me to load the environment variables from the env file


#dotenv_path = os.path.join(os.path.dirname(__file__),'.env')
load_dotenv() # load environment variables from file

# Configure the logging settings
# Set the log format and level, and create a log file named "helloworldreader.log" in append mode. Sets the format of the logs written to the log files
logging.basicConfig(filename='helloworldreader.log', filemode='a', format='%(asctime)s - %(levelname)s - %(message)s', level=logging.INFO)

# Create a console handler and set its level to INFO (higher than DEBUG)
console_handler = logging.StreamHandler()
console_handler.setLevel(logging.INFO)

# Set the formatter for the console handler. Sets the format of the logs that are output to the console
formatter = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')
console_handler.setFormatter(formatter)

# Add the console handler to the logger
logging.getLogger().addHandler(console_handler)

# Define the main function
def HelloWorldReader():

    load_dotenv()

    # Log that the function has started
    logging.info('Starting HelloWorldReader')
    
    #access the environment variable inserted by ansible from the yml file
    my_var = os.environ.get('TestMessage')
    logging.info(f"TestMessage: {my_var}")
  
    # Output all environment variables to the console - these are system set, not to be confused with the logging, that's what THE PROGRAM is doing in a particular moment - the logging is written to a local file
    logging.info('Printing environment variables:')
    for key, value in os.environ.items():
        print(f"{key}:{value}")
    
    # Log that the function has finished
    logging.info('Finished HelloWorldReader')

    # Output "Hello World!" 
    print("Hello World!")

# Check if the code is being executed as the main program
if __name__ == '__main__':
    # Call the main function
    HelloWorldReader()
